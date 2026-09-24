/* ==========================================================================
 * seg1a1e — system utilities + WoRx external-element dispatch layer.
 *
 * beep / pause are speaker + vertical-retrace helpers.  terminate() is the
 * fatal-error path (restore text mode, print, unhook int9, exit).  no_heap /
 * read_error / write_error are thin terminate() wrappers.
 *
 * The g_*_element functions are the resource-element file layer.  By default
 * they open/read/close a real file via _g_handle; game_manager installs
 * external_open/external_read (gm_open/gm_read) so the same call sites read
 * elements out of the packed WoRx archive instead.
 * ======================================================================== */
#include "riptide.h"

/* seg2608 globals (g_handle/external_open/external_read) are owned by the
 * data segment and declared extern in riptide.h. */


/* seg1a1e:0001 — short speaker beep (400 Hz, 100 ms). */
void beep(void)
{
    sound(400);
    delay(100);
    nosound();
}


/* seg1a1e:001C — fatal error.  Restore 80x25 text mode, print the message
 * (with optional detail string), unhook the keyboard grabber, exit(1). */
void terminate(uchar far *a, uchar far *b)
{
    union REGS regs;

    regs.x.ax = 3;                                /* BIOS mode 3 — text */
    int86(0x10, &regs, &regs);
    if (b)
        printf("%s %s\n", a, b);
    else
        printf("%s\n", a);
    gr_end_kbd_grab();
    exit(1);
}


/* seg1a1e:007B — retrace-synced pause: one full vsync pulse per count. */
void pause(uint n)
{
    while (n--) {
        while (inportb(0x3DA) & 8)  ;             /* wait for vsync to clear */
        while (!(inportb(0x3DA) & 8));            /* wait for vsync to start */
    }
}


/* seg1a1e:00A0 — is at least `size` bytes of conventional heap free? */
byte request_mem(ulong size)
{
    ulong avail;

    avail = coreleft();
    return size <= avail;
}


/* seg1a1e:00C7/00DD/00F3 — fatal-error wrappers around terminate(). */
void no_heap(uchar far *path)     { terminate((uchar far *)"Out of heap : ", path); }
void read_error(uchar far *path)  { terminate((uchar far *)"Read error : ", path); }
void write_error(uchar far *path) { terminate((uchar far *)"Write error : ", path); }


/* seg1a1e:0109/0116 — install the pluggable element open/read hooks. */
void set_external_open(void far *fn)
{
    external_open = (long far (*)(uchar far *))fn;
}
void set_external_read(void far *fn)
{
    external_read = (long far (*)(void far *, uint))fn;
}


/* seg1a1e:0123 — open a resource element; returns its length, or -1. */
long g_open_element(uchar far *path)
{
    long res;

    if (external_open)
        return external_open(path);
    if (g_handle != -1)
        terminate((uchar far *)"Request to open more than one element.", 0);
    g_handle = open(path, 0x8001);
    if (g_handle == -1)
        res = -1;
    else
        res = filelength(g_handle);
    return res;
}


/* seg1a1e:019A — read `len` bytes of the open element into `buf`. */
long g_element_read(void far *buf, uint len)
{
    uint n;

    if (external_read)
        return external_read(buf, len);
    if (g_handle == -1)
        terminate((uchar far *)"Element not open.", 0);
    n = read(g_handle, buf, len);
    return n;
}


/* seg1a1e:01F6 — close the open element (direct-file mode only). */
void g_close_element(void)
{
    if (external_open == 0 && g_handle != -1) {
        close(g_handle);
        g_handle = -1;
    }
}
