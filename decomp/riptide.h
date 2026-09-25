/* ==========================================================================
 * RIPTIDE.H — reconstructed class/global declarations for
 * "In Search of Dr. Riptide" (1994, MindStorm Software / Pack Media)
 * Target compiler: Borland C++ 3.1, large model (-ml), 386 instr (-3)
 * Member offsets verified against RIPTIDE.lst disassembly.
 * ========================================================================== */
#ifndef RIPTIDE_H
#define RIPTIDE_H

#include <stdio.h>
#include <string.h>
#include <io.h>
#include <fcntl.h>
#include <dos.h>
#include <conio.h>
#include <alloc.h>
#include <time.h>
#include <dir.h>

/* <stdlib.h> deliberately omitted — the game module defines its own
 * abs(int), random(int), atoi(uchar*) helpers (seg03f9), which would
 * clash with the stdlib inline bodies.  Needed library decls: */
extern "C" char far *ltoa(long, char far *, int);
extern "C" int  rand(void);
extern "C" long atol(const char far *);
extern "C" void exit(int);

typedef unsigned char  byte;
typedef unsigned char  uchar;
typedef unsigned int   uint;
typedef unsigned int   word;
typedef unsigned long  ulong;
typedef unsigned long  dword;

/* --------------------------------------------------------------------------
 * sprite-loop (.l) resource — an array of frame headers loaded by game_manager
 * ------------------------------------------------------------------------ */
struct spr_frame {                          /* a sprite frame record */
    uchar far *bitmap;                      /* 00 — also the solid-pixel mask */
    int   h;                                /* 04 */
    int   w;                                /* 06 */
};
struct loop_res {                           /* a .l sprite-loop resource */
    byte num_frames;                        /* 00 */
    char _pad[5];                           /* 01..05 */
    spr_frame far *frames[];                /* 06 — frame ptr table */
};

/* --------------------------------------------------------------------------
 * m_actor — a game entity (player subs, enemies, items, projectiles...)
 * sizeof = 0x54
 * ------------------------------------------------------------------------ */
struct m_actor;

typedef void (far *actfn_t)(struct m_actor far *);
typedef void (far *movefn_t)(struct m_actor far *, int far *, int far *);

class m_actor {
public:
    int      x;             /* 00 */
    int      y;             /* 02 */
    int      old_x;         /* 04 — right edge  = x + width  (recomputed in set_xy/new_loop) */
    int      old_y;         /* 06 — bottom edge = y + height */
    int      center_x;      /* 08 */
    int      center_y;      /* 0A */
    int      field_0C;      /* 0C — saved width  (new_loop stashes old w/h here) */
    int      field_0E;      /* 0E — saved height */
    int      width;         /* 10 */
    int      height;        /* 12 */
    int      x_speed;       /* 14 */
    int      y_speed;       /* 16 */
    int      map_pos;       /* 18 */
    int      field_1A;      /* 1A — width  in tiles = width/8 + 1 */
    int      field_1C;      /* 1C — height in tiles = height/8 + 1 */
    int      field_1E;      /* 1E */
    int      counter_22;    /* 20 */
    int      counter_24;    /* 22 */
    int      counter_26;    /* 24 */
    int      health;        /* 26  (see ctor: [26h]=0 — sketch had 28; verify) */
    /* NOTE: ctor zeroes words at 1E,20,22,24,26,28,2A — order in source TBD */
    int      field_28;      /* 28 */
    int      field_2A;      /* 2A */
    m_actor far *target;    /* 2C (far ptr) */
    m_actor far *linked;    /* 30 (far ptr) */
    byte     direction;     /* 34 */
    byte     type;          /* 35 */
    byte     field_36;      /* 36 */
    byte     field_37;      /* 37 */
    byte     frame;         /* 38 */
    byte     cycle_timer;   /* 39 */
    byte     cycle_speed;   /* 3A */
    byte     num_frames;    /* 3B */
    byte     current_loop;  /* 3C */
    byte     state;         /* 3D */
    actfn_t  update_func;   /* 3E (far fn ptr) */
    movefn_t move_func;     /* 42 (far fn ptr) */
    loop_res far *loop_data; /* 46 — active .l loop resource */
    uchar far  *sprite_data; /* 4A — loop name string */
    void far *field_4E;   /* 4E (far ptr) */
    unsigned flag_0     :1; /* 52.0 — dead/marked for removal: skips update() and draw() */
    unsigned in_window  :1; /* 52.1 — inside map window; feeds ed_list & shootable_list */
    unsigned no_erase   :1; /* 52.2 — suppress erase once (just drawn) */
    unsigned flag_3     :1; /* 52.3 */
    unsigned new_sprite :1; /* 52.4 — dims changed; erase() uses saved w/h once */
    unsigned inactive   :1; /* 52.5 — excluded from barrier/shootable lists */
    unsigned door_open  :1; /* 52.6 — end door unlocked */
    unsigned flag_7     :1; /* 52.7 */
    unsigned flag_8     :1; /* 53.0 */
    unsigned pad_flags  :7; /* 53.1-7 */
    /* 0x54 */

    m_actor(uchar far *name, void far *, void far *);           /* seg1224:0006 */
    ~m_actor();                                                  /* seg1224:01BD */
    byte facing_actor(m_actor far *);                            /* seg1224:02FC */
    void check_in_window();                                      /* seg1224:.... */
    void set_xy(int, int);                                       /*  */
    void set_cycle(uchar, uchar);                                /*  */
    void new_loop(uchar far *);                                  /* seg1224:041C */
    void erase();                                                /*  */
    void cycle();                                                /*  */
    void move();                                         /*  */
    void draw();                                                 /*  */
    uchar tile_collision(int, int, int);                               /*  */
    byte on_tile(int);                                      /*  */
    uchar on_pos(uint);                                          /* seg1224:0C53 */
};

/* --------------------------------------------------------------------------
 * game_cast — container of live actors. sizeof = 0x322 (ctor new(0x322))
 * ------------------------------------------------------------------------ */
class game_cast {
public:
    uchar    count;                 /* 00 */
    uchar    pad_01;                /* 01 */
    m_actor far *actors[200];       /* 02 — far ptr array (0x320 bytes) */
    /* 0x322 */
    game_cast();                                    /* seg1224:0EFD */
    ~game_cast();                                   /* seg1224:0F?? */
    m_actor far *add(uchar far *, void far *, void far *); /* seg1224:0F2F */
    void update(uchar);                             /* seg1224:0FBD */
    void kill_all();
    void remove(uchar);                             /* seg1224:1554 */
};

