/* ==========================================================================
 * GAME.CPP — decompilation of seg03f9 (main game module) of RIPTIDE.EXE
 * Original compiler: Borland C++ 3.1, -ml -3
 * Each function annotated with its original seg:offset.
 * ========================================================================== */
#include "riptide.h"

/* --------------------------------------------------------------------------
 * seg03f9:0003 — program entry
 * ------------------------------------------------------------------------ */
int main(int argc, char *argv[], char *envp[])
{
    parse_options(argc, (uchar **)argv);
    init_game();
    while (1) {
        if (debug_mode == 0)
            start_title_loop();
        play_game(zoom_to_map);
    }
}

/* --------------------------------------------------------------------------
 * seg03f9:0036 — one-time game initialization
 * ------------------------------------------------------------------------ */
/* sprite-loop resource types (spr_frame / loop_res) now live in riptide.h */

void init_game(void)
{
    FILE *stream;
    unsigned long need, free_mem;
    loop_res far *loopdat;
    long t2, t1;
    unsigned long i;

    gr_start_kbd_grab();
    clrscr();
    printf("%s\n", "Riptide (Registered) 1.0\t(C) 1994 MindStorm Software");
    if (debug_mode == 1)
        printf(">> DEBUG\tMODE ENABLED <<\n");
    if (force_pc_sound == 1)
        printf(">>  FORCING PC SOUND  <<\n");

    the_game = new game_manager((uchar *)"riptide.dat");
    the_cast = new game_cast();
    free_mem = coreleft();

    if (debug_mode == 0) {
        if (the_game->sb_present)
            need = 0x65518;                 /* 415000 */
        else
            need = 0x4CE78;                 /* 315000 */
        if (free_mem < need) {
            delete the_game;
            if (the_game->sb_present)
                terminate((uchar *)"Riptide requires 600k with digital sound.", 0);
            else
                terminate((uchar *)"Riptide requires 500k running pc sound.", 0);
        }
        init_display(0);
        display->blank_palette();
        display->show_pcx((uchar *)"logos.pcx", 1, 0, -1);
        load_resources();
        display->fade_down();
    } else {
        printf("Bytes free %lu\n", free_mem);
        load_resources();
        init_display(0);
    }

    display->field_07 = 0;
    i_init_interface(de_left, de_right, de_up, de_down, de_button);
    loopdat = (loop_res far *)the_game->get_loop((uchar far *)"mouse.l");
    mouse->set_cursor(loopdat->cels[0]->bitmap,
                      loopdat->cels[0]->width, loopdat->cels[0]->height);
    pd_redraws = 1;
    i_set_text(0x30, 2, 0x18, 0x1d);   /* asm pushes 1D,18,2,30 r-to-l */
    setup_options();
    init_scores_array();
    load_scores_in();
    the_map = NULL;
    new_map_name = NULL;

    gun_underbits = 0;
    jguage_underbits = 0;
    game_in_progress = 0;
    god_mode = 0;
    cheat_mode = 0;
    display->blank_palette();

    t1 = clock();
    for (i = 40; i--;)
        display->put_bits(i, i, i + 0x32, i + 0x1e, (uchar *)_tmp, 0, 0);
    for (i = 5; i--;)
        display->copy_page(1, 0);
    t2 = clock();
    system_bench = (byte)(t2 - t1);

    if (system_bench <= 4)
        the_game->game_speed = 2;
    else
        the_game->game_speed = 1;

    stream = fopen("config.rip", "rb");
    if (stream) {
        the_game->field_1C = fgetc(stream);
        the_game->game_speed = fgetc(stream);
        if (fgetc(stream) != 0) {
            the_game->input_mode = 1;
            the_game->joy_update();
        }
        fclose(stream);
    }
    set_exit_routine(cb_quit);
}

/* --------------------------------------------------------------------------
 * level descriptor table — seg2608:0228 (_all_maps), 24 entries × 20 bytes.
 * start_up is a far fn ptr used by boss levels (bs1/bs2/bs3_start_up),
 * NULL for normal levels.
 * ------------------------------------------------------------------------ */
/* --------------------------------------------------------------------------
 * Boss-level start_up routines — seg03f9:6B3F / 6BC0 / 6F89.  Each spawns the
 * boss body plus its aux_act2 appendages via the_cast->add(), then fixes up
 * facing/type/aux_act1 and the boss-relative x/y offsets (aux1/26).
 * ------------------------------------------------------------------------ */
void far bs1_start_up(void)
{
    act = the_cast->add((uchar far *)"bs1_bdl.l", mv_std, do_bs1);
    act->type = 1;
    act->facing = 1;
    act->aux_act1 = end_door_ptr;
    act->set_cycle(0, 0);
    act->set_xy(0x1C4, 0x1DA);
    boss = act;
    enemy_count++;
}

void far bs2_start_up(void)
{
    smart_missiles = 1;
    act = the_cast->add((uchar far *)"bs2_bod.l", mv_std, do_bs2);
    act->type = 1;
    act->x_step = -1;
    act->facing = 1;
    act->aux_act1 = end_door_ptr;
    act->set_cycle(0, 0);
    act->set_xy(0x1ED, 0x70);
    boss = act;
    enemy_count++;

    act = the_cast->add((uchar far *)"otiseyes.l", mv_bs2tn, do_bs2_eyes);
    act->facing = 1;
    act->aux_act1 = boss;
    act->set_xy(0x1FB, 0x82);
    act->set_cycle(0, 0);
    act->door_open = 1;
    act->aux1 = act->x - boss->x;
    act->aux2 = act->y - boss->y;

    act = the_cast->add((uchar far *)"bs2_tnl2.l", mv_bs2tn, do_bs2tn);
    act->facing = 1;
    act->type = 1;
    act->aux_act1 = boss;
    act->set_cycle(random(2) + 2, 1);
    act->set_xy(0x1CC, 0x90);
    act->aux1 = act->x - boss->x;
    act->aux2 = act->y - boss->y;

    act = the_cast->add((uchar far *)"bs2_tnr2.l", mv_bs2tn, do_bs2tn);
    act->facing = 1;
    act->type = 1;
    act->aux_act1 = boss;
    act->set_cycle(random(2) + 2, 1);
    act->set_xy(0x217, 0x90);
    act->aux1 = act->x - boss->x;
    act->aux2 = act->y - boss->y;

    act = the_cast->add((uchar far *)"bs2_tnl1.l", mv_bs2tn, do_bs2tn);
    act->facing = 1;
    act->type = 1;
    act->aux_act1 = boss;
    act->set_cycle(random(2) + 2, 1);
    act->set_xy(0x1D0, 0x94);
    act->aux1 = act->x - boss->x;
    act->aux2 = act->y - boss->y;

    act = the_cast->add((uchar far *)"bs2_tnr1.l", mv_bs2tn, do_bs2tn);
    act->facing = 1;
    act->type = 1;
    act->aux_act1 = boss;
    act->set_cycle(random(2) + 2, 1);
    act->set_xy(0x213, 0x94);
    act->aux1 = act->x - boss->x;
    act->aux2 = act->y - boss->y;
}

void far bs3_start_up(void)
{
    smart_missiles = 1;
    act = the_cast->add((uchar far *)"bs3_bdl.l", mv_std, do_bs3);
    act->x_step = -2;
    act->type = 1;
    act->facing = 1;
    act->aux_act2 = end_door_ptr;
    act->set_xy(0x193, 0x65);
    act->aux3 = 1;
    boss = act;
    enemy_count++;

    act = the_cast->add((uchar far *)"bs3_arr.l", mv_bs2tn, do_bs3a);
    act->type = 1;
    act->facing = 1;
    act->aux_act1 = boss;
    act->set_xy(0x1A4, 0x8A);
    act->set_cycle(0, 0);
    act->aux1 = act->x - boss->x;
    act->aux2 = act->y - boss->y;
    act->aux3 = boss->width - act->aux1 - act->width - 13;
    boss->aux_act1 = act;
    act->new_loop((uchar far *)"bs3_arl.l");

    act = the_cast->add((uchar far *)"bs3_prpr.l", mv_bs2tn, do_bs3_prop);
    act->facing = 1;
    act->aux_act1 = boss;
    act->set_xy(0x1E8, 0x7D);
    act->set_cycle(1, 1);
    act->aux1 = act->x - boss->x;
    act->aux2 = act->y - boss->y;
    act->aux3 = boss->width - act->aux1 - act->width - 13;
    act->new_loop((uchar far *)"bs3_prpl.l");

    act = the_cast->add((uchar far *)"bs3_facr.l", mv_bs2tn, do_bs3_face);
    act->facing = 1;
    act->aux_act1 = boss;
    act->set_xy(0x1A9, 0x6B);
    act->set_cycle(0xF, 0xA);
    act->aux1 = act->x - boss->x;
    act->aux2 = act->y - boss->y;
    act->aux3 = boss->width - act->aux1 - act->width - 13;
    act->new_loop((uchar far *)"bs3_facl.l");
}

/* --------------------------------------------------------------------------
 * seg03f9:6928-69AF — facing-poll callbacks for i_init_interface().  Each
 * refreshes input via the_game->doit() then returns the OR of the raw key
 * byte (seg2608:5193..519B) with the game_manager's accumulated facing
 * flag (field_27/28/29/2A).
 * ------------------------------------------------------------------------ */
uchar far de_left(void)  { the_game->doit(); return byte_2D3F6 | the_game->field_29; }
uchar far de_right(void) { the_game->doit(); return byte_2D3F8 | the_game->field_2A; }
uchar far de_up(void)    { the_game->doit(); return byte_2D3F3 | the_game->field_27; }
uchar far de_down(void)  { the_game->doit(); return byte_2D3FB | the_game->field_28; }

/* --------------------------------------------------------------------------
 * seg03f9:03A0 — main game loop; runs levels until game over
 * ------------------------------------------------------------------------ */
