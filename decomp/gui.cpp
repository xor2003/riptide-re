/* ==========================================================================
 * seg137f — GUI toolkit: ms_mouse driver, gui_item hierarchy (pull_down,
 * menu_bar, button, text_box, prompt_box, file_box, text_pager), and the
 * i_* interface wrappers.  Reconstructed from RIPTIDE.lst; compiles under
 * BC++3.1 -ml -3 -O -r- -vi-.
 * ======================================================================== */
#include "riptide.h"
#include <dos.h>
#include <string.h>

/* ==========================================================================
 * ms_mouse — int 33h driver wrapper.  A REGPACK image sits at this+0x1C and is
 * passed to int86 for every driver call; field_2C/2D/2E alias r_es/r_flags and
 * are used as button flags (the int33 fns used never set es/flags).
 * ======================================================================== */

ms_mouse::ms_mouse()
{
    REGPACK preg;

    field_01 = 1;
    field_00 = 0;
    field_02 = 0;
    field_2C = field_2D = 0;
    field_14 = 0;
    field_16 = 0;
    regs.x.ax = 0;                                   /* fn 0 — reset/status */
    int86(0x33, &regs, &regs);
    if (regs.x.ax == 0)
        field_2E = 0;                           /* no driver → flag clear */
    else
        field_2E = 1;
    if (display->field_00 == 0) {               /* software cursor mode */
        set_cursor((uchar far *)default_mouse, 5, 5);
        preg.r_ax = 0x0C;                       /* fn 0x0C — set event handler */
        preg.r_cx = 0x1F;
        preg.r_dx = (int)(void far *)mouse_handler;   /* FP_OFF */
        preg.r_es = FP_SEG(mouse_handler);
        intr(0x33, &preg);
        field_08 = 0;
    }
    field_0C = 0xA0;
    field_0E = 0x64;
    _m_dont_handle = 0;
}

ms_mouse::~ms_mouse()
{
    hide();
    regs.x.ax = 0;
    int86(0x33, &regs, &regs);
}

void ms_mouse::set_cursor(uchar far *bm, int hx, int hy)
{
    field_04 = bm;
    field_10 = hx;
    field_12 = hy;
}

uchar ms_mouse::get_event()
{
    field_01 = 0;
    while (field_01 == 0) {
        if (doit() == 0)
            break;
    }
    return field_01;
}

void ms_mouse::set_coords(int x, int y)
{
    regs.x.ax = 4;                                   /* fn 4 — set position */
    regs.x.cx = x << 1;                              /* mickeys = pixels*2 */
    regs.x.dx = y;
    int86(0x33, &regs, &regs);
    mouse->field_0C = x;
    mouse->field_0E = y;
    get_status();
}

void ms_mouse::show()
{
    if (field_02 == 0) {
        field_02 = 1;
        field_14 = display->width;
        field_16 = display->height;
        display->width  = 0x140;
        display->height = 0xC8;
        if (display->field_00 == 0)
            draw_mouse();
        else {
            regs.x.ax = 1;                           /* fn 1 — show hw cursor */
            int86(0x33, &regs, &regs);
        }
    }
}

void ms_mouse::hide()
{
    if (field_02 != 0) {
        if (display->field_00 == 0)
            erase_mouse();
        else {
            regs.x.ax = 2;                           /* fn 2 — hide hw cursor */
            int86(0x33, &regs, &regs);
        }
        display->width  = field_14;
        display->height = field_16;
        field_02 = 0;
    }
}

uchar ms_mouse::button_press(uchar btn)
{
    get_status();
    if (btn == 0 && field_00 != 0)
        return 1;
    if (field_2C != 0 && btn == 1)
        return 1;
    if (field_2D != 0 && btn == 3)
        return 1;
    return 0;
}

uchar ms_mouse::in_box(int x1, int y1, int x2, int y2)
{
    get_status();
    return (field_0C >= x1 && field_0C <= x2 && field_0E >= y1 && field_0E <= y2);
}

uchar ms_mouse::pressed_in_box(int x1, int y1, int x2, int y2)
{
    get_status();
    if (in_box(x1, y1, x2, y2) && field_00 != 0)
        return 1;
    return 0;
}

uchar ms_mouse::doit()
{
    get_status();
    return 1;
}

void ms_mouse::get_status()
{
    int btns;

    if (display->field_00 == 0)                 /* software mode: ISR maintains */
        return;                                 /*   the fields already */
    regs.x.ax = 3;                                   /* fn 3 — get pos + buttons */
    int86(0x33, &regs, &regs);
    field_0C = regs.x.cx >> 1;
    field_0E = regs.x.dx;
    btns = regs.x.bx & 7;
    if (btns != 0) field_00 = 1; else field_00 = 0;
    if (btns == 1) field_2C = 1; else field_2C = 0;
    if (btns == 2) field_2D = 1; else field_2D = 0;
    if (field_01 == 0 && field_00 == 0)
        field_01 = 1;
}

/* ==========================================================================
 * Global mouse helpers.  mouse_handler is installed via int33 fn 0x0C as the
 * event subroutine (called with bx=buttons, cx=x-mickeys, dx=y).
 * ======================================================================== */

void mouse_handler()
{
    int b, x, y;

    if (_m_dont_handle)
        return;
    b = _BX;                                    /* incoming bx = buttons */
    x = _CX >> 1;                               /* incoming cx mickeys → px */
    y = _DX;                                    /* incoming dy */
    if (mouse->field_02 == 1)
        erase_mouse();
    mouse->field_0C = x;
    mouse->field_0E = y;
    mouse->field_2C = b & 1;
    mouse->field_2D = b & 2;
    mouse->field_00 = mouse->field_2C;
    if (mouse->field_01 == 0 && mouse->field_00 == 0)
        mouse->field_01 = 1;
    if (mouse->field_02 == 1)
        draw_mouse();
}