/* --------------------------------------------------------------------------
 * game_manager — resources, sound, player state. sizeof = 0x332
 * ------------------------------------------------------------------------ */
struct gm_frame {                        /* one sprite frame — 8 bytes */
    void far *data;                      /* +0 — pixel data */
    word      h;                         /* +4 — height */
    word      w;                         /* +6 — width */
};
struct gm_loop {                         /* sprite-loop (.l) record — 0x46 */
    byte      count;                     /* +0 — frame count */
    byte      pad_01;                    /* +1 */
    char far *name;                      /* +2 — strdup'd element name */
    gm_frame far *frames[16];            /* +6 — frame records */
};
struct pcs_note_seq {                    /* PC-speaker note seq block — 0x0A */
    char far *name;                      /* +0 — strdup'd element name */
    word  far *freqs;                    /* +4 — word frequency table */
    word      count;                     /* +8 — note count */
};
struct voc_block {                       /* VOC data block — 0x08 */
    char far *name;                      /* +0 — strdup'd element name */
    void far *seq;                       /* +4 — getsequence() data */
};
struct gm_sound {                        /* loaded sound effect — 0x0E */
    char far *name;                      /* +0 — element name */
    byte      prio;                      /* +4 — priority (set by play_sound) */
    byte      index;                     /* +5 — play cursor */
    pcs_note_seq far *pcs;               /* +6 — PC-speaker seq block */
    voc_block far *voc;                  /* +0A — VOC block */
};
class game_manager {
public:
    dword field_00;        /* 00 */
    word  field_04;        /* 04 */
    byte  sb_present;      /* 06 — digital sound available (dspreset ok) */
    char  adlib_present;   /* 07 — adlibdetect() result */
    byte  field_08;        /* 08 — cleared per-level in play_game */
    byte  field_09;        /* 09 — cleared per-level */
    byte  field_0A;        /* 0A — cleared in start_room */
    byte  field_0B;        /* 0B — cleared in start_room */
    byte  field_0C;        /* 0C */
    byte  field_0D;        /* 0D — set by setup_secret_level */
    byte  field_0E;        /* 0E */
    byte  field_0F;        /* 0F — bs3 finale sequence enabled (cur_map 0x15) */
    byte  field_10;        /* 10 — chain attached to boss */
    byte  field_11[0x0B];  /* 11..1B */
    byte  field_1C;        /* 1C — config byte 0 (sound/music on) */
    byte  field_1D;        /* 1D */
    void far *field_1E;    /* 1E — current CMF/VOC sequence */
    byte  game_speed;      /* 22 */
    byte  field_23;        /* 23 */
    byte  input_mode;      /* 24 — joystick present flag (set from config) */
    byte  field_25;        /* 25 */
    byte  field_26;        /* 26 */
    byte  field_27;        /* 27 — up */
    byte  field_28;        /* 28 — down */
    byte  field_29;        /* 29 — left */
    byte  field_2A;        /* 2A — right */
    byte  field_2B;        /* 2B — fire-button held state (joystick/mouse/space/enter) */
    byte  field_2C;        /* 2C — input ack flag (post_message wait) */
    byte  field_2D;        /* 2D */
    byte  field_2E;        /* 2E */
    byte  field_2F;        /* 2F */
    byte  field_30;        /* 30 */
    byte  field_31[7];     /* 31..37 — gap */
    byte  field_38;        /* 38 — loop count (max 0x96) */
    byte  field_39;        /* 39 — sound count (max 0x27) */
    gm_loop  far *loops[0x96];   /* 3A..291 — sprite-loop table */
    gm_sound far *sounds[0x27];  /* 292..32D — sound-effect table */
    byte  field_32E[4];    /* 32E..331 — tail */
    /* 0x332 */

    game_manager(uchar far *rsc_name);          /* seg110e:0044 */
    ~game_manager();                            /* seg110e:0232 */
    void doit();                                /* seg110e:.... */
    void clear_flags();
    void joy_update();
    void reset_player(uchar);
    void turn_sound(uchar);
    void remove_sound(uchar far *name);
    void define_sound(uchar far *name, uchar type);
    gm_sound far *get_sound(uchar far *name);
    void play_sound_file(uchar far *);              /* seg110e:.... */
    void play_sound(uchar far *, uchar);            /* seg110e:.... */
    void reset_sound();                             /* seg110e:.... */
    void play_song(uchar far *);
    void stop_song();
    void pause_song();
    void continue_song();
    void play_voc(uchar far *);
    void play_voc_file(uchar far *);
    uchar voc_playing();
    voc_block far *load_voc(uchar far *name);
    pcs_note_seq far *load_pcs(uchar far *name);
    void play_pcs_file(uchar far *);
    void far *load_loop(uchar far *);       /* returns far ptr */
    void far *get_loop(uchar far *);
    void remove_loop(uchar far *);
};

struct tattr {                              /* 4-byte per-tile attribute record */
    word  attr;                             /* +0 — value compared by m_actor::on_tile */
    word  type;                             /* +2 — &0xC0=sw &0x300=door &0x3F=barrel &0xFC00=item */
};

/* --------------------------------------------------------------------------
 * tilemap — scrolling tile map. sizeof = 0x3A2
 * ------------------------------------------------------------------------ */
class tilemap {
public:
    int   viewport_x;      /* 00 */
    int   viewport_y;      /* 02 */
    int   viewport_w;      /* 04 */
    int   viewport_h;      /* 06 */
    int   map_x;           /* 08 */
    int   map_y;           /* 0A */
    int   field_0C;        /* 0C */
    int   field_0E;        /* 0E */
    int   field_10;        /* 10 */
    int   field_12;        /* 12 */
    int   map_w_pixels;    /* 14 = map_width*8 */
    int   map_h_pixels;    /* 16 = map_height*8 */
    int   field_18;        /* 18 */
    int   field_1A;        /* 1A */
    int   field_1C;        /* 1C */
    int   field_1E;        /* 1E */
    int   field_20;        /* 20 */
    int   field_22;        /* 22 */
    int   map_hdr[0x32];   /* 24..87 — 0x64-byte saved map header:
                              [0]=start_pos  [1]=finish_tile
                              [2]=end_door   [3]=end_door_pos
                              [4]=secret     [5..9]=?
                              [0A..1D]=teleport pairs (from,to)
                              [1E..27]=message pairs (pos,id) */
    byte  field_88;        /* 88 — palette-cycle param (add_cycle a) */
    byte  field_89;        /* 89 — palette-cycle param (add_cycle b) */
    byte  field_8A;        /* 8A — palette-cycle param (add_cycle c) */
    byte  field_8B;        /* 8B */
    byte  cycling;         /* 8C — palette cycling active */
    byte  field_8D;        /* 8D */
    int   map_width;       /* 8E (tiles) */
    int   map_height;      /* 90 */
    int   field_92;        /* 92 — cached window origin (map cells) */
    ulong map_size;        /* 94 (dword = map_width*map_height) */
    byte  far *map_data;   /* 98 (far ptr, 0x8000 bytes) */
    byte  palette[0x300];  /* 9C..39B */
    byte  exploded;        /* 39C (2 = ?) */
    byte  pad_39D;         /* 39D */
    tattr far *tile_attr;  /* 39E — far ptr to 4-byte recs; attr word at +2:
                              &0xC0=switch &0x300=door &0x3F=barrel &0xFC00=item */
    /* 0x3A2 */