void play_game(uchar map_id)
{
    uchar done;

    display->blank_palette();
    display->show_pcx((uchar far *)"p_frame.pcx", 0, 0, -1);
    gun_underbits   = display->get_bits(0x80, 0x97, 0xBE, 0xA1);
    jguage_underbits = display->get_bits(0x0C, 0xA7, 0x2C, 0xAD);
    display->copy_page(1, 0);

restart_map:                                        /* loc_6596 */
    cur_map = map_id;
reset_game:                                         /* loc_659C */
    game_in_progress = 1;
    done = 0;
    score_count = 0;
    score = 0;
    gun_count = 0;
    men = 2;
    auto_fire_count = 0;
    jason_fire = auto_fire = top_fire = 0;
    shot_size = 0;
    jason_on = 0;
    jason_present = 1;
    maximum_jason_power = 0x64;
    the_game->clear_flags();

    do {                                            /* loc_6C4A -> loc_65F3 */
        the_game->field_09 = 0;
        the_game->field_08 = 0;
        show_prelude();
replay:                                             /* loc_660A */
        the_game->play_song(all_maps[cur_map].song);
        switch (cur_map - 4) {                      /* jumptable off_6CBA */
        case 2:                                     /* cur_map=6 bs1.m */
            if (jason_present == 1)
                jason_present = 0;
            the_game->load_loop((uchar far *)"bs1_bdl.l");
            the_game->load_loop((uchar far *)"bs1_bdr.l");
            the_game->load_loop((uchar far *)"bs1dr.l");
            the_game->load_loop((uchar far *)"bosshit.l");
            the_game->define_sound((uchar far *)"badgrunt", 0);
            break;
        case 8:                                     /* cur_map=12 bs2.m */
            if (jason_present == 1)
                jason_present = 0;
            the_game->load_loop((uchar far *)"bs2_bod.l");
            the_game->load_loop((uchar far *)"bs2_tnr1.l");
            the_game->load_loop((uchar far *)"bs2_tnl1.l");
            the_game->load_loop((uchar far *)"bs2_tnr2.l");
            the_game->load_loop((uchar far *)"bs2_tnl2.l");
            the_game->load_loop((uchar far *)"msl_inkl.l");
            the_game->load_loop((uchar far *)"msl_inkr.l");
            the_game->load_loop((uchar far *)"otiseyes.l");
            break;
        case 17:                                    /* cur_map=21 bs3.m */
            if (jason_present == 1)
                jason_present = 0;
            the_game->load_loop((uchar far *)"bs3_bdr.l");
            the_game->load_loop((uchar far *)"bs3_arr.l");
            the_game->load_loop((uchar far *)"bs3_bdl.l");
            the_game->load_loop((uchar far *)"bs3_arl.l");
            the_game->load_loop((uchar far *)"bs3_dthr.l");
            the_game->load_loop((uchar far *)"bs3_prpl.l");
            the_game->load_loop((uchar far *)"bs3_prpr.l");
            the_game->load_loop((uchar far *)"bs3_facl.l");
            the_game->load_loop((uchar far *)"bs3_facr.l");
            the_game->load_loop((uchar far *)"chain.l");
            the_game->load_loop((uchar far *)"exp3.l");
            the_game->define_sound((uchar far *)"plunk2", 0);
            break;
        case 0:  case 3:  case 6:  case 10: case 11:/* shark levels */
        case 14: case 16: case 18: case 19:
            the_game->load_loop((uchar far *)"sharkr.l");
            the_game->load_loop((uchar far *)"sharkl.l");
            the_game->load_loop((uchar far *)"sharkdie.l");
            break;
        default:
            break;
        }

        start_room(all_maps[cur_map].map);          /* loc_6898 */
        if (all_maps[cur_map].start_up)
            all_maps[cur_map].start_up();

        do {
            de_doit();                              /* loc_68D6/68DB */
        } while (stop_room == 0);

        switch (cur_map - 4) {                      /* jumptable off_6C92 */
        case 2:                                     /* bs1 */
            the_game->remove_loop((uchar far *)"bs1_bdl.l");
            the_game->remove_loop((uchar far *)"bs1_bdr.l");
            the_game->remove_loop((uchar far *)"bs1dr.l");
            the_game->remove_loop((uchar far *)"bosshit.l");
            the_game->remove_sound((uchar far *)"badgrunt");
            /* fall through */
        case 8:                                     /* bs2 */
            the_game->remove_loop((uchar far *)"bs2_bod.l");
            the_game->remove_loop((uchar far *)"bs2_tnr1.l");
            the_game->remove_loop((uchar far *)"bs2_tnl1.l");
            the_game->remove_loop((uchar far *)"bs2_tnr2.l");
            the_game->remove_loop((uchar far *)"bs2_tnl2.l");
            the_game->remove_loop((uchar far *)"msl_inkl.l");
            the_game->remove_loop((uchar far *)"msl_inkr.l");
            the_game->remove_loop((uchar far *)"otiseyes.l");
            /* fall through */
        case 17:                                    /* bs3 */
            the_game->remove_loop((uchar far *)"bs3_bdr.l");
            the_game->remove_loop((uchar far *)"bs3_arr.l");
            the_game->remove_loop((uchar far *)"bs3_bdl.l");
            the_game->remove_loop((uchar far *)"bs3_arl.l");
            the_game->remove_loop((uchar far *)"bs3_prpl.l");
            the_game->remove_loop((uchar far *)"bs3_prpr.l");
            the_game->remove_loop((uchar far *)"bs3_facl.l");
            the_game->remove_loop((uchar far *)"bs3_facr.l");
            the_game->remove_loop((uchar far *)"bs3_dthr.l");
            the_game->remove_loop((uchar far *)"chain.l");
            the_game->remove_loop((uchar far *)"exp3.l");
            the_game->remove_sound((uchar far *)"plunk2");
            /* fall through */
        case 0:  case 3:  case 6:  case 10: case 11:
        case 14: case 16: case 18: case 19:
            the_game->remove_loop((uchar far *)"sharkr.l");
            the_game->remove_loop((uchar far *)"sharkl.l");
            the_game->remove_loop((uchar far *)"sharkdie.l");
            break;
        default:
            break;
        }

        display->copy_page(non_displayed_page, displayed_page);  /* loc_6B2F */
        the_cast->kill_all();
        display->copy_page(1, 0);

        switch (stop_room - 1) {                    /* jumptable off_6C86 */
        case 0:                                     /* level completed */
            end_room();
            if (cur_map < 0x15)
                ++cur_map;
            else if (cur_map >= 0x16)
                exit_secret_level();
            else {
                end_game();
                ++done;
            }
            switch (cur_map - 1) {                  /* jumptable off_6C58 */
            case 0:  case 1:  case 2:  case 3:  case 4:
            case 7:  case 8:  case 9:  case 10:
            case 12: case 13: case 14: case 15: case 16:
            case 17: case 18: case 19: case 21: case 22:
                strcpy((char *)_tmp, "New password : ");
                strcat((char *)_tmp, (char *)all_maps[cur_map].password);
                i_inform(_tmp, 0, 0);
                break;
            default:                                /* 5,6,11,20: no pw */
                break;
            }
            break;
        case 1:                                     /* jump to zoom_to_map */
            cur_map = zoom_to_map;
            display->fade_down();
            goto reset_game;
        case 2:                                     /* replay map, keep state */
            goto replay;
        case 3:                                     /* died: restart level */
            display->fade_down();
            goto restart_map;
        case 4:                                     /* game over */
            end_game();
            ++done;
            break;
        case 5:                                     /* secret level entrance */
            end_room();
            setup_secret_level();
            break;
        default:
            break;
        }
    } while (!done);
}

/* --------------------------------------------------------------------------
 * seg03f9:0B72 — enter the secret level paired with cur_map
 * ------------------------------------------------------------------------ */
void setup_secret_level(void)
{
    uchar i;

    the_game->field_0D = 1;                         /* in-secret-level flag */
    for (i = 0; i < 2; ++i)
        if (all_secrets[i * 2 + 1] == cur_map)
            break;
    if (i == 2)
        terminate((uchar far *)"Invalid secret level exit.", 0);
    cur_map = all_secrets[i * 2];
}

/* --------------------------------------------------------------------------
 * seg03f9:0BCB — leave secret level; resume at origin map + 1
 * ------------------------------------------------------------------------ */
void exit_secret_level(void)
{
    uchar i;

    for (i = 0; i < 2; ++i)
        if (all_secrets[i * 2] == cur_map)
            break;
    if (i == 2)
        terminate((uchar far *)"Invalid secret level re-entrance.", 0);
    cur_map = all_secrets[i * 2 + 1] + 1;
}

/* --------------------------------------------------------------------------
 * seg03f9:0C1D — load a map, spawn actors, draw initial frame
 * ------------------------------------------------------------------------ */
void start_room(uchar far *path)
{
    uint pos, attr, bits;

    zoom_to_map = 0;
    display->blank_palette();
    display->copy_page(0, 1);
    non_displayed_page = 0;
    displayed_page = 1;
    the_game->reset_player(0);
    end_door_ptr = NULL;
    ego_x_speed = 4;
    ego_y_speed = ego_x_speed + 0xFF;       /* byte: 4-1 = 3 */
    stop_room = 0;
    control = 1;
    zapper_count = 0;
    got_key = 0;
    smart_missiles = 0;
    the_game->field_0B = 0;
    the_game->field_0A = 0;
    goodies_found = 0;
    enemies_killed = 0;
    goody_count = 0;
    enemy_count = 0;
    air_count = 0;
    air_speed = 0x28;
    air_supply = 0x96;
    if (shld_supply < 0x3C)
        shld_supply = 0x3C;
    cur_message = -1;
    message_posted = 0;
    clear_message();
    update_shld_guage(0, 0x68, 0xB3);
    update_air_guage(0, 0x68, 0xA7);
    update_score(0x10D, 0x9F);
    update_men();
    update_gun();
    update_key_guage();
    top_shot_count = 0;
    shot_count = 0;
    jason_count = 0;
    boss = NULL;

    if (the_map == NULL) {
        the_map = new tilemap(path, 0, 0);
        the_map->set_viewport(0x10, 8, 0x120, 0x87);
    } else {
        the_map->new_map(path, 0, 0);
    }
    the_map->exploded = the_game->game_speed;
    the_map->purge_tiles();

    start_x = (the_map->map_hdr[0] % the_map->map_width) << 3;
    start_y = (the_map->map_hdr[0] / the_map->map_width) << 3;
    the_map->center_on(start_x, start_y);

    for (pos = 0; pos < (uint)the_map->map_size; ++pos) {
        attr = the_map->tile_attr[pos].type;     /* 4-byte recs, word at +2 */
        bits = attr & 0xC0;
        if (bits) add_switch(pos, bits);
        bits = attr & 0x300;
        if (bits) add_door(pos, bits);
        bits = attr & 0x3F;
        if (bits) add_barrel(pos, bits);
    }
    for (pos = 0; pos < (uint)the_map->map_size; ++pos) {
        attr = the_map->tile_attr[pos].type;
        bits = attr & 0xFC00;
        if (bits) add_map_item(pos, bits);
    }

    if (the_map->map_hdr[0] % 2) {                  /* odd start -> face left */
        ego = the_cast->add((uchar *)"subl.l", mv_ego, do_ego);
        ego->facing = 1;
    } else {
        ego = the_cast->add((uchar *)"subr.l", mv_ego, do_ego);
        ego->facing = 0;
    }
    ego->set_cycle(0x0C, 1);
    ego->status = 0;
    ego->set_xy(start_x, start_y);
    ego->type = 0x11;
    ego_map_w = (ego->width >> 3) + 1;
    ego_map_h = (ego->height >> 3) + 1;
    cur_sub = ego;
    if (jason_present)
        add_jason();
    update_jason_guage();
    hook_up_switches();
    finish_tile = the_map->map_hdr[1];
    end_door_tile = the_map->map_hdr[2];
    add_door(the_map->map_hdr[3], 0xFF);
    secret_tile = the_map->map_hdr[4];

    teleport_count = 0;
    for (pos = 0x0A; pos < 0x1E; pos += 2) {        /* teleport pairs */
        if (the_map->map_hdr[pos] != 0) {
            all_teleports[teleport_count][0] = the_map->map_hdr[pos];
            all_teleports[teleport_count][1] = the_map->map_hdr[pos + 1];
            ++teleport_count;
        }
    }

    message_count = 0;
    for (pos = 0x1E; pos < 0x28; pos += 2) {        /* message pairs */
        if (the_map->map_hdr[pos] == 0)
            break;
        map_messages[message_count]     = the_map->map_hdr[pos];
        map_messages[message_count + 1] = the_map->map_hdr[pos + 1];
        message_count += 2;
    }

    display->field_06 = 1;
    control = 0;
    de_doit();                                      /* draw initial frame */
    control = 1;
    display->field_06 = 0;
    display->copy_page(non_displayed_page, displayed_page);
    if (heavy_timer <= 5 && heavy_timer != 0)
        display->put_bits(0x80, 0x97, 0xBE, 0xA1,
                          (uchar far *)gun_underbits, 0, 0);
    display->fade_up();
}

/* --------------------------------------------------------------------------
 * seg03f9:114B — de_doit(void) — the per-frame game loop:
 *   rebuild the shootable/barrier lists, run all actors, render the frame,
 *   service input/timers, fire map message triggers, run the map-0x15 finale.
 * ------------------------------------------------------------------------ */
void de_doit(void)
{
    uint i;             /* var_8 */
    int  cx;            /* var_4 */
    int  cy;            /* var_6 */
    uchar centered;     /* var_1 */
    uint dist;          /* var_A */
    ulong n;            /* var_E */

    barrier_count = shootable_count = 0;

    for (i = 0; i < the_cast->count; i++) {
        act = the_cast->actors[i];
        if (act->type & 2) {
            if (barrier_count == 0x22)
                terminate((uchar far *)"Too many barriers for list.", 0);
            if (!act->sleep)
                barrier_list[barrier_count++] = act;
        }
        if (act->in_window == 1 && (act->type & 1) && !(act->type & 0x10)) {
            if (shootable_count == 0x1D)
                terminate((uchar far *)"Too many shootables.", 0);
            if (!act->sleep)
                shootable_list[shootable_count++] = act;
        }
    }

    cx = cur_sub->xw2 & ~3;
    cy = cur_sub->yh2;
    if (ego->status != 2)
        centered = the_map->center_on(cx, cy);
    else
        centered = 0;
    the_cast->update(centered);
    the_map->update(page_offsets[non_displayed_page]);
    if (cur_map == 6 || cur_map == 0x0C || cur_map == 0x15)
        update_boss_guage();
    i = display->doit();
    display->show_offset(page_offsets[non_displayed_page]);
    if (i && !display->field_06)
        forcepal(palette, 1);
    if (the_map->exploded == 2)
        display->pause(1);
    displayed_page = non_displayed_page;
    non_displayed_page ^= 1;
    the_game->doit();
    check_user();
    check_guages();

    if (jason_on == 0) {
        if (ego->on_pos(finish_tile))
            stop_room = 1;
        if (secret_tile && ego->on_pos(secret_tile))
            stop_room = 6;
        if (ego->on_pos(end_door_tile)) {
            if (!end_door_ptr)
                terminate((uchar far *)"End door switch without door.", 0);
            if (!end_door_ptr->door_open && got_key)
                end_door_ptr->door_open = 1;
            if (!got_key)
                post_message(0);
        }
    }

    if (heavy_timer) {
        if (heavy_timer == 5)
            display->put_bits(0x80, 0x97, 0xBE, 0xA1,
                              (uchar far *)gun_underbits, 0, 0);
        if (heavy_timer == 1) {
            gun_count = 0;
            shot_size = 0;
            display->copy_bits(0x80, 0x97, 0xBE, 0xA1, 0x80, 0x97,
                               page_offsets[0], page_offsets[1], 0x140, 0x140);
        }
    }

    if (score_count++ == 0x28) {
        score_count = 0;
        update_score(0x10D, 0x9F);
        if (random(3) == 0)
            the_game->play_sound((uchar far *)"bubbles2", 2);
    }

    if (displayed_page == 0) {
        if (cur_map == 0) {
            if (!jason_msg && cur_sub->on_pos(0x823)) {
                jason_msg = 1;
                post_message(0x0E);
            }
            if (!barrel_msg && cur_sub->on_pos(0x403)) {
                barrel_msg = 1;
                post_message(0x0A);
            }
            if (!gun_msg && cur_sub->on_pos(0xC23)) {
                gun_msg = 1;
                post_message(0x0C);
            }
            if (!cave_msg && cur_sub->on_pos(0x687)) {
                cave_msg = 1;
                post_message(0x0D);
            }
        }
        for (i = 0; i < message_count; i += 2) {
            if (map_messages[i] && cur_sub->on_pos(map_messages[i])) {
                post_message(map_messages[i + 1]);
                map_messages[i] = 0;
            }
        }
        if (message_posted && --message_posted == 0)
            clear_message();
    }

    if (cur_map == 0x15 && the_game->field_0F == 1) {
        pause(2);
        dist = abs(ego->x - boss->xw);
        if (the_game->field_10 == 0) {
            if (control)
                control = 0;
            if (cur_sub->yh != boss->yh2) {
                ego->x_step = 0;
                if (ego->yh < boss->yh2)
                    ego->y_step = 1;
                else
                    ego->y_step = -1;
            } else if (dist > 4) {
                ego->y_step = 0;
                if (boss->xw > ego->x)
                    ego->x_step = 4;
                else
                    ego->x_step = -4;
            } else {
                the_game->field_10 = 1;
                if (ego->facing) {
                    ego->new_loop((uchar far *)"subr.l");
                    ego->facing = 0;
                }
                act = the_cast->add((uchar far *)"chain.l", 0, 0);
                act->set_xy(cur_sub->xw2 + 5 - act->width,
                            cur_sub->yh);
                act->set_cycle(0, 4);
                ego->aux_act1 = act;
                ego->x_step = ego->y_step = 0;
            }
        } else {
            if (ego->aux_act1->cur_cel == 2)
                the_game->play_sound((uchar far *)"plunk2", 0x0F);
            if (boss->x_step == 0 && !ego->aux_act1->cycler)
                ego->x_step = ego->aux_act1->x_step = boss->x_step = 4;
            pause(3);
            if (ego->x > 0x258 && !displayed_page) {
                show_loop((uchar far *)"the.l", 0x23, 0x41, 0, 0);
                show_loop((uchar far *)"end.l", 0xA5, 0x41, 0, 0);
                pause(0x12C);
                for (n = 0; n < 0x1F400; n++) {
                    cx = random(0x140);
                    cy = random(0xC8);
                    display->fill_rect(cx, cy, cx + 2, cy + 2,
                                       random(0x10) + 0x90, -1, 0);
                }
                stop_room = 1;
            }
        }
    }
}