void draw_mouse()
{
    mouse->field_18 = mouse->field_0C & 0xFFFC;
    mouse->field_1A = (mouse->field_10 & 0xFFFC) + 4;
    _m_dont_handle = 1;
    /* save the screen rect under the cursor into the offscreen page at 0xCAD0 */
    display->copy_bits(mouse->field_18, mouse->field_0E,
                       mouse->field_18 + mouse->field_1A,
                       mouse->field_0E + mouse->field_12,
                       0, 0, 0, 0xCAD0, 0x140, mouse->field_1A);
    display->put_bits_masked(mouse->field_0C, mouse->field_0E,
                             mouse->field_0C + mouse->field_10,
                             mouse->field_0E + mouse->field_12,
                             mouse->field_04, 0, 0, 0);
    _m_dont_handle = 0;
}

void erase_mouse()
{
    _m_dont_handle = 1;
    /* restore the background saved by draw_mouse */
    display->copy_bits(0, 0, mouse->field_1A, mouse->field_12,
                       mouse->field_18, mouse->field_0E,
                       0xCAD0, 0, mouse->field_1A, 0x140);
    _m_dont_handle = 0;
}

/* ==========================================================================
 * gui_item — base class.  draw/erase are empty stubs; poll() is a plain
 * (non-virtual) stub returning 0 that subclasses shadow with a real virtual.
 * ======================================================================== */

gui_item::gui_item()
{
    field_0C = 0;
    field_0E = 0;
    field_02 = field_04 = field_06 = field_08 = field_0A = 0;
}

/* gui_item::~gui_item / draw / erase / poll live in other segments in the
 * original build (dtor+draw+erase in seg03f9, poll stub in seg0b2c); the
 * vtable still resolves to them.  They are empty stubs. */

/* ==========================================================================
 * i_* — interface wrappers used by the game code.
 * ======================================================================== */

void i_init_interface(void far *l, void far *r, void far *u,
                      void far *d, void far *b)
{
    mouse        = new ms_mouse;
    the_menu_bar = new menu_bar;
    pd_redraws         = 0;
    show_box_on        = 0;
    menu_bar_height    = 9;
    maximum_text_length = 8;
    i_external_left   = (uchar (far *)(void))l;
    i_external_right  = (uchar (far *)(void))r;
    i_external_up     = (uchar (far *)(void))u;
    i_external_down   = (uchar (far *)(void))d;
    i_external_button = (uchar (far *)(void))b;
}

void i_poll_interface()
{
    the_menu_bar->poll();
}

void i_set_text(uchar fg, uchar bg, uchar a4, uchar a6)
{
    display->field_01 = bg;
    display->field_04 = fg;
    display->field_02 = a6;
    display->field_03 = a4;
    menu_bar_height = (bg ? 1 : 0) + 9;
}

void i_no_imp()
{
    i_inform((uchar far *)"This feature has not\nbeen implemented yet.", 0, 0);
}

int i_get_int(uchar far *title, uchar far *arg_4)
{
    prompt_box far *pb;
    int v;

    pb = new prompt_box(title);
    pb->field_14 = arg_4;
    pb->draw();
    pb->poll();
    if (pb->field_1D != 0) {
        delete pb;
        return -1;
    }
    v = pb->field_24;
    delete pb;
    return v;
}

uchar far *i_get_string(uchar far *title, uchar far *arg_4)
{
    prompt_box far *pb;
    uchar far *s;

    pb = new prompt_box(title);
    pb->field_14 = arg_4;
    pb->draw();
    pb->poll();
    if (pb->field_1D != 0) {
        delete pb;
        return 0;
    }
    s = (uchar far *)strdup((char far *)pb->field_1E);
    delete pb;
    return s;
}

uchar far *i_load_file(uchar far *src, uchar far *dest)
{
    text_box far *tb;
    uchar far *path;

  restart:
    tb = new text_box((uchar far *)"Open File");
    tb->add_file_box(src);
    tb->add_button((uchar far *)"Cancel", 0);
    tb->add_button((uchar far *)"Ok", 0);
    tb->add_button((uchar far *)"Cd", 0);
    tb->draw();
    while (tb->poll() == 0)
        ;
    if (tb->buttons[2]->field_20 != 0) {
      getpath:
        path = i_get_string((uchar far *)"Change Directory",
                            (uchar far *)"Enter new path:");
        if (path != 0 && chdir((char far *)path) == -1) {
            i_inform((uchar far *)"Not a valid path.", 0, 0);
            goto getpath;
        }
        delete tb;
        goto restart;
    }
    if (tb->field_18->field_36 != 0 && tb->buttons[0]->field_20 == 0)
        strcpy((char far *)dest, (char far *)tb->field_18->field_36);
    else
        dest = 0;
    delete tb;
    mouse->get_event();
    return dest;
}

uchar i_yes_cancel(uchar far *s, uchar arg_4)
{
    text_box far *tb;
    uchar res;

    tb = new text_box(0);
    parse_box_string(tb, s);
    if (arg_4 != 0) {
        tb->add_button((uchar far *)"No", 0);
        tb->add_button((uchar far *)"Yes", 0);
    } else {
        tb->add_button((uchar far *)"Cancel", 0);
        tb->add_button((uchar far *)"Ok", 0);
    }
    tb->draw();
    while (tb->poll() == 0)
        ;
    if (((button far *)tb->buttons[0])->field_20 != 0)
        res = 1;
    else
        res = 0;
    release_box_strings(tb);
    delete tb;
    return res;
}