    tilemap(uchar far *path, int w, int h);   /* seg1783:0006 */
    ~tilemap();                               /* seg1783:012F */
    void init_tables();                                   /* qv */
    void init_work_vars();                                /* qv */
    void set_viewport(int,int,int,int);                   /* qiiii */
    int  get_map_pos(int,int);                            /* qii */
    void new_map(uchar far *, int, int);                  /* qnucii */
    void reset_map();                                     /* qv */
    void download_tiles();                                /* qv */
    void update(uint);                                    /* qui */
    void explode();                                       /* qv */
    uchar center_on(uint,uint);                           /* quiui */
    void scroll(uchar);                                   /* quc */
    void set_position(int,int);                           /* qii */
    void save(uchar far *);                               /* qnuc */
    void load(uchar far *, uchar);                        /* qnucuc */
    void change_tile(ulong,uint);                         /* qului */
    void add_cycle(uchar,uchar,uchar);                    /* qucucuc */
    void turn_cycling(uchar);                             /* quc */
    void reset_palette(uchar);                            /* quc */
    void purge_tiles();                                   /* qv */
    uchar check_bounds(int*,int*,int*,int*);   /* qnit1t1t1 (model-default far int*) */
    void erase_bits(int,int,int,int);                     /* qiiii */
    void put_bits_masked(int,int,int,int,uchar far*,uint,uchar); /* qiiiinucuiuc */
};

/* --------------------------------------------------------------------------
 * vga_display — Mode-X display driver.
 * ------------------------------------------------------------------------ */
class vga_display {
public:
    byte  field_00;        /* 00 — ctor arg (display/page mode) */
    byte  field_01;        /* 01 — text shadow color/enable */
    byte  field_02;        /* 02 */
    byte  field_03;        /* 03 */
    byte  field_04;        /* 04 — text foreground color */
    byte  field_05;        /* 05 — palette cycling enabled */
    byte  field_06;        /* 06 — flag: suppress frame render? (start_room) */
    byte  field_07;        /* 07 — flag cleared in init_game */
    int   width;           /* 08 — 320 */
    int   height;          /* 0A — 200 */
    byte  field_0C;        /* 0C — cycle period (ticks per step) */
    byte  field_0D;        /* 0D — cycle frame index */
    byte  field_0E;        /* 0E — cycle tick counter */
    byte  field_0F;        /* 0F — cycle frame count (color range) */
    byte  field_10[0x300]; /* 10..30F — cycle frame LUT (field_0F rows of 0x30) */
    word  field_310;       /* 310 — cycle start color *3 */
    word  field_312;       /* 312 — cycle end color *3 */
    int   field_314;       /* 314 — cycle range *3 bytes (signed → idiv) */
    word  field_316;       /* 316 — cycle range *3 / 4 (dwords per frame) */
    /* 0x318 */

    vga_display(uchar);
    ~vga_display();
    void set_text_mode();
    void set_mode_x();
    uchar doit();                                       /* seg1891:05E0 */
    void copy_page(uchar src, uchar dst);
    void turn_cycling(uchar);
    uchar cycle();
    void setup_cycle(uchar,uchar,uchar);
    void set_pix(int,int,uchar);
    int  read_pix(int,int);
    void draw_span(int,int,uchar,int,uint);
    void pause(uint);                                   /* seg1891:08ED */
    void blank_palette();
    void fade_up();
    void fade_down();
    void set_palette();                                 /* seg1891:.... */
    void get_palette();
    void save_palette();
    void restore_palette();
    void print_at(int,int,uchar far*);
    void print_at_xy(int,int,uchar far*,uchar);
    void fill_rect(int,int,int,int,int,int,uchar);      /* seg1891:0A92 */
    void show_offset(uint);                             /* seg1891:0B0B */
    void cls(uchar,uchar);
    void far *get_bits(int,int,int,int);
    void copy_bits(int,int,int,int,int,int,uint,uint,uint,uint); /* seg1891:0BB9 */
    void put_bits(int,int,int,int,uchar far*,uint,uint);
    void put_bits_masked(int,int,int,int,uchar far*,uint,uint,uchar);
    void show_pcx(uchar far *path, uchar, uint, int);
    void dump_pcx();
    uchar far *load_pcx(uchar far *path, uint far *size);
    uchar far *explode_pcx(uchar far *src, uint size, int arg_10);
    void import_palette(uchar far *src, uint size);
};

/* --------------------------------------------------------------------------
 * ms_mouse — mouse driver wrapper. sizeof = 0x30
 *   00..03  button/event flags + shown flag
 *   04      cursor bitmap (far *)
 *   08      saved background / handler (far *)
 *   0C/0E   mouse x,y
 *   10/12   cursor hotspot
 *   14/16   saved display w/h
 *   18/1A   draw-time aligned x / cursor width
 *   1C..2F  REGPACK int86 buffer; 2C/2D/2E double as button flags (r_es/r_flags
 *           are unused by the int33 functions we call)
 * ------------------------------------------------------------------------ */
