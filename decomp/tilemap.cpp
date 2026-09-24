/* --------------------------------------------------------------------------
 * tilemap.cpp — seg1783 — tilemap: scrolling Mode-X tile renderer, map
 *   file load/save, palette cycling.  Reconstructed from RIPTIDE.lst.
 *
 * Object layout (sizeof = 0x3A2):
 *   00..22  viewport + map/scroll state
 *   24..87  map_hdr[0x32]  (0x64-byte saved map header)
 *   88..8B  palette-cycle params
 *   8C      cycling flag
 *   8E/90   map_width / map_height (tiles)
 *   94      map_size (ulong)
 *   98      map_data far ptr (0x8000 bytes of tile bitmaps)
 *   9C..39B palette[0x300]
 *   39C     exploded flag
 *   39E     tile_attr far ptr (tattr[map_size])
 * ------------------------------------------------------------------------ */
#include "riptide.h"

tilemap::tilemap(uchar far *path, int w, int h)
{
    map_data = new char[0x8000];
    if (!map_data)
        no_heap("Tiles.");
    exploded = 2;
    init_work_vars();
    if (path == 0) {
        map_width = w;
        map_height = h;
        map_w_pixels = map_width << 3;
        map_h_pixels = map_height << 3;
        init_tables();
        reset_map();
        display->get_palette();
        memcpy(palette, ::palette, 0x300);
        download_tiles();
    } else {
        load(path, 0);
        init_tables();
    }
}

tilemap::~tilemap()
{
    beep();
    delete map_data;
    delete tile_attr;
}

void tilemap::init_tables()
{
    uint i;
    for (i = 0; i < 0xC8; ++i)
        tbl_mul_tw[i] = i * map_width;
    for (i = 0; i < 0x200; ++i) {
        tbl_tile_src[i] = 0xD980;
        tbl_tile_src[i] += (i / 0x28) * 0x280;
        tbl_tile_src[i] += (i % 0x28) * 2;
    }
    for (i = 0; i < 0x100; ++i)
        tbl_mul80[i] = i * 0x50;
}

void tilemap::init_work_vars()
{
    map_exploded = 0;
    field_92 = map_x = map_y = field_0C = field_0E = field_10 = field_12 = 0;
}

void tilemap::set_viewport(int x, int y, int w, int h)
{
    int i;
    display->cls(1, 1);
    viewport_x = x;                        /* 00 */
    viewport_y = y;                        /* 02 */
    field_22 = viewport_y * 0x50 + viewport_x / 4;
    viewport_w = w;                        /* 04 */
    field_20 = viewport_w / 4;
    viewport_h = h;                        /* 06 */
    field_1C = (viewport_w + 0x20) >> 3;   /* tile cols */
    if (field_1C > 0x28)
        terminate("Viewport width too big.", (uchar far *)0);
    field_1E = (viewport_h + 0x20) >> 3;   /* tile rows */
    if (field_1E > 0x19)
        terminate("Viewport height too big.", (uchar far *)0);
    for (i = 0; i < 0x3E8; ++i) {
        tbl_tile_dst[i] = 0x7D00;
        tbl_tile_dst[i] += (i / 0x28) * 0x280;
        tbl_tile_dst[i] += (i % 0x28) * 2;
    }
    field_18 = field_1C << 3;              /* cached window pixel width */
    field_1A = field_1E << 3;              /* cached window pixel height */
    display->height = field_1A;            /* 0A */
    display->field_07 = 0;                 /* 07 */
    explode();
}

int tilemap::get_map_pos(int x, int y)
{
    int pos = field_92;
    pos += tbl_mul_tw[y >> 3];
    pos += (uint)(x >> 3) % map_width;
    return pos;
}

void tilemap::new_map(uchar far *path, int w, int h)
{
    delete tile_attr;
    init_work_vars();
    if (path) {
        load(path, 0);
        init_tables();
    } else {
        map_width = w;
        map_height = h;
        map_w_pixels = w << 3;
        map_h_pixels = h << 3;
        init_tables();
        reset_map();
        explode();
    }
}

void tilemap::reset_map()
{
    uint i;
    map_size = (ulong)(uint)(map_width * map_height);
    for (i = 0; i < 0x8000; ++i)
        map_data[i] = i >> 7;
    tile_attr = new tattr[map_size];
    if (!tile_attr)
        no_heap("Init map.");
    for (i = 0; i < map_size; ++i) {
        tile_attr[i].attr = 2;
        tile_attr[i].type = 0;
    }
    for (i = 0; i < 0x32; ++i)
        map_hdr[i] = 0;
    field_88 = 0;
    field_89 = 0;
    field_8A = 0;
    cycling = 0;
}

