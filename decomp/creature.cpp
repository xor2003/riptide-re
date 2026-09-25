/* ==========================================================================
 * CREATURE.CPP — decompilation of seg0b2c (actor AI, movement & collision)
 * Original compiler: Borland C++ 3.1, -ml -3
 * Each function annotated with its original seg:offset.
 * ========================================================================== */
#include "riptide.h"

/* --------------------------------------------------------------------------
 * seg0b2c:0004 — gui_item::poll: trivial stub (linker placed it in seg0b2c).
 * ------------------------------------------------------------------------ */
uchar gui_item::poll()
{
    return 0;
}

/* --------------------------------------------------------------------------
 * seg0b2c:000D — hit_cur_sub(a,b): register a hit on the player's sub.
 * ------------------------------------------------------------------------ */
void far hit_cur_sub(int a, int b)
{
    cur_sub->flag_3   = 1;      /* bit3 — "took a hit this frame" */
    cur_sub->field_28 += a;
    cur_sub->field_1E  = b;
}

/* --------------------------------------------------------------------------
 * seg0b2c:0031 — set_flying_death: knock a creature into its dying loop.
 * ------------------------------------------------------------------------ */
/* forward decls for fn-ptr callbacks defined later in this TU */
void far do_ship_bomb(m_actor far *);
byte far do_follow(m_actor far *, int, int);
void far do_mine2(m_actor far *);

void far set_flying_death(m_actor far *a, uchar far *s2, int arg8, int argA, uchar argC)
{
    a->new_loop(s2);
    a->set_cycle(arg8, argC);
    a->state    = 2;
    a->y_speed  = argA;
    a->x_speed  = 0;
    a->type     = 0;
    a->flag_0   = 0;
    enemies_killed++;
}

/* --------------------------------------------------------------------------
 * seg0b2c:008F — check_flying_death: falling corpse sinks until off-window.
 * ------------------------------------------------------------------------ */
