/* ==========================================================================
 * gamemgr.cpp — seg110e reconstruction: game_manager (resources + WoRx sound).
 *
 * Original: Borland C++ large model, real mode.  Decoded from RIPTIDE.lst;
 * semantics cross-checked against Reko (segment 190E).
 * ========================================================================== */
#include "riptide.h"
#include <dos.h>

/* live PC-speaker sound-effect state (_cur_sound) — 0x0E bytes. */
struct cur_sound_t {
    byte  pad0[4];
    byte  prio;             /* +4 — priority of the playing sound */
    byte  index;            /* +5 — current note index */
    pcs_note_seq far *seq;  /* +6 — sequence being played */
    byte  padA[4];          /* +0A */
};

/* --------------------------------------------------------------------------
 * gm_open / gm_read — WoRx external element I/O callbacks.
 * Registered via set_external_open/read so the WoRx resource loader reads
 * through the game's own element layer.
 * ------------------------------------------------------------------------ */
int far gm_open(uchar far *name)
{
    return openelement(name);
}

ulong far gm_read(void far *buf, uint len)
{
    return elementread(buf, len);
}

/* --------------------------------------------------------------------------
 * pc_sound_doit — int 8 (timer) ISR.  The PIT is reprogrammed ~6x so this runs
 * at ~109 Hz; it chains to the saved handler every 6th tick (≈18.2 Hz) and
 * advances the PC-speaker note sequence each tick.
 * ------------------------------------------------------------------------ */
void interrupt far pc_sound_doit(...)
{
    if (++ticks18_2 >= 6) {
        ticks18_2 = 0;
        asm pushf;
        theirhandler();
    }
    if (the_game->field_1C != 0 && cur_sound != 0 &&
        ((cur_sound_t far *)cur_sound)->seq != 0) {
        if (((cur_sound_t far *)cur_sound)->index ==
            ((cur_sound_t far *)cur_sound)->seq->count) {
            cur_sound = 0;
            nosound();
        } else {
            sound(((cur_sound_t far *)cur_sound)->seq->freqs
                  [((cur_sound_t far *)cur_sound)->index]);
            ((cur_sound_t far *)cur_sound)->index++;
        }
    }
    outportb(0x20, 0x20);
}

/* --------------------------------------------------------------------------
 * game_manager ctor — start WoRx, open the RSC, detect sound hardware.
 * ------------------------------------------------------------------------ */
game_manager::game_manager(uchar far *rsc_name)
{
    int var_4, var_2, var_6;

    startworx();
    if (rsc_name != 0) {
        var_4 = startresource(rsc_name);
        if (var_4 > 2) {
            set_external_open((void far *)gm_open);
            set_external_read((void far *)gm_read);
        }
        if (var_4 == -1)
            read_error("RSC file.");
    }
    field_04 = 0;
    field_1C = 1;
    reset_player(0);
    reset_player(1);
    field_25 = field_2F = field_26 = field_30 = input_mode = field_2E = 0;
    field_00 = 0;
    adlib_present = sb_present = 0;
    adlib_present = adlibdetect();
    var_2 = dspreset();
    if (var_2 == -1 || force_pc_sound != 0)
        sb_present = 0;
    else
        sb_present = 1;
    if (sb_present != 0) {
        vochooksetting(1);
        setfmvolume(8, 8);
        setvocvolume(8, 8);
        for (var_6 = 0; var_6 < 0x10; ++var_6)
            setchannelvolume(var_6, 0x6E);
        printf("SoundBlaster detected.\n");
    } else {
        asm { mov ah, 0x2E
              int 0x63 }
        theirhandler = getvect(8);
        setvect(8, pc_sound_doit);
        outportb(0x43, 0x34);
        outportb(0x40, 0xC3);
        outportb(0x40, 0x2A);
    }
    clear_flags();
    game_speed = 0;
    field_38 = 0;
    field_39 = 0;
    field_1E = 0;
    cur_sound = 0;
}

