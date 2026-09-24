/* ==========================================================================
 * seg1a07 — keyboard grabber / int9 ISR.
 *
 * gr_start_kbd_grab installs gr_int9 on IRQ1 (int 9), which mirrors every
 * scancode into gr_keys[] and flushes the BIOS buffer, then chains to the
 * saved handler.  F10 fires the global exit_routine.  gr_end_kbd_grab puts the
 * original vector back.  gr_inkey() drains a pending key through getch.
 * ======================================================================== */
#include "riptide.h"
#include <dos.h>

/* stdlib.h is excluded (own abs/atoi); declare the RTL entry points used. */
extern "C" int  _Cdecl atexit(void (_Cdecl *)(void));

/* All seg2608 globals (gr_old_int9/first_time/fp_kbd_head/fp_kbd_tail) are
 * owned by the data segment and declared extern in riptide.h. */


/* seg1a07:000F — register the global F10 exit hook. */
void set_exit_routine(void (far *fn)(void))
{
    exit_routine = fn;
}

/* seg1a07:001C — return a pending key (0 = none).  Extended keys come back in
 * the high byte.  Drains the BIOS buffer (head := tail) under cli. */
int gr_inkey(void)
{
    int res = 0;
    word far *head, far *tail;

    head = (word far *)0x40001A;
    tail = (word far *)0x40001C;
    disable();                                    /* cli */
    if (*head != *tail) {                         /* buffer non-empty? */
        res = getch();
        if (res == 0)
            res = getch() << 8;                   /* extended scancode */
        *head = *tail;                            /* flush buffer */
    }
    enable();                                     /* sti */
    return res;
}

/* seg1a07:0071 — restore the original int9 handler. */
void gr_end_kbd_grab(void)
{
    setvect(9, gr_old_int9);
}

/* seg1a07:0088 — install the int9 grabber; clears gr_keys, hooks atexit once. */
void gr_start_kbd_grab(void)
{
    disable_exit_routine = 0;
    exit_routine = 0;
    gr_old_int9 = getvect(9);
    memset(gr_keys, 0, 0x80);
    setvect(9, gr_int9);
    if (first_time != 0) {
        atexit(gr_end_kbd_grab);
        first_time = 0;
    }
}

/* seg1a07:00E6 — int9 ISR: mirror scancode into gr_keys[], flush the BIOS
 * buffer, chain to the old handler, and fire exit_routine on F10 (0x44). */
void interrupt far gr_int9(...)
{
    byte scan;

    scan = inportb(0x60);                         /* 8042 data port */
    if (scan & 0x80)                              /* key release */
        gr_keys[scan & 0x7F] = 0;
    else                                          /* key press */
        gr_keys[scan] = 1;
    fp_kbd_tail = (word far *)0x40001A;
    fp_kbd_head = (word far *)0x40001C;
    *fp_kbd_tail = *fp_kbd_head;                  /* flush BIOS buffer */
    asm pushf;
    gr_old_int9();                                /* chain to old int9 (pushf;call) */
    if (scan == 0x44 && disable_exit_routine == 0 && exit_routine != 0)
        (*exit_routine)();
    outportb(0x20, 0x20);                         /* EOI to 8259A */
}