int i_inform(uchar far *s, uchar arg_4, uchar far *arg_6)
{
    text_box far *tb;
    uchar hadcursor;

    tb = new text_box(arg_6);
    parse_box_string(tb, s);
    tb->add_button((uchar far *)"Ok", 0);
    tb->field_6C = arg_4;
    if (mouse->field_02 != 0)
        hadcursor = 1;
    else {
        hadcursor = 0;
        mouse->show();
    }
    tb->draw();
    while (tb->poll() == 0)
        ;
    release_box_strings(tb);
    delete tb;
    if (hadcursor == 0)
        mouse->hide();
    return 0;
}

void i_show_box(uchar far *s, int arg_4, int arg_6,
                uchar far *arg_8, uchar far *arg_C)
{
    if (show_box_on == 0) {
        show_box = new text_box(arg_C);
        parse_box_string(show_box, s);
        if (arg_8 != 0)
            show_box->add_bitmap(arg_4, arg_6, arg_8);
        show_box->field_06 -= 0x14;
        show_box->draw();
        show_box_on = 1;
    }
}

void i_hide_box(uchar arg_0)
{
    if (show_box_on != 0) {
        show_box_on = 0;
        if (arg_0 != 0)
            show_box->field_77 = 1;
        release_box_strings(show_box);
        delete show_box;
    }
}

/* ==========================================================================
 * parse_box_string — split a '\n'-separated string into add_string calls.
 * ======================================================================== */
void parse_box_string(text_box far *tb, uchar far *s)
{
    uchar far *start, *end, *line;
    uint i;

    start = s;
    end   = s;
    i = 0;
    while (i <= strlen((char far *)s)) {
        if (s[i] == '\n' || s[i] == 0) {
            end = s + i;
            line = (uchar far *)new char[(int)(end - start) + 1];
            strncpy((char far *)line, (char far *)start, (int)(end - start));
            ((char far *)line)[(int)(end - start)] = 0;
            tb->add_string(line);
            start = end + 1;
        }
        i++;
    }
}

/* ==========================================================================
 * release_box_strings — delete every string in the text_box's list.
 * ======================================================================== */
void release_box_strings(text_box far *tb)
{
    uint i;

    for (i = 0; i < tb->field_0A; i++)
        delete tb->field_1C[i];
}

/* ==========================================================================
 * draw_shadow_box — raised-panel shadow via three fill_rect calls.
 * ======================================================================== */
void draw_shadow_box(int x1, int y1, int x2, int y2)
{
    display->fill_rect(x1, y1, x2, y2, display->field_02, display->field_03, 0);
    display->fill_rect(x1 + 2, y2, x2 + 1, y2 + 1, 0, 0xFFFF, 0);
    display->fill_rect(x2, y1 + 2, x2 + 1, y2, 0, 0xFFFF, 0);
}

/* ==========================================================================
 * high_light — invert a rect then print centred text over it.
 * ======================================================================== */
void high_light(int x1, int y1, int x2, int y2, uchar far *s,
                int arg_C, int arg_E, uchar inv)
{
    display->fill_rect(x1, y1, x2, y2,
                       inv ? display->field_02 : display->field_03,
                       0xFFFF, 0);
    display->print_at_xy(x1 + arg_C, y1 + arg_E, s, 0);
}

/* ==========================================================================
 * pull_down — a drop-down menu attached to a menu_bar slot.
 * ======================================================================== */

pull_down::pull_down(uchar far *title)
{
    field_64 = title;
    field_68 = strlen(field_64) * 8 + 1;
    field_6A = -1;
}

void pull_down::add_item(uchar far *s, void far *cb)
{
    pull_down_item far *it = (pull_down_item far *)new char[0xA];
    it->enabled = 1;
    it->s       = s;
    it->cb      = (void (far *)(void))cb;
    if (strlen(s) * 8 + 0x18 > field_08)
        field_08 = strlen(s) * 8 + 0x18;
    field_06 += 0xC;
    items[field_0A++] = it;
}

void pull_down::draw()
{
    display->print_at_xy(field_02 + 8, field_04, field_64, 0);
}

uchar pull_down::activate()
{
    int x1 = field_02;
    int x2 = field_02 + field_68 + 0x12;
    uchar save_bg, save_fg;
    int  y, i;

    mouse->hide();
    field_0E = (uchar far *)display->get_bits(x1, 0, x1 + field_08,
                                 menu_bar_height + 1 + field_06 + 2);
    display->pause(1);
    high_light(x1, 0, x2, menu_bar_height, field_64, 8, 1, 0);
    draw_shadow_box(x1, menu_bar_height,
                    x1 - 2 + field_08, menu_bar_height + field_06 + 2);
    y = menu_bar_height + 3;
    for (i = 0; i < field_0A; i++) {
        if (items[i]->enabled == 1) {
            display->print_at_xy(x1 + 8, y, items[i]->s, 0);
        } else {
            save_bg = display->field_01;
            save_fg = display->field_04;
            display->field_04 = display->field_03;
            if (save_bg != 0)
                display->field_01 = 1;
            display->print_at_xy(x1 + 8, y, items[i]->s, 0);
            display->field_04 = save_fg;
            display->field_01 = save_bg;
        }
        y += 0xC;
    }
    field_6A = 0;
    update_cur_selection();
    mouse->show();
    return poll();
}

void pull_down::update_cur_selection()
{
    int x1, x2, y1, y2;
    if (items[field_6A]->enabled != 1)
        return;
    x1 = field_02 + 1;
    x2 = field_02 + field_08 - 3;
    y1 = menu_bar_height + field_6A * 0xC + 1;
    y2 = y1 + 0xC;
    high_light(x1, y1, x2, y2, items[field_6A]->s, 7, 2, 0);
}

