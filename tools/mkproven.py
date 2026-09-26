#!/usr/bin/env python3
"""Build the Z3-proven-equivalence registry from DOSUnit compare-ssa batches.

A function is "proven" when every compared SSA part row for it has status
``passed``.  The registry records the machine-code SHA-256 of both sides per
part so a later recon rebuild can detect stale proofs ("equal until changed").

Outputs:
  tools/z3cmp/proven_equal.json  - authoritative registry
  tools/z3cmp/PROVEN.md          - human-readable summary

Usage: mkproven.py [batches_dir] [out_dir]
"""
import json
import sys
import collections
import glob
import hashlib
import os
import time

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ORIG_EXE = os.path.join(ROOT, "RIPTIDE.EXE")
RECON_EXE = os.path.join(ROOT, "decomp", "link", "RIPTIDE.EXE")
ORIG_FUNCS = os.path.join(ROOT, "tools", "z3cmp", "orig_funcs.json")
RECON_FUNCS = os.path.join(ROOT, "tools", "z3cmp", "recon_funcs.json")


def load_results(batches_dirs):
    """Load results from one or more batch dirs (comma-separated or glob)."""
    results = []
    seen = set()
    for spec in batches_dirs.split(","):
        for batches_dir in sorted(glob.glob(spec)) or [spec]:
            for path in sorted(glob.glob(os.path.join(batches_dir, "compare.batch*.json"))):
                if path in seen:
                    continue
                seen.add(path)
                doc = json.load(open(path))
                results.extend(doc.get("results", []))
    return results


def _mz_image(exe_path):
    """Executable image bytes (after the MZ header) for catalog `linear` offsets."""
    data = open(exe_path, "rb").read()
    return data[int.from_bytes(data[8:10], "little") * 16 :]


def _entry_bounds(funcs_path):
    """Sorted image-byte entry offsets of cataloged functions."""
    try:
        catalog = json.load(open(funcs_path))
    except OSError:
        return []
    bounds = []
    for function in catalog.get("functions", []):
        entry = function.get("entry") if isinstance(function, dict) else {}
        linear = (entry or {}).get("linear")
        try:
            bounds.append(int(linear, 0))
        except (TypeError, ValueError):
            continue
    return sorted(set(bounds))


def _function_hash(exe_path, image_byte, bounds):
    """SHA-256 over [entry, next catalog entry) bytes of the loaded image."""
    image = _mz_image(exe_path)
    if image_byte < 0 or image_byte >= len(image):
        return None
    end = len(image)
    for bound in bounds:
        if bound > image_byte:
            end = min(end, bound)
            break
    return hashlib.sha256(image[image_byte:end]).hexdigest()


def main():
    root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    batches_dir = (
        sys.argv[1]
        if len(sys.argv) > 1
        else os.path.join(root, "tools", "z3cmp", "batches*")
    )
    out_dir = sys.argv[2] if len(sys.argv) > 2 else os.path.join(root, "tools", "z3cmp")

    results = load_results(batches_dir)
    by_func = collections.defaultdict(list)
    for row in results:
        func = row.get("function")
        name = func.get("name") if isinstance(func, dict) else str(func or "")
        if name:
            by_func[name].append(row)

    orig_bounds = _entry_bounds(ORIG_FUNCS)
    recon_bounds = _entry_bounds(RECON_FUNCS)
    hash_cache = {}

    def exe_hash(exe_path, bounds, ssa_linear):
        key = (exe_path, ssa_linear)
        if key not in hash_cache:
            image_byte = int(ssa_linear, 0) - 0x1000
            hash_cache[key] = _function_hash(exe_path, image_byte, bounds)
        return hash_cache[key]

    proven = {}
    proven_linear = set()
    proven_exe = {}
    partial = {}
    for name, rows in sorted(by_func.items()):
        if rows and all(r.get("status") == "passed" for r in rows):
            parts = []
            reasons = collections.Counter()
            for r in rows:
                reasons[str(r.get("reason") or "z3_equal")] += 1
                od = r.get("oracle_detail") or {}
                cd = r.get("candidate_detail") or {}
                fn_entry = od.get("function_entry") or {}
                cand_fn_entry = cd.get("function_entry") or {}
                try:
                    proven_linear.add(int(fn_entry.get("linear"), 0))
                except (TypeError, ValueError):
                    pass
                parts.append(
                    {
                        "oracle_part": r.get("oracle_function"),
                        "candidate_part": r.get("candidate_function"),
                        "oracle_code_sha256": od.get("function_machine_code_sha256"),
                        "candidate_code_sha256": cd.get("function_machine_code_sha256"),
                        "oracle_function_entry": fn_entry.get("linear"),
                        "candidate_function_entry": cand_fn_entry.get("linear"),
                        "oracle_entry": (od.get("entry") or {}).get("ip"),
                        "candidate_entry": (cd.get("entry") or {}).get("ip"),
                        "reason": r.get("reason") or "z3_equal",
                    }
                )
            oracle_lin = (parts[0].get("oracle_function_entry") if parts else None) or None
            candidate_lin = (parts[0].get("candidate_function_entry") if parts else None) or None
            exe_sha256 = {}
            if oracle_lin:
                exe_sha256["orig"] = exe_hash(ORIG_EXE, orig_bounds, oracle_lin)
                proven_exe["0x%05x" % int(oracle_lin, 0)] = {
                    "orig": exe_sha256.get("orig"),
                    "candidate_entry": candidate_lin,
                    "recon": exe_hash(RECON_EXE, recon_bounds, candidate_lin)
                    if candidate_lin
                    else None,
                }
            proven[name] = {
                "parts": parts,
                "part_count": len(parts),
                "reasons": dict(reasons),
                "exe_sha256": exe_sha256,
            }
        else:
            partial[name] = collections.Counter(
                (r.get("status") or "?") + "/" + str(r.get("reason") or "") for r in rows
            )

    registry = {
        "generated": time.strftime("%Y-%m-%dT%H:%M:%S"),
        "source": batches_dir,
        "proven_count": len(proven),
        "proven_linear": sorted(proven_linear),
        "proven_exe": proven_exe,
        "proven": proven,
    }
    out_json = os.path.join(out_dir, "proven_equal.json")
    json.dump(registry, open(out_json, "w"), indent=1, sort_keys=True)

    lines = [
        "# Z3-proven equivalent functions (Riptide)",
        "",
        f"Generated: {registry['generated']}  |  source: {batches_dir}",
        "",
        f"**{len(proven)} functions fully proven** (all mapped SSA parts passed).",
        "Proof is valid until the recorded machine-code SHA-256 changes.",
        "",
        "| function | parts | reasons |",
        "|---|---|---|",
    ]
    for name, info in sorted(proven.items()):
        reasons = ",".join(f"{k}x{v}" for k, v in sorted(info["reasons"].items()))
        lines.append(f"| `{name}` | {info['part_count']} | {reasons} |")
    lines += [
        "",
        "## Partially compared functions",
        "",
        "| function | statuses |",
        "|---|---|",
    ]
    for name, counts in sorted(partial.items()):
        lines.append(f"| `{name}` | {dict(counts)} |")
    out_md = os.path.join(out_dir, "PROVEN.md")
    open(out_md, "w").write("\n".join(lines) + "\n")

    print(f"proven: {len(proven)} functions ({sum(i['part_count'] for i in proven.values())} parts)")
    print(f"partial/failed/refused: {len(partial)} functions")
    print(f"wrote {out_json}")
    print(f"wrote {out_md}")


if __name__ == "__main__":
    main()
