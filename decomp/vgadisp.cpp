/* ==========================================================================
 * seg1891 — vga_display: Mode-X display driver (text, palette, raster ops).
 * Reconstructed from RIPTIDE.lst; compiles under BC++3.1 -ml -3 -O -r- -vi-.
 * ======================================================================== */
#include "riptide.h"
#include <dos.h>

/* --------------------------------------------------------------------------
 * init_display — allocate the global vga_display and set the download base.
 * ------------------------------------------------------------------------ */
void init_display(uchar arg_0)
{
    display = new vga_display(arg_0);
    download_pos = 0x2EE0;
}

/* --------------------------------------------------------------------------
 * vga_display ctor — init fields, grab the palette, set Mode X, fetch the
 * BIOS ROM font pointer (int 10h AX=1130h BH=30h → ES:BP).
 * ------------------------------------------------------------------------ */
vga_display::vga_display(uchar arg_4)
{
    REGPACK preg;

    field_00 = arg_4;
    field_05 = field_06 = 0;
    width = 0x140;
    height = 0xC8;
    field_07 = 1;
    field_01 = 0;
    get_palette();
    x_set320x200();
    preg.r_ax = 0x1130;
    preg.r_bx = 0x300;
    intr(0x10, &preg);
    FP_SEG(system_font_ptr) = preg.r_es;
    FP_OFF(system_font_ptr) = preg.r_bp;
}

/* --------------------------------------------------------------------------
 * ~vga_display — restore text mode; deleting dtor frees the block on flag&1.
 * ------------------------------------------------------------------------ */
vga_display::~vga_display()
{
    set_text_mode();
}

/* --------------------------------------------------------------------------
 * set_text_mode — BIOS int 10h AH=0 AL=3 (80x25 text).
 * ------------------------------------------------------------------------ */
void vga_display::set_text_mode()
{
    REGS r;

    r.x.ax = 3;
    int86(0x10, &r, &r);
}

/* --------------------------------------------------------------------------
 * set_mode_x — enter 320x200 Mode X.
 * ------------------------------------------------------------------------ */
void vga_display::set_mode_x()
{
    x_set320x200();
}

/* --------------------------------------------------------------------------
 * doit — run one palette-cycling step if enabled and not suppressed.
 * ------------------------------------------------------------------------ */
uchar vga_display::doit()
{
    if (field_05 != 0 && field_06 == 0)
        return cycle();
    return 0;
}

/* --------------------------------------------------------------------------
 * copy_page — blit a whole page (0,0)-(320,200) from page src to page dst.
 * ------------------------------------------------------------------------ */
void vga_display::copy_page(uchar src, uchar dst)
{
    copy_bits(0, 0, 0x140, 0xC8, 0, 0,
              page_offsets[dst], page_offsets[src], 0x140, 0x140);
}

/* --------------------------------------------------------------------------
 * turn_cycling — enable/disable palette cycling; disabling restores the
 * saved palette and pushes it to the DAC.
 * ------------------------------------------------------------------------ */
void vga_display::turn_cycling(uchar arg_4)
{
    if (field_05 == arg_4)
        return;
    field_05 = arg_4;
    if (arg_4 != 0)
        return;
    memcpy(palette, old_palette, 0x300);
    set_palette();
}

/* --------------------------------------------------------------------------
 * cycle — advance the cycling tick; copy the current frame slice into the
 * live palette.
 * ------------------------------------------------------------------------ */
uchar vga_display::cycle()
{
    if (field_0E++ == field_0C) {
        field_0E = 0;
        my_movsd(palette + field_310,
                 (byte far *)this + field_0D * 0x30 + 0x10, field_316);
        if (++field_0D == field_0F)
            field_0D = 0;
        return 1;
    }
    return 0;
}

/* --------------------------------------------------------------------------
 * setup_cycle — precompute field_0F rotated copies of the colour range
 * [arg_4,arg_6) into the field_10 frame buffer (0x30-byte rows).
 * ------------------------------------------------------------------------ */