void pull_down::erase_cur_selection()
{
    int x1, x2, y1, y2;
    if (items[field_6A]->enabled != 1)
        return;
    x1 = field_02 + 1;
    x2 = field_02 + field_08 - 3;
    y1 = menu_bar_height + field_6A * 0xC + 1;
    y2 = y1 + 0xC;
    high_light(x1, y1, x2, y2, items[field_6A]->s, 7, 2, 1);
}

uchar pull_down::get_mouse_sel_location()
{
    int sel_top = menu_bar_height + field_6A * 0xC + 1;
    int sel_bot = sel_top + 0xC;
    int midx    = (mouse->field_0E - menu_bar_height) / 0xC;

    if (items[midx]->enabled != 0) {
        if (mouse->field_0E < sel_top)
            return 0;
        if (mouse->field_0E > sel_bot)
            return 1;
    }
    return 2;
}

void pull_down::increase_cur_selection()
{
    mouse->hide();
    erase_cur_selection();
    if (field_6A == field_0A - 1)
        field_6A = 0;
    else
        field_6A++;
    update_cur_selection();
    mouse->show();
    if (items[field_6A]->enabled == 0)
        increase_cur_selection();
}

void pull_down::decrease_cur_selection()
{
    mouse->hide();
    erase_cur_selection();
    if (field_6A == 0)
        field_6A = field_0A - 1;
    else
        field_6A--;
    update_cur_selection();
    mouse->show();
    if (items[field_6A]->enabled == 0)
        decrease_cur_selection();
}

uchar pull_down::poll()
{
    int   done     = 0;
    int   dragging = 0;
    uchar result   = 0;
    int   selloc, midx;
    uchar over_title, over_drop;

    while (done == 0) {
        if (byte_2D3AC != 0) {
            field_6A = -1;
            done++;
        }
        over_title = mouse->in_box(field_02, 0,
                                   field_02 + field_68 + 0x12, menu_bar_height);
        over_drop  = mouse->in_box(field_02 + 1, menu_bar_height + 1,
                                   field_02 + field_08 - 1,
                                   menu_bar_height + field_06 + 1);
        if (mouse->field_00 == 0) {
            if (dragging != 0 && over_drop != 0)
                done++;
            else
                dragging = 0;
            if (i_external_left != 0) {
                if (i_external_left()) {
                    result = 1; field_6A = -1; done++;
                } else if (i_external_right()) {
                    result = 2; field_6A = -1; done++;
                } else if (i_external_up()) {
                    decrease_cur_selection();
                    display->pause(0xF);
                } else if (i_external_down()) {
                    increase_cur_selection();
                    display->pause(0xF);
                }
                if (i_external_button())
                    done++;
            }
        } else {
            if (over_title != 0)
                continue;
            if (over_drop == 0 && mouse->field_0E < menu_bar_height) {
                field_6A = -1;
                done++;
                continue;
            }
            if (dragging == 0) {
                if (over_drop != 0) {
                    midx = (mouse->field_0E - menu_bar_height) / 0xC;
                    if (items[midx]->enabled == 1) {
                        mouse->hide();
                        erase_cur_selection();
                        field_6A = midx;
                        update_cur_selection();
                        mouse->show();
                        dragging = 1;
                    }
                }
            } else if (over_drop != 0) {
                selloc = get_mouse_sel_location();
                if (selloc == 0) decrease_cur_selection();
                if (selloc == 1) increase_cur_selection();
            }
        }
    }
    mouse->hide();
    display->put_bits(field_02, 0, field_02 + field_08,
                    menu_bar_height + 1 + field_06 + 2, field_0E, 0, 0);
    delete field_0E;
    mouse->show();
    if (field_6A != -1 && items[field_6A]->enabled != 0 &&
        items[field_6A]->cb != 0) {
        items[field_6A]->cb();
        if (pd_redraws == 1)
            result |= 0x80;
    }
    field_6A = -1;
    return result;
}

/* ==========================================================================
 * menu_bar — the top-of-screen strip of pull_down menus.
 * ======================================================================== */

menu_bar::menu_bar()
{
    field_02 = 1;
    field_04 = 1;
    field_68 = field_13 = 0;
}

void menu_bar::add_item(pull_down far *pd)
{
    items[field_0A] = pd;
    if (field_0A > 0)
        items[field_0A]->field_02 =
            items[field_0A - 1]->field_02 +
            strlen(items[field_0A - 1]->field_64) * 8 + 0xC;
    else
        items[field_0A]->field_02 = 0;
    items[field_0A]->field_04 = 1;
    field_0A++;
}

void menu_bar::draw()
{
    uint i;
    if (field_68 != 0)
        return;
    field_68 = 1;
    field_0E = (uchar far *)display->get_bits(0, 0, 0x140, menu_bar_height + 1);
    display->fill_rect(0, 0, 0x140, menu_bar_height + 1,
                       display->field_02, 0xFFFF, 0);
    display->fill_rect(0, menu_bar_height, 0x140, menu_bar_height + 1,
                       display->field_03, 0xFFFF, 0);
    for (i = 0; i < field_0A; i++)
        items[i]->draw();
}

void menu_bar::erase()
{
    if (field_68 == 0)
        return;
    display->put_bits(0, 0, 0x140, menu_bar_height + 1, field_0E, 0, 0);
    delete field_0E;
    field_68 = 0;
}

