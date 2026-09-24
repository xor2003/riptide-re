/* ==========================================================================
 * ACTOR.CPP — decompilation of seg1224 (m_actor / game_cast actor engine)
 * Original compiler: Borland C++ 3.1, -ml -3
 * Each function annotated with its original seg:offset.
 * ========================================================================== */
#include "riptide.h"

/* --------------------------------------------------------------------------
 * seg1224:0006 — m_actor ctor: zero the geometry/counters, install the two
 *   behaviour hooks, prime the anim mode, then new_loop() the sprite name.
 * ------------------------------------------------------------------------ */
m_actor::m_actor(uchar far *name, void far *mv, void far *upd)
{
    update_func = (actfn_t)upd;
    move_func   = (movefn_t)mv;
    field_37 = field_28 = counter_24 = counter_26 = health = field_1E = counter_22 = field_2A = 0;
    x = y = x_speed = y_speed = 0;
    cycle_speed = field_36 = type = state = 0;
    if (num_frames == 1) frame = 0; else frame = 1;
    flag_0 = in_window = no_erase = flag_3 = new_sprite = inactive = door_open = flag_7 = flag_8 = 0;
    height = width = 0;
    new_loop(name);
    target = linked = 0;
    field_4E = 0;
}

/* --------------------------------------------------------------------------
 * seg1224:01BD — ~m_actor: empty body; the compiler synthesizes the scalar
 *   deleting destructor ($bdtr) that frees the block when flags&1.
 * ------------------------------------------------------------------------ */
m_actor::~m_actor()
{
}

/* --------------------------------------------------------------------------
 * seg1224:01DE — facing_actor(other): is this actor facing toward `other`?
 *   returns 1 if (this center_x < other && direction==0 [right]) or
 *                (this center_x > other && direction==1 [left])
 * ------------------------------------------------------------------------ */
byte m_actor::facing_actor(m_actor far *other)
{
    if (center_x < other->center_x && direction == 0)
        return 1;
    if (center_x > other->center_x && direction == 1)
        return 1;
    return 0;
}

/* --------------------------------------------------------------------------
 * seg1224:0221 — check_in_window: set/clear in_window (field_52 bit1) from
 *   whether the actor's box overlaps the map window.
 * ------------------------------------------------------------------------ */
void m_actor::check_in_window()
{
    if (old_x >= the_map->field_0C &&
        the_map->field_0C + the_map->field_18 >= x &&
        old_y >= the_map->field_0E &&
        the_map->field_0E + the_map->field_1A >= y)
        in_window = 1;
    else
        in_window = 0;
}

/* --------------------------------------------------------------------------
 * seg1224:028B — set_xy(x,y): place actor, recompute edges/centers/map_pos,
 *   and register into ed_list while inside the window.
 * ------------------------------------------------------------------------ */
void m_actor::set_xy(int x, int y)
{
    this->x = x;
    this->y = y;
    this->old_x = this->x + width;
    this->old_y = this->y + height;
    this->center_x = this->x + (width >> 1);
    this->center_y = this->y + (height >> 1);
    check_in_window();
    if (in_window) {
        if (ed_list_size >= 0x63)
            terminate((uchar far *)"Too many actors in ed_list.", (uchar far *)0);
        ed_list[ed_list_size] = this;
        ed_list_size++;
    }
    map_pos = tbl_mul_tw[this->y >> 3] + (this->x >> 3);
}

/* --------------------------------------------------------------------------
 * seg1224:041C — new_loop(name): switch the actor's sprite-loop resource.
 *   stashes current dims into field_0C/0E, reloads frames, recompute box.
 * ------------------------------------------------------------------------ */
void m_actor::new_loop(uchar far *s2)
{
    sprite_data = s2;
    new_sprite = 1;
    field_0C = width;
    field_0E = height;
    loop_data = (loop_res far *)the_game->get_loop(s2);
    if (loop_data == 0)
        terminate((uchar far *)"Error looking for loop : ", s2);
    width  = loop_data->frames[0]->w;
    height = loop_data->frames[0]->h;
    field_1A = (width  >> 3) + 1;
    field_1C = (height >> 3) + 1;
    old_x = x + width;
    old_y = y + height;
    center_x = x + (width >> 1);
    center_y = y + (height >> 1);
    current_loop = cycle_timer = 0;
    num_frames   = loop_data->num_frames;
}

/* --------------------------------------------------------------------------
 * seg1224:055E — erase: restore background under the sprite (in window only).
 *   no_erase (bit2) suppresses one pass; new_sprite (bit4) uses the stashed
 *   dims (field_0C/0E) for the first erase after a sprite change.
 * ------------------------------------------------------------------------ */