/* --------------------------------------------------------------------------
 * game_manager dtor — undo the sound hook, restore the timer, shut WoRx down.
 * ------------------------------------------------------------------------ */
game_manager::~game_manager()
{
    if (sb_present != 0) {
        dspclose();
    } else {
        outportb(0x43, 0x34);
        outportb(0x40, 0x00);
        outportb(0x40, 0x00);
        setvect(8, theirhandler);
    }
    closeworx();
    nosound();
}

/* --------------------------------------------------------------------------
 * doit — per-frame input+sound pump.  Clears the finished VOC, resets the
 * player, folds the key/joystick state into the direction/fire/ack fields and
 * runs the registered field_00 callback.
 * ------------------------------------------------------------------------ */
void game_manager::doit()
{
    int var_2, var_4;

    if (cur_sound != 0 && sb_present != 0 && vocplaying() == 0)
        cur_sound = 0;
    reset_player(0);
    if (gr_keys[0x4D] != 0) field_2A = 1;
    if (gr_keys[0x4B] != 0) field_29 = 1;
    if (gr_keys[0x50] != 0) field_28 = 1;
    if (gr_keys[0x48] != 0) field_27 = 1;
    if (gr_keys[0x39] != 0) field_2B = 1;
    if (gr_keys[0x38] != 0 || gr_keys[0x1D] != 0) field_2C = 1;
    if (input_mode == 1) {
        asm cli;
        joystickupdate();
        var_2 = joystickx();
        var_4 = joysticky();
        asm sti;
        if (var_2 <= 0x1D) field_29 = 1;
        else if (var_2 >= 0x63) field_2A = 1;
        if (var_4 >= 0x54) field_28 = 1;
        else if (var_4 <= 0x2C) field_27 = 1;
        if (joystickbutton(0) != 0) field_2B = 1;
        if (joystickbutton(1) != 0) field_2C = 1;
    }
    if (field_00 != 0) {
        reset_player(1);
        ((void (far *)())field_00)();
    }
}

/* --------------------------------------------------------------------------
 * clear_flags — zero the 20 flag/input bytes at offset 8..0x1B.
 * ------------------------------------------------------------------------ */
void game_manager::clear_flags()
{
    int var_2;
    for (var_2 = 0; var_2 < 0x14; ++var_2)
        ((uchar far *)this)[8 + var_2] = 0;
}

/* --------------------------------------------------------------------------
 * joy_update — forward to the WoRx joystick poll.
 * ------------------------------------------------------------------------ */
void game_manager::joy_update()
{
    joystickupdate();
}

/* --------------------------------------------------------------------------
 * reset_player — clear the 6 input bytes of player p's 10-byte record
 * (stride 0x0A, base offset 0x27): ack, fire, down, up, right, left.
 * ------------------------------------------------------------------------ */
void game_manager::reset_player(uchar p)
{
    ((uchar far *)this + p * 0x0A)[0x29] =
        ((uchar far *)this + p * 0x0A)[0x2A] =
        ((uchar far *)this + p * 0x0A)[0x27] =
        ((uchar far *)this + p * 0x0A)[0x28] =
        ((uchar far *)this + p * 0x0A)[0x2B] =
        ((uchar far *)this + p * 0x0A)[0x2C] = 0;
}

/* --------------------------------------------------------------------------
 * turn_sound — toggle music/sound on-off (field_1C).  On resumes the saved
 * CMF block; off stops the sequence and any playing VOC.
 * ------------------------------------------------------------------------ */
void game_manager::turn_sound(uchar on)
{
    if (field_1C != on) {
        field_1C = on;
        if (on == 1) {
            if (field_1E != 0)
                playcmfblock((void far *)field_1E);
        } else {
            if (field_1E != 0)
                stopsequence();
            if (vocplaying() != 0)
                stopvoc();
        }
    }
}

/* --------------------------------------------------------------------------
 * remove_sound — drop a named effect from sounds[], free its VOC/PCS blocks,
 * then shift the table down.
 * ------------------------------------------------------------------------ */