/* --------------------------------------------------------------------------
 * seg03f9:18C5 — end of room: fade out and show the level stats
 * ------------------------------------------------------------------------ */
void end_room(void)
{
    display->fade_down();
    show_stats();
}

/* --------------------------------------------------------------------------
 * seg03f9:18DF — end of game: death/win screen, sound, high-score handling
 * ------------------------------------------------------------------------ */
void end_game(void)
{
    uchar       is_rec;     /* var_5 */
    uchar far   *name;      /* src   */

    the_game->reset_sound();
    display->show_offset(0);
    if (stop_room == 5) {
        if (random(2) == 0)
            display->show_pcx((uchar far *)"p_death1.pcx", 0, 0, -1);
        else
            display->show_pcx((uchar far *)"p_death2.pcx", 0, 0, -1);
        display->fade_up();
        if (the_game->sb_present)
            the_game->play_sound_file((uchar far *)"bubbles2");
        else
            the_game->play_sound_file((uchar far *)"dead");
        display->pause(0x5A);
        display->fade_down();
        display->cls(0, 0);
        display->set_palette();
    }
    is_rec = is_record(score);
    if (is_rec) {
        if (cheat_mode == 1) {
            i_inform((uchar far *)"You made the top 10!  Unfortunately\nyou are a big cheater, so no cigar.", 0, (uchar far *)0);
            is_rec = 0;
        } else {
            name = i_get_string((uchar far *)"Enter Name",
                                (uchar far *)"You're in the top 10!");
            if (name == 0)
                name = (uchar far *)"";
            save_new_score(score, name, 0);
        }
    }
    show_high_scores(is_rec);
    game_in_progress = 0;
    delete gun_underbits;
    delete jguage_underbits;
    gun_underbits = 0;
}

/* --------------------------------------------------------------------------
 * seg03f9:1A65 — kill the player: play the death animation, remove the loop,
 *   play a sound depending on remaining men, then set the respawn state.
 * ------------------------------------------------------------------------ */
void kill_ego(int arg0, int arg2)
{
    if (god_mode == 1)
        return;
    if (cur_sub->status == 6)
        return;
    if (ego->status != 2) {
        ego->erase();
        if (death_type == 0) {
            the_game->load_loop(aEgodie2_l_0_);
            ego->new_loop(aEgodie2_l_0);
            ego->set_cycle(2, 4);
            ego->set_xy(ego->x + 1, ego->y - 10);
        } else {
            the_game->play_sound((uchar far *)"swish", 0x0F);
            the_game->load_loop((uchar far *)"gotcha.l");
            ego->new_loop((uchar far *)"gotcha.l");
            ego->set_cycle(1, 4);
            ego->set_xy(arg0 - 28, arg2 - 28);
            the_game->play_sound((uchar far *)"smash", 0x0F);
        }
        ego->status = 2;
        ego->aux1 = 0x3C;
        ego->x_step = ego->y_step = 0;
        if (jason_present == 1)
            kill_jason();
        control = 0;
    }
    if (death_type == 0 && ego->cur_cel == 4)
        the_game->play_sound((uchar far *)"exp2", 0x0F);
    if (ego->cur_cel > 4 && !ego->door_open)
        add_bubble(ego->x + random(ego->width),
                   ego->y + random(ego->height), 0);
    if (ego->cycler)
        return;
    if (death_type == 0)
        the_game->remove_loop(aEgodie2_l_1);
    else
        the_game->remove_loop((uchar far *)"gotcha.l");
    the_game->reset_sound();
    switch (men % 2) {
        case 0: the_game->play_sound_file((uchar far *)"cry");     break;
        case 1: the_game->play_sound_file((uchar far *)"villans"); break;
    }
    display->fade_down();
    if (men == 0) {
        stop_room = 5;
        return;
    }
    stop_room = 3;
    if (heavy_timer == 0)
        shot_size = 0;
    auto_fire = 0;
    top_fire = 0;
    jason_fire = 0;
    jason_on = jason_present = 0;
    shld_supply = 0x3C;
    heavy_timer = 0;
    --men;
    update_men();
}

/* --------------------------------------------------------------------------
 * seg03f9:1D13 — score_at(int x, int y, int val)
 * ------------------------------------------------------------------------ */
void score_at(int x, int y, int val)
{
    uchar far *s2;

    switch (val)
    {
    case 100:  s2 = (uchar far *)"scr_100.l";  break;
    case 500:  s2 = (uchar far *)"scr_500.l";  break;
    case 1000: s2 = (uchar far *)"scr_1000.l"; break;
    case 2000: s2 = (uchar far *)"scr_2000.l"; break;
    case 3000: s2 = (uchar far *)"scr_3000.l"; break;
    case 4000: s2 = (uchar far *)"scr_4000.l"; break;
    default:
        terminate((uchar far *)"Undefined score animation.", 0);
        break;
    }

    score += val;
    act = the_cast->add(s2, 0, do_score);
    act->y_step = -(random(2) + 2);
    act->set_xy(x, y);
}

/* --------------------------------------------------------------------------
 * seg03f9:1DFA — post_message(uchar msg)
 * ------------------------------------------------------------------------ */
void post_message(uchar msg)
{
    uchar far *s2;
    int var_2;

    if (msg == cur_message)
        return;

    if (msg >= 10)
    {
        switch (msg - 10)
        {
        case 0: s2 = (uchar far *)"msg_bar.l";  break;
        case 2: s2 = (uchar far *)"msg_gun.l";  break;
        case 3: s2 = (uchar far *)"msg_cave.l"; break;
        case 4: s2 = (uchar far *)"msg_jasn.l"; break;
        }
        show_loop(s2, 0x69, 0x37, 0, page_offsets[displayed_page]);
        while (gr_keys[0x1C] || the_game->field_2C)
            the_game->doit();
        while (!gr_keys[0x1C] && !the_game->field_2C)
            the_game->doit();
        while (gr_keys[0x1C] || the_game->field_2C)
            the_game->doit();
        return;
    }

    message_posted = 0x3C;
    var_2 = 0xA0 - ((strlen(all_messages[msg]) >> 1) << 3);
    display->fill_rect(0, 0xBE, 0x140, 0xC8, 0, 0xFFFF, 0);
    vga_text(var_2, 0xBF, all_messages[msg], 0x17, 3);
    display->copy_bits(0, 0xBE, 0x140, 0xC8, 0, 0xBE,
                       page_offsets[0], page_offsets[1], 0x140, 0x140);
    cur_message = msg;
}

/* --------------------------------------------------------------------------
 * seg03f9:1F9C — clear_message(void)
 * ------------------------------------------------------------------------ */
void clear_message(void)
{
    display->fill_rect(0, 0xBE, 0x140, 0xC8, 0, 0xFFFF, 0);
    display->copy_bits(0, 0xBE, 0x140, 0xC8, 0, 0xBE,
                       page_offsets[0], page_offsets[1], 0x140, 0x140);
    cur_message = -1;
}

/* --------------------------------------------------------------------------
 * seg03f9:1FF6 — add_map_item(uint arg_0, uint arg_2)
 * arg_0 = tile position index, arg_2 = item type/flags value
 * ------------------------------------------------------------------------ */