void m_actor::erase()
{
    if (in_window) {
        if (no_erase) {
            no_erase = 0;
            return;
        }
        if (new_sprite) {
            the_map->erase_bits(x, y, x + field_0C, y + field_0E);
            new_sprite = 0;
        }
        else
            the_map->erase_bits(x, y, x + width, y + height);
    }
}

/* --------------------------------------------------------------------------
 * seg1224:0BD5 — on_tile(attr): scan the actor's field_1A x field_1C tile box
 *   (from map_pos, rows spaced by map_width-field_1A) for a tile_attr[attr].
 *   returns matching row index+1, or 0.
 * ------------------------------------------------------------------------ */
byte m_actor::on_tile(int attr)
{
    uchar var_6, var_5;
    word  var_2, var_4;

    var_2 = map_pos;
    var_4 = the_map->map_width - field_1A;
    for (var_6 = 0; var_6 < field_1C; var_6++) {
        for (var_5 = 0; var_5 < field_1A; var_5++) {
            if (the_map->tile_attr[var_2++].attr == attr)
                return var_6 + 1;
        }
        var_2 += var_4;
    }
    return 0;
}

/* --------------------------------------------------------------------------
 * seg1224:0C53 — on_pos(pos): same grid scan, matching raw tile positions.
 *   returns 1 if any covered tile index == pos.
 * ------------------------------------------------------------------------ */
uchar m_actor::on_pos(uint pos)
{
    uchar var_6, var_5;
    word  var_2, var_4;

    var_2 = map_pos;
    var_4 = the_map->map_width - field_1A;
    for (var_6 = 0; var_6 < field_1C; var_6++) {
        for (var_5 = 0; var_5 < field_1A; var_5++) {
            if (var_2++ == pos)
                return 1;
        }
        var_2 += var_4;
    }
    return 0;
}

/* --------------------------------------------------------------------------
 * seg1224:0373 — set_cycle(speed, frame): set anim speed + frame; frames 5/8
 *   recompute dims from the last loop frame.
 * ------------------------------------------------------------------------ */
void m_actor::set_cycle(uchar speed, uchar frame)
{
    this->frame       = frame;
    this->cycle_speed = speed;
    this->cycle_timer = 0;
    if (frame == 5 || frame == 8)
    {
        current_loop = num_frames - 1;
        width  = loop_data->frames[current_loop]->w;
        height = loop_data->frames[current_loop]->h;
        field_1A = (width  >> 3) + 1;
        field_1C = (height >> 3) + 1;
    }
}

/* --------------------------------------------------------------------------
 * seg1224:0CBD — touching(a,b): pixel-perfect collision between two actors.
 *   AABB reject, then intersect the current-frame solid-pixel masks.
 * ------------------------------------------------------------------------ */
byte touching(m_actor far *a, m_actor far *b)
{
    int var_2, var_4, var_6, var_8, var_A, var_C, var_E, var_10;
    int var_24, var_22, var_1E, var_26, var_28, var_20;
    int var_2E, var_30, var_2A, var_2C;
    uchar far *var_18, *var_1C;
    m_actor far *var_14;

    if (a->flag_0 || b->flag_0)
        return 0;
    if (a->inactive || b->inactive)
        return 0;
    if (b->y < a->y) { var_14 = a; a = b; b = var_14; }
    var_2 = a->x;      var_4 = a->y;
    var_6 = a->width;  var_8 = a->height;
    var_A = b->x;      var_C = b->y;
    var_E = b->width;  var_10 = b->height;
    if (var_2 + var_6 <= var_A) return 0;
    if (var_A + var_E <= var_2) return 0;
    if (var_4 + var_8 <= var_C) return 0;
    if (var_C + var_10 <= var_4) return 0;
    var_24 = var_C - var_4;
    if (var_2 < var_A) {
        var_22 = var_A - var_2;
        var_1E = var_6 - var_22;
        if (var_1E > var_E) var_1E = var_E;
        var_26 = var_6 * var_24 + var_22;
        var_28 = 0;
    } else {
        var_22 = var_2 - var_A;
        var_1E = var_E - var_22;
        if (var_1E > var_6) var_1E = var_6;
        var_26 = var_6 * var_24;
        var_28 = var_22;
    }
    if (var_C + var_10 <= var_4 + var_8)
        var_20 = var_10;
    else
        var_20 = var_8 - var_24;
    var_18 = a->loop_data->frames[a->current_loop]->bitmap;
    var_1C = b->loop_data->frames[b->current_loop]->bitmap;
    var_2E = var_6 - var_1E;
    var_30 = var_E - var_1E;
    var_2A = 0;
    var_2C = var_20;
    while (var_2C) {
        if (var_18[var_26] != 0 && var_1C[var_28] != 0)
            return 1;
        var_26++; var_28++; var_2A++;
        if (var_2A == var_1E) {
            var_26 += var_2E;
            var_28 += var_30;
            var_2C--;
            var_2A = 0;
        }
    }
    return 0;
}