void far check_flying_death(m_actor far *a)
{
    if (a->state == 2) {
        a->y_speed++;
        if (!a->in_window)
            a->flag_0 = 1;
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:00BF — check_for_hit: consume a flag_3 hit, flash field_36, return
 *   0=no-hit / 1=killed / 2=survived.
 * ------------------------------------------------------------------------ */
byte far check_for_hit(m_actor far *a, uchar arg4)
{
    if (!a->flag_3)
        return 0;
    a->flag_3   = 0;
    a->field_36 = 0x0F;
    if (arg4 > a->field_28)
        return 1;
    a->flag_0 = 1;
    return 2;
}

/* --------------------------------------------------------------------------
 * seg0b2c:0109 — check_vertical_ray: cast `arg4` tile-rows up/down (toward
 *   cur_sub) across the actor's width; 1 = path clear, 0 = blocked.
 * ------------------------------------------------------------------------ */
byte far check_vertical_ray(m_actor far *a, uint arg4)
{
    int var_2, var_4, var_6;
    var_2 = a->map_pos;
    if (a->center_y < cur_sub->center_y) {
        var_2 += tbl_mul_tw[a->field_1C - 1];   /* row just below the actor (orig: word_2BA84[field_1C]) */
        var_4  = the_map->map_width;            /* scan downward */
    } else {
        var_4  = -the_map->map_width;           /* scan upward */
    }
    if (arg4 < 1) arg4 = 1;
    while (arg4--) {
        var_6 = 0;
        while (a->field_1A > var_6) {
            if (the_map->tile_attr[var_2 + var_6].attr < 0x100)
                return 0;
            var_6++;
        }
        var_2 += var_4;
    }
    return 1;
}

/* --------------------------------------------------------------------------
 * seg0b2c:01A9 — check_horizontal_ray: cast `arg4` tiles in the facing
 *   direction across the actor's mid-row; 1 = clear, 0 = blocked.
 * ------------------------------------------------------------------------ */
byte far check_horizontal_ray(m_actor far *a, uint arg4)
{
    int var_2, var_4;
    var_2 = a->map_pos + tbl_mul_tw[a->field_1C >> 1];
    if (a->direction == 0) {
        var_4  = 1;
        var_2 += a->field_1A;                   /* start just past the right edge */
    } else {
        var_4  = -1;                            /* scan leftward */
    }
    if (arg4 < 1) arg4 = 1;
    while (arg4--) {
        if (the_map->tile_attr[var_2].attr < 0x100)
            return 0;
        var_2 += var_4;
    }
    return 1;
}

/* --------------------------------------------------------------------------
 * seg0b2c:0225 — check_new_pos: tentatively move to (x,y), collect the tile
 *   + barrier collision mask, restore, and report which speed was blocked.
 *   Returns the mask (bit15 set if any tile hit); *x_spd/*y_spd get 1 when
 *   the corresponding axis was stopped.
 * ------------------------------------------------------------------------ */
int far check_new_pos(m_actor far *a, int arg4, int arg6,
                      int far *arg8, int far *argC, int arg10, int arg12, int arg14)
{
    int var_2, var_4, var_6, var_8, var_A, var_E;
    uchar var_B;
    var_2 = a->x;
    var_4 = a->y;
    var_6 = a->map_pos;
    var_8 = a->x_speed;
    var_A = a->y_speed;
    a->x = arg4;
    a->y = arg6;
    a->map_pos = tbl_mul_tw[a->y >> 3] + (a->x >> 3);
    var_E = a->tile_collision(arg10, arg12, arg14);
    if (var_E != 0)
        var_E |= 0x8000;
    else {
        var_B = 0;
        while (var_B < barrier_count) {
            act = barrier_list[var_B];
            if (act != a && touching(a, act)) {
                if (a->x >= act->x)
                    var_E = 0x20;
                else
                    var_E = 0x80;
                break;
            }
            var_B++;
        }
    }
    if (var_E & 5)    var_A = 1;
    if (var_E & 0x0A) var_8 = 1;
    a->x = var_2;
    a->y = var_4;
    a->map_pos = var_6;
    *arg8 = var_8;
    *argC = var_A;
    return var_E;
}

/* --------------------------------------------------------------------------
 * seg0b2c:0372 — mv_ego: the player's move hook. Clamps the ceiling, snaps
 *   onto a tile when a door opens underfoot, then resolves via check_new_pos.
 * ------------------------------------------------------------------------ */
void far mv_ego(m_actor far *a, int far *x_out, int far *y_out)
{
    int var_2, var_4, var_6, var_8;
    if (*y_out < 0)
        *y_out = 0;
    if (a->door_open) {
        var_2 = (((*y_out - a->y_speed) >> 3) + 1 << 3) - 1;
        if (*y_out < var_2 && a->y_speed <= 0)
            *y_out = var_2;
    }
    if (a == jason)
        var_8 = check_new_pos(a, *x_out, *y_out, &var_4, &var_6, 4, 2, 0);
    else
        var_8 = check_new_pos(a, *x_out, *y_out, &var_4, &var_6, ego_map_w, ego_map_h, 1);
    if (var_8 != 0) {
        if (var_4 != 0) {
            *x_out = a->x;
            a->x_speed = 0;
        }
        if (var_6 != 0) {
            *y_out = a->y;
            a->y_speed = 0;
        }
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:0454 — mv_pirana: piranha only moves while flagged, then falls back
 *   to the standard mover.
 * ------------------------------------------------------------------------ */
void far mv_pirana(m_actor far *a, int far *x_out, int far *y_out)
{
    if (!a->flag_7) {           /* bit7 — move-enable */
        *x_out = a->x;
        *y_out = a->y;
    }
    mv_std(a, x_out, y_out);
}

/* --------------------------------------------------------------------------
 * seg0b2c:049D — mv_barrel: barrels fall & bounce via the standard mover.
 * ------------------------------------------------------------------------ */
void far mv_barrel(m_actor far *a, int far *x_out, int far *y_out)
{
    int var_2, var_4, var_6;
    var_6 = check_new_pos(a, *x_out, *y_out, &var_2, &var_4, 0, 0, 0);
    if (var_6 != 0) {
        if (var_6 < 0)                          /* sign bit — hit the floor */
            a->move_func = 0;                   /* [42h] — stop bouncing */
        a->y_speed = 0;
        *y_out = a->y;
    } else {
        if (a->y_speed == 2)
            return;
        a->y_speed++;                           /* gravity */
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:0511 — mv_std: the standard mover — resolve via check_new_pos;
 *   an x-block latches door_open (flip), a y-block bounces the fall speed.
 * ------------------------------------------------------------------------ */
void far mv_std(m_actor far *a, int far *x_out, int far *y_out)
{
    int var_2, var_4, var_6;
    var_6 = check_new_pos(a, *x_out, *y_out, &var_2, &var_4, 0, 0, 0);
    if (var_6 != 0) {
        if (var_2 != 0) {
            a->door_open = 1;
            *x_out = a->x;
        }
        if (var_4 != 0) {
            a->y_speed = -a->y_speed;
            *y_out = a->y;
        }
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:069F — mv_shark: shark edge check — if the tile it faces into is
 *   solid (or the ledge ends), latch flag_7 and hold position.
 * ------------------------------------------------------------------------ */
void far mv_shark(m_actor far *a, int far *x_out, int far *y_out)
{
    if (a->door_open) {
        if (the_map->tile_attr[a->map_pos - 2].attr < 0x100 && a->direction == 1)
            goto latch;
        if (the_map->tile_attr[a->map_pos + a->field_1A + 2].attr < 0x100 && a->direction == 0)
            goto latch;
        return;
latch:
        a->flag_7 = 1;
        *x_out = a->x;
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:0730 — mv_ship: ship ledge check — hold + door_open at the edge.
 * ------------------------------------------------------------------------ */
void far mv_ship(m_actor far *a, int far *x_out, int far *y_out)
{
    int var_2;
    var_2 = a->map_pos + word_2BA84[a->field_1C];
    if (the_map->tile_attr[var_2 - 1].attr < 0x100 && a->direction == 1)
        goto latch;
    if (the_map->tile_attr[var_2 + a->field_1A + 1].attr < 0x100 && a->direction == 0)
        goto latch;
    return;
latch:
    a->door_open = 1;
    *x_out = a->x;
}

/* --------------------------------------------------------------------------
 * seg0b2c:07B6 — mv_bs2tn: boss tentacle — position tracks its linked parent
 *   plus a per-direction offset.
 * ------------------------------------------------------------------------ */
void far mv_bs2tn(m_actor far *a, int far *x_out, int far *y_out)
{
    if (a->direction == 1)
        *x_out = a->target->x + a->counter_24;
    else
        *x_out = a->target->x + a->health;
    *y_out = a->target->y + a->counter_26;
}

/* --------------------------------------------------------------------------
 * seg0b2c:0586 — mv_pace: pacing move — peeks one step ahead for a ledge or a
 *   barrier; flags door_open so the update_func turns around at the edge.
 * ------------------------------------------------------------------------ */
void far mv_pace(m_actor far *a, int far *x_out, int far *y_out)
{
    int var_2, var_4, var_6, var_8;

    if (a->state == 2)
        return;
    if (a->in_window) {
        var_2 = a->map_pos + tbl_mul_tw[a->field_1C];
        var_4 = var_2 - the_map->map_width;
        if (a->x_speed > 0) {
            var_4 += a->field_1A;
            var_2 += a->field_1A;
        }
        if (the_map->tile_attr[var_2].attr > 0x100 ||
            the_map->tile_attr[var_4].attr < 0x100) {
            a->door_open = 1;
        } else {
            var_8 = a->x;
            a->x = *x_out + a->x_speed;
            for (var_6 = 0; var_6 < barrier_count; var_6++) {
                if (touching(a, barrier_list[var_6])) {
                    a->x = var_8;
                    a->door_open = 1;
                    goto done;
                }
            }
            *x_out = var_8;
            return;
        }
    }
done:
    *x_out = a->x;
}

/* --------------------------------------------------------------------------
 * seg0b2c:0807 — do_ego: the player's per-frame update. Applies hit damage,
 *   wakes jason, fires the door-open transition, spawns idle bubbles, and
 *   refills air when pressed against a solid tile.
 * ------------------------------------------------------------------------ */
void far do_ego(m_actor far *a)
{
    int var_2, var_4;
    if (a->state == 2 || a->state == 6)
        return;
    if (a->flag_3) {                        /* bit3 — took a hit */
        update_shld_guage(-a->field_28, 0x68, 0xB3);
        a->field_36 = 0x20;
        a->flag_3 = 0;
        a->field_28 = 0;
        if (jason_present && !jason_on)
            jason->flag_7 = 1;
        if (a->field_1E != 0) {
            a->x_speed += a->field_1E;
            a->field_1E = 0;
        }
    }
    if (jason_on == 1)
        return;
    if (a->state == 1 && --a->counter_24 == 0) {
        a->new_loop(a->direction == 1 ? (uchar *)"subl.l" : (uchar *)"subr.l");
        a->state = 0;
    }
    if (a->cycle_speed == 0 && random(2) == 0) {
        var_2 = a->x;
        var_4 = a->center_y + random(0x0A);
        if (a->direction == 0)
            add_bubble(var_2, var_4, -6);
        else
            add_bubble(var_2 + a->width, var_4, 6);
    }
    if (a->on_tile(0x100) == 3) {
        update_air_guage(5, 0x68, 0xA7);
        if (a->y_speed < 0)
            a->y_speed = 0;
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:0D8D — do_block: breakable block — just the generic hit test.
 * ------------------------------------------------------------------------ */
void far do_block(m_actor far *a)
{
    check_for_hit(a, 3);
}

/* --------------------------------------------------------------------------
 * seg0b2c:0DA1 — do_score: floating score popup — dies after 0x0F frames.
 * ------------------------------------------------------------------------ */
void far do_score(m_actor far *a)
{
    if (a->counter_24++ == 0x0F)
        a->flag_0 = 1;
}

/* --------------------------------------------------------------------------
 * seg0b2c:0DBE — do_chest: treasure chest — opens after 4 hits, then spews
 *   coins (or a gem) that arc out under gravity.
 * ------------------------------------------------------------------------ */
void far do_chest(m_actor far *a)
{
    int var_2, var_4, var_6, var_8;
    if (!a->in_window)
        return;
    if (a->flag_3) {                            /* bit3 — got hit */
        if (!a->door_open && a->field_28 >= 4) {
            a->door_open = 1;
            a->set_cycle(3, 4);                 /* open animation */
        }
        a->flag_3 = 0;
        a->field_36 = 0x0F;
    }
    if (a->door_open) {
        if (a->counter_24++ == 0x0A) {
            a->flag_0 = 1;
            return;
        }
    } else
        return;
    var_2 = a->x + random(a->width);
    var_4 = a->y - random(5);
    var_6 = random(0x0C);
    var_8 = random(8) + 6;
    if (random(0x0F) == 0) {
        act = the_cast->add((uchar *)"gem.l", 0, (void far *)do_coin);
        act->flag_7 = 1;
    } else
        act = the_cast->add((uchar *)"coin.l", 0, (void far *)do_coin);
    act->y_speed = -var_8;
    act->set_xy(var_2, var_4);
    act->set_cycle(1, 1);
    switch (random(3)) {
        case 0: act->x_speed = -var_6; break;
        case 1: act->x_speed = 0;     break;
        case 2: act->x_speed =  var_6; break;
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:0F76 — do_coin: a bouncing coin/gem — settles against walls, slows
 *   to a stop, and is collected for points (mid-air catches pay more).
 * ------------------------------------------------------------------------ */
void far do_coin(m_actor far *a)
{
    int var_2;
    if (the_map->tile_attr[a->map_pos - 1].attr < 0x100 ||
        the_map->tile_attr[a->map_pos + 2].attr < 0x100) {
        if (a->x_speed != 0)
            a->x_speed = 0;
        else if (a->y_speed != 1)
            a->y_speed = 1;
    }
    var_2 = a->map_pos + word_2BA88[a->flag_7 ? 0 : 1];
    if (the_map->tile_attr[var_2].attr < 0x100)
        a->y_speed = 0;
    if (!a->in_window)
        return;
    if (a->y_speed == 0 && !a->door_open) {
        a->door_open = 1;
        a->y_speed = 1;
    }
    if (a->y_speed != 0 && a->y_speed != 1)
        a->y_speed++;
    if (a->x_speed != 0) {
        if (a->x_speed > 0)
            a->x_speed--;
        else
            a->x_speed++;
    }
    if (touching(a, cur_sub)) {
        a->flag_0 = 1;
        the_game->play_sound((uchar *)"pup", 9);
        if (a->flag_7)                          /* gem — worth far more */
            var_2 = 0x7D0 << (a->y_speed != 0);
        else
            var_2 = a->y_speed != 0 ? 0x1F4 : 0x64;
        score_at(a->center_x, a->center_y, var_2);
        goodies_found++;
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:113D — do_fish: patrolling fish — reverses (and swaps l/r sprite)
 *   on wall contact or when its pace timer expires.
 * ------------------------------------------------------------------------ */
void far do_fish(m_actor far *a)
{
    if (a->tile_collision(0, 0, 0) == 0) {
        if (a->counter_24++ == a->counter_26)
            a->counter_24 = 0;
        else
            return;
    }
    if (a->direction == 1)
        a->new_loop(a->health == 1 ? (uchar *)"fish1r.l" : (uchar *)"fish2r.l");
    else
        a->new_loop(a->health == 1 ? (uchar *)"fish1l.l" : (uchar *)"fish2l.l");
    a->direction ^= 1;
    a->x_speed = -a->x_speed;
}

/* --------------------------------------------------------------------------
 * seg0b2c:11E5 — do_switch: a wall switch — once hit, latches open its linked
 *   door(s) and becomes inactive.
 * ------------------------------------------------------------------------ */
void far do_switch(m_actor far *a)
{
    if (a->inactive)                                /* bit5 — already thrown */
        return;
    if (!a->flag_3)                                 /* bit3 — not hit yet */
        return;
    a->current_loop = 0;
    a->target->door_open = 1;
    a->flag_3 = 0;
    a->inactive = 1;
    if (a->linked)
        a->linked->door_open = 1;
}

/* --------------------------------------------------------------------------
 * seg0b2c:1249 — do_door: a door — when told to open, plays its sound and
 *   starts the open animation once.
 * ------------------------------------------------------------------------ */
void far do_door(m_actor far *a)
{
    if (a->door_open == 1 && a->frame == 0) {
        the_game->play_sound((uchar *)"door", 6);
        a->set_cycle(4, 2);
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:1295 — do_duct_lr: a horizontal vent — pushes the sub left/right
 *   while it overlaps vertically and is within range.
 * ------------------------------------------------------------------------ */
void far do_duct_lr(m_actor far *a)
{
    int var_2;
    if (!a->in_window)
        return;
    if (cur_sub->state == 6)
        return;
    if (cur_sub->old_y > a->y + 0x2B || cur_sub->y < a->y)
        return;
    diff_x = abs(a->center_x - cur_sub->center_x);
    if (diff_x >= 0x46)
        return;
    if (diff_x > 0x32)
        var_2 = 2;
    else if (diff_x > 0x14)
        var_2 = 3;
    else
        var_2 = 5;
    if (a->direction == 1) {
        cur_sub->x_speed -= var_2;
        if (cur_sub->x_speed < -8)
            cur_sub->x_speed = -8;
    } else {
        cur_sub->x_speed += var_2;
        if (cur_sub->x_speed > 8)
            cur_sub->x_speed = 8;
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:1375 — do_duct_ud: a vertical vent — pushes the sub up/down while
 *   it overlaps horizontally and is within range.
 * ------------------------------------------------------------------------ */
void far do_duct_ud(m_actor far *a)
{
    int var_2;
    if (!a->in_window)
        return;
    if (cur_sub->state == 6)
        return;
    diff_y = abs(a->center_y - cur_sub->center_y);
    if (cur_sub->center_x < a->x || cur_sub->center_x > a->x + 0x38)
        return;
    if (diff_y >= 0x2D)
        return;
    if (diff_y > 0x0F && abs(cur_sub->x_speed) >= 4)
        return;
    var_2 = 3;
    if (a->direction == 2) {
        cur_sub->y_speed -= var_2;
        if (cur_sub->y_speed < -6)
            cur_sub->y_speed = -6;
    } else {
        cur_sub->y_speed += var_2;
        if (cur_sub->y_speed > 6)
            cur_sub->y_speed = 6;
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:1452 — do_barrel: an explosive barrel — when destroyed it blows up
 *   and drops the item it was holding.
 * ------------------------------------------------------------------------ */
void far do_barrel(m_actor far *a)
{
    if (check_for_hit(a, 2) == 2) {
        add_explosion(a->x, a->y, 2, (uchar *)0);
        add_map_item(a->map_pos, a->counter_24);
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:149B — do_pup: a power-up — activates on sight, drifts down, and on
 *   pickup applies its effect (switch on the pup type 1..9).
 * ------------------------------------------------------------------------ */
void far do_pup(m_actor far *a)
{
    int var_2;
    if (a->in_window == 1 && a->inactive == 1) {
        a->inactive = 0;
        a->y_speed = -1;
    }
    if (a->inactive == 1)
        return;
    if (a->y_speed != 0) {
        if (a->on_tile(0x100) != 0)
            a->y_speed = 0;
        else if (a->tile_collision(0, 0, 0) != 0)
            a->y_speed = 0;
    }
    if (!touching(a, ego))
        return;
    switch (a->counter_24 - 1) {                    /* pup kind 1..9 */
        case 0: update_air_guage(0x50, 0x68, 0xA7); break;
        case 1: if (shot_size < 3) shot_size++; post_message(3); break;
        case 2: update_shld_guage(0x28, 0x68, 0xB3);
                if (shot_size != 0 && heavy_timer == 0) shot_size--; break;
        case 3: top_fire = 1; break;
        case 4: men++; auto_fire = 0; jason_fire = 0;
                the_game->field_08 = 1; update_men(); break;
        case 5: got_key++; break;
        case 6: post_message(4); auto_fire = 1; break;
        case 7: add_jason(); break;
        case 8: jason_fire = 1; break;
    }
    if (a->counter_24 == 6) {                       /* the key */
        var_2 = 0x3E8;
        the_game->play_sound((uchar *)"pup2", 0x0E);
        update_key_guage();
        post_message(1);
    } else {
        var_2 = 0x1F4;
    }
    if (a->y_speed != 0) {
        the_game->play_sound((uchar *)"pup2", 0x0A);
        var_2 *= 2;                                 /* caught mid-air — double */
    } else {
        the_game->play_sound((uchar *)"pup", 9);
    }
    score_at(a->center_x, a->center_y, var_2);
    a->flag_0 = 1;
    goodies_found++;
}

/* --------------------------------------------------------------------------
 * seg0b2c:16AF — do_exp: an explosion sprite — dies the moment it scrolls off.
 * ------------------------------------------------------------------------ */
void far do_exp(m_actor far *a)
{
    if (!a->in_window)
        a->flag_0 = 1;
}

/* --------------------------------------------------------------------------
 * seg0b2c:16CC — do_bubble: an exhaled bubble — drifts up, decays its wobble,
 *   and pops after 0x14 frames, on leaving the window, or inside solid rock.
 * ------------------------------------------------------------------------ */
void far do_bubble(m_actor far *a)
{
    if (a->counter_24++ == 0x14) {
        a->flag_0 = 1;
        return;
    }
    if (a->x_speed != 0) {
        if (a->x_speed > 0)
            a->x_speed--;
        else
            a->x_speed++;
    }
    if (!a->in_window) {
        a->flag_0 = 1;
        return;
    }
    if (the_map->tile_attr[a->map_pos].attr == 0x100)
        a->flag_0 = 1;
}

/* --------------------------------------------------------------------------
 * seg0b2c:097C — do_probe: the "Jason" probe escort — chases the sub while
 *   jason_on; spins into a drill attack (state 4); drifts & bubbles otherwise.
 * ------------------------------------------------------------------------ */
void far do_probe(m_actor far *a)
{
    int var_2, var_4;

    if (a->y_speed < 0 && a->on_tile(0x100))
        a->y_speed = 0;

    if (jason_on != 1) {
        if (a->state == 4) {
            /* spinning drill attack — jitter about until the timer dies */
            if (--a->counter_24 == 0)
                goto turn;
            a->x_speed = random(5) - 2;
            a->y_speed = random(3) - 1;
            if ((a->x & 2) == 2)
                add_bubble(a->center_x, a->center_y, 0);
            return;
        }
        if (a->flag_7 && a->in_window) {
            if (a->state == 0 && random(7) == 0) {
                a->new_loop((uchar *)"probspin.l");
                a->set_cycle(1, 1);
                a->state = 4;
                a->counter_24 = random(0x14) + 0x14;
                the_game->play_sound((uchar *)"drillhi", 0x0B);
                return;
            }
            a->flag_7 = 0;
        }
        /* home in on the sub */
        diff_x = abs(ego->center_x - a->center_x);
        diff_y = abs(ego->center_y - a->center_y);
        if (diff_y > 0x0A) {
            var_4 = 0x0A;
            a->y_speed = (a->center_y < ego->center_y) ? 3 : -3;
        } else {
            var_4 = 0x19;
            a->y_speed = 0;
        }
        if (diff_x > var_4)
            a->x_speed = (a->center_x < ego->center_x) ? 4 : -4;
        else
            a->x_speed = 0;
        /* face the same way it's travelling relative to the sub */
        if (a->direction != ego->direction) {
            if ((ego->direction == 0 && a->center_x >= ego->center_x) ||
                (ego->direction == 1 && a->center_x <= ego->center_x))
                goto turn;
        } else {
            if ((ego->direction == 0 && a->center_x <= ego->center_x) ||
                (ego->direction == 1 && a->center_x >= ego->center_x))
                goto turn;
        }
        return;
    }

    /* jason_on == 1 — player-controlled: passive drift, input drives speed */
    if (a->state != 0)
        goto turn;
    if (a->flag_3) {
        ego->flag_3 = 1;
        ego->field_1E = 0;
        ego->field_28 = a->field_28;
        a->flag_3 = 0;
        a->field_28 = 0;
        a->field_36 = 0x20;
        if (a->field_1E != 0) {
            a->x_speed += a->field_1E;
            a->field_1E = 0;
        }
    }
    if (a->cycle_speed == 0 && random(4) == 0) {
        var_2 = a->y + random(3) + 4;
        if (a->direction == 0)
            add_bubble(a->x, var_2, -4);
        else
            add_bubble(a->x + a->width, var_2, 4);
    }
    return;

turn:
    a->state = 0;
    a->new_loop(a->direction ? (uchar *)"prober.l" : (uchar *)"probel.l");
    a->direction ^= 1;
}

/* --------------------------------------------------------------------------
 * seg0b2c:0CFE — do_gun_piece: a collectable gun part — 2000 pts; after the
 *   4th piece the heavy shot unlocks.
 * ------------------------------------------------------------------------ */
void far do_gun_piece(m_actor far *a)
{
    if (!a->in_window)
        return;
    if (touching(a, ego)) {
        a->flag_0 = 1;
        score_at(a->x, a->y, 0x7D0);
        gun_count++;
        goodies_found++;
        update_gun();
        the_game->field_09 = 1;
        the_game->play_sound((uchar *)"pup2", 9);
        if (gun_count == 4) {
            shot_size = 4;
            heavy_timer = 0x32;
        }
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:1749 — do_follow: homing chase — ray-casts ahead of the actor and
 *   steers toward the sub; returns 1 when it closes within horizontal range.
 * ------------------------------------------------------------------------ */
byte far do_follow(m_actor far *a, int arg_4, int arg_6)
{
    byte var_1, var_2;

    diff_x = abs(cur_sub->center_x - a->center_x);
    diff_y = abs(cur_sub->center_y - a->center_y);
    var_1 = check_horizontal_ray(a, diff_x >> 3);
    var_2 = check_vertical_ray(a, diff_y >> 3);
    if (var_2 != 0) {
        a->x_speed = 0;
        if (diff_y <= 0x0A)
            goto chase_x;
        a->y_speed = (cur_sub->center_y < a->center_y) ? -arg_4 : arg_4;
        return 0;
    }
    if (var_1 != 0)
        goto chase_x;
    if (var_2 != 0 || var_1 == 0) {
        a->y_speed = 0;
        a->x_speed = 0;
        return 0;
    }
    a->y_speed = 0;
    a->x_speed = (cur_sub->center_x < a->center_x) ? -arg_6 : arg_6;
    return 0;
chase_x:
    a->y_speed = 0;
    a->x_speed = (cur_sub->center_x < a->center_x) ? -(arg_6 - 1) : (arg_6 - 1);
    return 1;
}

/* --------------------------------------------------------------------------
 * seg0b2c:1881 — do_ship: a surface patrol ship — cruises, occasionally drops
 *   a bomb or fires a missile when the sub passes beneath; on a hit it either
 *   dumps a bomb and flees, or explodes for 3000 pts.
 * ------------------------------------------------------------------------ */
void far do_ship(m_actor far *a)
{
    byte hit;

    if (a->counter_24 == 0) {
        a->counter_24 = 0x2D;
        goto bomb;
    }
    a->counter_24--;
    if (a->door_open == 1)          /* turn-back requested — spin around */
        goto turn;
    if (random(0x1E) == 0)
        goto turn;
    diff_y = abs(cur_sub->center_y - a->old_y);
    if (diff_y < 0x0A) {
        if (a->facing_actor(cur_sub)) {
            if (random(0x0A) == 0)
                add_missile(a, 2, 0);
        } else if (random(0x0A) == 0) {
            goto turn;
        }
    }
    if (a->in_window) {
        hit = check_for_hit(a, 0x14);
        if (hit == 1 && random(6) == 0)
            goto bomb;
        if (hit == 2) {
            add_explosion(a->center_x, a->center_y, 2, (uchar far *)NULL);
            score_at(a->center_x, a->center_y, 0xBB8);
        }
    }
    return;

turn:
    a->new_loop(a->direction == 1 ? (uchar *)"shipr.l" : (uchar *)"shipl.l");
    a->x_speed = -a->x_speed;
    a->direction ^= 1;
    a->door_open = 0;
    return;

bomb:
    act = the_cast->add((uchar *)"shpbmb.l", (void far *)0, (void far *)do_ship_bomb);
    act->y_speed = 3;
    act->set_xy(a->center_x, a->old_y);
}

/* --------------------------------------------------------------------------
 * seg0b2c:1A3C — do_ship_bomb: a depth-charge — sinks until it grounds or hits
 *   the sub; leaves a trail of bubbles while in window.
 * ------------------------------------------------------------------------ */
void far do_ship_bomb(m_actor far *a)
{
    if (the_map->tile_attr[a->map_pos].attr >= 0x100) {
        if (a->in_window) {
            if (touching(a, cur_sub)) {
                hit_cur_sub(6, 0);
                goto boom;
            }
            if (random(6) == 0)
                add_bubble(a->center_x, a->y, 0);
        }
        return;
    }
boom:
    if (a->in_window)
        add_explosion(a->x, a->y, 1, (uchar far *)NULL);
    a->flag_0 = 1;
}

/* --------------------------------------------------------------------------
 * seg0b2c:1AF5 — do_cannon: a wall gun — tracks the sub, fires a missile when
 *   the sub crosses its row; 1000 pts when destroyed.
 * ------------------------------------------------------------------------ */
void far do_cannon(m_actor far *a)
{
    if (!a->in_window)
        return;
    if (!a->facing_actor(cur_sub)) {
        a->new_loop(a->direction == 1 ? (uchar *)"cannonr.l" : (uchar *)"cannonl.l");
        a->direction ^= 1;
    }
    if (a->counter_24 != 0) {
        if (a->counter_24-- == 8)
            add_missile(a, 0x0A, 5);
    } else {
        diff_y = abs(cur_sub->center_y - a->center_y);
        if (diff_y < 0x0A) {
            a->set_cycle(2, 3);
            a->counter_24 = random(5) + 0x0A;
        }
    }
    if (check_for_hit(a, 0x0A) == 2) {
        add_explosion(a->center_x, a->y, 2, (uchar far *)NULL);
        score_at(a->center_x, a->y, 0x3E8);
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:1C0D — do_clam: a giant clam — snaps shut when the sub swims over
 *   the mouth, holds it (draining via field_0E), then releases a gem on death.
 * ------------------------------------------------------------------------ */
void far do_clam(m_actor far *a)
{
    if (!a->in_window)
        return;
    if (a->counter_26 != 0) {
        a->counter_26--;
        return;
    }
    if (check_for_hit(a, 6) == 2) {
        /* destroyed — pop open and release the gem */
        a->flag_0 = 0;
        a->type = 0;
        a->update_func = (actfn_t)0;
        a->set_cycle(0, 4);
        add_explosion(a->center_x, a->y, 1, (uchar far *)NULL);
        add_bubble(a->center_x, a->y, 0);
        act = the_cast->add((uchar *)"gem.l", (void far *)0, (void far *)do_coin);
        act->flag_7 = 1;
        act->y_speed = -8;
        act->set_xy(a->center_x, a->y);
        act->set_cycle(1, 1);
    }
    /* idle / grab logic */
    diff_x = abs(cur_sub->center_x - a->center_x);
    diff_y = abs(cur_sub->center_y - a->center_y);
    if (a->door_open == 1) {                /* sub is inside — holding it */
        if (a->flag_7 == 1) {               /* counting down to release */
            if (--a->counter_24 == 0) {
                a->set_cycle(1, 3);            /* open */
                a->flag_7 = 0;
                a->door_open = 0;
                a->counter_26 = 0x28;
                the_game->field_0E = 0;
                cur_sub->y_speed = -4;
            } else {
                cur_sub->y_speed = 0;          /* held fast */
                cur_sub->x_speed = 0;
            }
        } else {
            /* closed — keep it latched while the sub struggles */
            if (abs(cur_sub->center_y - a->y) < 8) {
                the_game->play_sound((uchar *)"dirhit", 6);
                the_game->field_0E = 1;
                hit_cur_sub(4, 0);
                a->flag_7 = 1;
                a->counter_24 = 0x3C;
                a->set_cycle(1, 5);
            } else {
                cur_sub->y_speed += 4;
            }
        }
        return;
    }
    /* mouth open — snap when the sub is above and inside the mouth span */
    if (cur_sub->center_y < a->center_y &&
        jason_on == 0 &&
        diff_y < 0x32 &&
        cur_sub->center_x >= a->x &&
        cur_sub->center_x < a->old_x) {
        the_game->play_sound((uchar *)"swish", 6);
        a->set_cycle(1, 4);
        a->door_open = 1;
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:1EBF — do_shuttle: a patrol shuttle — sleeps until first seen, then
 *   chases the sub with do_follow and fires when close; turns around when the
 *   sub slips behind; 2000 pts on destruction.
 * ------------------------------------------------------------------------ */
void far do_shuttle(m_actor far *a)
{
    byte hit;

    if (!a->in_window && !a->flag_7)
        return;
    a->flag_7 = 1;                          /* once woken, stays awake */
    if (a->counter_24 != 0)
        a->counter_24--;
    if (a->door_open != 0) {
        /* sub slipped behind — flip and pause */
        a->new_loop(a->direction == 1 ? (uchar *)"shutl_r.l" : (uchar *)"shutl_l.l");
        a->direction ^= 1;
        a->door_open = 0;
        a->counter_24 = 0x0A;
        return;
    }
    if (!a->facing_actor(cur_sub))
        a->door_open = 1;
    hit = check_for_hit(a, 0x19);
    if (hit == 2) {
        add_explosion(a->center_x, a->center_y, 2, (uchar far *)NULL);
        score_at(a->x, a->y, 0x7D0);
    }
    if (do_follow(a, 2, 4)) {
        if (diff_y < 0x0F && random(0x0C) == 0)
            add_missile(a, 1, 0);
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:2001 — do_fire_ball: a lava-pit fireball — arcs for counter_24
 *   frames, swapping to the "down" sprite at the apex, then dies on the sub.
 * ------------------------------------------------------------------------ */
void far do_fire_ball(m_actor far *a)
{
    if (a->y_speed++ == a->counter_24)
        a->flag_0 = 1;
    if (a->y_speed == 1)
        a->new_loop((uchar *)"firbaldn.l");
    if (a->in_window) {
        if (random(0x0A) == 0)
            add_bubble(a->center_x, a->center_y, 0);
        if (touching(a, cur_sub)) {
            a->flag_0 = 1;
            hit_cur_sub(0x0F, 2);
            add_explosion(a->x, a->y, 1, (uchar far *)NULL);
        }
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:20BA — do_fire_pit: a lava vent — every counter_26 frames launches
 *   a firbalup.l fireball with a random negative arc.
 * ------------------------------------------------------------------------ */
void far do_fire_pit(m_actor far *a)
{
    int var_2;

    if (a->counter_24++ != a->counter_26)
        return;
    a->counter_24 = random(5);
    if (a->in_window)
        the_game->play_sound((uchar *)"fire1", 5);
    act = the_cast->add((uchar *)"firbalup.l", (void far *)0, (void far *)do_fire_ball);
    act->set_xy(a->x + 0x0F, a->y);
    act->set_cycle(1, 1);
    var_2 = random(5) + 0x0C;
    act->y_speed = -var_2;
    act->counter_24 = var_2 - 2;
}

/* --------------------------------------------------------------------------
 * seg0b2c:2190 — do_spikes: extending/retracting floor spikes — deadly while
 *   extended (frame), cycles extend→hold→retract on the animation loop.
 * ------------------------------------------------------------------------ */
void far do_spikes(m_actor far *a)
{
    if (!a->in_window)
        return;
    if (a->frame != 0) {
        /* extended — deadly to touch */
        if (a->door_open == 0 && touching(a, cur_sub)) {
            a->door_open = 1;
            hit_cur_sub(0x0A, 0);
        }
        return;
    }
    /* cycling — extend, hold, retract */
    if (a->current_loop == a->num_frames - 1) {
        if (a->counter_24 != 0) {
            a->counter_24--;
        } else {
            a->door_open = 0;
            a->set_cycle(2, 5);
        }
    } else if (a->current_loop == 0) {
        a->counter_24 = a->counter_26;
        a->set_cycle(2, 4);
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:2265 — do_tentacle: a lurking floor tentacle — hidden (state 0)
 *   until its timer pops it out (tent_out); a touch kills the sub outright;
 *   flag_3 retracts it back in for 0x64 frames.
 * ------------------------------------------------------------------------ */
void far do_tentacle(m_actor far *a)
{
    if (!a->in_window)
        return;
    if (a->state == 0) {
        if (--a->counter_24 == 0) {
            a->state = 5;
            a->flag_3 = 0;
            a->new_loop((uchar *)"tent_out.l");
            a->set_cycle(4, 4);
        }
        return;
    }
    if (touching(a, ego)) {
        a->flag_0 = 1;
        death_type = 1;
        kill_ego(a->x, a->y);
    }
    if (a->flag_3) {
        a->new_loop((uchar *)"tent_in.l");
        a->set_cycle(1, 4);
        a->flag_3 = 0;
        a->field_36 = 0x0F;
        a->state = 0;
        a->counter_24 = 0x64;
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:2359 — do_shark: a shark — swims back and forth; when it spots the
 *   sub in line it lunges (10x speed) and bites; flees on a graze; 3000 pts.
 * ------------------------------------------------------------------------ */
void far do_shark(m_actor far *a)
{
    byte hit;

    if (a->state == 2) {
        check_flying_death(a);
        return;
    }
    if (!a->in_window && !a->door_open)
        return;
    if (!a->door_open) {                    /* first sight — wake & swim */
        a->door_open = 1;
        a->set_cycle(8, 1);
        a->x_speed = (a->direction == 1) ? -1 : 1;
    }
    if (a->flag_7 == 1) {                    /* in a lunge */
        if (a->counter_24 != 0) {
            if (a->counter_26 != 0) {
                a->counter_26--;
            } else if (touching(a, cur_sub)) {
                the_game->play_sound((uchar *)"pirana", 8);
                hit_cur_sub(0x0F, a->x_speed / 2);
                a->counter_26 = 3;
            }
            if (--a->counter_24 == 1)
                goto end_lunge;
            goto check_hit;
        }
        /* cruising — lunge when lined up with the sub */
        if (a->facing_actor(cur_sub) &&
            (diff_y = abs(a->center_y - cur_sub->center_y)) < 0x1E)
            goto lunge;
        if (random(0x64) == 0)
            goto turn;
        goto check_hit;
    }
    goto turn;
lunge:
    a->x_speed *= 0x0A;
    a->counter_24 = 0x19;
    a->set_cycle(1, 1);
    return;
end_lunge:
    a->x_speed /= 0x0A;
    a->set_cycle(0x0A, 1);
    return;
turn:
    a->new_loop(a->direction == 1 ? (uchar *)"sharkr.l" : (uchar *)"sharkl.l");
    a->direction ^= 1;
    a->x_speed = -a->x_speed;
    a->flag_7 = 0;
    return;
check_hit:
    hit = check_for_hit(a, 0x16);
    if (hit == 0)
        return;
    if (hit == 1) {
        if (a->facing_actor(cur_sub) && random(4 - shot_size) == 0)
            goto turn;
        return;
    }
    if (hit == 2) {
        score_at(a->center_x, a->center_y, 0xBB8);
        set_flying_death(a, (uchar far *)"sharkdie.l", 2, -9, 4);
        the_game->play_sound((uchar *)"pirana", 8);
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:25F9 — do_jelly: a jellyfish — pulses up until it nears a ceiling,
 *   sinks to the floor, then rises again; stings the sub; 500 pts.
 * ------------------------------------------------------------------------ */
void far do_jelly(m_actor far *a)
{
    byte hit;
    int var_2;

    if (a->state == 0) {                    /* rising */
        if (a->y_speed != 0)
            a->y_speed++;
        if (a->current_loop == 0) {
            a->y_speed = -2;
            a->counter_26++;
        }
        if (random(0x12C) == 0)
            goto sink;
        var_2 = a->map_pos + 1 - word_2BA88[0];
        if (the_map->tile_attr[var_2].attr > 0x100)
            goto common;
        goto sink;
    }
    /* state 3 — sinking */
    if (a->current_loop == 1)
        a->set_cycle(0, 0);
    var_2 = a->map_pos + tbl_mul_tw[a->field_1C] + 1;
    if (the_map->tile_attr[var_2].attr < 0x100)
        goto floor;
    if (random(0x12C) == 0)
        goto floor;
common:
    if (a->in_window) {
        if (a->counter_24 != 0) {
            a->counter_24--;
        } else if (touching(a, cur_sub)) {
            a->counter_24 = 0x0A;
            hit_cur_sub(0x0A, 0);
        }
        hit = check_for_hit(a, 2);
        if (hit != 0) {
            if (hit == 2) {
                score_at(a->center_x, a->center_y, 0x1F4);
                enemies_killed++;
            } else if (a->state == 3) {
                goto floor;
            }
        }
    }
    return;
sink:
    a->state = 3;
    a->y_speed = 1;
    return;
floor:
    a->state = 0;
    a->y_speed = 0;
    a->set_cycle(random(2) + 4, 1);
}

/* --------------------------------------------------------------------------
 * seg0b2c:27CA — do_crab: a floor crab — scuttles, reversing at edges/randomly,
 *   and spits a missile at the sub when it swims into range; 1000 pts.
 * ------------------------------------------------------------------------ */
void far do_crab(m_actor far *a)
{
    if (a->state == 2) {
        check_flying_death(a);
        return;
    }
    if (!a->in_window)
        return;
    if (a->door_open) {                     /* bumped an edge — reverse */
        a->x_speed = -a->x_speed;
        a->door_open = 0;
    }
    if (random(0x3C) == 0)
        a->x_speed = -a->x_speed;
    if (a->counter_24 != 0) {
        a->counter_24--;
    } else {
        diff_y = abs(a->center_y - cur_sub->center_y);
        if (diff_y < 0x41) {
            a->direction = (a->x < cur_sub->x) ? 0 : 1;
            add_missile(a, 9, 1);
            a->counter_24 = 0x19;
            return;
        }
    }
    if (check_for_hit(a, 4) == 2) {
        score_at(a->center_x, a->center_y, 0x3E8);
        set_flying_death(a, (uchar far *)"crabdie.l", 6, -6, 4);
        the_game->play_sound((uchar *)"pirana", 8);
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:290F — do_serpent: a sea serpent — paces, and spits a missile at
 *   the sub when it's level and in front; turns at edges; 500 pts.
 * ------------------------------------------------------------------------ */
void far do_serpent(m_actor far *a)
{
    if (a->state == 2) {
        check_flying_death(a);
        return;
    }
    if (!a->in_window)
        return;
    if (a->door_open) {                     /* reached an edge — turn around */
        a->new_loop(a->direction == 0 ? (uchar *)"serp_l.l" : (uchar *)"serp_r.l");
        a->door_open = 0;
        a->direction ^= 1;
        a->x_speed = -a->x_speed;
        return;
    }
    if (a->counter_24 != 0) {
        a->counter_24--;
    } else {
        diff_y = abs(a->center_y - cur_sub->center_y);
        if (diff_y < 0x1E && a->facing_actor(cur_sub)) {
            add_missile(a, 7, 4);
            a->counter_24 = 0x0F;
            return;
        }
    }
    if (check_for_hit(a, 3) == 2) {
        score_at(a->center_x, a->center_y, 0x1F4);
        set_flying_death(a, (uchar far *)"serpdie.l", 2, -8, 1);
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:2A48 — do_face: a wall-mounted face turret — opens its mouth and
 *   spits a missile when the sub is level & in front; 1000 pts.
 * ------------------------------------------------------------------------ */
void far do_face(m_actor far *a)
{
    int var_2;

    if (!a->in_window)
        return;
    if (a->flag_3) {                        /* took a hit */
        if (a->field_28 >= 0x0A) {
            score_at(a->center_x, a->center_y, 0x3E8);
            add_explosion(a->center_x, a->center_y, 2, (uchar far *)NULL);
            a->flag_0 = 1;
            enemies_killed++;
        }
        a->flag_3 = 0;
        a->field_36 = 0x0F;
    }
    if (a->counter_24 != 0) {
        a->counter_24--;
        if (!a->door_open && a->current_loop == 1) {
            add_missile(a, 8, 0x0C);
            a->door_open = 1;
        }
        return;
    }
    var_2 = abs(a->center_y - cur_sub->center_y);
    if (var_2 < 0x23 && a->facing_actor(cur_sub)) {
        a->door_open = 0;
        a->counter_24 = 0x19;
        a->set_cycle(4, 3);
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:2B75 — do_pirana: a piranha — hides off-screen; once the sub nears
 *   it darts (2x speed) and tracks vertically, biting on contact; 100 pts.
 * ------------------------------------------------------------------------ */
void far do_pirana(m_actor far *a)
{
    byte hit;

    if (!a->in_window) {
        if (a->counter_24 != 0)
            goto reset;                     /* darted off-screen — reset */
        if (a->flag_7 != 1)
            return;                          /* hidden & not yet woken */
    }
    a->flag_7 = 1;                           /* awake */
    if (a->door_open == 1) {
        a->door_open = 0;
        a->new_loop(a->direction == 1 ? (uchar *)"piranar.l" : (uchar *)"piranal.l");
        a->x_speed = -a->x_speed;
        a->direction ^= 1;
    }
    hit = check_for_hit(a, 7);
    if (hit != 0) {
        if (hit == 1 && a->counter_26 == 0)
            goto dart;
        if (hit == 2)
            enemies_killed++;
        score_at(a->center_x, a->center_y, 0x64);
    }
    if (a->counter_26 != 0)
        goto track;
    /* idle — pounce when the sub swims close */
    diff_x = abs(a->center_x - ego->center_x);
    diff_y = abs(a->center_y - ego->center_y);
    if (diff_x < 0x32 && diff_y < 0x1E)
        goto dart;
    return;
dart:
    a->counter_26 = 0x1E;
    a->x_speed *= 2;
track:
    if (a->counter_26-- == 1)
        goto reset;
    if (!a->facing_actor(cur_sub))
        a->door_open = 1;
    if (a->y < cur_sub->center_y) {
        if (a->y_speed != 2)
            a->y_speed = 2;
    } else if (a->y > cur_sub->center_y) {
        if (a->y_speed != -2)
            a->y_speed = -2;
    }
    if ((a->counter_26 & 3) == 0 && touching(a, cur_sub))
        goto bite;
    return;
reset:
    a->counter_26 = 0;
    a->y_speed = 0;
    a->x_speed = (a->direction == 0) ? 1 : -1;
    return;
bite:
    the_game->play_sound((uchar *)"pirana", 8);
    hit_cur_sub(2, 0);
}

/* --------------------------------------------------------------------------
 * seg0b2c:2DB8 — do_tulip: a carnivorous flower — stays closed (regenerating
 *   health), opens to track the sub, spits; killed at 5 hits, closes at 3.
 * ------------------------------------------------------------------------ */
void far do_tulip(m_actor far *a)
{
    if (!a->in_window)
        return;
    if (a->door_open == 0) {
        if (a->health != 0) {               /* closed — count down to reopen */
            if (a->frame == 0)
                a->health--;
            return;
        }
        a->door_open = 1;                    /* begin opening */
        a->set_cycle(3, 4);
        return;
    }
    if (a->flag_7 == 0) {
        /* opening anim — armed once it reaches the last frame */
        if (a->current_loop == a->num_frames - 1) {
            a->flag_7 = 1;
            a->direction = 0x63;             /* "not yet facing" sentinel */
        }
        goto hits;
    }
    /* open & tracking — face the sub */
    if (cur_sub->x < a->x && a->direction != 1) {
        a->type = 1;
        a->direction = 1;
        a->new_loop((uchar *)"tulipl.l");
        goto fire;
    }
    if (cur_sub->x > a->x && a->direction != 0) {
        a->type = 1;
        a->direction = 0;
        a->new_loop((uchar *)"tulipr.l");
        goto fire;
    }
    if (a->counter_24++ == a->counter_26)
        goto fire;
    goto hits;
fire:
    a->counter_24 = 0;
    add_missile(a, 6, 6);
    a->set_cycle(0, 3);
    return;
hits:
    if (a->flag_3) {
        a->flag_3 = 0;
        a->field_36 = 0x0F;
        if (a->field_28 >= 3) {
            score_at(a->center_x, a->center_y, 0x1F4);
            if (a->field_28 >= 5) {
                a->flag_0 = 1;
                enemies_killed++;
            } else {
                a->field_28 = 0;
                a->new_loop((uchar *)"tulip.l");
                a->set_cycle(1, 5);
                a->type = 0;
                a->health = 0x64;
                a->flag_7 = 0;
                a->door_open = 0;
            }
        }
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:2FC2 — do_pod: a homing mine — drops until it lands (flag_7), then
 *   actively steers toward the sub at speed health+1; detonates on contact.
 * ------------------------------------------------------------------------ */
void far do_pod(m_actor far *a)
{
    byte var_1;

    if (a->flag_7 != 1) {
        /* falling — settle once it grounds */
        if (a->on_tile(0x100))
            a->y_speed -= a->y_speed;
        if (a->counter_26++ < 0x0A) {
            if (a->door_open == 1) {
                a->x_speed = -a->x_speed;
                if (random(2) == 0)
                    a->y_speed = 0;
                a->door_open = 0;
                a->counter_26 = random(5);
            }
            goto hitblock;
        }
        a->flag_7 = 1;                        /* settled — start homing */
    }
    if (!a->in_window)
        return;
    a->flag_7 = 1;
    /* steer toward the sub */
    diff_x = abs(a->center_x - cur_sub->center_x);
    diff_y = abs(a->center_y - cur_sub->center_y);
    a->counter_26 = random(5);
    if (diff_y < 0x0F && diff_x < 0x5A && a->x_speed != 0) {
        a->y_speed = 0;
    } else {
        a->y_speed = (cur_sub->center_y < a->center_y)
                        ? -(a->health + 1) : (a->health + 1);
    }
    if (diff_x < 0x1E && diff_y < 0x3C && a->y_speed != 0) {
        a->x_speed = 0;
    } else {
        a->x_speed = (cur_sub->center_x < a->center_x)
                        ? -(a->health + 1) : (a->health + 1);
    }
    return;
hitblock:
    if (a->in_window) {
        var_1 = (a->health != 0) ? 4 : 2;
        if (check_for_hit(a, var_1) == 2) {
            score_at(a->center_x, a->center_y, 0x1F4);
            goto die;
        }
        if (touching(a, cur_sub)) {
            hit_cur_sub(0x19, a->x_speed);
            goto die;
        }
    }
    return;
die:
    a->flag_0 = 1;
    add_explosion(a->x, a->y, 1, (uchar far *)NULL);
    enemies_killed++;
}

/* --------------------------------------------------------------------------
 * seg0b2c:320C — do_zapper: an arc emitter — pulses its zap sprite on a timer;
 *   while the arc frame is live it shocks the sub on contact.
 * ------------------------------------------------------------------------ */
void far do_zapper(m_actor far *a)
{
    if (a->counter_24++ == a->counter_26) {
        a->counter_24 = 0;
        a->set_cycle(0, 3);
    }
    if (a->in_window && a->frame != 0) {
        if (a->counter_24 == 2)
            the_game->play_sound((uchar *)"zap", 8);
        if (touching(a, cur_sub))
            hit_cur_sub(8, 0);
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:32A1 — do_mine1: a moored mine — when the sub swims below it (or
 *   bumps it) it releases a "freemine" floater and a "mreal" mooring sprite.
 * ------------------------------------------------------------------------ */
void far do_mine1(m_actor far *a)
{
    byte var_1;
    int var_4;

    if (!a->in_window)
        return;
    if (a->flag_3 == 0) {
        if (a->current_loop != 2) {
            var_4 = abs(a->center_x - cur_sub->center_x);
            if (var_4 < 0x23 && ego->y < a->y)
                goto release;
        }
        if (touching(a, cur_sub)) {
            hit_cur_sub(2, 0);
            add_bubble(a->x, a->y, 0);
            goto release;
        }
        return;
    }
release:
    act = the_cast->add((uchar *)"freemine.l", (void far *)0, (void far *)do_mine2);
    act->type = 1;
    act->set_xy(a->center_x, a->y);
    var_1 = act->height;
    if (a->door_open == 1)
        act->flag_3 = 1;
    act = the_cast->add((uchar *)"mreal.l", (void far *)0, (void far *)0);
    act->set_xy(a->center_x - act->width / 2, a->y + var_1);
    act->set_cycle(5, 2);
    a->flag_0 = 1;
}

/* --------------------------------------------------------------------------
 * seg0b2c:343F — do_mine2: a released "freemine" — drifts up, detonates on a
 *   wall, the sub ("dirhit"), or a shot; 500 pts.
 * ------------------------------------------------------------------------ */
void far do_mine2(m_actor far *a)
{
    byte var_1 = 0;

    if (!a->in_window)
        goto die;
    if (a->flag_3 == 1) {
        score_at(a->center_x, a->center_y, 0x1F4);
        goto boom;
    }
    if (a->tile_collision(0, 0, 0))
        goto boom;
    if (touching(a, cur_sub)) {
        hit_cur_sub(0x19, 0);
        var_1 = 1;
        goto boom;
    }
    if (a->on_tile(0x100))
        goto boom;
    if (a->y_speed != -5)
        a->y_speed--;
    return;
boom:
    add_explosion(a->x, a->y, 1,
                  var_1 ? (uchar far *)"dirhit" : (uchar far *)NULL);
die:
    a->flag_0 = 1;
}

/* --------------------------------------------------------------------------
 * seg0b2c:352C — do_missle: the player's torpedo — accelerates to terminal
 *   speed, steers (smart/dumb), scans the shootable & barrier lists, and
 *   detonates on impact or leaving the window.
 * ------------------------------------------------------------------------ */
void far do_missle(m_actor far *a)
{
    byte var_1, var_2;

    if (a->in_window == 1) {
        /* accelerate toward terminal speed */
        if (a->direction == 1) {
            if (a->x_speed > -a->counter_26)
                a->x_speed -= 2;
        } else if (a->direction == 0) {
            if (a->x_speed < a->counter_26)
                a->x_speed += 2;
        }
        if (a->state == 3 && a->y_speed != 0x0A)
            a->y_speed++;
        if (a->flag_7 && random(0x0A) == 0)
            add_bubble(a->center_x, a->y, 0);
        var_2 = 0;
        if (a->target->type & 0x10) {           /* smart — strike shootables */
            for (var_1 = 0; var_1 < shootable_count; var_1++) {
                act = shootable_list[var_1];
                if (act->inactive)
                    continue;
                if (!touching(a, act))
                    continue;
                act->flag_3 = 1;
                act->field_28 += a->health;
                act->field_1E = (a->x_speed > 0) ? 5 : -5;
                if (act->type & 0x20) {
                    diff_y = abs(a->y - act->y);
                    if (act->height / 2 > diff_y)
                        act->door_open = 1;
                }
                if (a->health < 0x0A)
                    goto die;
            }
            if (a->direction == 0x63) {           /* top torpedo — sinks */
                if (the_map->tile_attr[a->map_pos].attr == 0x100)
                    goto die;
                if (a->y_speed != -a->counter_26)
                    a->y_speed--;
            }
            goto wallcheck;
        }
        /* dumb shot — steer toward the sub */
        if (smart_missiles == 1 && a->direction != 0x63) {
            if (a->center_y > cur_sub->center_y)
                a->y_speed = -1;
            else if (a->center_y < cur_sub->center_y)
                a->y_speed = 1;
            else
                a->y_speed = 0;
        }
        for (var_1 = 0; var_1 < barrier_count; var_1++) {
            act = barrier_list[var_1];
            if (touching(a, act))
                goto die;
        }
        if (touching(a, cur_sub)) {
            hit_cur_sub(a->health, (a->x_speed > 0) ? 5 : -5);
            var_2++;
            goto die;
        }
wallcheck:
        if (a->health < 0x0A && a->tile_collision(0, 0, 0))
            goto die;
        return;
    }
die:
    a->flag_0 = 1;
    if (a->direction == 0x63)
        top_shot_count--;
    else if (a->target->type & 0x10)
        shot_count--;
    if (a->in_window != 1)
        return;
    if (var_2)
        add_explosion(a->center_x, a->center_y, a->counter_24,
                      (uchar far *)a->field_4E);
    else
        add_explosion(a->center_x, a->center_y, a->counter_24,
                      (uchar far *)NULL);
}

/* --------------------------------------------------------------------------
 * seg0b2c:3D26 — do_bs2tn: boss2 tentacle — 4 hits kill the parent's shield.
 * ------------------------------------------------------------------------ */
void far do_bs2tn(m_actor far *a)
{
    if (check_for_hit(a, 0x14) == 2) {
        score_at(a->center_x, a->center_y, 0xFA0);
        a->target->counter_26++;
        if (a->target->counter_26 == 4)
            a->target->field_28 = 0;
    }
    if (cur_sub->field_36 == 0 && touching(a, cur_sub))
        hit_cur_sub(a->target->x_speed, 1);
}

/* --------------------------------------------------------------------------
 * seg0b2c:3DB9 — do_bs2_eyes: boss2 eye — mirrors parent, randomly blinks.
 * ------------------------------------------------------------------------ */
void far do_bs2_eyes(m_actor far *a)
{
    a->field_36 = a->target->field_36;
    if (a->target->state == 2) {
        a->current_loop = 3;
    } else if (a->health == 0) {
        a->current_loop = random(3);
        a->health = 0x14;
    } else {
        a->health--;
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:46C9 — do_bs3_prop: boss3 propeller — follows parent dir, bubbles.
 * ------------------------------------------------------------------------ */
void far do_bs3_prop(m_actor far *a)
{
    int var_2, var_4;

    if (a->target->state == 2)
        a->flag_0 = 1;
    if (a->target->direction != a->direction) {
        if (a->direction == 0)
            a->new_loop((uchar *)"bs3_prpl.l");
        else
            a->new_loop((uchar *)"bs3_prpr.l");
        a->direction ^= 1;
    }
    if (random(2) == 0) {
        var_2 = a->x;
        var_4 = a->y + random(0x0F);
        if (a->direction == 0)
            add_bubble(var_2, var_4, -8);
        else
            add_bubble(var_2 + a->width, var_4, 8);
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:3E15 — do_bs2: boss2 — swims pacing, drops/turns, fires missiles,
 *   transforms into the dead hulk (state 2) after 4 hits while facing the sub.
 * ------------------------------------------------------------------------ */
void far do_bs2(m_actor far *a)
{
    if (a->state == 2) {
        if (a->y_speed != 0) {
            if (a->tile_collision(0, 0, 0) != 0) {
                a->y_speed = 0;
                a->inactive = 1;
                enemies_killed++;
            }
            if (random(3) == 0)
                add_explosion(a->x + random(a->width), a->y + random(a->height), 1, (uchar far *)0);
        } else {
            if (random(6) == 0)
                add_bubble(a->x + random(a->width), a->y + random(a->height), 0x14);
        }
        return;
    }
    if (a->counter_24 != 0) {
        a->counter_24--;
    } else if (a->door_open) {
        a->counter_24 = random(0x14) + 0x0A;
        a->door_open = 0;
        a->x_speed = -a->x_speed;
        a->direction ^= 1;
    }
    if (a->counter_26 == 4 && a->y_speed != 0) {
        a->y_speed = 0;
        a->flag_3 = 0;
        a->field_28 = 0;
    }
    if (a->facing_actor(cur_sub) == 0)
        a->door_open = 1;
    if (a->counter_26 == 4) {
        if (check_for_hit(a, 0x3C) == 2) {
            a->target->door_open = 1;
            a->flag_0 = 0;
            a->x_speed = 0;
            a->y_speed = 1;
            a->move_func = (movefn_t)0;
            a->state = 2;
            score += 75000;
        }
        if (random(0x1E) == 0)
            add_missile(a, 0x0B, 0x23);
    } else {
        diff_y = abs(a->center_y - cur_sub->center_y);
        if (diff_y < 0x28 && random(0x14) == 0)
            add_missile(a, 0x0B, 0x23);
        a->y_speed = (cur_sub->center_y < a->old_y) ? -1 : 1;
    }
    if (cur_sub->field_36 == 0 && touching(a, cur_sub))
        hit_cur_sub(a->x_speed, 1);
}

/* --------------------------------------------------------------------------
 * seg0b2c:456F — do_bs3a: boss3 appendage — on death frees the parent's latch
 *   and erupts; occasionally primes the parent's fire state.
 * ------------------------------------------------------------------------ */
void far do_bs3a(m_actor far *a)
{
    byte var_1;

    var_1 = check_for_hit(a, 0x28);
    if (var_1 == 2) {
        a->target->target = (m_actor far *)0;
        a->target->flag_3 = 0;
        a->target->field_28 = 0;
        add_explosion(a->x, a->y, 1, (uchar far *)0);
        add_explosion(a->old_x, a->y, 1, (uchar far *)0);
        add_explosion(a->center_x, a->center_y, 2, (uchar far *)0);
    } else if (var_1 == 1 && a->facing_actor(cur_sub) == 0 && random(4) == 0) {
        a->target->door_open = 1;
    }
    if (a->flag_7) {
        if (a->frame == 0)
            a->flag_7 = 0;
    } else if (random(0x0A) == 0 && a->facing_actor(cur_sub) != 0) {
        a->flag_7 = 1;
        a->set_cycle(2, 3);
        add_missile(a, 0x0A, 0x12);
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:4778 — do_bs3_face: boss3 face — mirrors the parent's facing loop.
 * ------------------------------------------------------------------------ */
void far do_bs3_face(m_actor far *a)
{
    if (a->target->state == 2)
        a->flag_0 = 1;
    if (a->target->direction != a->direction) {
        if (a->direction == 0)
            a->new_loop((uchar *)"bs3_facl.l");
        else
            a->new_loop((uchar *)"bs3_facr.l");
        a->direction ^= 1;
    }
}

/* --------------------------------------------------------------------------
 * seg0b2c:3892 — do_bs1: boss1 "grunt" — dormant until in view, then paces and
 *   periodically charges at the sub; state 2 is the sinking dead hulk.
 * ------------------------------------------------------------------------ */
void far do_bs1(m_actor far *a)
{
    if (a->state == 2) {
        if (!a->inactive) {
            if (random(2) == 0)
                add_explosion(a->x + random(a->width), a->y + random(a->height),
                              random(2) == 0 ? 5 : 1, (uchar far *)0);
            if (a->tile_collision(0, 0, 0) != 0) {
                a->target->door_open = 1;
                a->inactive = 1;
                a->y_speed = 0;
            }
        } else if (random(3) == 0) {
            add_bubble(a->x + random(a->width), a->y + random(a->height), 0x14);
        }
        return;
    }
    if (a->x_speed == 0) {
        if (a->in_window != 1)
            return;
        a->x_speed = -1;
        a->set_cycle(8, 9);
        the_game->play_sound((uchar *)"badgrunt", 0x0F);
    }
    if (a->flag_3) {
        a->flag_3 = 0;
        if (a->facing_actor(cur_sub) == 0) {
            a->field_36 = 0x0F;
            if (random(4 - shot_size) == 0)
                a->door_open = 1;
            a->health = a->field_28;
            if (a->field_28 > 0x5A) {
                a->new_loop((uchar *)"bs1dr.l");
                a->set_cycle(0, 0);
                a->state = 2;
                a->x_speed = 0;
                a->y_speed = 1;
                a->move_func = (movefn_t)0;
                a->type = 0;
                score += 50000;
                enemies_killed++;
                return;
            }
        } else {
            a->field_28 = a->health;
            the_game->play_sound((uchar *)"dirhit", 8);
        }
    }
    if (a->counter_24 != 0) {
        a->counter_24--;
    } else if (a->door_open) {
        a->counter_24 = random(0x14) + 0x0A;
        a->door_open = 0;
        a->x_speed = -a->x_speed;
        if (a->direction == 1)
            a->new_loop((uchar *)"bs1_bdr.l");
        else
            a->new_loop((uchar *)"bs1_bdl.l");
        a->direction ^= 1;
    }
    if (a->counter_26 != 0) {
        if (--a->counter_26 != 0) {
            if (random(4) == 0)
                add_missile(a, 5, 0x28);
            if (cur_sub->field_36 == 0 && touching(a, cur_sub))
                hit_cur_sub(-(cur_sub->x_speed), 5);
        } else {
            if (random(2) != 0)
                a->door_open = 1;
            a->x_speed = a->x_speed / 8;
            a->y_speed = a->y_speed / 2;
            a->set_cycle(0, 5);
        }
        return;
    }
    diff_x = abs(cur_sub->center_x - a->center_x);
    diff_y = abs(cur_sub->center_y - a->center_y);
    if (diff_x < 0x96 && diff_y < 0x28) {
        if (a->facing_actor(cur_sub) != 0 && random(0x0A) == 0) {
            a->counter_26 = 0x0A;
            a->x_speed *= 8;
            a->y_speed *= 2;
            a->set_cycle(1, 4);
            return;
        }
    } else {
        if (diff_y > 0x0A && a->counter_24 == 0)
            a->y_speed = (a->center_y < cur_sub->center_y) ? 1 : -1;
    }
    if (a->frame == 0)
        a->set_cycle(8, 9);
    if (random(0x12C) == 0)
        the_game->play_sound((uchar *)"badgrunt", 0x0C);
}

/* --------------------------------------------------------------------------
 * seg0b2c:40AC — do_bs3: boss3 — the big finale boss.  When target is set it
 *   escorts/mirrors that actor; when clear it is the vulnerable head that
 *   paces, fires missiles, and takes hits.  state 2 is the dying hulk whose
 *   crash releases the sub and triggers the end sequence.
 * ------------------------------------------------------------------------ */
void far do_bs3(m_actor far *a)
{
    int var_2, var_4, var_6, var_8;

    if (a->state == 2) {
        if (!a->inactive) {
            if (a->tile_collision(0, 0, 0) != 0) {
                a->y_speed = 0;
                a->linked->door_open = 1;
                a->inactive = 1;
                enemies_killed++;
                control = 0;
                ego->y_speed = 0;
                ego->x_speed = 0;
                ego->move_func = (movefn_t)0;
                if (ego->facing_actor(a) == 0)
                    turn_ego();
                ego->set_cycle(0, 1);
                the_game->field_0F = 1;
            }
        } else if (random(6) == 0) {
            add_bubble(a->x + random(a->width), a->y + random(a->height), 0x14);
        }
        if (random(2) == 0) {
            var_6 = a->x + random(a->width);
            var_8 = a->y + random(a->height) - 0x0A;
            switch (random(3)) {
            case 0:
                add_explosion(var_6, var_8, 1, (uchar far *)0);
                break;
            case 1:
                add_explosion(var_6, var_8, 2, (uchar far *)0);
                break;
            case 2:
                act = the_cast->add((uchar *)"exp3.l", (void far *)0, (void far *)0);
                act->set_xy(var_6, var_8);
                act->set_cycle(0, 2);
                break;
            }
        }
        return;
    }
    if (a->target != 0) {
        if (a->flag_3) {
            a->flag_3 = 0;
            the_game->play_sound((uchar *)"dirhit", 8);
        }
    } else {
        var_4 = check_for_hit(a, 0x5A);
        if (var_4 == 2) {
            a->new_loop((uchar *)"bs3_dthr.l");
            a->state = 2;
            a->x_speed = 0;
            a->y_speed = 1;
            a->move_func = (movefn_t)0;
            a->flag_0 = 0;
            score += 100000;
            return;
        }
        if (var_4 == 1) {
            if (random(3 - shot_size + 1) == 0 && a->facing_actor(cur_sub) == 0)
                a->door_open = 1;
        }
        if (a->counter_26 != 0)
            a->counter_26--;
        else if (a->facing_actor(cur_sub) != 0) {
            diff_y = abs(a->center_y - cur_sub->center_y);
            if (diff_y < 0x28) {
                a->counter_26 = 5;
                add_missile(a, 2, 0x20);
            }
        }
    }
    if (a->facing_actor(cur_sub) == 0 && random(5) == 0)
        a->door_open = 1;
    if (a->counter_24 != 0) {
        a->counter_24--;
        a->door_open = 0;
    } else {
        var_2 = (a->target != 0) ? a->old_y + 0x0F : a->old_y;
        a->y_speed = (cur_sub->center_y < var_2) ? -a->health : a->health;
        a->counter_24 = 0x0A;
        if (a->door_open) {
            a->door_open = 0;
            a->x_speed = -a->x_speed;
            if (a->direction == 1) {
                a->new_loop((uchar *)"bs3_bdr.l");
                if (a->target) a->target->new_loop((uchar *)"bs3_arr.l");
            } else {
                a->new_loop((uchar *)"bs3_bdl.l");
                if (a->target) a->target->new_loop((uchar *)"bs3_arl.l");
            }
            a->direction ^= 1;
            if (a->target) {
                a->target->direction ^= 1;
                a->target->set_cycle(0, 0);
            }
        }
    }
    if (cur_sub->field_36 == 0 && touching(a, cur_sub))
        hit_cur_sub(0, 1);
}