void add_map_item(uint arg_0, uint arg_2)
{
    uchar far *s2;
    byte var_5;
    int var_2, var_4;

    if (arg_2 & 0xF)
    {
        add_map_pup(arg_0, arg_2 & 0xF);
        return;
    }
    var_5 = !(arg_0 & 1);
    get_map_coords(arg_0, &var_2, &var_4);
    switch (arg_2)
    {
    case 0x10:                  /* coin / gem / bonus group */
    case 0x400:
    case 0x2800:
    case 0x5000:
        if (arg_2 == 0x2800)
            s2 = (uchar far *)"gem.l";
        else if (arg_2 == 0x5000)
        {
            switch (var_5)
            {
            case 0: s2 = (uchar far *)"bonus1.l"; break;
            case 1: s2 = (uchar far *)"bonus2.l"; break;
            }
        }
        else
            s2 = (uchar far *)"coin.l";
        act = the_cast->add(s2, 0, do_coin);
        act->set_cycle(random(2) + 1, 1);
        if (arg_2 == 0x2800) act->s_aux2 = 1;
        var_2 += act->width >> 1;
        if (arg_2 != 0x10) ++goody_count;
        break;

    case 0x20:                  /* pod */
    case 0x1000:
        if (var_5)
            act = the_cast->add((uchar far *)"pod1.l", mv_std, do_pod);
        else
        {
            act = the_cast->add((uchar far *)"pod2.l", mv_std, do_pod);
            act->aux3 = 1;
        }
        act->set_cycle(2, 1);
        act->type = 1;
        if (arg_2 == 0x1000) ++enemy_count;
        else var_4 += act->height;
        break;

    case 0x800:                 /* mine */
        act = the_cast->add((uchar far *)"mine.l", 0, do_mine1);
        var_2 = var_2 - act->width / 2;
        var_4 = var_4 - act->height;
        act->type = 0x21;
        act->set_cycle(random(0xA) + 0xF, 1);
        break;

    case 0xC00:                 /* zapper */
        ++zapper_count;
        act = the_cast->add((uchar far *)"zap_ud.l", 0, do_zapper);
        var_2 = var_2 - 3;
        var_4 = var_4 + 8;
        act->aux2 = zapper_count % 2 * 0xA + 0x28;
        act->set_cycle(0, 0);
        act->type = 1;
        break;

    case 0x1400:                /* fish */
        if (var_5)
        {
            act = the_cast->add((uchar far *)"fish1r.l", 0, do_fish);
            act->aux3 = 1;
        }
        else
        {
            act = the_cast->add((uchar far *)"fish2r.l", 0, do_fish);
            act->aux3 = 2;
        }
        var_4 -= act->height / 2;
        act->facing = 0;
        act->x_step = 1;
        act->aux2 = random(0x64) + 0x64;
        act->set_cycle(3, 1);
        break;

    case 0x1800:                /* weed */
        act = the_cast->add((uchar far *)"weed1.l", 0, 0);
        var_2 -= act->width / 2;
        var_4 -= act->height - 2;
        act->set_cycle(random(5) + 0xA, 1);
        break;

    case 0x1C00:                /* tulip */
        act = the_cast->add((uchar far *)"tulip.l", 0, do_tulip);
        act->aux2 = 0x16;
        act->set_cycle(0, 0);
        var_2 -= 0xB;
        var_4 -= act->my_loop->cels[1]->height + 3;
        break;

    case 0x2000:                /* chest */
        act = the_cast->add((uchar far *)"chest.l", 0, do_chest);
        act->type = 3;
        var_2 -= act->width / 2;
        var_4 -= act->height;
        act->set_cycle(0, 0);
        goody_count += 0xA;
        break;

    case 0x2C00:                /* duct left/right */
        if (var_5)
        {
            act = the_cast->add((uchar far *)"duct_r.l", 0, do_duct_lr);
            act->facing = 0;
        }
        else
        {
            act = the_cast->add((uchar far *)"duct_l.l", 0, do_duct_lr);
            act->facing = 1;
        }
        var_4 += 8;
        act->set_cycle(1, 1);
        break;

    case 0x3000:                /* duct up/down */
        if (var_5)
        {
            act = the_cast->add((uchar far *)"duct_u.l", 0, do_duct_ud);
            act->facing = 2;
        }
        else
        {
            act = the_cast->add((uchar far *)"duct_d.l", 0, do_duct_ud);
            act->facing = 3;
        }
        var_2 += 8;
        act->set_cycle(1, 1);
        break;

    case 0x2400:                /* pirana */
        if (var_5)
        {
            act = the_cast->add((uchar far *)"piranar.l", mv_pirana, do_pirana);
            act->x_step = 1;
            act->facing = 0;
        }
        else
        {
            act = the_cast->add((uchar far *)"piranal.l", mv_pirana, do_pirana);
            act->x_step = -1;
            act->facing = 1;
        }
        act->type = 1;
        var_2 -= act->width / 2;
        var_4 -= act->height / 2;
        act->set_cycle(5, 1);
        ++enemy_count;
        break;

    case 0x3400:                /* block */
        if (var_5) act = the_cast->add((uchar far *)"block2.l", 0, do_block);
        else       act = the_cast->add((uchar far *)"block.l", 0, do_block);
        act->type = 3;
        break;

    case 0x3800:                /* face left/right */
    case 0x7000:
        if (arg_2 == 0x3800)
        {
            act = the_cast->add((uchar far *)"face_r.l", 0, do_face);
            act->facing = 0;
            var_2 += 7;
        }
        else
        {
            act = the_cast->add((uchar far *)"face_l.l", 0, do_face);
            act->facing = 1;
            var_2 -= act->width - 1;
        }
        act->set_cycle(0, 0);
        act->type = 1;
        var_4 -= 2;
        ++enemy_count;
        break;

    case 0x3C00:                /* serpent */
        if (var_5)
        {
            act = the_cast->add((uchar far *)"serp_r.l", mv_pace, do_serpent);
            act->facing = 0;
            act->x_step = 1;
        }
        else
        {
            act = the_cast->add((uchar far *)"serp_l.l", mv_pace, do_serpent);
            act->facing = 1;
            act->x_step = -1;
        }
        var_2 -= act->width / 2;
        var_4 -= act->height;
        act->type = 1;
        act->set_cycle(1, 1);
        ++enemy_count;
        break;

    case 0x4000:                /* crab */
        act = the_cast->add((uchar far *)"crab.l", mv_pace, do_crab);
        if (var_5) { act->facing = 0; act->x_step = 2; }
        else       { act->facing = 1; act->x_step = -2; }
        act->set_cycle(1, 1);
        act->type = 1;
        var_4 -= act->height;
        ++enemy_count;
        break;

    case 0x4400:                /* gun piece */
        if (the_game->field_09 == 1 || gun_count == 4)
        {
            add_barrel(arg_0, 0x10);
            return;
        }
        switch (gun_count)
        {
        case 0: s2 = (uchar far *)"piece_1.l"; break;
        case 1: s2 = (uchar far *)"piece_2.l"; break;
        case 2: s2 = (uchar far *)"piece_3.l"; break;
        case 3: s2 = (uchar far *)"piece_4.l"; break;
        }
        act = the_cast->add(s2, 0, do_gun_piece);
        act->set_cycle(6, 1);
        var_4 -= act->height;
        ++goody_count;
        break;

    case 0x4800:                /* jelly */
        act = the_cast->add((uchar far *)"jelly.l", 0, do_jelly);
        act->type = 1;
        act->set_cycle(random(2) + 4, 1);
        var_2 -= act->width / 2;
        ++enemy_count;
        break;

    case 0x4C00:                /* shark */
        if (var_5)
        {
            act = the_cast->add((uchar far *)"sharkr.l", mv_shark, do_shark);
            act->facing = 0;
        }
        else
        {
            act = the_cast->add((uchar far *)"sharkl.l", mv_shark, do_shark);
            act->facing = 1;
        }
        act->type = 1;
        act->set_cycle(0, 0);
        var_2 -= act->width / 2;
        ++enemy_count;
        break;

    case 0x5400:                /* tentacle */
        act = the_cast->add((uchar far *)"tent_out.l", 0, do_tentacle);
        act->type = 1;
        act->aux1 = 0x19;
        act->set_cycle(0, 0);
        var_2 -= 0xF;
        var_4 += act->height;
        break;

    case 0x5800:                /* spikes */
        if (var_5)
        {
            act = the_cast->add((uchar far *)"spikes_d.l", 0, do_spikes);
            var_4 += 8;
        }
        else
        {
            act = the_cast->add((uchar far *)"spikes_u.l", 0, do_spikes);
            var_4 -= act->height;
        }
        act->aux2 = random(0x19) + 0x28;
        act->type = 1;
        act->set_cycle(0, 0);
        var_2 += act->width;
        break;

    case 0x5C00:                /* statue */
        act = the_cast->add((uchar far *)"statue.l", 0, 0);
        var_2 -= act->width / 2;
        var_4 -= act->height;
        break;

    case 0x6000:                /* fire pit */
        act = the_cast->add((uchar far *)"fire_pit.l", 0, do_fire_pit);
        act->set_cycle(3, 1);
        if (var_5) act->aux2 = 0x50;
        else       act->aux2 = 0x28;
        var_4 -= 5;
        break;

    case 0x6400:                /* shuttle */
        act = the_cast->add((uchar far *)"shutl_l.l", 0, do_shuttle);
        act->type = 1;
        act->facing = 1;
        var_2 += act->width;
        break;

    case 0x6800:                /* clam */
        act = the_cast->add((uchar far *)"clam.l", 0, do_clam);
        act->type = 1;
        act->set_cycle(0, 0);
        var_2 -= act->width / 2;
        var_4 -= act->height - 2;
        break;

    case 0x6C00:                /* cannon */
        act = the_cast->add((uchar far *)"cannonr.l", mv_std, do_cannon);
        act->type = 1;
        act->facing = 0;
        act->set_cycle(0, 0);
        act->y_step = 1;
        var_2 -= act->my_loop->cels[2]->width / 2;
        break;

    case 0x7400:                /* ship */
        if (var_5)
        {
            act = the_cast->add((uchar far *)"shipl.l", mv_ship, do_ship);
            act->x_step = -5;
            act->facing = 1;
        }
        else
        {
            act = the_cast->add((uchar far *)"shipr.l", mv_ship, do_ship);
            act->x_step = 5;
            act->facing = 0;
        }
        act->set_cycle(1, 0xA);
        act->type = 1;
        var_2 -= act->width / 2;
        var_4 -= 0x14;
        break;
    }
    act->set_xy(var_2, var_4);
}

/* --------------------------------------------------------------------------
 * seg03f9:2D4C — barrel factory (called by add_map_item gun case)
 * ------------------------------------------------------------------------ */
void add_barrel(uint arg_0, uint arg_2)
{
    if (arg_2 & 0xF)
        strcpy((char *)_tmp, "barrel2.l");
    else
        switch ((arg_2 + goody_count + enemy_count) & 1)
        {
        case 0: strcpy((char *)_tmp, "barrel1.l"); break;
        case 1: strcpy((char *)_tmp, "barrel3.l"); break;
        }
    act = the_cast->add(_tmp, mv_barrel, do_barrel);
    act->type = 3;
    act->aux1 = arg_2;
    act->y_step = 1;
    get_map_coords(arg_0, (int *)act, (int *)act + 1);
    act->set_xy(act->x - act->width / 2, act->y - act->height);
    if (arg_2 & 0xF)  ++goody_count;
    if (arg_2 & 0x10) ++goody_count;
    if (arg_2 & 0x20) ++enemy_count;
}

/* --------------------------------------------------------------------------
 * seg03f9:2E5D — power-up factory (called by add_map_item when arg_2&0xF)
 * ------------------------------------------------------------------------ */
void add_map_pup(uint arg_0, uint arg_2)
{
    int var_2, var_4;

    switch (arg_2)
    {
    case 1:
        strcpy((char *)_tmp, "pu_air.l");
        break;
    case 2:
        strcpy((char *)_tmp, "pu_shld.l");
        break;
    case 3:
        if (heavy_timer) goto skip;
        strcpy((char *)_tmp, "pu_fire.l");
        break;
    case 4:
        if (top_fire) goto skip;
        strcpy((char *)_tmp, "pu_top.l");
        break;
    case 5:
        if (the_game->field_08 != 1)
        {
            strcpy((char *)_tmp, "pu_1up.l");
            arg_0 -= the_map->map_width;
        }
        else
            goto skip;
        break;
    case 6:
        strcpy((char *)_tmp, "pu_key.l");
        break;
    case 7:
        if (auto_fire != 1)
            strcpy((char *)_tmp, "pu_auto.l");
        else
            goto skip;
        break;
    case 8:
        if (jason_present) goto skip;
        strcpy((char *)_tmp, "pu_jason.l");
        break;
    case 9:
        if (jason_present != 0)
        {
            if (jason_fire != 1)
            {
                strcpy((char *)_tmp, "pu_jf.l");
                break;
            }
        }
        goto skip;
    default:
        terminate((uchar far *)"Pup not defined!", 0);
    }
    act = the_cast->add(_tmp, 0, do_pup);
    act->aux1 = arg_2;
    act->sleep = 1;
    act->set_cycle(2, 1);
    get_map_coords(arg_0, &var_2, &var_4);
    act->set_xy(var_2, var_4);
    return;
skip:
    add_map_item(arg_0, 0x400);
    --goody_count;
}

/* --------------------------------------------------------------------------
 * seg03f9:2FCC — link each switch actor to its matching door actors
 * ------------------------------------------------------------------------ */
void hook_up_switches(void)
{
    int i, j;

    for (i = 0; i < the_cast->count; ++i)
    {
        act = the_cast->actors[i];
        if (act->type & 4)
            for (j = 0; j < the_cast->count; ++j)
            {
                if ((the_cast->actors[j]->type & 8) &&
                    the_cast->actors[j]->aux1 == act->aux1)
                {
                    if (act->aux_act1 == 0)
                        act->aux_act1 = the_cast->actors[j];
                    else
                        act->aux_act2 = the_cast->actors[j];
                }
            }
    }
}

/* --------------------------------------------------------------------------
 * seg03f9:30B6 — switch actor factory
 * ------------------------------------------------------------------------ */
void add_switch(uint arg_0, uint arg_2)
{
    int var_2, var_4;

    get_map_coords(arg_0, &var_2, &var_4);
    act = the_cast->add((uchar far *)"switch.l", 0, do_switch);
    act->type = 5;
    act->aux1 = arg_2 >> 6;
    act->set_xy(var_2 - 1, var_4);
    act->set_cycle(0, 0);
    act->cur_cel = 1;
}

/* --------------------------------------------------------------------------
 * seg03f9:3142 — door actor factory (end door when arg_2==0xFF)
 * ------------------------------------------------------------------------ */
void add_door(uint arg_0, uint arg_2)
{
    int var_2, var_4;

    arg_0 += the_map->map_width;
    get_map_coords(arg_0, &var_2, &var_4);
    if (arg_2 == 0xFF)
    {
        act = the_cast->add((uchar far *)"end_dr.l", 0, do_door);
        end_door_ptr = act;
    }
    else
        act = the_cast->add((uchar far *)"door_ud.l", 0, do_door);
    act->type = 0xB;
    act->aux1 = arg_2 >> 8;
    act->set_xy(var_2 - 4, var_4);
    act->set_cycle(0, 0);
}

/* --------------------------------------------------------------------------
 * seg03f9:3209 — bubble actor factory
 * ------------------------------------------------------------------------ */
void add_bubble(int arg_0, int arg_2, int arg_4)
{
    byte var_1;

    if (the_cast->count > 0x7D) return;
    var_1 = random(2);
    if (random(3) == 0)
        act = the_cast->add((uchar far *)"bubmd.l", 0, do_bubble);
    else
        act = the_cast->add((uchar far *)"bubsm.l", 0, do_bubble);
    act->x_step = arg_4;
    act->y_step = -(var_1 + 1);
    act->set_xy(arg_0, arg_2);
    act->set_cycle(var_1, 1);
}

/* --------------------------------------------------------------------------
 * seg03f9:32AF — spawn an explosion actor + sound at (arg_0, arg_2)
 * ------------------------------------------------------------------------ */
void add_explosion(int arg_0, int arg_2, uchar arg_4, uchar far *arg_6)
{
    uchar var_1, var_2;

    switch (arg_4)
    {
        case 0: var_1 = 3; var_2 = 0; break;
        case 1: var_1 = 3; var_2 = 1; break;
        case 2: var_1 = 5; var_2 = 1; break;
        case 5: var_1 = 5; var_2 = 0; break;
        case 3:
        case 4:
        default: var_1 = 2; var_2 = 1; break;
    }
    if (arg_6 != 0)
        the_game->play_sound(arg_6, 5);
    else
        the_game->play_sound(_all_explosions[arg_4][1], var_1);
    act = the_cast->add(_all_explosions[arg_4][0], 0, do_exp);
    act->set_cycle(var_2, 2);
    act->set_xy(arg_0 - act->width / 2, arg_2 - act->height / 2);
    if (arg_0 & 1)
        add_bubble(arg_0, arg_2 - 3, 0);
}

