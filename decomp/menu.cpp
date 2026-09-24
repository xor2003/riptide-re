/* ==========================================================================
 * MENU.CPP — decompilation of seg0fa9 (menu system & screen callbacks)
 * Original compiler: Borland C++ 3.1, -ml -3
 * Each function annotated with its original seg:offset.
 * ========================================================================== */
#include "riptide.h"

/* forward decls for the *_call_up helpers installed into text_pager */
void far catalogue_call_up(uchar);
void far instructions_call_up(uchar);
void far story_call_up(uchar);
void far help_call_up(uchar);

/* --------------------------------------------------------------------------
 * seg0fa9:0001 — prepare_new_screen: hide menu/mouse, swap to the clean page.
 * ------------------------------------------------------------------------ */
void far prepare_new_screen(void)
{
    the_menu_bar->erase();
    mouse->hide();
    display->copy_page(1, 0);
}

/* --------------------------------------------------------------------------
 * seg0fa9:003F — restore_old_screen: swap back, redraw menu, show mouse.
 * ------------------------------------------------------------------------ */
void far restore_old_screen(void)
{
    display->copy_page(0, 1);
    the_menu_bar->draw();
    mouse->show();
}

/* --------------------------------------------------------------------------
 * seg0fa9:0610 — cb_catalogue: show the "t_cat.txt" pager.
 * ------------------------------------------------------------------------ */
void far cb_catalogue(void)
{
    text_pager far *tp;

    prepare_new_screen();
    tp = new text_pager((uchar far *)"t_cat.txt", 0, catalogue_call_up);
    delete tp;
    restore_old_screen();
}

/* --------------------------------------------------------------------------
 * seg0fa9:064C — cb_start: "Start game from begining?" → fresh game.
 * ------------------------------------------------------------------------ */
void far cb_start(void)
{
    if (game_in_progress != 0) {
        if ((int)i_yes_cancel((uchar far *)"Start game from begining?", 0) == 0)
            stop_room = 2;
    }
    zoom_to_map = 0;
    _resume = 1;
}

/* --------------------------------------------------------------------------
 * seg0fa9:067B — cb_start_act_2: "End current game?" → jump to act 2 (map 7).
 * ------------------------------------------------------------------------ */
void far cb_start_act_2(void)
{
    if (game_in_progress != 0) {
        if ((int)i_yes_cancel((uchar far *)"End current game?", 0) == 0)
            stop_room = 2;
    }
    zoom_to_map = 7;
    _resume = 1;
}

/* --------------------------------------------------------------------------
 * seg0fa9:096C — cb_story: show "t_story.txt" pager; resume if in a game.
 * ------------------------------------------------------------------------ */
void far cb_story(void)
{
    text_pager far *tp;

    prepare_new_screen();
    tp = new text_pager((uchar far *)"t_story.txt", 0, story_call_up);
    delete tp;
    restore_old_screen();
    if (game_in_progress)
        _resume = 1;
}

/* --------------------------------------------------------------------------
 * seg0fa9:08AB — cb_instructions: show "t_inst.txt" pager.
 * ------------------------------------------------------------------------ */
void far cb_instructions(void)
{
    text_pager far *tp;

    prepare_new_screen();
    tp = new text_pager((uchar far *)"t_inst.txt", 0, instructions_call_up);
    delete tp;
    restore_old_screen();
    if (game_in_progress)
        _resume = 1;
}

/* --------------------------------------------------------------------------
 * seg0fa9:0F0D — cb_help: show "t_help.txt" pager.
 * ------------------------------------------------------------------------ */
void far cb_help(void)
{
    text_pager far *tp;

    prepare_new_screen();
    tp = new text_pager((uchar far *)"t_help.txt", 0, help_call_up);
    delete tp;
    restore_old_screen();
    if (game_in_progress)
        _resume = 1;
}

/* --------------------------------------------------------------------------
 * seg0fa9:09B4 — cb_high_scores: show the high-score table.
 * ------------------------------------------------------------------------ */
void far cb_high_scores(void)
{
    prepare_new_screen();
    show_high_scores(0);
    restore_old_screen();
    if (game_in_progress)
        _resume = 1;
}

/* --------------------------------------------------------------------------
 * seg0fa9:09D5 — cb_resume: just flag resume.
 * ------------------------------------------------------------------------ */