class ms_mouse {
public:
    byte  field_00;        /* 00 — any button pressed */
    byte  field_01;        /* 01 — event pending (set by handler) */
    byte  field_02;        /* 02 — cursor currently shown */
    byte  field_03;        /* 03 */
    uchar far *field_04;   /* 04 — cursor bitmap */
    void  far *field_08;   /* 08 — saved bg bits */
    int   field_0C;        /* 0C — mouse x (init 0xA0) */
    int   field_0E;        /* 0E — mouse y (init 0x64) */
    int   field_10;        /* 10 — hotspot x */
    int   field_12;        /* 12 — hotspot y */
    int   field_14;        /* 14 — saved display width */
    int   field_16;        /* 16 — saved display height */
    int   field_18;        /* 18 — aligned x during draw */
    int   field_1A;        /* 1A — cursor width during draw */
    union REGS regs;       /* 1C..2B — int86 in/out image (ax,bx,cx,dx,si,di,cflag,flags) */
    byte  field_2C;        /* 2C — left-button flag */
    byte  field_2D;        /* 2D — right-button flag */
    byte  field_2E;        /* 2E — mouse-present flag */
    byte  field_2F;        /* 2F */
    /* sizeof = 0x30 */

    ms_mouse();
    ~ms_mouse();
    void set_cursor(uchar far *, int, int);
    uchar get_event();
    void set_coords(int,int);
    void show();
    void hide();
    uchar button_press(uchar);
    uchar in_box(int,int,int,int);
    uchar pressed_in_box(int,int,int,int);
    uchar doit();
    void get_status();
};

/* --------------------------------------------------------------------------
 * GUI classes (seg137f).  All derive from gui_item {vptr,02..13}.
 *   vtable: [0]=draw [1]=erase  (poll added as slot 2 by interactive items)
 * gui_item: sizeof = 0x14
 * ------------------------------------------------------------------------ */
class gui_item {
public:
    word  field_02;        /* 02 — x1 / x */
    word  field_04;        /* 04 — y1 / y */
    word  field_06;        /* 06 — height (y-extent) */
    word  field_08;        /* 08 — width  (x-extent) */
    word  field_0A;        /* 0A — item count */
    word  field_0C;        /* 0C */
    uchar far *field_0E;   /* 0E — saved-bits buffer (get_bits) / data ptr */
    byte  field_12;        /* 12 */
    byte  field_13;        /* 13 */
    /* sizeof = 0x14 */

    gui_item();
    ~gui_item();
    virtual void draw();
    virtual void erase();
    uchar poll();              /* non-virtual stub (seg0b2c:0004) — returns 0 */
};

/* pull_down item — 0xA bytes, allocated with new char[0xA] */
struct pull_down_item {
    uchar far *s;            /* +0 — label text */
    byte  enabled;           /* +4 — 1 = selectable */
    byte  _pad5;             /* +5 */
    void  (far *cb)(void);   /* +6 — item callback */
};

class pull_down : public gui_item {
public:
    pull_down_item far *items[20]; /* 14..63 — pull_down_item* (dword each) */
    uchar far *field_64;   /* 64 — title string */
    byte  field_68;        /* 68 — title pixel width (strlen*8+1) */
    byte  field_69;        /* 69 — pad */
    int   field_6A;        /* 6A — cur_selection (-1 = none), signed */
    word  field_6C;        /* 6C */
    /* sizeof = 0x6E */

    pull_down(uchar far *);
    void add_item(uchar far *, void far *);
    virtual void draw();
    uchar activate();
    void update_cur_selection();
    void erase_cur_selection();
    uchar get_mouse_sel_location();
    void increase_cur_selection();
    void decrease_cur_selection();
    virtual uchar poll();
};

class menu_bar : public gui_item {
public:
    byte  field_14;        /* 14 — poll result byte (1=left,2=right,0x80=redraw) */
    byte  field_15;        /* 15 */
    int   field_16;        /* 16 — active pull_down index (-1 = none) */
    pull_down far *items[20]; /* 18..67 — pull_down* array */
    byte  field_68;        /* 68 — already-drawn flag */
    byte  field_69;        /* 69 */
    /* sizeof = 0x6A */

    menu_bar();
    void add_item(pull_down far *);
    virtual void draw();
    virtual void erase();
    virtual uchar poll();
    void toggle_item(uchar far *, uchar far *, uchar);
};

class button : public gui_item {
public:
    uchar far *field_14;   /* 14 — label string (far) */
    int   field_18;        /* 18 — x pos */
    int   field_1A;        /* 1A — y pos */
    int   field_1C;        /* 1C */
    int   field_1E;        /* 1E */
    int   field_20;        /* 20 — armed/pressed state */
    void  far *field_22;   /* 22 — user data/callback */
    /* sizeof = 0x26 */

    button(uchar far *, void far *, uchar);
    ~button();
    virtual void draw();
    virtual uchar poll();
    void mouse_to_me(void);
};

class file_box;
class button;
class text_box : public gui_item {
public:
    /* gui_item 00..13; text_box fields 14..8D */
    int   field_14;        /* 14 — bitmap width (x-extent; signed /2 in draw) */
    int   field_16;        /* 16 — bitmap height (y-extent) */
    file_box far *field_18;/* 18 — embedded file_box ptr */
    uchar far *field_1C[20];/* 1C..6B — string ptr array (count = field_0A) */
    byte  field_6C;        /* 6C */
    byte  field_6D;        /* 6D */
    uchar far *field_6E;   /* 6E — bitmap ptr */
    uchar far *field_72;   /* 72 — title string */
    byte  field_76;        /* 76 — button count */
    byte  field_77;        /* 77 */
    byte  field_78;        /* 78 */
    byte  field_79;        /* 79 */
    button far *buttons[4];/* 7A..89 — button array (dword each) */
    byte  field_8A, field_8B, field_8C, field_8D; /* 8A..8D */
    /* sizeof = 0x8E */

    text_box(uchar far *);
    ~text_box();
    virtual void draw();
    virtual void erase();
    virtual uchar poll();
    void add_bitmap(int,int,uchar far *);
    void add_string(uchar far *);
    void add_file_box(uchar far *);
    void add_button(uchar far *, void far *);
};

class prompt_box : public gui_item {
public:
    uchar far *field_14;   /* 14 — prompt label (drives box width) */
    uchar far *field_18;   /* 18 — title string */
    byte  field_1C;        /* 1C */
    byte  field_1D;        /* 1D */
    uchar far *field_1E;   /* 1E — edit buffer (new char[0x1E]) */
    byte  field_22;        /* 22 — max length */
    byte  field_23;        /* 23 — pad (word-aligns field_24) */
    word  field_24;        /* 24 — atoi() result */
    int   field_26;        /* 26 — edit box x */
    int   field_28;        /* 28 — edit box y */
    /* sizeof = 0x2A */

    prompt_box(uchar far *);
    ~prompt_box();
    virtual void draw();
    virtual uchar poll();
    void update_text(uchar far *);
};