/* --------------------------------------------------------------------------
 * seg03f9:33C9 — fire a projectile from an actor (arg_4 = type, arg_6 = y adj)
 * ------------------------------------------------------------------------ */
void add_missile(m_actor far *arg_0, uchar arg_4, int arg_6)
{
    int var_2, var_4;

    if (arg_0->in_window == 0)
        return;
    if (arg_4 == 0x63)
    {
        if (ego->on_tile(0x100) != 0)
            return;
    }
    else
    {
        if (arg_0->facing == 1)
        {
            act = the_cast->add(_all_projectiles[arg_4].spr_l, 0, do_missle);
            var_2 = arg_0->x;
            var_2 -= act->width;
            act->x_step = -1;
        }
        else
        {
            act = the_cast->add(_all_projectiles[arg_4].spr_r, 0, do_missle);
            var_2 = arg_0->xw - 3;
            act->x_step = 1;
        }
        act->facing = arg_0->facing;
        if (arg_6 == 0)
            var_4 = arg_0->yh2 + 3;
        else
            var_4 = arg_0->y + arg_6;
        act->aux1 = _all_projectiles[arg_4].v2;
        act->aux2 = _all_projectiles[arg_4].v1;
        act->aux3 = _all_projectiles[arg_4].v0;
        act->s_aux2 = _all_projectiles[arg_4].flag;
        if (arg_4 == 9)
        {
            act->status = 3;
            act->y_step = -7;
        }
        act->aux_act1 = arg_0;
        act->field_4E = _all_projectiles[arg_4].link;
        act->set_cycle(0, 1);
        act->set_xy(var_2, var_4);
        if (arg_4 == 0x0A)
            the_game->play_sound(_all_projectiles[arg_4].snd, 0x0A);
        else
            the_game->play_sound(_all_projectiles[arg_4].snd, 3);
        return;
    }
    act = the_cast->add((uchar far *)"msl_top.l", 0, do_missle);
    act->aux_act1 = arg_0;
    act->facing = 0x63;
    act->s_aux2 = 1;
    act->aux2 = 8;
    act->aux3 = 2;
    if (ego->facing == 0)
        act->set_xy(ego->x + 0x0B, ego->yh2 - act->height - 8);
    else
        act->set_xy(ego->x + ego->width - 0x0D, ego->yh2 - act->height - 8);
    top_shot_count++;
}

/* --------------------------------------------------------------------------
 * seg03f9:36A8 — spawn the Jason probe actor
 * ------------------------------------------------------------------------ */
void add_jason(void)
{
    jason = the_cast->add((uchar far *)"prober.l", mv_ego, do_probe);
    jason->type = 0x11;
    jason->facing = 0;
    if (ego->facing == 0)
        jason->set_xy(ego->x - 2, ego->y);
    else
        jason->set_xy(ego->xw, ego->y);
    jason->set_cycle(0xC, 1);
    jason_power = 100;
    jason_present = 1;
}

/* --------------------------------------------------------------------------
 * seg03f9:3744 — destroy the Jason probe actor
 * ------------------------------------------------------------------------ */
void kill_jason(void)
{
    jason->deleting = 1;
    add_explosion(jason->xw2, jason->yh2, 2, 0);
    if (jason_on == 1 && ego->status != 2)
        scroll_to(ego);
    jason_on = jason_present = 0;
    cur_sub = ego;
    update_jason_guage();
}

/* --------------------------------------------------------------------------
 * seg03f9:37A6 — switch control between ego and the Jason probe
 * ------------------------------------------------------------------------ */
void toggle_sub_control(void)
{
    if (jason_present != 0)
    {
        the_game->play_sound_file((uchar far *)"squeek");
        cur_sub->x_step = cur_sub->y_step = 0;
        if (jason_on == 1)
        {
            scroll_to(ego);
            jason_on = 0;
            cur_sub = ego;
        }
        else
        {
            ego->y_step = 0;
            scroll_to(jason);
            jason_on = 1;
            cur_sub = jason;
        }
    }
}

/* --------------------------------------------------------------------------
 * seg03f9:3823 — smooth-scroll the map view to centre on an actor
 *   phase 1: ±8px coarse steps (8-aligned), phase 2: ±4/±1px fine steps
 * ------------------------------------------------------------------------ */
void scroll_to(m_actor far *arg_0)
{
    uint  var_4, var_6, var_8, var_A;
    uchar var_1;

    var_4 = the_map->map_x + (the_map->viewport_w >> 1);
    var_6 = the_map->map_y + (the_map->viewport_h >> 1);
    var_4 = (var_4 >> 3) << 3;
    var_6 = (var_6 >> 3) << 3;
    var_8 = var_A = 0;
    while (var_4 != var_8 || var_6 != var_A)
    {
        var_8 = (arg_0->xw2 >> 3) << 3;
        var_A = (arg_0->yh2 >> 3) << 3;
        if (var_4 < var_8)
            var_4 += 8;
        else if (var_4 > var_8)
            var_4 -= 8;
        if (var_6 < var_A)
            var_6 += 8;
        else if (var_6 > var_A)
            var_6 -= 8;
        var_1 = the_map->center_on(var_4, var_6);
        the_cast->update(var_1);
        the_map->update(page_offsets[non_displayed_page]);
        display->show_offset(page_offsets[non_displayed_page]);
        displayed_page = non_displayed_page;
        non_displayed_page ^= 1;
    }
    while (var_4 != var_8 || var_6 != var_A)
    {
        var_8 = (arg_0->xw2 >> 2) << 2;
        var_A = arg_0->yh2;
        if (var_4 < var_8)
            var_4 += 4;
        else if (var_4 > var_8)
            var_4 -= 4;
        if (var_6 < var_A)
            var_6++;
        else if (var_6 > var_A)
            var_6--;
        var_1 = the_map->center_on(var_4, var_6);
        the_cast->update(var_1);
        the_map->update(page_offsets[non_displayed_page]);
        display->show_offset(page_offsets[non_displayed_page]);
        displayed_page = non_displayed_page;
        non_displayed_page ^= 1;
    }
}

/* --------------------------------------------------------------------------
 * seg03f9:3A2D — fire a shot from ego/jason (cap 5 live shots) + bonus shots
 * ------------------------------------------------------------------------ */
void ego_fire(void)
{
    if (shot_count == 5)
        return;
    if (jason_on != 0)
    {
        shot_count++;
        if (shot_size == 0)
            add_missile(jason, 0, 4);
        else
            add_missile(jason, 1, 4);
        return;
    }
    if (ego->status == 1)
        return;
    shot_count++;
    add_missile(ego, shot_size, 0);
    if (heavy_timer != 0)
        heavy_timer--;
    if (jason_fire != 0 && jason_present != 0 && jason->status == 0)
        add_missile(jason, 1 - (shot_size == 0), 0);
    if (top_fire == 1 && top_shot_count != 2)
        add_missile(ego, 0x63, 0);
    if (shot_size != 0 && abs(ego->x_step) <= 6)
    {
        if (ego->facing == 0)
            ego->x_step -= shot_size + 2;
        else
            ego->x_step += shot_size + 2;
    }
}

/* --------------------------------------------------------------------------
 * seg03f9:3B43 — flip the controlled actor's facing facing
 * ------------------------------------------------------------------------ */
void turn_ego(void)
{
    if (jason_on != 0)
        jason->new_loop(jason->facing == 1 ? (uchar far *)"prober.l"
                                            : (uchar far *)"probel.l");
    else
    {
        ego->status = 1;
        ego->aux1 = 3;
        ego->new_loop((uchar far *)"turn.l");
    }
    cur_sub->facing ^= 1;
}

/* --------------------------------------------------------------------------
 * seg03f9:3BA6 — player input: menu key, fire/auto-fire, teleport, movement,
 *                animation cycle, cheat keys, debug keys
 * ------------------------------------------------------------------------ */
void check_user(void)
{
    int   var_4;
    uchar var_1;

    if (control == 0) goto no_input;

    if (gr_keys[1] || gr_keys[0x3B])
        if (!displayed_page)
            activate_menu_bar();

    if (the_game->field_2B == 1)
    {
        if (auto_fire == 1 && jason_on == 0)
        {
            if (auto_fire_count++ == 2)
            {
                auto_fire_count = 0;
                ego_fire();
            }
        }
        else
        {
            if (space_bar_been_up != 0)
                ego_fire();
            space_bar_been_up = 0;
        }
    }
    else
    {
        if (space_bar_been_up == 0)
            space_bar_been_up++;
    }

    if (the_game->field_2C == 1 && ego->status == 0)
    {
        for (var_4 = 0; var_4 < teleport_count; var_4++)
            if (cur_sub->on_pos(all_teleports[var_4][0]))
            {
                teleport_to(all_teleports[var_4][1]);
                break;
            }
        if (jason_present == 1 && var_4 == teleport_count)
        {
            toggle_sub_control();
            display->pause(0xA);
        }
    }

    var_1 = 0;
    if (the_game->field_2A != 0)
    {
        if (cur_sub->facing != 0)
            turn_ego();
        if (cur_sub->status != 1)
            cur_sub->x_step = ego_x_speed;
        var_1 = 1;
    }
    else if (the_game->field_29 != 0)
    {
        if (cur_sub->facing != 1)
            turn_ego();
        if (cur_sub->status != 1)
            cur_sub->x_step = -ego_x_speed;
        var_1 = 1;
    }
    else
    {
        if (cur_sub->x_step != 0)
        {
            if (cur_sub->x_step > 0)
                cur_sub->x_step--;
            else
                cur_sub->x_step++;
        }
    }

    if (the_game->field_28 != 0)
    {
        if (ego_y_speed > cur_sub->y_step)
            cur_sub->y_step++;
        else if (ego_y_speed < cur_sub->y_step)
            cur_sub->y_step = ego_y_speed;
        var_1 = 1;
    }
    else if (the_game->field_27 != 0)
    {
        if (-ego_y_speed < cur_sub->y_step)
            cur_sub->y_step--;
        else if (-ego_y_speed > cur_sub->y_step)
            cur_sub->y_step = -ego_y_speed;
        var_1 = 1;
    }
    else
    {
        if (abs(cur_sub->y_step) > 1)
        {
            if (cur_sub->y_step > 0)
                cur_sub->y_step--;
            else
                cur_sub->y_step++;
        }
    }

    if (ego->status != 1)
    {
        if (var_1 != 0)
        {
            if (cur_sub->cycle_speed != 0 || cur_sub->cycler == 0)
                cur_sub->set_cycle(0, 1);
        }
        else
        {
            if (cur_sub->cycle_speed != 0xC)
                cur_sub->set_cycle(0xC, 1);
        }
    }

    if (cheat_mode == 1)
    {
        if (gr_keys[0x1E])
            update_air_guage(2, 0x68, 0xA7);
        if (gr_keys[0x1F])
            update_shld_guage(2, 0x68, 0xB3);
        if (gr_keys[0x21] && shot_size != 3)
        {
            shot_size = 3;
            the_game->play_sound_file((uchar far *)"drillhi");
        }
        if (gr_keys[0x13] && auto_fire != 1)
        {
            auto_fire = 1;
            the_game->play_sound_file((uchar far *)"drillhi");
        }
        if (gr_keys[0x24] && jason_present == 0)
        {
            add_jason();
            the_game->play_sound_file((uchar far *)"drillhi");
        }
        if (gr_keys[0x23] && jason_present == 1 && jason_fire != 1)
        {
            jason_fire = 1;
            the_game->play_sound_file((uchar far *)"drillhi");
        }
        if (gr_keys[0x16] && top_fire != 1)
        {
            top_fire = 1;
            the_game->play_sound_file((uchar far *)"drillhi");
        }
        if (gr_keys[0x22] && god_mode != 1)
        {
            god_mode = 1;
            the_game->play_sound_file((uchar far *)"drillhi");
        }
    }

no_input:
    if (debug_mode == 1)
    {
        if (gr_keys[0x20])
            debug++;
        if (gr_keys[0x19] && displayed_page == 0)
        {
            display->dump_pcx();
            i_inform((uchar far *)"Riptide.pcx has been written", 0, 0);
        }
        if (gr_keys[0x2C])
            stop_room = 1;
        if (gr_keys[0x02])
            display->pause(0xA);
        if (gr_keys[0x03])
            display->pause(0x1E);
        if (gr_keys[0x3B])
            display->show_offset(0);
        if (gr_keys[0x3C])
            display->show_offset(0x3E80);
        if (gr_keys[0x3D])
            display->show_offset(0x7D00);
        if (gr_keys[0x3E])
            display->show_offset(0xBB80);
    }
}

/* --------------------------------------------------------------------------
 * seg03f9:406D — teleport the controlled actor to a map cell
 * ------------------------------------------------------------------------ */