void game_manager::remove_sound(uchar far *s1)
{
    int var_2, var_4;

    if (vocplaying() != 0)
        stopvoc();
    for (var_2 = 0; var_2 < field_39; ++var_2) {
        if (strcmp(sounds[var_2]->name, s1) == 0)
            break;
    }
    if (var_2 == field_39)
        return;
    if (sb_present != 0) {
        delete sounds[var_2]->voc->name;
        farfree(sounds[var_2]->voc->seq);
        delete sounds[var_2]->voc;
    } else if (sounds[var_2]->pcs != 0) {
        delete sounds[var_2]->pcs->name;
        delete sounds[var_2]->pcs->freqs;
        delete sounds[var_2]->pcs;
    }
    delete sounds[var_2];
    for (var_4 = var_2 + 1; var_4 < field_39; ++var_4)
        sounds[var_4 - 1] = sounds[var_4];
    field_39--;
}

/* --------------------------------------------------------------------------
 * define_sound — register a sound effect by name: allocate a gm_sound, load
 * the VOC (digital) or PCS (PC-speaker) block, append to sounds[].
 * ------------------------------------------------------------------------ */
void game_manager::define_sound(uchar far *src, uchar)
{
    gm_sound far *snd;

    if (field_39 == 0x27)
        terminate((uchar far *)"Sound storage full.", (uchar far *)0);
    snd = (gm_sound far *)new gm_sound;
    snd->name = src;
    if (sb_present != 0)
        snd->voc = load_voc(src);
    else
        snd->pcs = load_pcs(src);
    sounds[field_39++] = snd;
}

/* --------------------------------------------------------------------------
 * get_sound — look up a sound-effect record by name; terminate if missing.
 * ------------------------------------------------------------------------ */
gm_sound far *game_manager::get_sound(uchar far *s2)
{
    int var_2;

    for (var_2 = 0; var_2 < field_39; ++var_2) {
        if (strcmp(sounds[var_2]->name, s2) == 0)
            return sounds[var_2];
    }
    terminate((uchar far *)"Snd not in storage.", s2);
    return 0;
}

/* --------------------------------------------------------------------------
 * play_sound_file — play a named effect: VOC (digital) or PCS (PC-speaker).
 * ------------------------------------------------------------------------ */
void game_manager::play_sound_file(uchar far *src)
{
    if (field_1C != 0) {
        if (sb_present != 0)
            play_voc_file(src);
        else
            play_pcs_file(src);
    }
}

/* --------------------------------------------------------------------------
 * play_sound — play a registered effect by name at the given priority.  A
 * higher-priority sound already playing is not preempted.
 * ------------------------------------------------------------------------ */
void game_manager::play_sound(uchar far *s2, uchar prio)
{
    gm_sound far *snd;

    if (cur_sound == 0) {
        snd = get_sound(s2);
        if (sb_present != 0 || snd->pcs != 0) {
            cur_sound = snd;
            ((cur_sound_t far *)cur_sound)->prio = prio;
            ((cur_sound_t far *)cur_sound)->index = 0;
            if (sb_present != 0)
                play_voc((uchar far *)((gm_sound far *)cur_sound)->voc->seq);
        }
    } else {
        if (((cur_sound_t far *)cur_sound)->prio > prio)
            return;
        snd = get_sound(s2);
        if (sb_present != 0) {
            cur_sound = snd;
            ((cur_sound_t far *)cur_sound)->prio = prio;
            play_voc((uchar far *)((gm_sound far *)cur_sound)->voc->seq);
        } else if (snd->pcs != 0) {
            cur_sound = snd;
            ((cur_sound_t far *)cur_sound)->prio = prio;
            ((cur_sound_t far *)cur_sound)->index = 0;
        }
    }
}

/* --------------------------------------------------------------------------
 * reset_sound — stop the current song/VOC and silence the PC speaker.
 * ------------------------------------------------------------------------ */