class file_box : public gui_item {
public:
    uchar far *field_14;   /* 14 — path/mask */
    char  field_18[0x1E];  /* 18..35 — inline current-dir + mask buffer */
    uchar far *field_36;   /* 36 — selected path (dword) */
    char  field_3A[2];     /* 3A — down-arrow glyph "\x1F" */
    char  field_3C[2];     /* 3C — up-arrow glyph "\x1E" */
    int   field_3E;        /* 3E — selection (-1) */
    int   field_40;        /* 40 — up-arrow rect x1 */
    int   field_42;        /* 42 — up-arrow rect x2 */
    int   field_44;        /* 44 — up-arrow rect y1 */
    int   field_46;        /* 46 — up-arrow rect y2 */
    int   field_48;        /* 48 — down-arrow rect x1 */
    int   field_4A;        /* 4A — down-arrow rect x2 */
    int   field_4C;        /* 4C — down-arrow rect y1 */
    int   field_4E;        /* 4E — down-arrow rect y2 */
    uchar far *field_50[256]; /* 50..44F — file list (count=field_0A) */
    byte  field_450;       /* 450 */
    byte  field_451;       /* 451 */
    byte  field_452;       /* 452 */
    byte  field_453, field_454, field_455; /* 453..455 */
    /* sizeof = 0x456 */

    file_box(uchar far *);
    ~file_box();
    uchar far *current_directory(uchar far *);
    virtual void draw();
    void update();
    void draw_arrows();
    void poll_arrows();
    virtual uchar poll();
};

class text_pager : public gui_item {
public:
    /* gui_item 00..13 only — sizeof = 0x14; inherits gui_item vtable (no own
     * virtuals — poll resolves to the non-virtual gui_item::poll stub) */
    text_pager(uchar far *path, uchar, void (far *)(uchar));
    ~text_pager();
};

/* level descriptor table — seg2608:0228 (_all_maps), 24 entries × 20 bytes. */
struct level_def {
    uchar far *map;        /* +00  "1-1.m" ... */
    uchar far *song;       /* +04  "1.cmf" ... */
    uchar far *password;   /* +08  "1", "UR2GD" ... */
    uchar far *title;      /* +0C  "Micro Menace" ... */
    void (far *start_up)(void);   /* +10  boss init or NULL */
};

/* ==========================================================================
 * GLOBALS (seg2608 offsets in comments)
 * ========================================================================== */
extern game_manager far *the_game;      /* 365A */
extern game_cast   far *the_cast;
extern level_def  all_maps[];
extern byte       all_secrets[];         /* seg2608:0224 — {secret,origin} pairs */
extern vga_display far *display;        /* 4788 */
extern ms_mouse    far *mouse;
extern menu_bar    far *the_menu_bar;
extern tilemap     far *the_map;        /* 3822 */

extern m_actor far *ego;                /* 34A8 */
extern m_actor far *jason;              /* 34B0 */
extern m_actor far *cur_sub;
extern m_actor far *boss;
extern m_actor far *act;
extern m_actor far *end_door_ptr;

extern byte debug_mode;                 /* 3512 — db */
extern byte debug;                      /* 25C0 — debug counter */
extern byte force_pc_sound;             /* 3662 — db */
extern byte zoom_to_map;                /* 34D3 — db */
extern byte game_in_progress;           /* 34BF — db */
extern byte god_mode;                   /* 34DD — db */
extern byte cheat_mode;                 /* 34E3 — db */
extern long score;                      /* 350E — dword */
extern byte score_count;                /* 34D4 — db */
extern byte men;                        /* 34CA — db */
extern byte gun_count;                  /* 34D8 — db */
extern byte gun_pieces_xy[8];           /* 0094 — 4 gun slot (x,y) pairs */
extern byte auto_fire_count;            /* 34D7 — db */
extern byte jason_fire;                 /* 34DC */
extern byte auto_fire;                  /* 34D6 */
extern byte top_fire;                   /* 34D5 */
extern byte shot_size;                  /* 34D0 */
extern byte jason_on;                   /* 3524 */
extern byte jason_present;              /* 3525 */
extern byte maximum_jason_power;        /* 34DA — db */
extern byte jason_power;                /* 34D9 — db */
extern int  shld_supply;                /* 34E6 — dw */
extern int  air_supply;                 /* 34E4 — dw */
extern byte air_count;                  /* 34CB — db */
extern byte air_speed;                  /* 34CC — db */
extern byte cur_map;                    /* 34D2 — db */
extern byte stop_room;                  /* 351A — db */
extern byte system_bench;               /* 34CD — db */
extern byte displayed_page;             /* 3526 */
extern byte non_displayed_page;         /* 3527 */
extern int  page_offsets[2];
extern byte control;                    /* 34CE — db */
extern int  heavy_timer;                /* 34F8 — dw */
extern byte enemies_killed;             /* 3521 — db */
extern byte goodies_found;
extern void far score_at(int,int,int);        /* seg03f9:.... */              /* 3520 — db */
extern byte enemy_count;                /* 351E — db */
extern byte goody_count;                /* 351F — db */
extern byte got_key;
extern int  start_x, start_y;           /* 34E8/34EA — dw */
extern byte ego_x_speed;                /* 34BD — db */
extern byte ego_y_speed;                /* 34BE — db */
extern int  ego_map_w;                  /* 34F2 — dw */
extern int  ego_map_h;                  /* 34F4 — dw */
extern byte message_count;              /* 3523 — db */
extern byte message_posted;             /* 3522 — db */
extern int  cur_message;                /* 34F6 — dw */
extern int  map_messages[40];           /* 34FA — words */
extern byte gr_keys[];                  /* 2D3AB — scancode state table; [0x1C]=ENTER */
extern uchar far *all_messages[];       /* 009C — dd: message string table */
extern byte teleport_count;             /* 351B — db */
extern int  all_teleports[20][2];       /* 362E — 20 (entry,dest) pairs */
extern byte shootable_count;                /* 351D — db */
extern m_actor far *shootable_list[30];
extern byte barrier_count;                  /* 351C — db */
extern m_actor far *barrier_list[35];
extern byte ed_list_size;                 /* count of actors currently in-window */
extern word tbl_mul_tw[];
extern word word_2BA84[];
extern word word_2BA88[];                 /* seg2608:3828 — 2-entry direction probe table */                 /* seg2608:3824 — row-offset table base (one elem before tbl_mul_tw) */                 /* tile-row -> linear map offset multiply table */
extern word tbl_mul80[];                  /* seg2608:39B6 — i*80 row table */
extern word tbl_tile_src[];               /* seg2608:3BB6 — tile->src offset table */
extern byte map_exploded;                 /* seg2608:4786 — db */
extern m_actor far *ed_list[100];
extern byte pd_redraws;                 /* 380C — db */
extern int  show_box_on;
extern byte menu_bar_height;
extern text_box far *show_box;           /* 3804 */
extern byte maximum_text_length;        /* 380B — db */
extern uchar (far *i_external_left)(void);
extern uchar (far *i_external_right)(void);
extern uchar (far *i_external_up)(void);
extern uchar (far *i_external_down)(void);
extern uchar (far *i_external_button)(void);
extern void (far *exit_routine)(void);
extern byte disable_exit_routine;
extern int  resume;
extern byte saw_title_screen;
extern byte smart_missiles;             /* 34DE — db */
extern byte death_type;                 /* — db */
extern uchar src[];                     /* 0F2A — "egodie2.l" */
extern int  finish_tile, end_door_tile, secret_tile;  /* 34EC/34EE/34F0 dw */
extern byte top_shot_count, shot_count, jason_count;  /* 34D1/34CF/34DB db */
extern byte jason_msg, barrel_msg, gun_msg, cave_msg;
extern int  diff_x, diff_y;
extern int  space_bar_been_up;
extern byte zapper_count;               /* 3515 — db */
extern m_actor far *end_door_ptr;       /* 34AC — far ptr */
extern m_actor far *boss;               /* 34B8 — far ptr */
extern byte palette[768];
extern byte old_palette[768];
extern byte spare_palette[768];
extern void far *gun_underbits;         /* 34C2 far ptr */
extern void far *jguage_underbits;      /* 34C6 far ptr */
extern byte _tmp[];        /* 51CC — scratch buffer global */
extern char _tmp2[];       /* 53C0 — second scratch buffer (ltoa target) */
extern char s1[];         /* 1313 -> _s1 "Debug" menu title */
extern byte _resume;      /* 3513 — menu resume flag */
extern byte byte_2D3AC;   /* 514C — key/scan state for menu wait loops */
extern byte byte_2D3C7;   /* 5167 — input flag (wait-for-release loops) */
extern byte byte_2D3E4;   /* 5184 — input flag (wait-for-release loops) */
extern void far *cur_sound;
extern void interrupt (*theirhandler)(...); /* 3664 — saved int8 vector */
extern uchar far *new_map_name;         /* 351A? — far ptr (string) */
extern byte _m_dont_handle;             /* 380A — db, suppress mouse-handler redraw */
extern byte default_mouse[];            /* 2314 — default cursor bitmap */
extern int  word_2C9EA;                 /* 478A — dw, vga page/segment arg */