void teleport_to(uint arg_0)
{
    int var_2, var_4, var_6;

    control = 0;
    cur_sub->status = 6;
    if (jason_on == 0)
    {
        ego->new_loop((uchar far *)"backsub.l");
        ego->set_cycle(0, 1);
    }
    cur_sub->x_step = 0;
    cur_sub->y_step = 0;
    var_6 = 10;
    the_game->play_sound((uchar far *)"tport", 0xF);
    while (var_6--) de_doit();
    get_map_coords(arg_0, &var_2, &var_4);
    var_2 -= cur_sub->width / 2;
    var_4 -= cur_sub->height / 2;
    if (jason_on == 0)
    {
        if (jason_present != 0 && touching(ego, jason))
            jason->set_xy(var_2, var_4);
        cur_sub->new_loop((uchar far *)"turn.l");
    }
    cur_sub->set_xy(var_2, var_4);
    var_6 = 5;
    while (var_6--) de_doit();
    if (jason_on == 0)
    {
        if (ego->facing == 0)
            ego->new_loop((uchar far *)"subr.l");
        else
            ego->new_loop((uchar far *)"subl.l");
    }
    cur_sub->status = 0;
    control = 1;
}

/* --------------------------------------------------------------------------
 * seg03f9:41DD — redraw the boss aux3 gauge (per-level boss width)
 *   fill_rect backdrop then 5 tapered draw_span rows for the bar
 * ------------------------------------------------------------------------ */
void update_boss_guage(void)
{
    int var_2, var_4, var_6;

    if (boss->status == 2)
        return;
    switch (cur_map)
    {
        case 6:
            if (boss->x_step != 0 && boss != 0)
            {
                var_2 = 0x5A - boss->aux3;
                var_4 = 0x5A;
                var_6 = 1;
            }
            else
                var_6 = 0;
            break;
        case 0xC:
            var_6 = 1;
            var_4 = 0x3C;
            if (boss->aux2 == 4)
                var_2 = 0x3C - boss->field_28;
            else
                var_2 = var_4;
            break;
        case 0x15:
            var_6 = 1;
            if (boss->aux_act1 != 0)
            {
                var_2 = 0x28 - boss->aux_act1->field_28;
                var_4 = 0x28;
            }
            else
            {
                var_2 = 0x5A - boss->field_28;
                var_4 = 0x5A;
            }
            break;
        default:
            break;
    }
    if (var_6 == 0)
        return;
    if (var_2 < 0)
        var_2 = 0;
    display->fill_rect(0xC3, 0x87, var_4 + 0xC3, 0x8C, 0x1C, -1, non_displayed_page);
    display->draw_span(0xC3, 0x87, 0x26, var_2, page_offsets[non_displayed_page]);
    display->draw_span(0xC3, 0x88, 0x23, var_2, page_offsets[non_displayed_page]);
    display->draw_span(0xC3, 0x89, 0x20, var_2, page_offsets[non_displayed_page]);
    display->draw_span(0xC3, 0x8A, 0x23, var_2, page_offsets[non_displayed_page]);
    display->draw_span(0xC3, 0x8B, 0x26, var_2, page_offsets[non_displayed_page]);
}

/* --------------------------------------------------------------------------
 * seg03f9:43A9 — redraw the air supply gauge
 * ------------------------------------------------------------------------ */
void update_air_guage(int arg_0, int arg_2, int arg_4)
{
    byte var_1, var_2;

    display->fill_rect(arg_2, arg_4, arg_2 + 0x96, arg_4 + 5, 0, -1, 0);
    if (air_supply + arg_0 >= 0x95)
        air_supply = 0x95;
    else if (air_supply + arg_0 < 0)
        air_supply = 0;
    else
        air_supply += arg_0;
    var_1 = air_supply < 0x32 ? 0x20 : 0x60;
    if (air_supply >= 2)
    {
        var_2 = var_1 + 8;
        display->draw_span(arg_2 + 1, arg_4,     var_2, air_supply - 2, 0);
        display->draw_span(arg_2 + 1, arg_4 + 4, var_2, air_supply - 2, 0);
        var_2 = var_1 + 4;
        display->draw_span(arg_2, arg_4 + 1, var_2, air_supply, 0);
        display->draw_span(arg_2, arg_4 + 3, var_2, air_supply, 0);
        display->draw_span(arg_2, arg_4 + 2, var_1, air_supply, 0);
    }
    display->set_pix(arg_2 + 3, arg_4 + 1, 0xF);
    display->copy_bits(0x68, 0xA7, 0xFE, 0xAC, 0x68, 0xA7,
                       page_offsets[0], page_offsets[1], 0x140, 0x140);
}

/* --------------------------------------------------------------------------
 * seg03f9:4532 — redraw the shield supply gauge
 * ------------------------------------------------------------------------ */
void update_shld_guage(int arg_0, int arg_2, int arg_4)
{
    byte var_1, var_2;

    display->fill_rect(arg_2, arg_4, arg_2 + 0x96, arg_4 + 5, 0, -1, 0);
    if (shld_supply + arg_0 >= 0x95)
        shld_supply = 0x95;
    else if (shld_supply + arg_0 < 0)
        shld_supply = 0;
    else
        shld_supply += arg_0;
    var_1 = shld_supply < 0x32 ? 0x20 : 0x91;
    if (shld_supply >= 2)
    {
        var_2 = var_1 + 8;
        display->draw_span(arg_2 + 1, arg_4,     var_2, shld_supply - 2, 0);
        display->draw_span(arg_2 + 1, arg_4 + 4, var_2, shld_supply - 2, 0);
        var_2 = var_1 + 4;
        display->draw_span(arg_2, arg_4 + 1, var_2, shld_supply, 0);
        display->draw_span(arg_2, arg_4 + 3, var_2, shld_supply, 0);
        display->draw_span(arg_2, arg_4 + 2, var_1, shld_supply, 0);
    }
    display->set_pix(arg_2 + 3, arg_4 + 1, 0xF);
    display->copy_bits(0x68, 0xB3, 0xFE, 0xB8, 0x68, 0xB3,
                       page_offsets[0], page_offsets[1], 0x140, 0x140);
}

/* --------------------------------------------------------------------------
 * seg03f9:480C — redraw the Jason power gauge
 * ------------------------------------------------------------------------ */
void update_jason_guage(void)
{
    int var_2, var_4, var_6, var_8, var_A;

    display->put_bits(0x0C, 0xA7, 0x2C, 0xAD, (uchar far *)jguage_underbits, 0, 0);
    var_2 = jason_power / 3 - 1;
    if (jason_present != 0)
    {
        if (var_2 > 1)
        {
            var_2 = jason_power / 3 - 1;
            if (var_2 > 8) var_4 = 0x64; else var_4 = 0x23;
            var_6 = var_4 - 3;
            var_8 = var_4 + 3;
            display->fill_rect(0x0C, 0xA7, var_2 + 0xC, 0xAC, var_4, -1, 0);
            display->draw_span(0x0C, 0xA7, (uchar)var_6, var_2, 0);
            display->draw_span(0x0C, 0xAC, (uchar)var_8, var_2, 0);
            for (var_A = 0; var_A < 6; var_A++)
            {
                display->set_pix(0x0C, var_A + 0xA7, (uchar)var_6);
                display->set_pix(var_2 + 0xB, var_A + 0xA7, (uchar)var_8);
                display->set_pix(var_2 + 0xC, var_A + 0xA7, 0x1D);
            }
        }
    }
    display->copy_bits(0x0C, 0xA7, 0x2C, 0xAD, 0x0C, 0xA7,
                       page_offsets[0], page_offsets[1], 0x140, 0x140);
}

/* --------------------------------------------------------------------------
 * seg03f9:498B — redraw the green-key indicator
 * ------------------------------------------------------------------------ */
void update_key_guage(void)
{
    display->fill_rect(0xEA, 0x95, 0xF4, 0xA1, 0, -1, 0);
    if (got_key != 0)
        show_loop((uchar far *)"key.l", 0xEA, 0x95, 0, 0);
    display->copy_bits(0xEA, 0x95, 0xF4, 0xA1, 0xEA, 0x95,
                       page_offsets[0], page_offsets[1], 0x140, 0x140);
}

/* --------------------------------------------------------------------------
 * seg03f9:49FF — redraw the pulse-cannon gun-piece indicators
 * ------------------------------------------------------------------------ */
void update_gun(void)
{
    uchar far *s2;
    loop_res far *var_E;
    int var_6, var_4, var_2;

    display->field_07 = 1;
    for (var_6 = 0; var_6 < gun_count; var_6++)
    {
        var_2 = gun_pieces_xy[var_6 * 2];
        var_4 = gun_pieces_xy[var_6 * 2 + 1];
        switch (var_6)
        {
            case 0: s2 = (uchar far *)"gun_1.l"; break;
            case 1: s2 = (uchar far *)"gun_2.l"; break;
            case 2: s2 = (uchar far *)"gun_3.l"; break;
            case 3: s2 = (uchar far *)"gun_4.l"; break;
            default: terminate((uchar far *)"Error updating gun.", 0); break;
        }
        var_E = (loop_res far *)the_game->get_loop(s2);
        display->put_bits_masked(var_2, var_4,
                                 var_2 + var_E->cels[0]->width,
                                 var_4 + var_E->cels[0]->height,
                                 var_E->cels[0]->bitmap, 0, 0, 0);
        display->copy_bits(var_2, var_4,
                           var_2 + var_E->cels[0]->width,
                           var_4 + var_E->cels[0]->height,
                           var_2, var_4,
                           page_offsets[0], page_offsets[1], 0x140, 0x140);
    }
    display->field_07 = 0;
}

/* --------------------------------------------------------------------------
 * seg03f9:4B46 — activate the pull-down menu bar (pause game, run menus)
 * ------------------------------------------------------------------------ */
void activate_menu_bar(void)
{
    i_set_text(0x30, 2, 0x18, 0x1D);
    if (game_in_progress != 0)
    {
        the_menu_bar->toggle_item((uchar far *)s1, (uchar far *)"Run Benchmark", 1);
        the_menu_bar->toggle_item((uchar far *)"Game", (uchar far *)"Resume", 1);
        the_game->pause_song();
    }
    else
    {
        the_menu_bar->toggle_item((uchar far *)"Debug", (uchar far *)"Run Benchmark", 0);
        the_menu_bar->toggle_item((uchar far *)"Game", (uchar far *)"Resume", 0);
    }
    the_menu_bar->draw();
    if (debug_mode == 1)
    {
        ltoa((long)farcoreleft(), _tmp2, 0x0A);
        strcpy(_tmp, _tmp2);
        display->print_at_xy(0x104, 1, (uchar far *)_tmp, 0);
    }
    mouse->show();
    while (gr_keys[1] != 0)
        ;
    _resume = 0;
    the_menu_bar->field_16 = 1;
    while (!gr_keys[1] && !_resume)
        i_poll_interface();
    mouse->hide();
    the_menu_bar->erase();
    while (gr_keys[1] != 0)
        ;
    if (game_in_progress != 0 && the_game->field_1C == 1)
        the_game->continue_song();
}

/* --------------------------------------------------------------------------
 * seg03f9:4CC6 — per-tick gauge drain / low warnings / death & jason checks
 * ------------------------------------------------------------------------ */
void check_guages(void)
{
    uint var_2, var_4;

    if (air_count++ == air_speed)
    {
        update_air_guage(-3, 0x68, 0xA7);
        air_count = 0;
        if (air_supply < 40)
        {
            if (!the_game->field_0A)
            {
                the_game->field_0A++;
                the_game->play_sound((uchar far *)"ping", 0xF);
                post_message(5);
            }
        }
        else if (the_game->field_0A != 0 && air_supply > 40)
            the_game->field_0A = 0;

        if (shld_supply < 40)
        {
            if (!the_game->field_0B)
            {
                the_game->field_0B++;
                the_game->play_sound((uchar far *)"ping", 0xF);
                post_message(9);
            }
        }
        else if (the_game->field_0B != 0 && shld_supply > 40)
            the_game->field_0B = 0;
    }

    if (ego->status == 2)
        kill_ego(0, 0);
    else if (air_supply == 0 || shld_supply == 0)
    {
        death_type = 0;
        kill_ego(0, 0);
    }

    if (jason_present == 0)
        return;

    if (jason_count++ == 0x14)
    {
        jason_count = 0;
        update_jason_guage();
        var_2 = abs(ego->xw2 - jason->xw2);
        var_4 = abs(ego->yh2 - jason->yh2);
        if (var_2 > 0x1E) goto drain;
        if (var_4 <= 0x0A) goto recharge;
drain:
        if (jason_power < 40)
        {
            if (!the_game->field_0C)
            {
                the_game->field_0C++;
                the_game->play_sound((uchar far *)"ping", 0xF);
                post_message(8);
            }
        }
        else if (the_game->field_0C != 0)
            the_game->field_0C = 0;
        if (jason_power != 0)
            jason_power -= 2;
        else
            kill_jason();
        goto end;
recharge:
        if (var_2 <= 0x1E && var_4 <= 0x0A)
            jason_power = maximum_jason_power;
end:
        ;
    }
}

/* --------------------------------------------------------------------------
 * seg03f9:46BB — redraw the men-lives counter
 * ------------------------------------------------------------------------ */
void update_men(void)
{
    display->fill_rect(0x127, 0xA6, 0x138, 0xAF, 0, -1, 0);
    vga_text(0x128, 0xA8, (uchar far *)ltoa(men, (char far *)_tmp, 0xA), 0x68, 3);
    display->copy_bits(0x128, 0xA7, 0x138, 0xAF, 0x128, 0xA7,
                       page_offsets[0], page_offsets[1], 0x140, 0x140);
}

