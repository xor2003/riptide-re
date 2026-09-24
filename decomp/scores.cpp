/* ==========================================================================
 * SCORES.CPP — seg19df reconstruction for "In Search of Dr. Riptide"
 * High-score file layer: create/load/save the 10-record table in high.scr.
 * Built with Borland C++ 3.1, large model (-ml -3 -O -r- -vi-).
 * ========================================================================== */
#include "riptide.h"

/* --------------------------------------------------------------------------
 * seg19df:000C — init_scores_array: open high.scr; create it if missing,
 * otherwise load it, then seed _high_score with the table's top score.
 * ------------------------------------------------------------------------ */
void far init_scores_array(void)
{
    FILE *stream;

    if ((stream = fopen("high.scr", "rb")) == 0) {
        if (stream != 0)
            fclose(stream);
        init_scores_file();
    } else {
        fclose(stream);
        load_scores_in();
    }
    _high_score = _game_highs[0].score;
}

/* --------------------------------------------------------------------------
 * seg19df:0063 — init_scores_file: blank all 10 records and write the file.
 * ------------------------------------------------------------------------ */
void far init_scores_file(void)
{
    byte var_1;

    var_1 = 0;
    while (var_1 < 0x0A) {
        strcpy(_game_highs[var_1].name, "........");
        _game_highs[var_1].score    = 0;
        _game_highs[var_1].field_0E = 0;
        var_1++;
    }
    save_all_scores();
}

/* --------------------------------------------------------------------------
 * seg19df:00B8 — save_all_scores: write the whole 0xA0-byte table to disk.
 * ------------------------------------------------------------------------ */
void far save_all_scores(void)
{
    int handle;
    int len;

    if ((handle = open("high.scr", 0x8104, 0x180)) == -1) {
        perror("Error:");
        return;
    }
    len = 0xA0;
    write(handle, _game_highs, len);
    close(handle);
}

/* --------------------------------------------------------------------------
 * seg19df:0106 — load_scores_in: read the 0xA0-byte table from disk.
 * ------------------------------------------------------------------------ */
void far load_scores_in(void)
{
    int handle;
    int len;

    if ((handle = open("high.scr", 0x8001)) == -1) {
        perror("Error:");
    } else {
        len = 0xA0;
        read(handle, _game_highs, len);
    }
    close(handle);
}

/* --------------------------------------------------------------------------
 * seg19df:0151 — save_new_score: shift the table down and insert a new
 * record at the rank returned by is_record (1-based).
 * ------------------------------------------------------------------------ */
void far save_new_score(ulong score, uchar far *src, uchar arg_8)
{
    byte var_3;
    int  var_2;

    var_3 = is_record(score);
    var_2 = 9;
    while (var_3 - 1 < var_2) {
        _game_highs[var_2] = _game_highs[var_2 - 1];
        var_2--;
    }
    strcpy(_game_highs[var_3 - 1].name, (char far *)src);
    _game_highs[var_3 - 1].score    = score;
    _game_highs[var_3 - 1].field_0E = arg_8;
    save_all_scores();
}

/* --------------------------------------------------------------------------
 * seg19df:01DC — is_record: return the 1-based rank a score would take,
 * or 0 if it does not make the table.
 * ------------------------------------------------------------------------ */
uchar far is_record(ulong score)
{
    byte var_1;

    var_1 = 0;
    while (var_1 < 0x0A) {
        if (_game_highs[var_1].score < score)
            return var_1 + 1;
        var_1++;
    }
    return 0;
}

/* --------------------------------------------------------------------------
 * seg19df:0211 — return_element: format one field of a record for display.
 *   arg_2 == 1 -> score as a decimal string
 *   arg_2 == 2 -> name pointer
 *   arg_2 == 3 -> "1" if the download flag is set, else NULL
 * ------------------------------------------------------------------------ */
uchar far *far return_element(uchar arg_0, uchar arg_2)
{
    score_line string;

    string = unk_2A7EC;
    switch (arg_2) {
    case 1:
        return (uchar far *)ultoa(_game_highs[arg_0].score, string.s, 0x0A);
    case 2:
        return (uchar far *)_game_highs[arg_0].name;
    case 3:
        if (_game_highs[arg_0].field_0E != 0)
            return (uchar far *)"1";
    }
    return 0;
}