/* high-score table — 10 records, 16-byte stride (0xA0 bytes) */
struct score_entry {
    char  name[10];                     /* +00 */
    ulong score;                        /* +0A */
    byte  field_0E;                     /* +0E */
    byte  field_0F;                     /* +0F */
};
struct score_line { char s[0x14]; };    /* 20-byte display line */
extern score_entry _game_highs[10];     /* 5096 — _game_highs */
extern ulong _high_score;               /* 5136 */
extern "C" score_line unk_2A7EC;        /* 258C — blank line template */

/* ==========================================================================
 * FUNCTION PROTOTYPES — seg03f9 (this module) and externs from other modules
 * ========================================================================== */

/* seg03f9 — game.cpp */
int  main(int, char **, char **);
void init_game(void);
void play_game(uchar map_id);
void setup_secret_level(void);
void exit_secret_level(void);
void start_title_loop(void);
void start_room(uchar far *);
void show_prelude(void);
void de_doit(void);
void end_room(void);
void end_game(void);
void parse_options(int, uchar **);
uchar far de_left(void);    /* seg03f9:6928 — poll "left" input state */
uchar far de_right(void);   /* seg03f9:694A — poll "right" input state */
uchar far de_up(void);      /* seg03f9:696C — poll "up" input state */
uchar far de_down(void);    /* seg03f9:698E — poll "down" input state */
uchar de_button(void);
extern byte byte_2D3F3;     /* seg2608:5193 — input state (up) */
extern byte byte_2D3F6;     /* seg2608:5196 — input state (left) */
extern byte byte_2D3F8;     /* seg2608:5198 — input state (right) */
extern byte byte_2D3FB;     /* seg2608:519B — input state (down) */
void clear_message(void);
void update_shld_guage(int,int,int);
void update_air_guage(int,int,int);
void update_score(int,int);
void update_men(void);
void update_gun(void);
void update_key_guage(void);
void update_jason_guage(void);
void update_boss_guage(void);                            /* seg03f9:41DD */
void kill_ego(int,int);                                  /* seg03f9:1A65 */
void kill_jason(void);                                   /* seg03f9:3744 */
struct msl_def {                              /* 22-byte projectile record (seg2608:00EC) */
    uchar far *snd;      /* +00 */
    uchar far *spr_l;    /* +04 (direction==1) */
    uchar far *spr_r;    /* +08 */
    uchar v0;            /* +0C -> health */
    uchar v1;            /* +0D -> counter_26 */
    uchar v2;            /* +0E -> counter_24 */
    uchar pad0F;         /* +0F */
    void  far *link;     /* +10 -> field_4E */
    uchar flag;          /* +14 -> flag_7 */
    uchar pad15;         /* +15 */
};
extern msl_def _all_projectiles[];             /* seg2608:00EC */
extern uchar far *_all_explosions[][2];        /* seg2608:01F4 {sprite,sound} */
extern void far do_missle(m_actor far *);
extern void far do_exp(m_actor far *);
void add_bubble(int,int,int);                            /* seg03f9:3209 */
void post_message(uchar);                                /* seg03f9:1DFA */
void show_loop(uchar far *, int, int, uchar, uint);      /* seg03f9:6827 */
void vga_text(int, int, uchar far *, uchar, uchar);      /* seg1891:.... */
void add_switch(uint,uint);
void add_door(uint,uint);
void add_barrel(uint,uint);
void add_map_item(uint,uint);
void add_map_pup(uint,uint);
void get_map_coords(uint, int far *, int far *);
void hook_up_switches(void);
void add_jason(void);
void check_user(void);
void check_guages(void);
void kill_ego(int,int);
void add_explosion(int,int,uchar,uchar far *);               /* seg03f9:32AF */
void add_missile(m_actor far *, uchar, int);                  /* seg03f9:33C9 */
void activate_menu_bar(void);
void ego_fire(void);
void turn_ego(void);
void teleport_to(uint);
void show_stats(void);
void wait_for_user(void);
int  random(int);                       /* 7280 — game-local helper */
int  abs(int);                          /* 72A4 — game-local helper */
int  atoi(const uchar *);                   /* 72EC — game-local helper */