void vga_display::setup_cycle(uchar arg_4, uchar arg_6, uchar arg_8)
{
    byte dest[0x30];
    int var_2, var_4;
    byte var_5, var_6, var_7;

    field_0D = 0;
    field_0E = 0;
    field_0F = arg_6 - arg_4;
    field_0C = arg_8;
    field_310 = arg_4 * 3;
    field_312 = arg_6 * 3;
    memcpy(old_palette, palette, 0x300);
    field_314 = (arg_6 - arg_4) * 3;
    if (field_314 % 4)
        terminate((uchar far *)"Palette cycle not a multiple of 4.", (uchar far *)0);
    field_316 = field_314 / 4;
    memcpy(dest, (byte far *)palette + arg_4 * 3, field_314);
    for (var_2 = 0; var_2 < field_0F; ++var_2) {
        memcpy((byte far *)this + var_2 * 0x30 + 0x10, dest, field_314);
        var_5 = *(dest - 3 + field_314);
        var_6 = *(dest - 2 + field_314);
        var_7 = *(dest - 1 + field_314);
        for (var_4 = field_314; var_4 > 2; --var_4)
            dest[var_4] = *(dest - 3 + var_4);
        dest[0] = var_5;
        dest[1] = var_6;
        dest[2] = var_7;
    }
}

/* --------------------------------------------------------------------------
 * set_pix — plot a pixel (always page 0 via x_set_pix).
 * ------------------------------------------------------------------------ */
void vga_display::set_pix(int x, int y, uchar c)
{
    x_set_pix(x, y, 0, c);
}

/* --------------------------------------------------------------------------
 * read_pix — fetch a pixel (page 0).
 * ------------------------------------------------------------------------ */
int vga_display::read_pix(int x, int y)
{
    return x_read_pix(x, y, 0);
}

/* --------------------------------------------------------------------------
 * draw_span — horizontal span draw.
 * ------------------------------------------------------------------------ */
void vga_display::draw_span(int x, int y, uchar c, int arg_A, uint arg_C)
{
    x_draw_span(x, y, arg_A, arg_C, c);
}

/* --------------------------------------------------------------------------
 * pause — busy-wait n vertical-retrace periods by polling port 0x3DA bit 3.
 * ------------------------------------------------------------------------ */
void vga_display::pause(uint n)
{
    while (n--) {
        while (inportb(0x3DA) & 8)
            ;
        while (!(inportb(0x3DA) & 8))
            ;
    }
}

/* --------------------------------------------------------------------------
 * blank_palette — black out the DAC palette.
 * ------------------------------------------------------------------------ */
void vga_display::blank_palette()
{
    nullpal();
}

/* --------------------------------------------------------------------------
 * fade_up / fade_down — palette fade helpers over _palette.
 * ------------------------------------------------------------------------ */
void vga_display::fade_up()
{
    palup(palette);
}

void vga_display::fade_down()
{
    paldown(palette);
}

/* --------------------------------------------------------------------------
 * set_palette — push _palette to the DAC.
 * ------------------------------------------------------------------------ */
void vga_display::set_palette()
{
    forcepal(palette, 0);
}

/* --------------------------------------------------------------------------
 * get_palette — read all 256 DAC registers into _palette (int 10h AX=1017h),
 * after waiting one retrace.
 * ------------------------------------------------------------------------ */
void vga_display::get_palette()
{
    REGS    inregs;
    SREGS   segregs;

    inregs.x.ax = 0x1017;
    inregs.x.bx = 0;
    inregs.x.cx = 0x100;
    inregs.x.dx = FP_OFF(palette);
    segregs.es = _DS;
    pause(1);
    int86x(0x10, &inregs, &inregs, &segregs);
}

/* --------------------------------------------------------------------------
 * save_palette / restore_palette — stash the live palette to spare_palette.
 * ------------------------------------------------------------------------ */
void vga_display::save_palette()
{
    memcpy(spare_palette, palette, 0x300);
}

void vga_display::restore_palette()
{
    memcpy(palette, spare_palette, 0x300);
}

/* --------------------------------------------------------------------------
 * print_at_xy — draw text (optionally centred + shadowed) via vga_text.
 * ------------------------------------------------------------------------ */
/* --------------------------------------------------------------------------
 * print_at — print on the character grid (col,row are *8 for pixels).
 * col==-1 centres in a 40-column line; row==-1 defaults to row 12.
 * ------------------------------------------------------------------------ */