uchar menu_bar::poll()
{
    uint i;
    pull_down far *pd;
    int x1, x2;

    if (i_external_button != 0)
        while (i_external_button() != 0)
            ;
    if (mouse->field_2E == 0) {
        field_14 = items[0]->activate();
    } else if (field_16 != -1) {
        field_13 = field_16;
        field_14 = items[field_16]->activate();
        if (!(field_14 & 0x80))
            field_16 = -1;
    } else {
        field_14 = 0;
        for (i = 0; i < field_0A; i++) {
            pd = items[i];
            x1 = pd->field_02;
            x2 = pd->field_02 + strlen(pd->field_64) * 8 + 0xA;
            if (mouse->pressed_in_box(x1, 0, x2, menu_bar_height)) {
                field_14 = pd->activate();
                field_13 = i;
                break;
            }
        }
        if (field_14 & 0x80)
            field_16 = i;
    }
    while (field_14 & 3) {
        if (field_14 == 1) {
            if (--field_13 == 0xFF)
                field_13 = field_0A - 1;
        } else {
            if (++field_13 == field_0A)
                field_13 = 0;
        }
        display->pause(0xF);
        field_14 = items[field_13]->activate();
        if (field_14 & 0x80)
            field_16 = field_13;
    }
    return 0;
}

void menu_bar::toggle_item(uchar far *s1, uchar far *s2, uchar val)
{
    uchar found = 0;
    uchar i = 0, j;

    while (i < field_0A) {
        if (strcmp(s1, items[i]->field_64) == 0) {
            j = 0;
            while (j < items[i]->field_0A) {
                if (strcmp(items[i]->items[j]->s, s2) == 0) {
                    items[i]->items[j]->enabled = val;
                    found = 1;
                    break;
                }
                j++;
            }
        }
        if (found != 0)
            return;
        i++;
    }
}

/* ---------------------------------------------------------------------------
 * button — clickable push-button.  vtable = {draw, gui_item::erase, poll}.
 * field_14 = label; 18/1A = box x/y; 1C/1E = centred text x/y; 13 = style;
 * field_20 = armed state; field_22 = user callback (void far*, called).
 * ------------------------------------------------------------------------- */
button::button(uchar far *label, void far *cb, uchar centered) : gui_item()
{
    field_14 = label;
    field_22 = cb;
    field_08 = 0x40;
    field_06 = 0x0B;
    field_13 = centered;
    field_20 = 0;
}

void button::draw()
{
    draw_shadow_box(field_18, field_1A, field_18 + field_08,
                    field_1A + field_06 + (display->field_01 != 0));
    field_1C = field_18 + (field_08 >> 1) - ((strlen(field_14) << 3) >> 1);
    field_1E = field_1A + 2;
    display->print_at_xy(field_1C, field_1E, field_14, 0);
}

uchar button::poll()
{
    int txoff = field_1C - field_18;
    if (mouse->in_box(field_18, field_1A, field_18 + field_08 + 1,
                      field_1A + field_06 + 1)
        && i_external_button != 0 && i_external_button() != 0) {
        mouse->hide();
        high_light(field_18 + 1, field_1A + 1, field_18 + field_08 - 1,
                   field_1A + field_06, field_14, txoff, 2, 0);
        display->pause(2);
        high_light(field_18 + 1, field_1A + 1, field_18 + field_08 - 1,
                   field_1A + field_06, field_14, txoff, 1, 1);
        mouse->show();
        field_20 = 1;
        if (field_22 == 0)
            return 1;
        field_20 = 0;
        return ((uchar (far *)(void))field_22)();
    }
    if (mouse->pressed_in_box(field_18, field_1A, field_18 + field_08 + 1,
                              field_1A + field_06 + 1)) {
        if (field_20 != 1) {
            field_20 = 1;
            mouse->hide();
            high_light(field_18 + 1, field_1A + 1, field_18 + field_08 - 1,
                       field_1A + field_06, field_14, txoff, 2, 0);
            mouse->show();
        }
        return 0;
    }
    if (field_20 == 1) {
        if (mouse->field_00 == 0) {
            mouse->hide();
            high_light(field_18 + 1, field_1A + 1, field_18 + field_08 - 1,
                       field_1A + field_06, field_14, txoff, 1, 1);
            mouse->show();
            if (field_22 == 0)
                return 1;
            field_20 = 0;
            return ((uchar (far *)(void))field_22)();
        }
        mouse->hide();
        high_light(field_18 + 1, field_1A + 1, field_18 + field_08 - 1,
                   field_1A + field_06, field_14, txoff, 1, 1);
        mouse->show();
        field_20 = 0;
    }
    return 0;
}

void button::mouse_to_me()
{
    uchar was_shown;
    if (mouse->field_02 != 0) {
        was_shown = 1;
        mouse->hide();
    } else
        was_shown = 0;
    mouse->set_coords(field_18 + (field_08 >> 1), field_1A + field_06 - 1);
    if (was_shown != 0)
        mouse->show();
}

/* ---------------------------------------------------------------------------
 * text_box — bordered dialog box holding text lines, an optional bitmap, an
 * optional file_box, and up to 4 buttons.  vtable = {draw, erase, poll}.
 * field_06 = box height, field_08 = box width; 02/04 = centred x/y.
 * ------------------------------------------------------------------------- */
text_box::text_box(uchar far *title) : gui_item()
{
    field_72 = title;
    field_06 = 0x24;
    field_08 = 0x64;
    field_02 = 0xA0 - (field_08 >> 1);
    field_04 = 0x64 - (field_06 >> 1);
    field_6C = 0;
    field_6D = 0;
    field_76 = 0;
    field_77 = 0;
    field_18 = 0;
    field_6E = 0;
    field_16 = 0;
    field_14 = 0;
    field_78 = 0;
}