void far cb_resume(void)
{
    _resume = 1;
}

/* --------------------------------------------------------------------------
 * seg0fa9:057D — catalogue_call_up: dense starfield backdrop for the catalogue.
 * ------------------------------------------------------------------------ */
void far catalogue_call_up(uchar arg)
{
    int var_2, var_4, var_6;

    display->cls(0, 0);
    var_2 = 0;
    while (var_2 < 5000) {
        var_4 = random(0x13E);
        var_6 = random(0xC6);
        display->set_pix(var_4, var_6, 0x1B);
        display->set_pix(var_4 + 1, var_6 + 1, 0x1D);
        display->set_pix(var_4, var_6 + 2, 0x1F);
        var_2++;
    }
}

/* --------------------------------------------------------------------------
 * seg0fa9:07C4 — instructions_call_up: pattern backdrop + powerup legend.
 * ------------------------------------------------------------------------ */
void far instructions_call_up(uchar arg)
{
    int var_2, var_4, var_6, var_8, var_A;

    display->cls(0, 0);
    display->field_07 = 1;
    for (var_A = 0; var_A < 200; var_A++) {
        var_6 = (var_A % 0x14) << 4;
        var_8 = (var_A / 0x14) * 0x14;
        show_loop((uchar *)"pat1.l", var_6, var_8, 0, 0);
    }
    display->field_07 = 0;
    if (arg != 1)
        return;
    var_2 = 0x33;
    var_4 = 0x36;
    show_loop((uchar *)"pu_shld.l", var_2, var_4, 0, 0);
    var_4 += 0x1E;
    show_loop((uchar *)"pu_auto.l", var_2, var_4, 0, 0);
    var_4 += 0x1E;
    show_loop((uchar *)"pu_fire.l", var_2, var_4, 0, 0);
    var_4 += 0x1E;
    show_loop((uchar *)"pu_jason.l", var_2, var_4, 0, 0);
}

/* --------------------------------------------------------------------------
 * seg0fa9:08F3 — story_call_up: pattern backdrop only.
 * ------------------------------------------------------------------------ */
void far story_call_up(uchar arg)
{
    int var_2, var_4, var_6;

    display->cls(0, 0);
    var_4 = var_2 = 0;
    display->field_07 = 1;
    for (var_6 = 0; var_6 < 200; var_6++) {
        var_2 = (var_6 % 0x14) << 4;
        var_4 = (var_6 / 0x14) * 0x14;
        show_loop((uchar *)"pat1.l", var_2, var_4, 0, 0);
    }
    display->field_07 = 0;
}

/* --------------------------------------------------------------------------
 * seg0fa9:0E94 — help_call_up: sparse starfield backdrop for help.
 * ------------------------------------------------------------------------ */
void far help_call_up(uchar arg)
{
    int var_2, var_4, var_6;

    display->cls(0, 0);
    var_2 = 0;
    while (var_2 < 0x7D0) {
        var_4 = random(0x13E);
        var_6 = random(0xC6);
        display->set_pix(var_4, var_6, 0x97);
        display->set_pix(var_4 + 1, var_6 + 1, 0x99);
        var_2++;
    }
}

/* --------------------------------------------------------------------------
 * seg0fa9:06AA — cb_password: prompt for a level password / cheat code.
 * ------------------------------------------------------------------------ */
void far cb_password(void)
{
    uchar far *pw;
    byte var_5;

    mouse->hide();
    pw = i_get_string((uchar *)"Password", (uchar *)"Enter password below:");
    mouse->show();
    strupr(pw);
    var_5 = 0;
    while (var_5 < 0x18) {
        if (strcmp(pw, all_maps[var_5].password) == 0) {
            the_game->play_sound_file((uchar *)"charge");
            stop_room = 2;
            zoom_to_map = var_5;
            _resume = 1;
            goto done;
        }
        var_5++;
    }
    if (strcmp(pw, "LETSRIP!") == 0) {
        the_game->play_sound((uchar *)"drillhi", 0x0F);
        i_inform((uchar *)"Cheat mode ON!\nLet's Rip!", 0, 0);
        cheat_mode = 1;
        goto done;
    }
    if (var_5 == 0x18)
        i_inform((uchar *)"That is not a valid\npassword.", 0, 0);
done:
    delete pw;
    if (game_in_progress != 0)
        _resume = 1;
}