/* seg0b2c — actor AI / movement (extern) */
extern void far do_ego(m_actor far *);
extern void far mv_ego(m_actor far *, int far *, int far *);
extern void far do_score(m_actor far *);
extern void far do_coin(m_actor far *);
extern void far do_pod(m_actor far *);
extern void far mv_std(m_actor far *, int far *, int far *);
extern void far mv_bs2tn(m_actor far *, int far *, int far *);
extern void far do_bs1(m_actor far *);
extern void far do_bs2(m_actor far *);
extern void far do_bs2tn(m_actor far *);
extern void far do_bs2_eyes(m_actor far *);
extern void far do_bs3(m_actor far *);
extern void far do_bs3a(m_actor far *);
extern void far do_bs3_prop(m_actor far *);
extern void far do_bs3_face(m_actor far *);
extern void far do_mine1(m_actor far *);
extern void far do_zapper(m_actor far *);
extern void far do_fish(m_actor far *);
extern void far do_tulip(m_actor far *);
extern void far do_chest(m_actor far *);
extern void far do_duct_lr(m_actor far *);
extern void far do_duct_ud(m_actor far *);
extern void far do_pirana(m_actor far *);
extern void far mv_pirana(m_actor far *, int far *, int far *);
extern void far do_block(m_actor far *);
extern void far do_face(m_actor far *);
extern void far do_serpent(m_actor far *);
extern void far mv_pace(m_actor far *, int far *, int far *);
extern void far do_crab(m_actor far *);
extern void far do_gun_piece(m_actor far *);
extern void far do_jelly(m_actor far *);
extern void far do_shark(m_actor far *);
extern void far mv_shark(m_actor far *, int far *, int far *);
extern void far do_tentacle(m_actor far *);
extern void far do_spikes(m_actor far *);
extern void far do_fire_pit(m_actor far *);
extern void far do_shuttle(m_actor far *);
extern void far do_clam(m_actor far *);
extern void far do_cannon(m_actor far *);
extern void far do_ship(m_actor far *);
extern void far mv_ship(m_actor far *, int far *, int far *);
extern void far do_pup(m_actor far *);
extern void far mv_barrel(m_actor far *, int far *, int far *);
extern void far do_barrel(m_actor far *);
extern void far do_switch(m_actor far *);
extern void far do_door(m_actor far *);
extern void far do_bubble(m_actor far *);
extern void far do_probe(m_actor far *);
/* seg0b2c collision/ray helpers */
extern void far hit_cur_sub(int, int);
extern void far set_flying_death(m_actor far *, uchar far *, int, int, uchar);
extern void far check_flying_death(m_actor far *);
extern byte far check_for_hit(m_actor far *, uchar);
extern byte far check_vertical_ray(m_actor far *, uint);
extern byte far check_horizontal_ray(m_actor far *, uint);
extern int  far check_new_pos(m_actor far *, int, int, int far *, int far *, int, int, int);
extern void far scroll_to(m_actor far *);                     /* seg0b2c */
extern byte far touching(m_actor far *, m_actor far *);       /* seg0b2c */

/* seg110e — game_manager module helpers (extern) */
extern "C" void gr_start_kbd_grab(void);
extern "C" void gr_end_kbd_grab(void);
extern byte quick_quit;                 /* 2D3EF — db = gr_keys[0x44] (F10) skips quit confirm */
extern "C" void set_exit_routine(void (far *)(void));
extern "C" int  gr_inkey(void);         /* seg1a07 — read key via BIOS buffer + getch */
extern "C" void interrupt far gr_int9(...); /* seg1a07 — int9 ISR (gr_keys + chain) */
extern void interrupt (*gr_old_int9)(...);  /* seg2608:5142 — saved int9 vector */
extern int  first_time;                 /* seg2608:25BE — atexit registered once */
extern word far *fp_kbd_head;           /* seg2608:513A — -> BIOS kbd head (0040:001A) */
extern word far *fp_kbd_tail;           /* seg2608:513E — -> BIOS kbd tail (0040:001C) */
extern void terminate(uchar far *, uchar far *);
extern void pause(uint);                    /* seg1a1e — timer pause */
extern "C" void forcepal(byte far *, int);  /* seg1c64 asm — palette load */
extern unsigned long coreleft(void);        /* library */

/* seg1891 / display + interface (extern) */
extern void init_display(uchar);
extern void load_resources(void);
extern void setup_options(void);
extern void init_scores_array(void);
extern void init_scores_file(void);                            /* seg19df:0063 */
extern void save_all_scores(void);                             /* seg19df:00B8 */
extern uchar far *return_element(uchar, uchar);                /* seg19df:0211 */
extern uchar i_yes_cancel(uchar far *, uchar);                  /* seg137f:0382 */
/* seg1a1e — resource-element file layer + text-form renderer (seg0fa9) */
extern void  far read_error(uchar far *path);                   /* seg1a1e:00DD */
extern long  far g_open_element(uchar far *path);               /* seg1a1e:0123 — returns file len or -1 */
extern long  far g_element_read(void far *buf, uint len);       /* seg1a1e:019A */
extern void  far g_close_element(void);                         /* seg1a1e:01F6 */
extern void  far print_form(uchar far *path, uchar);            /* seg0fa9:007C */
extern FILE  _stream;            /* 2EF0 — printer output stream (stdprn) */
extern "C" char far *itoa(int, char far *, int);
extern "C" char far *ultoa(unsigned long, char far *, int);
extern "C" char far *strset(char far *, int);
extern "C" char far *strcat(char far *, const char far *);
extern char _src[];    /* 182D — "." rank suffix */
extern "C" void my_movsd(void far*, void far*, uint); /* far dword array move (seg1a1e) */
extern void no_heap(uchar far *);                        /* out-of-memory handler */
extern "C" void far *memcpy(void far *, const void far *, uint);
extern void load_scores_in(void);
extern void i_init_interface(void far *, void far *, void far *,
                             void far *, void far *);