text_box::~text_box()
{
    int i;
    erase();
    for (i = 0; i < field_76; i++)
        delete buttons[i];
    if (field_18)
        delete field_18;
}

void text_box::add_bitmap(int off, int h, uchar far *bits)
{
    field_06 += h;
    field_04 = 0x64 - (field_06 >> 1);
    field_14 = off;
    field_16 = h;
    field_6E = bits;
}

void text_box::add_string(uchar far *s)
{
    uint w;
    field_1C[field_0A++] = s;
    w = strlen(s) * 8 + 0x20;
    field_06 += 0xC;
    if (field_08 < w)
        field_08 = w;
    field_02 = 0xA0 - (field_08 >> 1);
    field_04 = 0x64 - (field_06 >> 1);
}

void text_box::add_file_box(uchar far *path)
{
    field_06 += 0x84;
    field_08 = 0xE0;
    field_02 = 0xA0 - (field_08 >> 1);
    field_04 = 0x64 - (field_06 >> 1);
    field_18 = new file_box(path);
    field_18->field_02 = field_02 + 2;
    field_18->field_04 = field_04 + 0x1A;
}

void text_box::add_button(uchar far *label, void far *cb)
{
    button far *b = new button(label, cb, 0);
    if (field_18 == 0) {
        b->field_18 = field_02 + field_08 - 4 - (field_76 + 1) * 0x44;
        b->field_1A = field_04 + field_06 - 0xF;
    } else {
        b->field_18 = field_02 + field_08 - 0x40 - 8;
        b->field_1A = field_04 + field_06 - field_76 * 0xF - 0xF;
    }
    if (field_76 == 0)
        b->mouse_to_me();
    buttons[field_76++] = b;
}

void text_box::draw()
{
    int was_shown, sx, sy, tx, ty, bx, by, i;
    if (mouse->field_02 != 0) {
        mouse->hide();
        was_shown = 1;
    } else
        was_shown = 0;
    field_0E = (uchar far *)display->get_bits(field_02, field_04,
                                 field_02 + field_08 + 1, field_04 + field_06 + 1);
    if (field_0E == 0)
        no_heap("Text Box");
    draw_shadow_box(field_02, field_04, field_02 + field_08, field_04 + field_06);
    if (field_72 == 0) {
        display->fill_rect(field_02, field_04, field_02 + field_08,
                           field_04 + 0xA, display->field_03, -1, 0);
    } else {
        tx = 0xA0 - ((strlen(field_72) << 3) >> 1);
        ty = field_04 + 1;
        display->fill_rect(field_02, field_04, field_02 + field_08,
                           field_04 + 0xA, display->field_03, -1, 0);
        display->print_at_xy(tx, ty, field_72, 0);
    }
    sy = field_04 + 0xC;
    for (i = 0; i < field_0A; i++) {
        if (field_6C == 0)
            sx = 0xA0 - ((strlen(field_1C[i]) << 3) >> 1);
        else if (field_6C == 1)
            sx = field_02 + 4;
        display->print_at_xy(sx, sy, field_1C[i], 0);
        sy += 0xC;
    }
    for (i = 0; i < field_76; i++)
        buttons[i]->draw();
    if (field_18 != 0)
        field_18->draw();
    if (field_6E != 0) {
        bx = 0xA0 - field_14 / 2;
        by = field_04 + field_0A * 0xC + 0xC;
        display->put_bits(bx, by, bx + field_14, by + field_16, field_6E, 0, 0);
    }
    if (was_shown != 0)
        mouse->show();
    if (i_external_button != 0)
        while (i_external_button() != 0)
            ;
}

uchar text_box::poll()
{
    int i;
    for (i = 0; i < field_76; i++) {
        if (field_18 != 0 && field_18->poll())
            return 1;
        if (buttons[i]->poll())
            return 1;
    }
    if (i_external_left != 0) {
        if (i_external_left() != 0) {
            if (field_78 != field_76 - 1) {
                field_78++;
                buttons[field_78]->mouse_to_me();
                display->pause(0xF);
            }
        }
        if (i_external_right() != 0) {
            if (field_78 != 0) {
                field_78--;
                buttons[field_78]->mouse_to_me();
                display->pause(0xF);
            }
        }
    }
    return 0;
}

void text_box::erase()
{
    uchar was_shown;
    if (field_77 == 0) {
        if (mouse->field_02 != 0) {
            mouse->hide();
            was_shown = 1;
        } else
            was_shown = 0;
        display->put_bits(field_02, field_04, field_02 + field_08 + 1,
                          field_04 + field_06 + 1, field_0E, 0, 0);
        if (was_shown != 0)
            mouse->show();
    }
    delete field_0E;
}

/* ---------------------------------------------------------------------------
 * prompt_box — single-line text/number entry dialog.
 * vtable = {draw, gui_item::erase, poll}.
 * ------------------------------------------------------------------------- */
prompt_box::prompt_box(uchar far *prompt) : gui_item()
{
    field_18 = prompt;
    field_1C = 0;
    field_1D = 0;
    field_24 = 0;
    field_22 = maximum_text_length;
    field_1E = new uchar[0x1E];
    memset(field_1E, 0, 0x1E);
}

prompt_box::~prompt_box()
{
    int was_shown = mouse->field_02;
    mouse->hide();
    display->put_bits(field_02, field_04, field_02 + field_08 + 1,
                      field_04 + field_06 + 1, field_0E, 0, 0);
    delete field_0E;
    if (was_shown != 0)
        mouse->show();
    delete field_1E;
}