/* --------------------------------------------------------------------------
 * seg1224:0EFD — game_cast ctor: empty the cast + the on-screen ed_list.
 * ------------------------------------------------------------------------ */
game_cast::game_cast()
{
    count = 0;
    ed_list_size = 0;
}

/* --------------------------------------------------------------------------
 * seg1224:0F2F — game_cast::add(name,a,b): append a new m_actor to the cast.
 * ------------------------------------------------------------------------ */
m_actor far *game_cast::add(uchar far *name, void far *a, void far *b)
{
    if (count == 0xC8)
        return 0;
    actors[count] = new m_actor(name, a, b);
    if (actors[count] == 0)
        no_heap((uchar far *)"Adding actor to cast.");
    return actors[count++];
}

/* --------------------------------------------------------------------------
 * seg1224:14E0 — game_cast::kill_all: erase + delete every actor, reset lists.
 * ------------------------------------------------------------------------ */
void game_cast::kill_all()
{
    uchar i;
    for (i = 0; i < count; i++)
        actors[i]->erase();
    for (i = 0; i < count; i++)
        delete actors[i];
    count = 0;
    ed_list_size = 0;
}

/* --------------------------------------------------------------------------
 * seg1224:1554 — game_cast::remove(idx): delete actor idx, shift tail down.
 * ------------------------------------------------------------------------ */
void game_cast::remove(uchar idx)
{
    delete actors[idx];
    my_movsd(&actors[idx], &actors[idx + 1], count - idx);
    count--;
}

/* --------------------------------------------------------------------------
 * seg1224:0629 — cycle: per-frame animation mode machine. Runs when the
 *   cycle_timer reaches cycle_speed, then advances current_loop per the
 *   `frame` mode and re-derives dims from the new frame.
 * ------------------------------------------------------------------------ */
void m_actor::cycle()
{
    if (frame == 0)
        return;
    if (inactive)
        return;
    if (cycle_timer++ != cycle_speed)
        return;
    cycle_timer = 0;
    switch (frame)
    {
    case 1:
        ++current_loop;
        if (current_loop == num_frames) current_loop = 0;
        break;
    case 2:
        if (current_loop++ == num_frames - 2) flag_0 = 1;
        break;
    case 3:
    case 4:
        ++current_loop;
        if (current_loop == num_frames) {
            if (frame == 4) current_loop = num_frames - 1;
            else            current_loop = 0;
            frame = 0;
        }
        break;
    case 5:
        if (current_loop-- == 0) { current_loop = 0; frame = 0; }
        break;
    case 6:
        ++current_loop;
        if (current_loop == num_frames) { current_loop = num_frames - 2; frame = 7; }
        break;
    case 7:
        if (current_loop-- == 0) { current_loop = 1; frame = 6; }
        break;
    case 8:
        --current_loop;
        if (current_loop == 0xFF) current_loop = num_frames - 1;
        break;
    case 9:
        ++current_loop;
        if (current_loop == 2) current_loop = 0;
        break;
    case 10:
        current_loop = random(num_frames);
        break;
    }
    width  = loop_data->frames[current_loop]->w;
    height = loop_data->frames[current_loop]->h;
    field_1A = (width  >> 3) + 1;
    field_1C = (height >> 3) + 1;
}

/* --------------------------------------------------------------------------
 * seg1224:0872 — move: run the per-actor hooks then integrate x/y and refresh
 *   all derived geometry; re-register in ed_list while in-window (ego drawn
 *   separately and skipped).
 * ------------------------------------------------------------------------ */
void m_actor::move()
{
    int var_2, var_4;
    if (flag_0)
        return;
    if (update_func)
        update_func(this);
    if (move_func) {
        var_2 = x + x_speed;
        var_4 = y + y_speed;
        move_func(this, &var_2, &var_4);
        x = var_2;
        y = var_4;
    } else {
        x += x_speed;
        y += y_speed;
    }
    old_x = x + width;
    old_y = y + height;
    center_x = x + (width  >> 1);
    center_y = y + (height >> 1);
    map_pos = tbl_mul_tw[y >> 3] + (x >> 3);
    check_in_window();
    if (in_window) {
        if (this == ego)
            return;
        if (ed_list_size >= 0x63)
            terminate((uchar far *)"Too many actors to draw.", (uchar far *)0);
        ed_list[ed_list_size] = this;
        ed_list_size++;
    }
}

/* --------------------------------------------------------------------------
 * seg1224:09F7 — draw: blit the current sprite frame while in-window and
 *   flagged; a 2-tick flash toggle lives in field_36/field_37.
 * ------------------------------------------------------------------------ */