void tilemap::download_tiles()
{
    unsigned var_2, var_4, var_6;
    int var_8, var_A;
    var_6 = 0;
    for (var_4 = 0; var_4 < 0xD; ++var_4) {
        for (var_2 = 0; var_2 < 0x28 - ((var_4 == 0xC) << 3); ++var_2) {
            var_8 = var_2 << 3;
            var_A = (var_4 << 3) + 0x60;
            display->put_bits(var_8, var_A, var_8 + 8, var_A + 8,
                              map_data + (var_6 << 6), 0, 0xBB80);
            ++var_6;
        }
    }
}

void tilemap::update(uint arg_4)
{
    int var_2;
    var_2 = (field_10 >> 2) + 0x7D00 + tbl_mul80[field_12];
    x_update_map(var_2, field_20, viewport_h, field_22 + arg_4);
}

void tilemap::explode()
{
    x_explode_map(map_width, field_1E, tile_attr, field_92,
                  tbl_tile_src, tbl_tile_dst);
    ++map_exploded;
}

uchar tilemap::center_on(uint x, uint y)
{
    int var_2, var_4;
    var_2 = x - (viewport_w >> 1);
    var_4 = y - (viewport_h >> 1);
    set_position(var_2, var_4);
    if (map_exploded) {
        map_exploded = 0;
        return 1;
    }
    return 0;
}

void tilemap::scroll(uchar dir)
{
    switch (dir) {
    case 0: set_position(map_x + 4, map_y); break;
    case 1: set_position(map_x - 4, map_y); break;
    case 2: set_position(map_x, map_y - 1); break;
    case 3: set_position(map_x, map_y + 1); break;
    }
}

void tilemap::set_position(int x, int y)
{
    if (x < 0)
        x = 0;
    if (x + viewport_w > map_w_pixels)
        x = map_w_pixels - viewport_w;
    if (y < 0)
        y = 0;
    if (y + viewport_h > map_h_pixels)
        y = map_h_pixels - viewport_h;
    map_x = x;
    map_y = y;
    if ((map_x > field_0C || field_0C == 0) &&
        (map_x + viewport_w < field_0C + field_18) &&
        (map_y > field_0E || field_0E == 0) &&
        (map_y + viewport_h < field_0E + field_1A)) {
        field_10 = map_x - field_0C;       /* sub-tile offset in window */
        field_12 = map_y - field_0E;
        return;
    }
    field_0C = ((map_x - 0x10) >> 3) << 3; /* new window origin, 8-aligned */
    field_0E = ((map_y - 0x10) >> 3) << 3;
    if (field_0C < 0)
        field_0C = 0;
    if (field_0E < 0)
        field_0E = 0;
    field_92 = tbl_mul_tw[field_0E >> 3];
    field_92 += (uint)(field_0C >> 3) % map_width;
    if (map_x < 0x10)
        field_10 = map_x % 0x10;
    else
        field_10 = (map_x % 8) + 0x10;
    if (map_y < 0x10)
        field_12 = map_y % 0x10;
    else
        field_12 = (map_y % 8) + 0x10;
    explode();
}

void tilemap::save(uchar far *path)
{
    int fd;
    uint len;
    fd = open(path, 0x8304, 0x180);
    if (fd == -1)
        goto fail;
    if (write(fd, &map_width, 2) != 2)      /* this+8E */
        goto fail;
    if (write(fd, &map_height, 2) != 2)     /* this+90 */
        goto fail;
    len = map_size * 4;
    if (write(fd, tile_attr, len) != len)   /* attr array */
        goto fail;
    if (write(fd, map_data, 0x8000) != 0x8000)
        goto fail;
    if (write(fd, palette, 0x300) != 0x300) /* this+9C */
        goto fail;
    if (write(fd, map_hdr, 0x64) != 0x64)   /* this+24 */
        goto fail;
    len = 4;
    if (write(fd, &field_88, len) != len)   /* this+88 — cycle params */
        goto fail;
    close(fd);
    return;
fail:
    close(fd);
    write_error("Saving map.");
}