void prompt_box::draw()
{
    int was_shown, tx, ty;
    field_08 = (strlen(field_14) << 3) + 0x20;
    if (maximum_text_length * 8 > field_08)
        field_08 = maximum_text_length * 8;
    field_06 = 0x24;
    field_02 = 0xA0 - (field_08 >> 1);
    field_04 = 0x64 - (field_06 >> 1);
    field_26 = field_02 + 8;
    field_28 = field_04 + field_06 - 0xE;
    was_shown = mouse->field_02;
    mouse->hide();
    field_0E = (uchar far *)display->get_bits(field_02, field_04,
                                 field_02 + field_08 + 1, field_04 + field_06 + 1);
    draw_shadow_box(field_02, field_04, field_02 + field_08, field_04 + field_06);
    display->fill_rect(field_02, field_04, field_02 + field_08, field_04 + 0xA,
                       display->field_03, -1, 0);
    tx = 0xA0 - ((strlen(field_18) << 3) >> 1);
    ty = field_04 + 1;
    display->print_at_xy(tx, ty, field_18, 0);
    display->print_at_xy(0xA0 - ((strlen(field_14) << 3) >> 1), field_04 + 0xC,
                         field_14, 0);
    display->fill_rect(field_26, field_28, field_26 + field_08 - 0x10,
                       field_28 + 0xC, display->field_02, display->field_03, 0);
    if (was_shown == 1)
        mouse->show();
}

uchar prompt_box::poll()
{
    uchar len = 0, done = 0, ch, i;
    disable_exit_routine = 1;
    update_text(field_1E);
    while (kbhit())
        getch();
    while (!done) {
        ch = getch();
        if (ch == 8) {
            if (len > 0) {
                len--;
                field_1E[len] = 0;
                update_text(field_1E);
            }
        } else if (ch == 13 || ch == 27) {
            done = 1;
        } else {
            if (len < field_22) {
                field_1E[len] = ch;
                len++;
                update_text(field_1E);
            }
        }
    }
    if (ch != 0x1B) {
        for (i = 0; i < len; i++) {
            if (field_1E[i] < '0' || field_1E[i] > '9')
                field_1C++;
        }
        if (field_1C == 0)
            field_24 = atoi(field_1E);
    } else
        field_1D++;
    disable_exit_routine = 0;
    return 0;
}

void prompt_box::update_text(uchar far *s)
{
    int right = field_26 + 2 + (strlen(s) << 3);
    display->fill_rect(field_26, field_28, field_26 + (field_08 - 0x10),
                       field_28 + 0xC, display->field_02, display->field_03, 0);
    display->print_at_xy(field_26 + 1, field_28 + 2, s, 0);
    display->print_at_xy(right, field_28 + 2, "_", 0);
}

/* ---------------------------------------------------------------------------
 * file_box — scrollable directory list (256 file ptrs, 10 visible rows)
 * -------------------------------------------------------------------------*/

file_box::file_box(uchar far *src) : gui_item()
{
    struct ffblk fb;
    int r;
    field_450 = 0;
    field_451 = 0;
    field_452 = 0;
    field_14 = src;
    current_directory(field_18);
    strcat(field_18, "\\");
    strcat(field_18, src);
    field_08 = 0x68;
    field_06 = 0x7A;
    field_3E = -1;
    field_3C[0] = 0x1E;
    field_3C[1] = 0;
    field_3A[0] = 0x1F;
    field_3A[1] = 0;
    for (r = findfirst(field_14, &fb, 0); r == 0; r = findnext(&fb))
        field_50[field_0A++] = (uchar far *)strdup(fb.ff_name);
}

file_box::~file_box()
{
    int i;
    for (i = 0; i < field_0A; i++)
        farfree(field_50[i]);
}

uchar far *file_box::current_directory(uchar far *dest)
{
    strcpy(dest, "X:\\");
    dest[0] = getdisk() + 'A';
    getcurdir(0, dest + 3);
    return dest;
}

void file_box::draw()
{
    mouse->hide();
    update();
    draw_arrows();
    display->print_at_xy(field_02 + 2, field_04 - 0xC, field_18, 0);
    mouse->show();
    field_454 = 0;
}

void file_box::update()
{
    uchar far *dest;
    int y, i;
    display->fill_rect(field_02, field_04, field_02 + field_08, field_04 + field_06,
                       display->field_02, display->field_03, 0);
    y = field_04 + 3;
    for (i = field_450; i < field_450 + 0xA; i++) {
        if (field_0A > i) {
            dest = new uchar[0xF];
            strnset(dest, 0, 0xE);
            strcpy(dest, field_50[i]);
            display->print_at_xy(field_02 + 2, y, dest, 0);
            y += 0xC;
            delete dest;
        }
    }
}

void file_box::draw_arrows()
{
    field_40 = field_02 + field_08;
    field_42 = field_40 + 8;
    field_44 = field_04 + 1;
    field_46 = field_44 + 8;
    field_48 = field_02 + field_08;
    field_4A = field_48 + 8;
    field_4C = field_04 + field_06 - 8;
    field_4E = field_4C + 7;
    display->fill_rect(field_02 + field_08 - 1, field_04,
                       field_02 + field_08 + 9, field_04 + field_06,
                       display->field_02, display->field_03, 0);
    display->print_at_xy(field_40, field_44, field_3C, 0);
    display->print_at_xy(field_48, field_4C, field_3A, 0);
}