extern void i_set_text(uchar, uchar, uchar, uchar);
extern void i_poll_interface(void);                    /* seg137f:0075 */
extern "C" unsigned long farcoreleft(void);          /* seg0000:2080 RTL */
extern int  i_inform(uchar far *, uchar, uchar far *);            /* seg137f:046A */
extern int  i_get_int(uchar far *, uchar far *);                  /* seg137f:00E9 */
extern void i_show_box(uchar far *, int, int, uchar far *, uchar far *);   /* seg137f:0540 */
extern void i_no_imp(void);                                       /* seg137f:00D2 */
extern void parse_box_string(text_box far *, uchar far *);        /* seg137f:0604 */
extern void release_box_strings(text_box far *);                  /* seg137f:06DB */
extern void draw_shadow_box(int, int, int, int);                  /* seg137f:0712 */
extern void high_light(int, int, int, int, uchar far *, int, int, uchar); /* seg137f:079D */

/* ---- seg1891 vga_display externs ------------------------------------------- */
/* Mode-X low-level raster ops (seg1a88) */
extern "C" void x_set_pix(int, int, int, int);          /* _x_set_pix */
extern "C" int  x_read_pix(int, int, int);              /* _x_read_pix */
extern "C" void x_draw_span(int, int, int, uint, int);  /* _x_draw_span */
extern "C" void x_fill_rect(int, int, int, int, int, int); /* _x_fill_rect */
extern "C" void x_show_offset(uint);                    /* _x_show_offset */
extern "C" void x_set320x200(void);                     /* _x_set320x200 */
extern "C" void x_get_bits(int,int,int,int,int,void far*);   /* _x_get_bits */
extern "C" void x_put_bits(int,int,int,int,int,int,uchar far*,int,int,int); /* _x_put_bits */
extern "C" void x_vid2vid(int,int,int,int,int,int,uint,uint,uint,uint); /* _x_vid2vid */
extern "C" void x_put_bits_masked(int,int,int,int,int,int,uchar far*,int,int,int); /* _x_put_bits_masked */
extern "C" void x_put_bits_masked2(int,int,int,int,int,int,uchar far*,int,int,int); /* _x_put_bits_masked2 */
extern "C" void x_put_bits_masked_color(int,int,int,int,int,int,uchar far*,int,int,int,uchar); /* _x_put_bits_masked_color */
extern "C" void x_update_map(uint,uint,uint,uint);                /* _x_update_map */
extern "C" void x_explode_map(uint,uint,tattr far*,uint,word far*,word far*); /* _x_explode_map */
extern void beep(void);                                           /* @beep$qv */
extern byte request_mem(ulong);                                   /* @request_mem$qul — seg1a1e:00A0 */
extern word tbl_tile_dst[];               /* tile->dst VGA offset table */
/* palette helpers (seg1c64) */
extern "C" void palup(byte far *);                       /* _palup */
extern "C" void paldown(byte far *);                     /* _paldown */
extern "C" void nullpal(void);                           /* _nullpal */
/* WoRx resource element API is declared above (g_open_element/g_element_read/
   g_close_element, read_error at ~802). */
extern void write_error(uchar far *);
/* vga_display globals */
extern int  download_pos;                                /* _download_pos */
extern uchar far *system_font_ptr;                       /* _system_font_ptr (off) / +2 (seg) */
extern void i_hide_box(uchar);                                             /* seg137f:0603 */
extern "C" int joystickbutton(int);                                        /* seg2286 — BIOS joy */
extern uchar far *i_get_string(uchar far *, uchar far *);
extern uchar far *i_load_file(uchar far *, uchar far *);   /* seg137f:0212 */
extern uchar is_record(ulong);                              /* seg19df:.... */
extern void save_new_score(ulong, uchar far *, uchar);      /* seg19df:.... */
extern void show_high_scores(uchar);                        /* seg19df:.... */
extern void cb_quit(void);

/* library */
extern "C" long clock(void);

/* --------------------------------------------------------------------------
 * seg2286 — WoRx sound + input library (extern "C", far). Addresses verified.
 * ------------------------------------------------------------------------ */
extern "C" {
    int   far startworx(void);                                  /* 084A */
    int   far startresource(uchar far *name);                   /* 082A */
    void  far closeworx(void);                                  /* 0069 */
    int   far dspreset(void);                                   /* 0460 */
    void  far dspclose(void);                                   /* 0445 */
    int   far adlibdetect(void);                                /* 040B */
    void  far vochooksetting(int);                              /* 0A62 */
    void  far setfmvolume(int, int);                            /* 036D */
    void  far setvocvolume(int, int);                           /* 0342 */
    void  far setchannelvolume(int, int);                       /* 0795 */
    int   far openelement(void far *name);                      /* 00D7 */
    uint  far elementread(void far *buf, uint len);             /* 00A8 */
    void  far *far getsequence(void far *);                     /* 049B */
    void  far playcmfblock(void far *);                         /* 0699 */
    void  far stopsequence(void);                               /* 087A */
    void  far continuesequence(void);                           /* 021D */
    void  far playvocblock(void far *);                         /* 060F */
    void  far playvocfile(uchar far *name);                     /* 06E3 */
    void  far stopvoc(void);                                    /* 0895 */
    int   far vocplaying(void);                                 /* 08E8 */
    void  far joystickupdate(void);                             /* 0398 */
    int   far joystickx(void);                                  /* 03D1 */
    int   far joysticky(void);                                  /* 03EE */
}
extern "C" int   far printf(const char far *, ...);             /* seg0000:35EA */
extern "C" void  far farfree(void far *);                       /* seg0000:1C4E */

/* seg110e — WoRx/resource globals + callbacks */
extern byte   ticks18_2;                                        /* 3668 */
void interrupt far pc_sound_doit(...);                          /* seg110e:03D2 isr */
extern int   far gm_open(uchar far *name);                      /* seg110e:000E */
extern ulong far gm_read(void far *buf, uint len);              /* seg110e:0023 */
extern void  far set_external_open(void far *);                 /* seg1a1e:0109 */
extern void  far set_external_read(void far *);                 /* seg1a1e:0116 */
extern int   g_handle;                                          /* seg2608:25C2 — element handle */
extern long  far (*external_open)(uchar far *);                 /* seg2608:25C4 — pluggable opener */
extern long  far (*external_read)(void far *, uint);            /* seg2608:25C8 — pluggable reader */

/* seg137f — mouse ISR + software-cursor helpers */
void far mouse_handler(void);                                   /* 0C1D int33 cb */
void far draw_mouse(void);                                      /* 0CC4 */
void far erase_mouse(void);                                     /* 0DA6 */

#endif /* RIPTIDE_H */
