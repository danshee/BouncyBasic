10 print "{clr}{home}"
20 gosub 600 : rem screen dimensions
30 x = 1 : y = 1
40 dx = 1 : dy = 1
50 gosub 200 : rem draw ball
60 gosub 400 : rem sleep
70 gosub 300 : rem clear ball
80 x = x + dx
90 if x <= 0 or x >= xmax then dx = -dx
100 y = y + dy
110 if y <= 0 or y >= ymax then dy = -dy
120 goto 50


200 rem draw ball
210 gosub 500
220 poke 780, 113 : sys 65490
230 return

300 rem clear ball
310 gosub 500
330 poke 780, 32 : sys 65490
340 return

400 rem wait
410 for t = 1 to 10 : next
420 return

500 rem kernal plot routine
510 poke 781, y : poke 782, x : poke 783, 0
520 sys 65520
530 return

600 rem kernal screen routine
610 sys 65517
620 xmax = peek(781) - 1
630 ymax = peek(782) - 1
640 return