/* --------------------------------------------------------------------------
 * seg0fa9:09DF — cb_quit: confirm, shut down, persist config, show exit text.
 * Registered as the exit routine by init_game (_set_exit_routine).
 * ------------------------------------------------------------------------ */
void far cb_quit(void)
{
    FILE *f;

    if (gr_keys[0x44] == 0) {
        if (i_yes_cancel((uchar far *)"Are you sure you want to\nleave?", 0) != 0)
            return;
    }
    the_game->reset_sound();
    delete mouse;
    delete display;
    gr_end_kbd_grab();
    f = fopen("config.rip", "wb+");
    if (f) {
        fputc(the_game->field_1C, f);
        fputc(the_game->game_speed, f);
        if (the_game->input_mode == 1)
            fputc(1, f);
        else
            fputc(0, f);
        fclose(f);
    }
    print_form((uchar *)"t_exit.txt", 0);
    delete the_game;
    exit(0);
}

/* --------------------------------------------------------------------------
 * seg0fa9:007C — print_form: render a resource text file to the screen
 * (arg==0) or the printer (arg==1).  Tabs expand 6 columns; lines are padded
 * to 0x50 and CR-terminated for cputs, or vfprintf'd to the printer stream.
 * ------------------------------------------------------------------------ */
void far print_form(uchar far *path, uchar arg_4)
{
    byte buf;
    int  col;
    union REGS regs;

    g_close_element();
    memset(_tmp, 0, 0x190);
    if ((long)g_open_element(path) == -1L)
        read_error(path);
    if (arg_4 == 0) {
        textbackground(4);
        textcolor(0x0F);
    } else {
        regs.h.ah = 2;
        regs.x.dx = 0;
        int86(0x17, &regs, &regs);
        if (regs.h.ah != 0) {
            if (i_yes_cancel((uchar *)"Printer error.  Continue?", 0))
                goto end;
        }
    }
    buf = 1;
    while (buf != 0) {
        strnset((char far *)_tmp, 0, 0x50);
        col = 0;
        do {
            if (g_element_read(&buf, 1) != 1)
                goto eof;
            if (buf == 9) {
                strcat((char far *)_tmp + col, (char far *)"        ");
                col += 6;
            } else {
                _tmp[col] = buf;
                col++;
            }
        } while (buf != 0x0A);
        if (arg_4 == 0) {
            for (buf = col - 2; buf < 0x50; buf++)
                _tmp[buf] = ' ';
            _tmp[0x50] = 0x0D;
            cputs((char far *)_tmp);
        } else {
            vfprintf(&_stream, (char far *)_tmp, 0);
        }
    }
eof:
    if (arg_4 == 1) {
        _tmp[0] = 0x0C;
        _tmp[1] = 0;
        vfprintf(&_stream, (char far *)_tmp, 0);
    }
end:
    g_close_element();
}

/* --------------------------------------------------------------------------
 * seg0fa9:0AE2 — cb_sound: On/Off text_box for digital game sound.
 * ------------------------------------------------------------------------ */
void far cb_sound(void)
{
    text_box far *tb;

    tb = new text_box((uchar far *)"Game Sound");
    strcpy((char far *)_tmp, (char far *)"Game sounds are currently ");
    if (the_game->field_1C != 0)
        strcat((char far *)_tmp, (char far *)"ON.");
    else
        strcat((char far *)_tmp, (char far *)"OFF.");
    tb->add_string((uchar far *)_tmp);
    tb->add_string((uchar far *)"New\tsetting?");
    tb->add_button((uchar far *)"Off", (void far *)0);
    tb->add_button((uchar far *)"On", (void far *)0);
    tb->draw();
    while (tb->poll() == 0)
        ;
    if (tb->buttons[0]->field_20 != 0)
        the_game->turn_sound(0);
    if (tb->buttons[1]->field_20 != 0)
        the_game->turn_sound(1);
    delete tb;
    if (game_in_progress != 0)
        _resume = 1;
}

/* --------------------------------------------------------------------------
 * seg0fa9:0C08 — cb_control: Joy/Key selector + joystick calibration.
 * ------------------------------------------------------------------------ */