void tilemap::load(uchar far *path, uchar arg_8)
{
    uint len;
    if (cycling) {                          /* 8C */
        display->field_05 = 0;              /* kill display cycling */
        cycling = 0;
    }
    if ((long)g_open_element(path) == -1L)
        goto fail;
    if (g_element_read(&map_width, 2) != 2)      /* this+8E */
        goto fail;
    if (g_element_read(&map_height, 2) != 2)     /* this+90 */
        goto fail;
    map_size = (ulong)(uint)(map_width * map_height);
    map_w_pixels = map_width << 3;
    map_h_pixels = map_height << 3;
    tile_attr = new tattr[map_size];
    len = map_size * 4;
    if ((uint)g_element_read(tile_attr, len) != len)
        goto fail;
    if (map_data == 0) {
        map_data = new char[0x8000];
        if (!map_data)
            no_heap("Tiles.");
    }
    if (g_element_read(map_data, 0x4000) != 0x4000)
        goto fail;
    if (g_element_read(map_data + 0x4000, 0x4000) != 0x4000)
        goto fail;
    if (g_element_read(palette, 0x300) != 0x300)  /* this+9C */
        goto fail;
    if (g_element_read(map_hdr, 0x64) != 0x64)     /* this+24 */
        goto fail;
    len = 4;
    if (g_element_read(&field_88, len) != len)    /* this+88 */
        goto fail;
    g_close_element();
    reset_palette(arg_8);
    download_tiles();
    return;
fail:
    g_close_element();
    read_error("Loading map.");
}

void tilemap::change_tile(ulong pos, uint val)
{
    if (map_size < pos) {
        beep();
        terminate("Tile change out of range.", (uchar far *)0);
    }
    tile_attr[pos].attr = val;
}

void tilemap::add_cycle(uchar a, uchar b, uchar c)
{
    field_88 = a;
    field_89 = b;
    field_8A = c;
    display->setup_cycle(a, b, c);
}

void tilemap::turn_cycling(uchar on)
{
    cycling = on;                          /* 8C */
    display->turn_cycling(on);
    if (on == 0)
        field_88 = 0;
}

void tilemap::reset_palette(uchar apply)
{
    memcpy(::palette, palette, 0x300);      /* map palette -> global */
    if (apply)
        display->set_palette();
    if (field_88) {
        display->setup_cycle(field_88, field_89, field_8A);
        turn_cycling(1);
    }
}

void tilemap::purge_tiles()
{
    if (map_data) {
        delete map_data;
        map_data = 0;
    }
}

uchar tilemap::check_bounds(int *x1, int *y1, int *x2, int *y2)
{
    if (*x2 < field_0C)
        return 0;
    if (*x1 > field_0C + field_18)
        return 0;
    if (*y2 < field_0E)
        return 0;
    if (*y1 > field_0E + field_1A)
        return 0;
    *x1 -= field_0C;
    *x2 -= field_0C;
    *y1 -= field_0E;
    *y2 -= field_0E;
    return 1;
}

void tilemap::erase_bits(int x1, int y1, int x2, int y2)
{
    unsigned var_2, var_4;
    int var_6, var_8, var_A, var_C;
    uint var_E;
    int var_10, var_12, var_14, var_16;
    x1 = (x1 >> 3) << 3;
    y1 = (y1 >> 3) << 3;
    if (!check_bounds(&x1, &y1, &x2, &y2))
        return;
    if (x1 < 0)
        x1 = 0;
    if (y1 < 0)
        y1 = 0;
    if (x2 > 0x138)
        x2 = 0x138;
    if (field_1A - 8 < y2)
        y2 = field_1A - 8;
    var_14 = ((x2 - x1) >> 3) + 1;          /* tiles wide */
    var_16 = ((y2 - y1) >> 3) + 1;          /* tiles high */
    var_10 = get_map_pos(x1, y1);           /* map index */
    var_12 = map_width - var_14;            /* row skip */
    var_6 = x1;
    var_8 = y1;
    for (var_4 = 0; var_4 < var_16; ++var_4) {
        for (var_2 = 0; var_2 < var_14; ++var_2) {
            var_E = tile_attr[var_10].attr;          /* tile index */
            var_A = (var_E % 0x28) << 3;             /* src x */
            var_C = ((var_E / 0x28) << 3) + 0x60;    /* src y */
            display->copy_bits(var_A, var_C, var_A + 8, var_C + 8,
                               var_6, var_8, 0xBB80, 0x7D00, 0x140, 0x140);
            var_6 += 8;
            ++var_10;
        }
        var_6 = x1;
        var_8 += 8;
        var_10 += var_12;
    }
}

void tilemap::put_bits_masked(int x1, int y1, int w, int h,
                              uchar far *bits, uint arg_10, uchar arg_12)
{
    int x2 = x1 + w;
    int y2 = y1 + h;
    if (!check_bounds(&x1, &y1, &x2, &y2))
        return;
    display->put_bits_masked(x1, y1, x2, y2, bits, arg_10, 0x7D00, arg_12);
}