void vga_display::print_at(int x, int y, uchar far *s)
{
    if (x == -1)
        x = 0x14 - (strlen((char far *)s) >> 1);
    if (y == -1)
        y = 0x0C;
    vga_text(x << 3, y << 3, s, display->field_04, display->field_01);
}

void vga_display::print_at_xy(int x, int y, uchar far *s, uchar arg_C)
{
    if (arg_C != 0)
        x = 0xA0 - ((strlen((char far *)s) << 3) >> 1);
    if (display->field_01 != 0)
        vga_text(x + 1, y + 1, s, 0, 0);
    vga_text(x, y, s, display->field_04, display->field_01);
}

/* --------------------------------------------------------------------------
 * fill_rect — draw a border (arg_E) + interior (arg_C), or just the interior
 * when arg_E == -1, on page arg_10.
 * ------------------------------------------------------------------------ */
void vga_display::fill_rect(int x1, int y1, int x2, int y2,
                            int arg_C, int arg_E, uchar arg_10)
{
    if (arg_E != -1) {
        x_fill_rect(x1, y1, x2, y2, page_offsets[arg_10], arg_E);
        x_fill_rect(x1 + 1, y1 + 1, x2 - 1, y2 - 1, page_offsets[arg_10], arg_C);
    } else {
        x_fill_rect(x1, y1, x2, y2, page_offsets[arg_10], arg_C);
    }
}

/* --------------------------------------------------------------------------
 * show_offset — set the VGA display-start offset (mode-checks field_00).
 * ------------------------------------------------------------------------ */
void vga_display::show_offset(uint arg_4)
{
    if (field_00 != 0)
        terminate((uchar far *)"Not in Mode X - aborted.", (uchar far *)0);
    x_show_offset(arg_4);
}

/* --------------------------------------------------------------------------
 * cls — clear page arg_6 to colour arg_4.
 * ------------------------------------------------------------------------ */
void vga_display::cls(uchar arg_4, uchar arg_6)
{
    x_fill_rect(0, 0, 0x140, 0xC8, page_offsets[arg_6], arg_4);
}

/* --------------------------------------------------------------------------
 * get_bits — capture a screen rect into a heap buffer.
 * ------------------------------------------------------------------------ */
void far *vga_display::get_bits(int x, int y, int x2, int y2)
{
    int   var_2;
    void far *var_6;

    var_2 = (x2 - x) * (y2 - y);
    var_6 = new char[var_2];
    if (var_6 == 0)
        no_heap((uchar far *)"Getting screen bits.");
    x_get_bits(x, y, x2, y2, 0, var_6);
    return var_6;
}

/* --------------------------------------------------------------------------
 * copy_bits — vid-to-vid blit (page-relative offsets).
 * ------------------------------------------------------------------------ */
void vga_display::copy_bits(int a4, int a6, int a8, int aA, int aC, int aE,
                          uint a10, uint a12, uint a14, uint a16)
{
    x_vid2vid(a4, a6, a8, aA, aC, aE, a10, a12, a14, a16);
}

/* --------------------------------------------------------------------------
 * put_bits — write a captured block back (clipping handled in x_put_bits).
 * ------------------------------------------------------------------------ */
void vga_display::put_bits(int x, int y, int x2, int y2, uchar far *bits,
                          uint arg_10, uint arg_12)
{
    int var_2;

    var_2 = x2 - x;
    if (arg_10 == 0)
        arg_10 = var_2;
    x_put_bits(x, y, x2, y2, 0, 0, bits, arg_12, arg_10, 0x140);
}

/* --------------------------------------------------------------------------
 * put_bits_masked — clip a masked sprite to the screen, then forward to the
 * colour / wide / narrow masked blitters. field_07 disables clipping.
 * ------------------------------------------------------------------------ */