void far cb_control(void)
{
    text_box far *tb;

    tb = new text_box((uchar far *)"Game Control");
    tb->add_string((uchar far *)"Game control is currently set to:");
    switch (the_game->input_mode) {
    case 0: tb->add_string((uchar far *)"KEYBOARD"); break;
    case 1: tb->add_string((uchar far *)"JOYSTICK"); break;
    }
    tb->add_button((uchar far *)"Joy", (void far *)0);
    tb->add_button((uchar far *)"Key", (void far *)0);
    tb->draw();
    while (tb->poll() == 0)
        ;
    delete tb;
    if (tb->buttons[0]->field_20 != 0) {          /* Joy selected */
        the_game->joy_update();
        i_show_box((uchar far *)"Center joystick and press\nfire button.",
                   0, 0, (uchar far *)0, (uchar far *)0);
        while (joystickbutton(0) == 0 && gr_keys[1] == 0)
            the_game->joy_update();
        i_hide_box(0);
        if (gr_keys[1] != 0)
            i_inform((uchar far *)"Joystick\tcalibration aborted.", 0,
                     (uchar far *)0);
        else
            the_game->input_mode = 1;
    }
    if (tb->buttons[1]->field_20 != 0)            /* Key selected */
        the_game->input_mode = 0;
    if (game_in_progress != 0)
        _resume = 1;
}

/* --------------------------------------------------------------------------
 * seg0fa9:0D7A — cb_game_speed: Slow/Fast text_box; propagates into the_map.
 * ------------------------------------------------------------------------ */
void far cb_game_speed(void)
{
    text_box far *tb;

    tb = new text_box((uchar far *)"Game Speed");
    tb->add_string((uchar far *)"Game speed is currently set to:");
    switch (the_game->game_speed) {
    case 1: tb->add_string((uchar far *)"FAST"); break;
    case 2: tb->add_string((uchar far *)"SLOW"); break;
    }
    tb->add_button((uchar far *)"Slow", (void far *)0);
    tb->add_button((uchar far *)"Fast", (void far *)0);
    tb->draw();
    while (tb->poll() == 0)
        ;
    if (tb->buttons[0]->field_20 != 0)            /* Slow */
        the_game->game_speed = 2;
    if (tb->buttons[1]->field_20 != 0)            /* Fast */
        the_game->game_speed = 1;
    if (the_map != 0)
        the_map->exploded = the_game->game_speed;
    delete tb;
    if (game_in_progress != 0)
        _resume = 1;
}

/* --------------------------------------------------------------------------
 * seg0fa9:01F7 — cb_about_de: the animated credits/about screen.
 * Starfield + sprite loops + credit lines + "scream" + press-to-continue.
 * ------------------------------------------------------------------------ */