/* --------------------------------------------------------------------------
 * seg03f9:473F — redraw the score readout
 * ------------------------------------------------------------------------ */
void update_score(int arg_0, int arg_2)
{
    display->fill_rect(arg_0 - 1, arg_2 - 1, arg_0 + 0x30, arg_2 + 8, 0, -1, 0);
    strcpy((char *)_tmp, ltoa(score, _tmp2, 0xA));
    vga_text(arg_0 + (0x30 - strlen((char *)_tmp) * 8), arg_2, _tmp, 0x68, 3);
    display->copy_bits(arg_0, arg_2, arg_0 + 0x31, arg_2 + 8, arg_0, arg_2,
                       page_offsets[0], page_offsets[non_displayed_page != displayed_page], 0x140, 0x140);
}

/* --------------------------------------------------------------------------
 * seg03f9:4EAD — map cell index -> pixel x/y
 * ------------------------------------------------------------------------ */
void get_map_coords(uint arg_0, int far *arg_2, int far *arg_6)
{
    *arg_2 = (arg_0 % the_map->map_width) << 3;
    *arg_6 = (arg_0 / the_map->map_width) << 3;
}

/* --------------------------------------------------------------------------
 * seg03f9:4EE0 — preload all sprite loops + sound definitions
 * ------------------------------------------------------------------------ */
void load_resources(void)
{
    the_game->load_loop((uchar far *)"bubsm.l");
    the_game->load_loop((uchar far *)"bubmd.l");
    the_game->load_loop((uchar far *)"subr.l");
    the_game->load_loop((uchar far *)"subl.l");
    the_game->load_loop((uchar far *)"turn.l");
    the_game->load_loop((uchar far *)"msl_str.l");
    the_game->load_loop((uchar far *)"msl_sm.l");
    the_game->load_loop((uchar far *)"msl_tpl.l");
    the_game->load_loop((uchar far *)"msl_tpr.l");
    the_game->load_loop((uchar far *)"msl_rkr.l");
    the_game->load_loop((uchar far *)"msl_rkl.l");
    the_game->load_loop((uchar far *)"msl_top.l");
    the_game->load_loop((uchar far *)"msl_pea.l");
    the_game->load_loop((uchar far *)"msl_spt.l");
    the_game->load_loop((uchar far *)"msl_red.l");
    the_game->load_loop((uchar far *)"msl_arwl.l");
    the_game->load_loop((uchar far *)"msl_arwr.l");
    the_game->load_loop((uchar far *)"msl_bg2l.l");
    the_game->load_loop((uchar far *)"msl_bg2r.l");
    the_game->load_loop((uchar far *)"shpbmb.l");
    the_game->load_loop((uchar far *)"fireball.l");
    the_game->load_loop((uchar far *)"explg.l");
    the_game->load_loop((uchar far *)"expmd.l");
    the_game->load_loop((uchar far *)"expsm.l");
    the_game->load_loop((uchar far *)"splat.l");
    the_game->load_loop((uchar far *)"prober.l");
    the_game->load_loop((uchar far *)"probel.l");
    the_game->load_loop((uchar far *)"fish1l.l");
    the_game->load_loop((uchar far *)"fish1r.l");
    the_game->load_loop((uchar far *)"fish2l.l");
    the_game->load_loop((uchar far *)"fish2r.l");
    the_game->load_loop((uchar far *)"scr_100.l");
    the_game->load_loop((uchar far *)"scr_500.l");
    the_game->load_loop((uchar far *)"scr_1000.l");
    the_game->load_loop((uchar far *)"scr_2000.l");
    the_game->load_loop((uchar far *)"scr_3000.l");
    the_game->load_loop((uchar far *)"scr_4000.l");
    the_game->load_loop((uchar far *)"coin.l");
    the_game->load_loop((uchar far *)"bonus1.l");
    the_game->load_loop((uchar far *)"bonus2.l");
    the_game->load_loop((uchar far *)"tulipl.l");
    the_game->load_loop((uchar far *)"tulipr.l");
    the_game->load_loop((uchar far *)"tulip.l");
    the_game->load_loop((uchar far *)"serp_r.l");
    the_game->load_loop((uchar far *)"serp_l.l");
    the_game->load_loop((uchar far *)"msl_bigl.l");
    the_game->load_loop((uchar far *)"msl_bigr.l");
    the_game->load_loop((uchar far *)"msl_hbl.l");
    the_game->load_loop((uchar far *)"msl_hbr.l");
    the_game->load_loop((uchar far *)"firbalup.l");
    the_game->load_loop((uchar far *)"firbaldn.l");
    the_game->load_loop((uchar far *)"pu_air.l");
    the_game->load_loop((uchar far *)"pu_fire.l");
    the_game->load_loop((uchar far *)"pu_shld.l");
    the_game->load_loop((uchar far *)"pu_jwl1.l");
    the_game->load_loop((uchar far *)"pu_1up.l");
    the_game->load_loop((uchar far *)"pu_auto.l");
    the_game->load_loop((uchar far *)"pu_key.l");
    the_game->load_loop((uchar far *)"pu_top.l");
    the_game->load_loop((uchar far *)"pu_jason.l");
    the_game->load_loop((uchar far *)"pu_jf.l");
    the_game->load_loop((uchar far *)"gem.l");
    the_game->load_loop((uchar far *)"spikes_u.l");
    the_game->load_loop((uchar far *)"spikes_d.l");
    the_game->load_loop((uchar far *)"shutl_l.l");
    the_game->load_loop((uchar far *)"shutl_r.l");
    the_game->load_loop((uchar far *)"mreal.l");
    the_game->load_loop((uchar far *)"freemine.l");
    the_game->load_loop((uchar far *)"tent_out.l");
    the_game->load_loop((uchar far *)"tent_in.l");
    the_game->load_loop((uchar far *)"mine.l");
    the_game->load_loop((uchar far *)"barrel1.l");
    the_game->load_loop((uchar far *)"barrel2.l");
    the_game->load_loop((uchar far *)"barrel3.l");
    the_game->load_loop((uchar far *)"pod1.l");
    the_game->load_loop((uchar far *)"pod2.l");
    the_game->load_loop((uchar far *)"piranar.l");
    the_game->load_loop((uchar far *)"piranal.l");
    the_game->load_loop((uchar far *)"jelly.l");
    the_game->load_loop((uchar far *)"backsub.l");
    the_game->load_loop((uchar far *)"end_dr.l");
    the_game->load_loop((uchar far *)"door_ud.l");
    the_game->load_loop((uchar far *)"duct_l.l");
    the_game->load_loop((uchar far *)"duct_r.l");
    the_game->load_loop((uchar far *)"duct_u.l");
    the_game->load_loop((uchar far *)"duct_d.l");
    the_game->load_loop((uchar far *)"block.l");
    the_game->load_loop((uchar far *)"block2.l");
    the_game->load_loop((uchar far *)"switch.l");
    the_game->load_loop((uchar far *)"zap_ud.l");
    the_game->load_loop((uchar far *)"weed1.l");
    the_game->load_loop((uchar far *)"chest.l");
    the_game->load_loop((uchar far *)"face_r.l");
    the_game->load_loop((uchar far *)"face_l.l");
    the_game->load_loop((uchar far *)"crab.l");
    the_game->load_loop((uchar far *)"crabdie.l");
    the_game->load_loop((uchar far *)"serpdie.l");
    the_game->load_loop((uchar far *)"probspin.l");
    the_game->load_loop((uchar far *)"piece_1.l");
    the_game->load_loop((uchar far *)"piece_2.l");
    the_game->load_loop((uchar far *)"piece_3.l");
    the_game->load_loop((uchar far *)"piece_4.l");
    the_game->load_loop((uchar far *)"gun_1.l");
    the_game->load_loop((uchar far *)"gun_2.l");
    the_game->load_loop((uchar far *)"gun_3.l");
    the_game->load_loop((uchar far *)"gun_4.l");
    the_game->load_loop((uchar far *)"statue.l");
    the_game->load_loop((uchar far *)"fire_pit.l");
    the_game->load_loop((uchar far *)"clam.l");
    the_game->load_loop((uchar far *)"cannonr.l");
    the_game->load_loop((uchar far *)"cannonl.l");
    the_game->load_loop((uchar far *)"shipr.l");
    the_game->load_loop((uchar far *)"shipl.l");
    the_game->load_loop((uchar far *)"mouse.l");
    the_game->load_loop((uchar far *)"key.l");
    the_game->load_loop((uchar far *)"pat1.l");
    the_game->define_sound((uchar far *)"fire1", 0);
    the_game->define_sound((uchar far *)"fire2", 0);
    the_game->define_sound((uchar far *)"exp1", 0);
    the_game->define_sound((uchar far *)"exp2", 0);
    the_game->define_sound((uchar far *)"dirhit", 0);
    the_game->define_sound((uchar far *)"bubbles2", 0);
    the_game->define_sound((uchar far *)"pirana", 0);
    the_game->define_sound((uchar far *)"door", 0);
    the_game->define_sound((uchar far *)"drillhi", 0);
    the_game->define_sound((uchar far *)"zap", 0);
    the_game->define_sound((uchar far *)"pup", 0);
    the_game->define_sound((uchar far *)"pup2", 0);
    the_game->define_sound((uchar far *)"faze", 0);
    the_game->define_sound((uchar far *)"tulip", 1);
    the_game->define_sound((uchar far *)"ping", 0);
    the_game->define_sound((uchar far *)"tport", 0);
    the_game->define_sound((uchar far *)"swish", 0);
    the_game->define_sound((uchar far *)"smash", 0);
}

/* --------------------------------------------------------------------------
 * seg03f9:5AAC — render high-score table + Reset/Ok button dialog
 *   arg_0 = rank (1..10) of a newly-entered score to highlight, 0 = none
 * ------------------------------------------------------------------------ */
void show_high_scores(uchar arg_0)
{
    button far *block, far *var_C;
    uchar var_7;
    int  var_2, var_4, var_6;

restart:
    display->save_palette();
    display->blank_palette();
    display->show_pcx((uchar far *)"p_highs.pcx", 0, 0, -1);
    i_set_text(0x40, 2, 0x1C, 0x9E);
    var_4 = 0x46;
    var_6 = 0x1E;
    var_2 = 0;
    goto row_check;
row_body:
    i_set_text(0x80, 2, 0x87, 0x9F);
    if (var_2 == 0)
        i_set_text(0x40, 2, 0x1C, 0x9E);
    else if (arg_0 != 0 && arg_0 == var_2 + 1)
        i_set_text(0x30, 2, 0x18, 0x1D);
    itoa(var_2 + 1, _tmp, 0x0A);
    strcat(_tmp, _src);
    display->print_at_xy(var_4, var_6 + var_2 * 0x0A, (uchar far *)_tmp, 0);
    strcpy(_tmp, return_element(var_2, 2));
    display->print_at_xy(var_4 + 0x28, var_6 + var_2 * 0x0A, (uchar far *)_tmp, 0);
    strcpy(_tmp, return_element(var_2, 1));
    display->print_at_xy(var_4 + 0x8C, var_6 + var_2 * 0x0A, (uchar far *)_tmp, 0);
    var_2++;
row_check:
    if (var_2 < 0x0A)
        goto row_body;
    i_set_text(0x30, 2, 0x18, 0x1D);
    strcpy(_tmp, "Your Score");
    strcat(_tmp, ltoa(score, _tmp2, 0x0A));
    display->print_at_xy(var_4 - 0x0A, var_6 + 0x78, (uchar far *)_tmp, 0);
    i_set_text(0x30, 2, 0x18, 0x1D);
    block = new button((uchar far *)"Reset", (void far *)0, 0);
    var_C = new button((uchar far *)"Ok", (void far *)0, 0);
    block->field_18 = 0xA0;
    block->field_1A = 0xB7;
    var_C->field_18 = 0xE6;
    var_C->field_1A = 0xB7;
    block->draw();
    var_C->draw();
    var_C->mouse_to_me();
    display->set_palette();
    mouse->show();
    while (de_button())
        ;
    var_2 = 0x438;
    var_7 = 1;
    while ((int)var_C->poll() == 0)
    {
        if ((*i_external_left)() || (*i_external_right)())
        {
            display->pause(0x0A);
            var_7 ^= 1;
            ((button far **)&block)[var_7]->mouse_to_me();
            while ((*i_external_left)() || (*i_external_right)())
                ;
        }
        if (block->poll())
        {
            if ((int)i_yes_cancel((uchar far *)"Are you sure you want to\n"
                             "reset the high scores?", 0) == 0)
            {
                init_scores_file();
                delete block;
                delete var_C;
                mouse->hide();
                goto restart;
            }
            block->field_20 = 0;
        }
        display->pause(1);
        if (var_2-- == 0)
            break;
    }
    delete block;
    delete var_C;
    mouse->hide();
    display->cls(0, 0);
    display->restore_palette();
    display->set_palette();
}

/* --------------------------------------------------------------------------
 * seg03f9:5981 — title screen: song, pcx, sound, cheat-key poll loop
 * ------------------------------------------------------------------------ */