void vga_display::put_bits_masked(int arg_4, int arg_6, int arg_8, int arg_A,
                          uchar far *bits, uint arg_10, uint arg_12, uchar arg_14)
{
    int var_2, var_4, var_6, var_8, var_A, var_C;

    var_2 = arg_8 - arg_4;
    var_4 = arg_A - arg_6;
    if (arg_10 == 0)
        arg_10 = var_2;
    if (field_07 != 0) {
        var_A = var_2;
        var_C = var_4;
        var_6 = 0;
        var_8 = 0;
    } else {
        var_C = var_4;
        if (arg_6 >= 0) {
            var_8 = 0;
            if (height < arg_A)
                var_C = var_4 - (arg_6 + var_4 - height);
        } else {
            var_8 = abs(arg_6);
            var_C = var_4 - var_8;
        }
        var_A = var_2;
        if (arg_4 >= 0) {
            var_6 = 0;
            if (width < arg_8)
                var_A = var_2 - (arg_4 + var_2 - width);
        } else {
            var_6 = abs(arg_4);
            var_A = var_2 - var_6;
        }
    }
    if (arg_14 != 0)
        x_put_bits_masked_color(var_6, var_8, var_6 + var_A, var_8 + var_C,
                                arg_4 + var_6, arg_6 + var_8,
                                bits, arg_12, var_2 - var_A, 0x140, arg_14);
    else if (var_A > 4)
        x_put_bits_masked2(var_6, var_8, var_6 + var_A, var_8 + var_C,
                           arg_4 + var_6, arg_6 + var_8,
                           bits, arg_12, var_2 - var_A, 0x140);
    else
        x_put_bits_masked(var_6, var_8, var_6 + var_A, var_8 + var_C,
                          arg_4 + var_6, arg_6 + var_8,
                          bits, arg_12, var_2 - var_A, 0x140);
}

/* --------------------------------------------------------------------------
 * show_pcx — load a PCX from the resource file, RLE-decode it onto the screen
 * and apply its 256-colour palette. arg_A = row limit (divided by 0x50),
 * arg_C = height override (-1 → derive from header).
 * ------------------------------------------------------------------------ */
void vga_display::show_pcx(uchar far *path, uchar arg_8, uint arg_A, int arg_C)
{
    long  var_1A;
    uchar far *src, *dest;
    int   var_12, var_10, var_E, var_C, var_A, var_8;
    byte  var_1;

    arg_A /= 0x50;
    var_1A = (long)g_open_element(path);
    if (var_1A == -1L)
        goto open_fail;
    src = (uchar far *)new char[var_1A];
    if (src == 0)
        no_heap((uchar far *)"Loading pcx file.");
    if ((long)g_element_read(src, (uint)var_1A) != var_1A)
        goto read_fail;
    g_close_element();
    dest = (uchar far *)new char[0x80];
    if (dest == 0)
        no_heap((uchar far *)"Creating PCX header.");
    memcpy(dest, src, 0x80);
    if (arg_C == -1)
        var_E = *(uint far *)(dest + 0x0A) - *(uint far *)(dest + 0x06) + 1;
    else
        var_E = arg_C;
    var_10 = *(uint far *)(dest + 0x42);
    var_12 = 0x80;
    for (var_8 = arg_A; var_8 < arg_A + var_E; ++var_8) {
        var_A = 0;
        while (var_A < var_10) {
            var_1 = src[var_12++];
            if ((var_1 & 0xC0) == 0xC0) {
                var_C = var_1 & 0x3F;
                draw_span(var_A, var_8, src[var_12++], var_C, 0);
                var_A += var_C;
            } else {
                set_pix(var_A++, var_8, var_1);
            }
        }
    }
    ++var_12;
    for (var_8 = 0; var_8 < 0x300; ++var_8)
        palette[var_8] = src[var_12++] >> 2;
    if (arg_8 != 0)
        set_palette();
    delete dest;
    delete src;
done:
    return;
read_fail:
    read_error(path);
    goto done;
open_fail:
    terminate((uchar far *)"Couldn't open", path);
    return;
}

/* --------------------------------------------------------------------------
 * dump_pcx — screenshot: encode the current screen to "riptide.pcx" (RLE).
 * On any open/write failure → close + write_error. (The trailing terminate
 * block is dead code in the original; the write-fail path is loc_1BD0E.)
 * ------------------------------------------------------------------------ */
