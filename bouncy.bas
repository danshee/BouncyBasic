10 print "{clr}{home}"
15 gosub 700 : rem setup for commodore model
20 gosub 600 : rem screen dimensions
30 x = 1 : y = 1    : rem ball coordinates
35 px = x : py = y  : rem ball previous coordinates
40 dx = 1 : dy = 1  : rem ball vector
50 gosub 300 : rem clear ball
60 gosub 200 : rem draw ball
70 gosub 400 : rem sleep
80 px = x : x = x + dx
90 if x = 0 or x = xmax then dx = -dx
100 py = y : y = y + dy
110 if y = 0 or y = ymax then dy = -dy
120 goto 50


200 rem draw ball
210 poke rb + 1, y : poke rb + 2, x : poke rb + 3, 0
220 sys 65520
230 poke rb, 113 : sys 65490
240 return

300 rem clear ball
310 poke rb + 1, py : poke rb + 2, px : poke rb + 3, 0
320 sys 65520
330 poke rb, 32 : sys 65490
340 return

400 rem wait
410 when = ti + 1
420 if ti <= when goto 420
430 return

600 rem kernal screen routine
610 sys 65517
620 xmax = peek(rb + 1) - 1
630 ymax = peek(rb + 2) - 1
640 return

700 rem detect commodore model
710 a = peek(65534)
720 if a = 72 then rb = 780 : return : rem commodore 64
730 if a = 114 then rb = 780 : return : rem vic-20
740 rem assume plus/4 (or c16)
750 rb = 2034
760 return
