10 print "{clr}{home}"
20 poke 53280, 7 : poke 53281, 13
30 x = 1 : y = 1
40 dx = 1 : dy = 1
50 gosub 200 : rem draw ball
60 gosub 400 : rem sleep
70 gosub 300 : rem clear ball
80 x = x + dx
90 if x <= 0 or x >= 39 then dx = -dx
100 y = y + dy
110 if y <= 0 or y >= 24 then dy = -dy
120 goto 50


200 rem draw ball
210 poke 1024 + x + 40*y, 81
220 return

300 rem clear ball
310 poke 1024 + x + 40*y, 32
320 return

400 rem wait
410 for t = 1 to 10 : next
420 return