void file_box::poll_arrows()
{
    if (mouse->pressed_in_box(field_40, field_44, field_42, field_46)) {
        if (field_450 - 1 > 0) {
            if (!field_451) {
                mouse->hide();
                high_light(field_40, field_44, field_42, field_46, field_3C, 0, 0, 0);
                mouse->show();
            }
            field_450 -= 2;
            update();
            display->pause(5);
            field_451 = 1;
            field_3E = -1;
        }
    } else if (field_451) {
        field_451 = 0;
        mouse->hide();
        high_light(field_40, field_44, field_42, field_46, field_3C, 0, 0, 1);
        mouse->show();
    }
    if (mouse->pressed_in_box(field_48, field_4C, field_4A, field_4E)) {
        if (field_450 + 0xB < field_0A) {
            if (!field_452) {
                mouse->hide();
                high_light(field_48, field_4C, field_4A, field_4E, field_3A, 0, 0, 0);
                mouse->show();
            }
            field_450 += 2;
            update();
            display->pause(5);
            field_452 = 1;
            field_3E = -1;
        }
    } else if (field_452) {
        field_452 = 0;
        mouse->hide();
        high_light(field_48, field_4C, field_4A, field_4E, field_3A, 0, 0, 1);
        mouse->show();
    }
}

uchar file_box::poll()
{
    int i, x1, y1, x2, y2, ox1, oy1, ox2, oy2;
    if (field_0A == 0) {
        field_36 = 0;
        return 0;
    }
    poll_arrows();
    display->pause(1);
    if (field_453 > 0)
        field_453--;
    for (i = 0; i < 0xA; i++) {
        if (i > 0xA)
            break;
        if (field_0A < i)
            break;
        x1 = field_02 + 1;
        x2 = field_02 + field_08 - 1;
        y1 = field_04 + i * 0xC + 1;
        y2 = y1 + 0xC;
        if (mouse->pressed_in_box(x1, y1, x2, y2)) {
            if (field_3E != -1 && field_3E != i && field_0A > i) {
                mouse->hide();
                ox1 = x1;
                ox2 = x2;
                oy1 = field_04 + field_3E * 0xC + 1;
                oy2 = oy1 + 0xC;
                high_light(ox1, oy1, ox2, oy2, field_50[field_3E + field_450], 1, 2, 1);
                mouse->show();
            }
            if (field_3E != i && field_0A > i) {
                mouse->hide();
                field_3E = i;
                high_light(x1, y1, x2, y2, field_50[i + field_450], 1, 2, 0);
                mouse->show();
                mouse->field_01 = 0;
                field_453 = 0x19;
            }
            if (field_3E == i && mouse->field_01 != 0) {
                if (field_453 != 0) {
                    field_454 = 1;
                    return 1;
                }
                mouse->field_01 = 0;
                field_453 = 0x19;
            }
        }
    }
    if (field_3E == -1)
        field_36 = 0;
    else
        field_36 = field_50[field_450 + field_3E];
    return 0;
}

/* ---------------------------------------------------------------------------
 * text_pager — page a text file through a scrollable viewer (More/Exit/Done)
 * -------------------------------------------------------------------------*/

text_pager::text_pager(uchar far *path, uchar arg_8, void (far *cb)(uchar)) : gui_item()
{
    button far *block, far *var_E;
    uchar var_A, buf;
    int var_8, var_6, var_4, var_2;
    if ((long)g_open_element(path) == -1L)
        read_error(path);
    var_6 = 0;
    field_13 = 0;
    for (;;) {
        if (arg_8 == 0)
            display->blank_palette();
        else
            display->fade_down();
        var_4 = 5;
        var_2 = 5;
        if (cb != 0)
            (*cb)(var_6);
        else
            display->cls(display->field_02, 0);
        var_8 = 0;
        while (var_8 < 0x13) {
            memset(_tmp, 0, 0x64);
            var_A = 0;
            if (g_element_read(&buf, 1) != 1)
                goto last_page;
            while (buf != 0x0A) {
                _tmp[var_A++] = buf;
                if (g_element_read(&buf, 1) != 1)
                    goto last_page;
            }
            _tmp[strlen(_tmp) - 1] = 0;
            display->print_at_xy(var_2, var_4, _tmp, 0);
            var_4 += 0xA;
            var_8++;
        }
        block = new button((uchar far *)"More >>", 0, 0);
        var_E = new button((uchar far *)"Exit", 0, 0);
        block->field_18 = 0xE6;
        var_E->field_18 = 0xA0;
        block->field_1A = var_E->field_1A = 0xB7;
        block->draw();
        var_E->draw();
        block->mouse_to_me();
        if (arg_8 == 0)
            display->set_palette();
        else
            display->fade_up();
        mouse->show();
        while (mouse->field_00 != 0 || gr_keys[57] != 0 || gr_keys[28] != 0)
            ;
        for (;;) {
            if (var_E->poll()) {
                delete block;
                delete var_E;
                mouse->hide();
                goto done;
            }
            if (block->poll()) {
                mouse->hide();
                delete block;
                delete var_E;
                var_6++;
                break;              /* next page */
            }
            if (i_external_left) {
                if (i_external_left() && field_13 != 1) {
                    field_13++;
                    (&block)[field_13]->mouse_to_me();
                    display->pause(0xF);
                }
                if (i_external_right() && field_13 != 0) {
                    field_13--;
                    (&block)[field_13]->mouse_to_me();
                    display->pause(0xF);
                }
            }
        }
    }
last_page:
    block = new button((uchar far *)"Done", 0, 0);
    block->field_18 = 0xE6;
    block->field_1A = 0xB8;
    block->draw();
    if (arg_8 == 0)
        display->set_palette();
    else
        display->fade_up();
    mouse->show();
    while (mouse->field_00 != 0 || gr_keys[57] != 0 || gr_keys[28] != 0)
        ;
    while ((int)block->poll() == 0)
        ;
    mouse->hide();
    delete block;
done:
    g_close_element();
}

text_pager::~text_pager()
{
}