void far cb_about_de(void)
{
    int i, x, y;

    display->blank_palette();
    prepare_new_screen();
    display->cls(0, 0);
    for (i = 0; i < 5000; i++) {
        x = random(0x13E);
        y = random(0xC6);
        display->fill_rect(x, y, x + 2, y + 2, random(6) + 0x2A, -1, 0);
    }
    show_loop((uchar far *)"turn.l", 0x14, 0x3C, 0, 0);
    show_loop((uchar far *)"fish1r.l", 0x46, 0x78, 0, 0);
    show_loop((uchar far *)"bs1_bdl.l", 0xE6, 0x5F, 1, 0);
    i_set_text(0x10, 2, 0x1C, 0x9F);
    display->print_at_xy(0x14, 0x0A, (uchar far *)"In Search of Dr.\tRiptide", 1);
    display->print_at_xy(0x14, 0x14, (uchar far *)"R E G I S T E R E D", 1);
    i_set_text(0x80, 2, 0x87, 0x9F);
    display->print_at_xy(0x14, 0x32, (uchar far *)"Design and Programming:", 1);
    i_set_text(0x30, 2, 0x18, 0x1D);
    display->print_at_xy(0x14, 0x3C, (uchar far *)"Raoul\tSaid", 1);
    i_set_text(0x80, 2, 0x87, 0x9F);
    display->print_at_xy(0x14, 0x5A, (uchar far *)"Producer:", 1);
    i_set_text(0x30, 2, 0x18, 0x1D);
    display->print_at_xy(0x14, 0x64, (uchar far *)"Avery\tPack", 1);
    i_set_text(0x80, 2, 0x87, 0x9F);
    display->print_at_xy(0x14, 0x78, (uchar far *)"Artwork:", 1);
    i_set_text(0x30, 2, 0x18, 0x1D);
    display->print_at_xy(0x14, 0x82, (uchar far *)"Mel Guymon", 1);
    i_set_text(0x80, 2, 0x87, 0x9F);
    display->print_at_xy(0x14, 0x96, (uchar far *)"Composer/Sound Effects:", 1);
    i_set_text(0x30, 2, 0x18, 0x1D);
    display->print_at_xy(0x14, 0xA0, (uchar far *)"Dan\tFroelich", 1);
    i_set_text(0x68, 3, 0x1C, 0x9B);
    display->print_at_xy(0x14, 0xB4, (uchar far *)"Copyright (C) 1994 MindStorm Software", 1);
    display->print_at_xy(0x14, 0xBE, (uchar far *)"and Pack\tMedia Company, Inc.", 1);
    display->set_palette();
    the_game->play_sound_file((uchar far *)"scream");
    while (the_game->field_2B != 0 || mouse->field_00 != 0)
        the_game->doit();
    while (the_game->field_2B == 0 && mouse->field_00 == 0)
        the_game->doit();
    while (the_game->field_2B != 0 || mouse->field_00 != 0)
        the_game->doit();
    display->blank_palette();
    i_set_text(0x30, 2, 0x18, 0x1D);
    restore_old_screen();
    display->set_palette();
}

/* --------------------------------------------------------------------------
 * seg0fa9:0F55 — cb_debug_info: build a stats string in _tmp and inform it.
 * ------------------------------------------------------------------------ */
void far cb_debug_info(void)
{
    strset((char far *)_tmp, 0);
    strcpy((char far *)_tmp, (char far *)"Bytes\tfree  :\t");
    strcat((char far *)_tmp, ltoa(farcoreleft(), (char far *)_tmp2, 0x0A));
    strcat((char far *)_tmp, (char far *)"\n");
    strcat((char far *)_tmp, (char far *)"\nMap width   : ");
    strcat((char far *)_tmp, itoa(the_map->map_width, (char far *)_tmp2, 0x0A));
    strcat((char far *)_tmp, (char far *)"\nMap height  : ");
    strcat((char far *)_tmp, itoa(the_map->map_height, (char far *)_tmp2, 0x0A));
    strcat((char far *)_tmp, (char far *)"\nCast size   : ");
    strcat((char far *)_tmp, itoa(the_cast->count, (char far *)_tmp2, 0x0A));
    strcat((char far *)_tmp, (char far *)"\nSprt storage: ");
    strcat((char far *)_tmp, ultoa(the_game->field_04, (char far *)_tmp2, 0x0A));
    strcat((char far *)_tmp, (char far *)"\nEgo X,Y     :\t");
    strcat((char far *)_tmp, itoa(ego->x, (char far *)_tmp2, 0x0A));
    strcat((char far *)_tmp, (char far *)" ");
    strcat((char far *)_tmp, itoa(ego->y, (char far *)_tmp2, 0x0A));
    strcat((char far *)_tmp, (char far *)"\nSystem Bench: ");
    strcat((char far *)_tmp, itoa(system_bench, (char far *)_tmp2, 0x0A));
    i_inform((uchar far *)_tmp, 1, (uchar far *)0);
}

/* --------------------------------------------------------------------------
 * seg0fa9:112E — cb_run_benchmark: time 600 de_doit() frames → "Frames per
 * second: N".  Saves/restores the_map speed, hides menu+mouse during the run.
 * ------------------------------------------------------------------------ */
void far cb_run_benchmark(void)
{
    long start, end, elapsed;
    int old_speed, frames, i;

    the_menu_bar->erase();
    mouse->hide();
    old_speed = the_map->exploded;
    the_map->exploded = 1;
    i = 600;
    start = clock();
    while (i-- != 0)
        de_doit();
    end = clock();
    elapsed = end - start;
    frames = (int)(600.0 / (elapsed / 18.2));
    the_map->exploded = old_speed;
    strcpy((char far *)_tmp, (char far *)"Frames per second: ");
    strcat((char far *)_tmp, itoa(frames, (char far *)_tmp2, 0x0A));
    the_menu_bar->draw();
    mouse->show();
    i_inform((uchar far *)_tmp, 0, (uchar far *)0);
}