void start_title_loop(void)
{
    int var_2;

    the_game->play_song((uchar far *)"title.cmf");
    display->blank_palette();
    display->show_pcx((uchar far *)"p_title.pcx", 0, 0, -1);
    display->set_palette();
    i_set_text(0x30, 2, 0x18, 0x1D);
    if (the_game->sb_present == 0)
        the_game->play_sound_file((uchar far *)"title");
    else
        the_game->play_sound_file((uchar far *)"pup2");
    if (saw_title_screen == 0)
    {
        saw_title_screen++;
        while (the_game->field_2B != 0)
            the_game->doit();
        var_2 = 0x12C;
        while (the_game->field_2B == 0 && var_2-- != 0)
        {
            if (!god_mode && gr_keys[0x22] && gr_keys[0x38])
            {
                the_game->play_sound_file((uchar far *)"sum");
                god_mode = 1;
            }
            display->pause(1);
            the_game->doit();
        }
    }
    activate_menu_bar();
}

/* --------------------------------------------------------------------------
 * seg03f9:5ECF — level-complete stats screen: % destroyed, palette backup,
 *   animated air/shield bonus drain into score, then restore
 * ------------------------------------------------------------------------ */
void show_stats(void)
{
    uchar far *dest;
    uchar far *block;
    int var_2, var_4, var_6, var_8, var_A, var_C, var_E;
    int var_10, var_14, var_16, var_18, var_1A, var_1C, var_1E, value;

    non_displayed_page = displayed_page = 0;
    display->show_offset(0);
    the_game->reset_sound();
    the_game->reset_player(0);
    the_game->play_song((uchar far *)"stats.cmf");
    the_game->define_sound((uchar far *)"add", 0);
    the_game->define_sound((uchar far *)"sum", 0);
    i_set_text(0x30, 2, 0x18, 0x1D);
    var_2 = air_supply;
    var_4 = shld_supply;
    var_1E = 0;
    var_6 = 0x41;
    var_8 = 0x69;
    var_A = var_6;
    var_C = var_8 + 0x0A;
    var_18 = 0x54;
    var_1A = 0x54;
    var_1C = 0xF9;
    var_E = 0xA0;
    if (!enemy_count || !goody_count)
        terminate((uchar far *)"Attempt to divide by zero in show_stats",
                  (uchar far *)0);
    var_10 = (int)(goodies_found / (float)goody_count * 100.0);
    value = (int)(enemies_killed / (float)enemy_count * 100.0);
    display->blank_palette();
    dest = new uchar[0x300];
    if (dest == 0)
        no_heap((uchar far *)"show stats");
    memcpy(dest, palette, 0x300);
    display->show_pcx((uchar far *)"p_stats.pcx", 0, 0, -1);
    var_14 = 0xD2;
    var_16 = 0x0A;
    show_loop((uchar far *)"otis.l", var_14, var_16, 0, 0);
    update_air_guage(0, var_18, 0xA7);
    update_shld_guage(0, var_1A, 0xB3);
    update_score(var_1C, 0x9F);
    strcpy((char *)_tmp, "Enemies destroyed : ");
    strcat((char *)_tmp, itoa(value, _tmp2, 0x0A));
    strcat((char *)_tmp, "%");
    display->print_at_xy(var_6, var_8 - 0x1E, (uchar far *)_tmp, 0);
    strcpy((char *)_tmp, "Goodies\t\t  : ");
    strcat((char *)_tmp, itoa(var_10, _tmp2, 0x0A));
    strcat((char *)_tmp, "%");
    display->print_at_xy(var_6, var_8 - 0x14, (uchar far *)_tmp, 0);
    display->print_at_xy(var_6, var_8, (uchar far *)"Bonus X 50\t  :", 0);
    display->print_at_xy(var_A, var_C, (uchar far *)"Bonus X 100\t  :", 0);
    display->set_palette();
    block = (uchar far *)display->get_bits(var_6 + var_E, var_8,
                                           var_6 + var_E + 0x28, var_8 + 0x0A);
    while (air_supply != 0 && !the_game->field_2B)
    {
        the_game->doit();
        the_game->play_sound((uchar far *)"add", 0x0F);
        pause(3);
        var_1E += 0x96;
        update_air_guage(-3, var_18, 0xA7);
        display->put_bits(var_6 + var_E, var_8, var_6 + var_E + 0x28,
                          var_8 + 0x0A, block, 0, 0);
        display->print_at_xy(var_6 + var_E, var_8,
                             (uchar far *)itoa(var_1E, _tmp, 0x0A), 0);
    }
    air_supply = 0;
    score += var_2 * 0x32;
    var_1E = var_2 * 0x32;
    display->put_bits(var_6 + var_E, var_8, var_6 + var_E + 0x28,
                      var_8 + 0x0A, block, 0, 0);
    display->print_at_xy(var_6 + var_E, var_8,
                         (uchar far *)itoa(var_1E, _tmp, 0x0A), 0);
    update_score(var_1C, 0x9F);
    i_set_text(0x30, 2, 0x18, 0x1D);
    update_air_guage(0, var_18, 0xA7);
    delete block;
    block = (uchar far *)display->get_bits(var_A + var_E, var_C,
                                           var_A + var_E + 0x28, var_C + 0x0A);
    var_1E = 0;
    while (shld_supply != 0 && !the_game->field_2B)
    {
        the_game->doit();
        the_game->play_sound((uchar far *)"add", 0x0F);
        pause(3);
        update_shld_guage(-3, var_1A, 0xB3);
        var_1E += 0x12C;
        display->put_bits(var_A + var_E, var_C, var_A + var_E + 0x28,
                          var_C + 0x0A, block, 0, 0);
        display->print_at_xy(var_A + var_E, var_C,
                             (uchar far *)itoa(var_1E, _tmp, 0x0A), 0);
    }
    shld_supply = 0;
    score += var_4 * 0x64;
    var_1E = var_4 * 0x64;
    update_score(var_1C, 0x9F);
    i_set_text(0x30, 2, 0x18, 0x1D);
    display->put_bits(var_A + var_E, var_C, var_A + var_E + 0x28,
                      var_C + 0x0A, block, 0, 0);
    display->print_at_xy(var_A + var_E, var_C,
                         (uchar far *)itoa(var_1E, _tmp, 0x0A), 0);
    update_shld_guage(0, var_1A, 0xB3);
    the_game->play_sound((uchar far *)"sum", 0x0F);
    while (the_game->voc_playing())
        ;
    wait_for_user();
    air_supply = var_2;
    shld_supply = var_4;
    delete block;
    the_game->remove_sound((uchar far *)"add");
    the_game->remove_sound((uchar far *)"sum");
    i_set_text(0x30, 2, 0x18, 0x1D);
    the_game->reset_sound();
    memcpy(palette, dest, 0x300);
    delete dest;
}

/* --------------------------------------------------------------------------
 * seg03f9:65CC — intro/prelude sequence: pan a tall image, map title,
 *   explosion + scroll-to, then wait for input
 * ------------------------------------------------------------------------ */
void show_prelude(void)
{
    int var_4;

    display->blank_palette();
    the_game->reset_sound();
    display->copy_page(2, 1);
    display->cls(0, 0);
    display->cls(0, 1);
    display->show_offset(page_offsets[1]);
    show_loop((uchar far *)"prelude.l", 0x50, 0x32, 0, 0);
    i_set_text(0x80, 2, 0x87, 0x9F);
    display->print_at_xy(0, 0x64, all_maps[cur_map].title, 1);
    i_set_text(0x30, 2, 0x18, 0x1D);
    display->set_palette();
    the_game->play_sound((uchar far *)"fire2", 0x0D);
    the_game->doit();
    var_4 = 0x3E80;
    while (var_4 >= 0)
    {
        display->show_offset(var_4);
        var_4 -= 0x280;
    }
    display->copy_page(1, 0);
    display->show_offset(page_offsets[1]);
    display->cls(0, 0);
    the_game->play_sound((uchar far *)"exp2", 0x0E);
    the_game->doit();
    display->show_offset(0x3D40);
    display->pause(2);
    display->show_offset(page_offsets[1]);
    while (de_button() == 0)
        ;
    the_game->play_sound((uchar far *)"fire2", 0x0F);
    var_4 = 0x3E80;
    while (var_4 >= 0)
    {
        display->show_offset(var_4);
        var_4 -= 0x280;
    }
    display->copy_page(1, 2);
    while (the_game->voc_playing())
        ;
    the_game->reset_sound();
}

/* --------------------------------------------------------------------------
 * seg03f9:6827 — draw one frame of a sprite-loop resource at (x,y)
 *   s2 = loop name, arg_4 = x, arg_6 = y, arg_8 = frame index, arg_A = flags
 * ------------------------------------------------------------------------ */
void show_loop(uchar far *s2, int arg_4, int arg_6, uchar arg_8, uint arg_A)
{
    loop_res far *var_6;
    uchar var_1;

    display->field_07 = 1;
    var_1 = 0;
    var_6 = (loop_res far *)the_game->get_loop(s2);
    if (var_6 == 0)
    {
        var_6 = (loop_res far *)the_game->load_loop(s2);
        if (var_6 == 0)
            terminate((uchar far *)"Loop does not exist.", s2);
        var_1 = 1;
    }
    else
        var_1 = 0;
    display->put_bits_masked(arg_4, arg_6,
        arg_4 + var_6->cels[arg_8]->width,
        arg_6 + var_6->cels[arg_8]->height,
        var_6->cels[arg_8]->bitmap, arg_A, 0, 0);
    if (var_1)
        the_game->remove_loop(s2);
    display->field_07 = 0;
}

/* --------------------------------------------------------------------------
 * seg03f9:69B0 — de_button: any fire/confirm input held?
 *   al = gr_keys[SPACE] | gr_keys[ENTER] | the_game->field_2B
 * ------------------------------------------------------------------------ */
/* TEMP: headless smoke-test hook — "-autofire" pulses "fire" every 40th
 * de_button call so the prelude/menu button gates pass without input and
 * the game loop actually runs. Zero effect without the flag. */
static int auto_pulse;
static long auto_t;

uchar de_button(void)
{
    uchar r;

    the_game->doit();
    r = gr_keys[0x39] | gr_keys[0x1C] | the_game->field_2B;
    if (auto_pulse && (++auto_t % 40) == 0)
        return 1;
    return r;
}

/* --------------------------------------------------------------------------
 * seg03f9:69D6 — wait_for_user: release → press → release debounce
 *   each loop calls the_game->doit() to pump input
 * ------------------------------------------------------------------------ */
void wait_for_user(void)
{
    while (the_game->field_2B || mouse->field_00 ||
           gr_keys[0x39] || gr_keys[0x1C])
        the_game->doit();
    while (!the_game->field_2B && !mouse->field_00 &&
           !gr_keys[0x39] && !gr_keys[0x1C])
        the_game->doit();
    while (the_game->field_2B || mouse->field_00 ||
           gr_keys[0x39] || gr_keys[0x1C])
        the_game->doit();
}

/* --------------------------------------------------------------------------
 * seg03f9:6A84 — command line options
 * ------------------------------------------------------------------------ */
void parse_options(int argc, uchar *argv[])
{
    int i;
    debug_mode = 0;
    force_pc_sound = 0;
    zoom_to_map = 0;
    for (i = 0; i < argc; i++) {
        if (strcmp((char *)argv[i], "-mandich") == 0)
            debug_mode = 1;
        if (strcmp((char *)argv[i], "-pcsound") == 0)
            force_pc_sound = 1;
        if (strcmp((char *)argv[i], "-autofire") == 0)   /* TEMP headless test */
            auto_pulse = 1;
        if (strcmp((char *)argv[i], "-start") == 0)
            zoom_to_map = atoi(argv[i + 1]) - 1;
    }
}

/* --------------------------------------------------------------------------
 * seg03f9:7280 — random(int)   game-local helper
 *   movsx eax,ax / movsx edx,range / imul eax,edx / ebx=8000h / cdq / idiv ebx
 * ------------------------------------------------------------------------ */
int random(int range)
{
    return (int)(((long)rand() * range) / 32768);
}

/* --------------------------------------------------------------------------
 * seg03f9:72A4 — abs(int)      game-local helper
 *   orig emits branchless idiom: mov ax,a / cwd / xor ax,dx / sub ax,dx
 *   (pre-3.1 compiler codegen for x<0?-x:x; BC++3.1 emits a branch — same semantics)
 * ------------------------------------------------------------------------ */
int abs(int a)
{
    return a < 0 ? -a : a;
}

/* --------------------------------------------------------------------------
 * seg03f9:72EC — atoi(uchar *) game-local helper (uchar*, NOT stdlib char*)
 *   push s+2 / push s / call _atol / add sp,4
 * ------------------------------------------------------------------------ */
int atoi(const uchar *s)
{
    return (int)atol((const char far *)s);
}

/* --------------------------------------------------------------------------
 * gui_item base virtuals + destructors — emitted into this TU (seg03f9 tail).
 * BC synthesizes the polymorphic deleting-dtor `$bdtr` bodies from these.
 * ------------------------------------------------------------------------ */
gui_item::~gui_item() {}
void gui_item::draw() {}
void gui_item::erase() {}
button::~button() {}