void game_manager::reset_sound()
{
    if (sb_present != 0) {
        stop_song();
        if (vocplaying() != 0)
            stopvoc();
    }
    cur_sound = 0;
    nosound();
}

/* --------------------------------------------------------------------------
 * play_song — load a CMF sequence and start it if music is enabled.
 * ------------------------------------------------------------------------ */
void game_manager::play_song(uchar far *src)
{
    if (sb_present != 0) {
        stop_song();
        field_1E = getsequence(src);
        if (field_1E == 0)
            terminate((uchar far *)"Can't find song ", src);
        if (field_1C != 0)
            playcmfblock(field_1E);
    }
}

/* --------------------------------------------------------------------------
 * stop_song — stop the current sequence and free its block.
 * ------------------------------------------------------------------------ */
void game_manager::stop_song()
{
    if (sb_present != 0) {
        if (field_1E != 0) {
            stopsequence();
            farfree(field_1E);
            field_1E = 0;
        }
    }
}

/* --------------------------------------------------------------------------
 * pause_song — stop the current sequence but keep its block.
 * ------------------------------------------------------------------------ */
void game_manager::pause_song()
{
    if (sb_present != 0) {
        if (field_1E != 0)
            stopsequence();
    }
}

/* --------------------------------------------------------------------------
 * continue_song — resume the paused sequence.
 * ------------------------------------------------------------------------ */
void game_manager::continue_song()
{
    if (sb_present != 0) {
        if (field_1E != 0)
            continuesequence();
    }
}

/* --------------------------------------------------------------------------
 * play_voc — start a VOC block if sound is enabled and a DSP is present.
 * ------------------------------------------------------------------------ */
void game_manager::play_voc(uchar far *arg_4)
{
    if (field_1C != 0 && sb_present != 0)
        playvocblock((void far *)arg_4);
}

/* --------------------------------------------------------------------------
 * play_voc_file — build "<src>.voc" and stream it via playvocfile.
 * ------------------------------------------------------------------------ */
void game_manager::play_voc_file(uchar far *src)
{
    if (sb_present != 0) {
        if (vocplaying() != 0)
            stopvoc();
        strcpy(_tmp, src);
        strcat(_tmp, ".voc");
        playvocfile(_tmp);
        while (vocplaying() != 0)
            ;
    }
}

/* --------------------------------------------------------------------------
 * voc_playing — report whether a VOC is playing (0 if no DSP).
 * ------------------------------------------------------------------------ */
uchar game_manager::voc_playing()
{
    if (sb_present != 0)
        return vocplaying();
    return 0;
}

/* --------------------------------------------------------------------------
 * load_voc — allocate a VOC block {name, seq}: strdup the name and load the
 * "<src>.voc" sequence via getsequence.
 * ------------------------------------------------------------------------ */
voc_block far *game_manager::load_voc(uchar far *src)
{
    voc_block far *block;
    void far *var_8;

    strcpy(_tmp, src);
    strcat(_tmp, ".voc");
    block = (voc_block far *)new voc_block;
    var_8 = getsequence(_tmp);
    if (var_8 == 0)
        terminate((uchar far *)"Voc not found: ", _tmp);
    block->name = strdup(_tmp);
    block->seq = var_8;
    return block;
}

/* --------------------------------------------------------------------------
 * load_pcs — read a ".pcs" element: name, note count, then the word freq
 * table.  Returns the 10-byte {name,freqs,count} block or 0 on error.
 * ------------------------------------------------------------------------ */
pcs_note_seq far *game_manager::load_pcs(uchar far *src)
{
    pcs_note_seq far *block;
    int len;

    strcpy(_tmp, src);
    strcat(_tmp, ".pcs");
    if ((long)g_open_element(_tmp) == -1L) {
        g_close_element();
        return 0;
    }
    block = (pcs_note_seq far *)new pcs_note_seq;
    block->name = strdup(_tmp);
    if (g_element_read(&block->count, 2) != 2)
        goto fail;
    block->freqs = (word far *)new char[block->count * 2];
    len = block->count * 2;
    if (g_element_read(block->freqs, len) != len)
        goto fail;
    g_close_element();
    return block;
fail:
    g_close_element();
    terminate((uchar far *)"Error loading pcs:", src);
    return 0;
}