void vga_display::dump_pcx()
{
    uchar far *block;
    int   handle;
    uint  var_10, var_E, buf, var_A, var_8, var_6;
    byte  var_1;

    handle = open("riptide.pcx", 0x8304, 0x180);
    if (handle == -1)
        goto fail;
    block = (uchar far *)new char[0x80];
    if (block == 0)
        no_heap((uchar far *)"Creating PCX header.");
    block[0] = 0x0A;
    block[1] = 5;
    block[2] = 1;
    block[3] = 8;
    *(word far *)(block + 4) = 0;
    *(word far *)(block + 6) = 0;
    *(word far *)(block + 8) = 0x13F;
    *(word far *)(block + 0x0A) = 0xC7;
    *(word far *)(block + 0x0C) = 0x140;
    *(word far *)(block + 0x0E) = 0xC8;
    block[0x41] = 1;
    *(word far *)(block + 0x44) = 0;
    *(word far *)(block + 0x42) = 0x140;
    if (write(handle, block, 0x80) != 0x80)
        goto fail;
    var_E = *(word far *)(block + 0x0A) - *(word far *)(block + 0x06) + 1;
    var_10 = *(word far *)(block + 0x42);
    var_6 = 0;
    for (var_8 = var_6; var_8 < var_6 + var_E; ++var_8) {
        var_A = 0;
        while (var_A < var_10) {
            buf = 0;
            var_1 = read_pix(var_A, var_8);
            while ((byte)read_pix(var_A + buf, var_8) == var_1 &&
                   buf < 0x3F && var_A + buf < var_10)
                ++buf;
            if (buf > 0) {
                var_A += buf;
                buf |= 0xC0;
                if (write(handle, &buf, 1) != 1)
                    goto fail;
                if (write(handle, &var_1, 1) != 1)
                    goto fail;
            } else {
                if ((var_1 & 0xC0) == 0xC0)
                    if (write(handle, (void far *)0xC1L, 1) != 1)
                        goto fail;
                if (write(handle, &var_1, 1) != 1)
                    goto fail;
                ++var_A;
            }
        }
    }
    var_1 = 0x0C;
    if (write(handle, &var_1, 1) == -1)
        goto fail;
    for (var_8 = 0; var_8 < 0x300; ++var_8) {
        var_1 = palette[var_8] << 2;
        if (write(handle, &var_1, 1) == -1)
            goto fail;
    }
    delete block;
    close(handle);
    return;
fail:
    close(handle);
    write_error("riptide.pcx");
}

/* --------------------------------------------------------------------------
 * load_pcx — locate <path>.pcx on disk (findfirst "*.pcx"), read it into a
 * heap buffer, store its size through arg_0E, return the buffer.
 * ------------------------------------------------------------------------ */
uchar far *vga_display::load_pcx(uchar far *path, uint far *arg_0E)
{
    struct ffblk ff;
    uchar far *buf;
    int   handle, var_4;
    uint  var_6;

    for (var_4 = findfirst("*.pcx", &ff, 0); var_4 == 0; var_4 = findnext(&ff))
        if (strcmp((char far *)path, ff.ff_name) == 0) {
            var_6 = (uint)ff.ff_fsize;
            break;
        }
    if (var_4 != 0)
        return 0;
    buf = (uchar far *)new char[var_6];
    if (buf == 0)
        no_heap((uchar far *)"Loading pcx file.");
    handle = open((char far *)path, 0x8001);
    if (handle == -1)
        goto fail;
    if (read(handle, buf, var_6) != var_6)
        goto fail;
    close(handle);
    *arg_0E = var_6;
    return buf;
fail:
    close(handle);
    read_error(path);
    return 0;
}

/* --------------------------------------------------------------------------
 * explode_pcx — RLE-decode an in-memory PCX image into a freshly-allocated
 * 320-column bitmap. Palette sits in the last 0x300 bytes of src[arg_E].
 * ------------------------------------------------------------------------ */