/* --------------------------------------------------------------------------
 * seg0fa9:1234 — cb_debug_shot_size: Small/Medium/Huge text_box → _shot_size.
 * ------------------------------------------------------------------------ */
void far cb_play_song(void)
{
    if (the_game->adlib_present == 0) {
        i_inform((uchar far *)"Adlib card not present.", 0, 0);
    } else {
        i_load_file((uchar far *)"*.cmf", (uchar far *)_tmp);
        if ((uchar far *)_tmp != 0)
            the_game->play_song((uchar far *)_tmp);
    }
}

void far cb_stop_song(void)
{
    if (the_game->adlib_present == 0) {
        i_inform((uchar far *)"Adlib card not present.", 0, 0);
    } else {
        the_game->stop_song();
    }
}

void far cb_god_mode(void)
{
    i_inform((uchar far *)"God mode now on!", 0, 0);
    god_mode = 1;
}

void far cb_debug_shot_size(void);

/* --------------------------------------------------------------------------
 * seg0fa9:13B5 — setup_options: build the four pull-down menus on the menu bar.
 * ------------------------------------------------------------------------ */
void far setup_options(void)
{
    pull_down far *pd;

    the_menu_bar->field_13 = 1;
    pd = new pull_down((uchar far *)"?");
    pd->add_item((uchar far *)"About Riptide...", (void far *)cb_about_de);
    pd->add_item((uchar far *)"Catalog...",       (void far *)cb_catalogue);
    pd->add_item((uchar far *)"Help",             (void far *)cb_help);
    the_menu_bar->add_item(pd);

    pd = new pull_down((uchar far *)"Game");
    pd->add_item((uchar far *)"Start",            (void far *)cb_start);
    pd->add_item((uchar far *)"Start Act II",     (void far *)cb_start_act_2);
    pd->add_item((uchar far *)"Resume",           (void far *)cb_resume);
    pd->add_item((uchar far *)"Password",         (void far *)cb_password);
    pd->add_item((uchar far *)"Story...",         (void far *)cb_story);
    pd->add_item((uchar far *)"Instructions...",  (void far *)cb_instructions);
    pd->add_item((uchar far *)"High scores...",   (void far *)cb_high_scores);
    pd->add_item((uchar far *)"Quit",             (void far *)cb_quit);
    the_menu_bar->add_item(pd);

    pd = new pull_down((uchar far *)"Setup");
    pd->add_item((uchar far *)"Sound",            (void far *)cb_sound);
    pd->add_item((uchar far *)"Control",          (void far *)cb_control);
    pd->add_item((uchar far *)"Game speed",       (void far *)cb_game_speed);
    the_menu_bar->add_item(pd);

    if (debug_mode == 1) {
        pd = new pull_down((uchar far *)"Debug");
        pd->add_item((uchar far *)"Info",         (void far *)cb_debug_info);
        pd->add_item((uchar far *)"Run benchmark",(void far *)cb_run_benchmark);
        pd->add_item((uchar far *)"Shot size...", (void far *)cb_debug_shot_size);
        pd->add_item((uchar far *)"Play song...", (void far *)cb_play_song);
        pd->add_item((uchar far *)"Stop song",    (void far *)cb_stop_song);
        pd->add_item((uchar far *)"God mode",     (void far *)cb_god_mode);
        the_menu_bar->add_item(pd);
    }
}

void far cb_debug_shot_size(void)
{
    text_box far *tb;
    uchar var_5;

    tb = new text_box((uchar far *)"Shot size");
    tb->add_string((uchar far *)"\t Enter new shot\tsize:  ");
    tb->add_button((uchar far *)"Small", (void far *)0);
    tb->add_button((uchar far *)"Medium", (void far *)0);
    tb->add_button((uchar far *)"Huge", (void far *)0);
    tb->draw();
    while (tb->poll() == 0)
        ;
    var_5 = 0;
    while (var_5 < 3) {
        if (tb->buttons[var_5]->field_20 != 0) {
            shot_size = var_5;
            break;
        }
        var_5++;
    }
    delete tb;
}