void m_actor::draw()
{
    if (new_sprite == 1)
        new_sprite = 0;
    if (!in_window)
        return;
    if (flag_0 != 1)
        return;
    the_map->put_bits_masked(x, y, width, height,
        loop_data->frames[current_loop]->bitmap, 0, field_36);
    if (field_36 == 0)
        return;
    if (field_37++ == 1) {
        field_37 = field_36 = 0;
    }
}

/* --------------------------------------------------------------------------
 * seg1224:0AB8 — tile_collision: scan the actor's tile-footprint edges against
 *   tile_attr<0x100 and return a bitmask of which edges are blocked
 *   (1=top, 2=left, 4=bottom, 8=right). arg4==0 scans the whole footprint.
 * ------------------------------------------------------------------------ */
uchar m_actor::tile_collision(int arg4, int arg6, int arg8)
{
    uchar var_B = 0;
    int var_8, var_A, var_4, var_6;
    uint var_2;
    if (arg4 == 0) {
        var_8 = field_1A;
        var_A = field_1C;
    } else {
        var_8 = arg4 - arg8;
        var_A = arg6;
    }
    var_4 = map_pos + arg8;
    var_6 = var_4 + tbl_mul_tw[var_A - 1];
    for (var_2 = 0; var_2 < var_8; var_2++) {
        if (the_map->tile_attr[var_4].attr < 0x100) var_B |= 1;
        if (the_map->tile_attr[var_6].attr < 0x100) var_B |= 4;
        var_4++;
        var_6++;
    }
    var_4 = map_pos + arg8;
    var_6 = var_4 + var_8 - 1;
    for (var_2 = 0; var_2 < var_A; var_2++) {
        if (the_map->tile_attr[var_4].attr < 0x100) var_B |= 2;
        if (the_map->tile_attr[var_6].attr < 0x100) var_B |= 8;
        var_4 += the_map->map_width;
        var_6 += the_map->map_width;
    }
    return var_B;
}

/* --------------------------------------------------------------------------
 * seg1224:0FBD — update(arg4): the per-frame driver. Phase flag selects the
 *   erase pass (0) vs the flag-clear pass (1); always re-primes ed_list,
 *   drops dead actors, then runs cycle()+move() on every live actor in
 *   16-wide unrolled blocks, then draw()s ego + the ed_list.
 * ------------------------------------------------------------------------ */
void game_cast::update(uchar arg4)
{
    int var_2, var_4, var_6, var_8, var_A, var_C;
    if (arg4 == 0) {
        ego->erase();
        var_2 = 0;
        while (var_2 < ed_list_size)
            ed_list[var_2++]->erase();
    } else {
        var_2 = 0;
        while (var_2 < ed_list_size) {
            ed_list[var_2]->new_sprite = 0;
            ed_list[var_2]->no_erase = 0;
            var_2++;
        }
    }
    ed_list_size = 0;
    var_2 = 0;
    while (var_2 < count) {
        if (actors[var_2]->flag_0 == 1)
            remove(var_2);
        var_2++;
    }
    var_6 = count & 0xF;
    var_8 = count >> 4;
    var_A = var_8 << 4;
    var_C = var_A + var_6;
    var_4 = 0;
    while (var_4 < var_8) {
        var_2 = var_4 << 4;
        actors[var_2 + 0]->cycle(); actors[var_2 + 0]->move();
        actors[var_2 + 1]->cycle(); actors[var_2 + 1]->move();
        actors[var_2 + 2]->cycle(); actors[var_2 + 2]->move();
        actors[var_2 + 3]->cycle(); actors[var_2 + 3]->move();
        actors[var_2 + 4]->cycle(); actors[var_2 + 4]->move();
        actors[var_2 + 5]->cycle(); actors[var_2 + 5]->move();
        actors[var_2 + 6]->cycle(); actors[var_2 + 6]->move();
        actors[var_2 + 7]->cycle(); actors[var_2 + 7]->move();
        actors[var_2 + 8]->cycle(); actors[var_2 + 8]->move();
        actors[var_2 + 9]->cycle(); actors[var_2 + 9]->move();
        actors[var_2 + 10]->cycle(); actors[var_2 + 10]->move();
        actors[var_2 + 11]->cycle(); actors[var_2 + 11]->move();
        actors[var_2 + 12]->cycle(); actors[var_2 + 12]->move();
        actors[var_2 + 13]->cycle(); actors[var_2 + 13]->move();
        actors[var_2 + 14]->cycle(); actors[var_2 + 14]->move();
        actors[var_2 + 15]->cycle(); actors[var_2 + 15]->move();
        var_4++;
    }
    var_2 = var_A;
    while (var_2 < var_C) {
        actors[var_2]->cycle();
        actors[var_2]->move();
        var_2++;
    }
    ego->draw();
    var_2 = 0;
    while (var_2 < ed_list_size)
        ed_list[var_2++]->draw();
}