uchar far *vga_display::explode_pcx(uchar far *src, uint arg_E, int arg_10)
{
    uchar far *header, *dest, *srcdata;
    uint  var_A, var_C, var_8, var_10h;
    int   var_E, var_6;
    byte  var_19;

    for (var_A = 0; var_A < 0x300; ++var_A)
        palette[var_A] = src[arg_E + var_A - 0x300] >> 2;
    set_palette();
    header = (uchar far *)new char[0x80];
    memcpy(header, src, 0x80);
    var_6 = *(int far *)(header + 8) - *(int far *)(header + 4) + 1;
    var_8 = *(uint far *)(header + 0x42);
    dest = (uchar far *)new char[var_6 * arg_10];
    if (dest == 0)
        return 0;
    srcdata = src + 0x80;
    var_10h = 0;
    for (var_A = 0; var_A < arg_10; ++var_A) {
        var_C = 0;
        while (var_C < var_8) {
            var_19 = srcdata[var_10h++];
            if ((var_19 & 0xC0) == 0xC0) {
                var_E = var_19 & 0x3F;
                var_19 = srcdata[var_10h++];
                do {
                    dest[var_A * 0x140 + var_C++] = var_19;
                } while (--var_E != 0);
            } else {
                dest[var_A * 0x140 + var_C++] = var_19;
            }
        }
    }
    delete header;
    return dest;
}

/* --------------------------------------------------------------------------
 * import_palette — pull the trailing 256-colour palette out of a PCX image
 * buffer (last 0x300 bytes) and push it to the DAC.
 * ------------------------------------------------------------------------ */
void vga_display::import_palette(uchar far *src, uint arg_E)
{
    uchar far *pal;
    int   var_2;

    for (var_2 = 0, pal = src + (arg_E - 0x300); var_2 != 0x300; ++var_2)
        palette[var_2] = *pal++ >> 2;
    set_palette();
}

/* --------------------------------------------------------------------------
 * vga_text — render a string in the BIOS 8x8 font. Each glyph is 8 bytes
 * (one per row); each set bit plots a pixel. mode selects a colour ramp:
 *   0/1 = flat colour, 2 = brighten per row, 3 = darken per row.
 * The 8 column bit-tests are written out unrolled to match the original.
 * ------------------------------------------------------------------------ */
#define GLYPH_BIT()  (*(uchar far *)MK_FP(FP_SEG(system_font_ptr), \
                        FP_OFF(system_font_ptr) + (((word)var_A << 3) + var_2)))

void vga_text(int x, int y, uchar far *s, uchar color, uchar mode)
{
    uchar far *p;
    int   var_8, var_4, var_6, var_2;
    uchar var_9, var_A, var_F;

    p = s;
    var_8 = x;
    if (mode != 0) {
        for (var_4 = 0; var_4 < strlen((char far *)s); ++var_4) {
            var_A = *p++;
            var_6 = y;
            var_F = color;
            for (var_2 = 0; var_2 < 8; ++var_2) {
                var_9 = 0x80;
                if (GLYPH_BIT() & var_9) display->set_pix(var_8,     var_6, var_F);
                var_9 >>= 1;
                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 1, var_6, var_F);
                var_9 >>= 1;
                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 2, var_6, var_F);
                var_9 >>= 1;
                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 3, var_6, var_F);
                var_9 >>= 1;
                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 4, var_6, var_F);
                var_9 >>= 1;
                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 5, var_6, var_F);
                var_9 >>= 1;
                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 6, var_6, var_F);
                var_9 >>= 1;
                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 7, var_6, var_F);
                ++var_6;
                switch (mode) {
                case 0: break;
                case 1: break;
                case 2: ++var_F; break;
                case 3: --var_F; break;
                }
            }
            var_8 += 8;
        }
    } else {
        for (var_4 = 0; var_4 < strlen((char far *)s); ++var_4) {
            var_A = *p++;
            var_6 = y;
            for (var_2 = 0; var_2 < 8; ++var_2) {
                var_9 = 0x80;
                if (GLYPH_BIT() & var_9) display->set_pix(var_8,     var_6, color);
                var_9 >>= 1;
                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 1, var_6, color);
                var_9 >>= 1;
                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 2, var_6, color);
                var_9 >>= 1;
                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 3, var_6, color);
                var_9 >>= 1;
                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 4, var_6, color);
                var_9 >>= 1;
                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 5, var_6, color);
                var_9 >>= 1;
                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 6, var_6, color);
                var_9 >>= 1;
                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 7, var_6, color);
                ++var_6;
            }
            var_8 += 8;
        }
    }
}