/* --------------------------------------------------------------------------
 * play_pcs_file — load a ".pcs" element, wrap it in a live-sound block and
 * hand it to the timer ISR.
 * ------------------------------------------------------------------------ */
void game_manager::play_pcs_file(uchar far *src)
{
    pcs_note_seq far *block;
    cur_sound_t far *var_8;

    block = load_pcs(src);
    if (block == 0)
        return;
    var_8 = (cur_sound_t far *)new cur_sound_t;
    var_8->seq = block;
    cur_sound = var_8;
    ((cur_sound_t far *)cur_sound)->index = 0;
    if (cur_sound == 0) {
        delete block->name;
        delete block->freqs;
        delete block;
        delete var_8;
    }
}

/* --------------------------------------------------------------------------
 * get_loop — look up a sprite-loop record by name; return the loop or NULL.
 * ------------------------------------------------------------------------ */
void far *game_manager::get_loop(uchar far *s2)
{
    int var_2;

    for (var_2 = 0; var_2 < field_38; ++var_2) {
        if (strcmp(loops[var_2]->name, s2) == 0)
            return loops[var_2];
    }
    return 0;
}

/* --------------------------------------------------------------------------
 * load_loop — load a .l sprite-loop element: frame count, then per-frame
 * {w,h} headers and w*h pixel data.  Append the record to loops[].
 * ------------------------------------------------------------------------ */
void far *game_manager::load_loop(uchar far *src)
{
    gm_loop far *buf;
    byte var_5, var_6;
    int len, var_2;

    if (field_38 == 0x96)
        terminate((uchar far *)"Loop storage full!", (uchar far *)0);
    buf = (gm_loop far *)new gm_loop;
    if (buf == 0)
        no_heap("Adding a loop to game_manager.");
    buf->name = strdup(src);
    strcpy(_tmp, src);
    strupr(_tmp);
    if ((long)g_open_element(_tmp) == -1L)
        return 0;
    if (g_element_read(buf, 1) != 1)
        return 0;
    for (var_2 = 0; var_2 < buf->count; ++var_2) {
        buf->frames[var_2] = (gm_frame far *)new gm_frame;
        if (buf->frames[var_2] == 0)
            goto oom;
        if (g_element_read(&var_5, 1) != 1)
            return 0;
        if (g_element_read(&var_6, 1) != 1)
            return 0;
        buf->frames[var_2]->w = var_5;
        buf->frames[var_2]->h = var_6;
        len = var_5 * var_6;
        field_04 += len;
        buf->frames[var_2]->data = (void far *)new char[len];
        if (buf->frames[var_2]->data == 0)
            goto oom;
        if (g_element_read(buf->frames[var_2]->data, len) != len)
            return 0;
    }
    loops[field_38++] = buf;
    g_close_element();
    return buf;
oom:
    no_heap("Loading loop.");
    g_close_element();
    return 0;
}

/* --------------------------------------------------------------------------
 * remove_loop — drop a named loop: free name, each frame's data + record, the
 * record itself, then pack loops[] down with my_movsd.
 * ------------------------------------------------------------------------ */
void game_manager::remove_loop(uchar far *s2)
{
    gm_loop far *block;
    int var_2, var_4;

    for (var_2 = 0; var_2 < field_38; ++var_2) {
        if (strcmp(loops[var_2]->name, s2) == 0)
            break;
    }
    if (var_2 == field_38)
        return;
    var_4 = var_2;
    block = loops[var_4];
    delete block->name;
    for (var_2 = 0; var_2 < block->count; ++var_2) {
        delete block->frames[var_2]->data;
        delete block->frames[var_2];
    }
    delete block;
    my_movsd(&loops[var_4], &loops[var_4 + 1], field_38 - var_4);
    field_38--;
}
