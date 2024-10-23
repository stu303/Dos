Rem $DYNAMIC
$Debug
10 Rem GAME NAME
20 GoSub 2600: Rem INITIALISE
30 GoSub 440
40 If RO <> 11 Then 30
50 Print: Print "YOU'VE DONE IT!!": GoSub 3520: Print "THAT WAS THE EXIT FROM THE FOREST"
60 GoSub 3520: Rem DELAY
70 Print: Print "YOU HAVE SUCCEEDED, "; N$; "!"
80 Print: Print "YOU MANAGED TO GET OUT OF THE FOREST"
90 GoSub 3520
100 Print: Print "CONGRATULATIONS!"
110 GoSub 3520
120 Print: Print "TOTAL SECRETS: "
125 GoSub 3520
126 Print: Print "Exiting to DOS..."
130 End
150 Rem ***************
440 Rem MAIN PLAYER INPUT
450 If HP = 0 Or HP < 0 Then GoTo 25000
460 GoSub 3520
480 A$ = "": B$ = "": C$ = "": D$ = "": E$ = ""
481 Locate 24, 1
486 Input ">", A$
490 If A$ = "" Then Print "You must type something!": Print: GoTo 460
500 Rem EMULATE UCASE$
502 For I = 1 To Len(A$): If Asc(Mid$(A$, I, 1)) > 90 Then Mid$(A$, I, 1) = Chr$(Asc(Mid$(A$, I, 1)) Xor 32)
503 Next I
505 Rem PRINT A$
508 Rem AS=ASC(A$)
510 Rem IF AS<65 OR AS>90 THEN PRINT:PRINT "CAPITAL LETTERS ONLY!":PRINT:GOTO 460
515 Rem PRINT AS
520 A$ = Left$(A$ + Space$(30), 30): M = Len(A$): Rem :IF M<30 THEN A$=A$+" ":GOTO 520
525 N = 1
530 GoSub 625: B$ = R$
531 Rem B$=LEFT$(A$,3)
540 If Left$(B$, 3) = "HEL" And C$ + D$ + E$ = "" Then GoSub 3690: GoTo 440
550 If Left$(B$, 3) = "QUI" And C$ + D$ + E$ = "" Then 120
555 Rem IF LEFT$(B$,3)="LOO" AND C$+D$+E$="" THEN RC=1:GOTO 990
560 GoSub 625: C$ = R$
564 If Left$(C$, 1) <> " " Then 620
590 If Rnd(1) > .5 Then 610
600 Print "I don't understand that.": Print: GoTo 460
610 Print "I don't know what you mean.": Print: GoTo 460
618 Rem GET 2 MORE COMMANDS INTO D$ AND E$
620 GoSub 625: D$ = R$
622 GoSub 625: E$ = R$
624 GoTo 630

625 R$ = "": While N <= M And Mid$(A$, N, 1) = " ": N = N + 1: Wend
626 While N <= M And Mid$(A$, N, 1) <> " ": R$ = R$ + Mid$(A$, N, 1): N = N + 1: Wend
628 Return

630 BS$ = Left$(B$, 3): Rem B$ IS FULL, BS$ IS SHORT 3 CHAR FORM
631 If B$ = "LOOK" And C$ + D$ + E$ = "" Then RC = 1: GoTo 1010
632 If (B$ = "LOOK" And C$ = "AT") Or (B$ = "CHECK" And C$ <> "INSIDE") Or (B$ = "EXAMINE" And C$ <> "INSIDE") Then GoSub 15000: GoTo 650
633 If B$ = "GRAB" Or B$ = "TAKE" Or B$ = "PICKUP" Or (B$ = "PICK" And C$ = "UP") Then GoSub 4000: GoTo 650
634 If (B$ = "LOOK" And C$ = "INSIDE") Or (B$ = "LOOK" And C$ = "IN") Or (B$ = "CHECK" And C$ = "INSIDE") Or (B$ = "EXAMINE" And C$ = "INSIDE") Then GoSub 10000: GoTo 650
635 If (B$ = "GO" Or BS$ = "MOV" Or BS$ = "WAL" Or BS$ = "HEA") And D$ + E$ = "" Then GoSub 6000: GoTo 650
636 Rem S/E IF B$="OPEN" THEN GOSUB:GOTO 650
637 If B$ = "STATUS" Then GoSub 20000: GoTo 650
640 If B$ = "BAG" Or B$ = "INVENTORY" Then GoSub 2300: GoTo 650
643 If B$ = "DROP" Or B$ = "LEAVE" Then GoSub 17000: GoTo 650
645 GoTo 590

650 GoSub 6700: Rem AREA PRINT
980 Rem ***************
990 Rem ROOM DESCRIPTIONS
995 If N$ = "ELLE" Then GoSub 7000
996 If RD = 1 Then Return
1000 Print
1010 On RO GOSUB 1040, 1100, 1170, 1230, 1280, 1360, 1410, 1470, 1540, 1620, 1700, 1730, 1790, 1860, 1960, 2030, 2100, 2160, 2230
1020 Return
1030 Rem ***************
1040 Rem RM 1
1050 Print "THIS IS ROOM 1"
1080 Return
1090 Rem ***************
1100 Rem RM 2
1109 If RC = 1 Then GoTo 1161
1110 Print "DIMLY LIT ROOM"
1111 Print "You find yourself in a dimly lit room. The air in the tomb feels thick and also": Print "musty. The floor is coated with a thin layer of sand that shifts around slightlyas you move."
1112 Print "There are many vases of different shapes and sizes scattered around the room.": Print "A couple of large statues stand against the northern wall, their features are": Print "well-worn with time but they still give off an ominous presence."
1113 Print "There is an exit to the east."
1115 If A(RO, 13) = 1 Or A(RO, 14) = 1 Or A(RO, 15) = 1 Then Print "There is a box on the ground."
1150 Print
1155 RD = 1
1156 If RC = 0 And A(RO, 9) <> 0 Then GoSub 23000
1160 Return
1161 Print "You find yourself in a dimly lit room. The floor is coated with a thin layer of sand that shifts around slightly as you move."
1162 Print "There are many vases of different shapes and sizes scattered around the room.": Print "A couple of large statues stand against the northern wall, their features are": Print "well-worn with time but they still give off an ominous presence."
1163 Print "There is an exit to the east."
1165 If A(RO, 13) = 1 Or A(RO, 14) = 1 Or A(RO, 15) = 1 Then Print "There is a box on the ground."
1166 Print
1167 RC = 0
1168 Return
1170 Rem ***************
1180 Rem RM 3
1185 If RC = 1 Then GoTo 1222
1190 Print "L-SHAPED CORRIDOR"
1191 Print "You have entered an L-shaped corridor which exits towards the north.": Print "Hieroglyphics are spread throughout the walls of the corridor."
1192 If A(RO, 13) = 1 Or A(RO, 14) = 1 Or A(RO, 15) = 1 Then Print "There is a box on the ground."
1210 Print
1215 RD = 1
1216 If RC = 0 And A(RO, 9) <> 0 Then GoSub 23000
1220 Return
1222 Print "You are in an L-shaped corridor which exits towards the North. Hieroglyphics arespread throughout the walls of the corridor."
1223 If A(RO, 13) = 1 Or A(RO, 14) = 1 Or A(RO, 15) = 1 Then Print "There is a box on the ground."
1224 Print
1225 RC = 0
1226 Return
1230 Rem ***************
1240 Rem RM 4
1245 If RC = 1 Then GoTo 1251
1250 Print "CIRCULAR ROOM"
1251 Print "You are in a circular room with a small glistening pool in the center. A pathwayencircles the room, with exits leading to the north and west."
1252 If A(RO, 13) = 1 Or A(RO, 14) = 1 Or A(RO, 15) = 1 Then Print "There is a box on the ground."
1260 Print
1263 RD = 1
1265 If RC = 0 And A(RO, 9) <> 0 Then GoSub 23000
1266 RC = 0
1270 Return
1280 Rem ***************
1290 Rem RM 5
1295 If RC = 1 Then GoTo 1310
1300 Print "BURIAL CHAMBER"
1310 Print "This is an expansive chamber with a doorway to the west. There are many tall": Print "pillars lined up along the walls."
1320 Print "On the floor, in the centre of the room. There is a depiction of the egyiptian": Print "god Anubis, holding a hollowed out ankh, as if something was once there."
1340 Print "There is a large stone door to the North."
1341 If A(RO, 13) = 1 Or A(RO, 14) = 1 Or A(RO, 15) = 1 Then Print "There is a box on the ground."
1342 Print
1343 RD = 1
1345 If RC = 0 And A(RO, 9) <> 0 Then GoSub 23000
1346 RC = 0
1350 Return
1360 Rem ***************
1370 Rem RM 6
1375 If RC = 1 Then GoTo 1390
1380 Print "EMPTY CHAMBER"
1390 Print "You are in a small room. There are faded hieroglyphics all along the walls,": Print "their meanings have been lost to time."
1391 If A(RO, 13) = 1 Or A(RO, 14) = 1 Or A(RO, 15) = 1 Then Print "There is a box on the ground."
1392 Print
1393 RD = 1
1395 If RC = 0 And A(RO, 9) <> 0 Then GoSub 23000
1396 RC = 0
1400 Return
1410 Rem ***************
1420 Rem RM 7
1424 If RC = 1 Then GoTo 1430
1425 Print "CHAMBER OF SAND"
1430 Print "You are in a small room. The floor is covered knee-deep with sand.": Print "There is a large square shaped hole in the ceiling."
1431 If A(RO, 13) = 1 Or A(RO, 14) = 1 Or A(RO, 15) = 1 Then Print "There is a box on the ground."
1432 Print
1435 RD = 1
1436 If RC = 0 And A(RO, 9) <> 0 Then GoSub 23000
1440 RC = 0
1460 Return
1470 Rem ***************
1480 Rem RM 8
1485 If RC = 1 Then GoTo 1495
1490 Print "NARROW PASSAGE"
1495 Print "The passage is extremely narrow and dark, leaving you little room to move. The walls are cold and smooth, like limestone."
1496 If A(RO, 13) = 1 Or A(RO, 14) = 1 Or A(RO, 15) = 1 Then Print "There is a box on the ground."
1497 Print
1500 RD = 1
1505 If RC = 0 And A(RO, 9) <> 0 Then GoSub 23000
1510 RC = 0
1530 Return
1540 Rem ***************
1550 Rem RM 9
1560 Print "THIS IS ROOM 9"
1610 Return
1620 Rem ***************
1630 Rem RM 10
1640 Print "THIS IS ROOM 10"
1690 Return
1700 Rem ***************
1710 Rem RM 11
1720 Print "THIS IS ROOM 11"
1725 Return
1730 Rem ***************
1740 Rem RM 12
1750 Print "THIS IS ROOM 12"
1780 Return
1790 Rem ***************
1800 Rem RM 13
1810 Print "THIS IS ROOM 13"
1850 Return
1860 Rem ***************
1870 Rem RM 14
1880 Print "THIS IS ROOM 14"
1950 Return
1960 Rem ***************
1970 Rem RM 15
1980 Print "THIS IS ROOM 15"
2020 Return
2030 Rem ***************
2040 Rem RM 16
2050 Print "THIS IS ROOM 16"
2090 Return
2100 Rem ***************
2110 Rem RM 17
2120 Print "THIS IS ROOM 17"
2150 Return
2160 Rem ***************
2170 Rem RM 18
2180 Print "THIS IS ROOM 18"
2220 Return
2230 Rem ***************
2240 Rem RM 19
2250 Print "THIS IS ROOM 19"
2280 Return
2300 Rem ***************
2305 Rem INVENTORY/BAG
2306 GoSub 3520
2307 If BOX + CREST = 0 Then Print "You are carrying nothing.": Print: Return
2308 GoSub 3520
2310 Print: Print "INVENTORY": Print
2311 GoSub 3520
2312 If BOX = 1 Then Print "BOX": Print
2390 GoSub 3520
2392 If CREST = 1 Then Print "CREST": Print
2393 GoSub 3520
2580 Return


2590 Rem ***************
2600 Rem INITIALISE
2670 Rem ***************
2680 Rem SET UP ROOMS
2690 Dim A(19, 15)
2700 For B = 1 To 19
    2710 For C = 1 To 15
        2720 Read A(B, C)
    2730 Next C
2740 Next B
2745 Cls
2746 Print " "
2750 Input "What is your name"; N$
2760 Cls
2770 RO = 2: Rem STARTING RM
2860 SECRETS = 0
2870 XP = 0
2880 GOLD = 0
2890 LVL = 1
2900 HP = 100
2910 ARMOUR$ = "NONE"
2920 WEAPON$ = "NONE"
2930 ACCESSORY$ = "NONE"
3300 Rem ***************
3310 Data 0,2,0,0,0,0,0,0,1,0,0,0,0,0,0: Rem RM 1
3320 Data 0,3,0,1,0,0,0,0,1,0,1,0,0,0,0: Rem RM 2
3330 Data 4,0,0,2,0,0,0,0,0,0,0,0,0,0,0: Rem RM 3
3340 Data 8,0,3,5,0,0,0,0,1,0,0,0,0,0,0: Rem RM 4
3350 Data 10,4,0,6,0,0,0,0,0,0,0,0,0,0,0: Rem RM 5
3360 Data 7,5,0,0,0,0,0,0,0,0,0,0,0,0,0: Rem RM 6
3370 Data 0,0,6,0,0,0,0,0,0,0,0,0,0,0,0: Rem RM 7
3380 Data 9,0,4,0,0,0,0,0,0,0,0,0,0,0,0: Rem RM 8
3390 Data 0,0,8,0,0,0,0,0,0,0,0,0,0,0,0: Rem RM 9
3400 Data 0,11,5,13,0,0,0,0,0,0,0,0,0,0,0: Rem RM 10
3410 Data 0,12,0,10,0,0,0,0,0,0,0,0,0,0,0: Rem RM 11
3420 Data 0,0,0,11,0,0,0,0,0,0,0,0,0,0,0: Rem RM 12
3430 Data 0,10,0,0,0,0,0,0,0,0,0,0,0,0,0: Rem RM 13
3440 Data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0: Rem RM 14
3450 Data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0: Rem RM 15
3460 Data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0: Rem RM 16
3470 Data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0: Rem RM 17
3480 Data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0: Rem RM 18
3490 Data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0: Rem RM 19
3500 Rem ***************
3510 Rem DELAY LOOP
3520 For T = 1 To 900: Next T
3530 Return
3690 Rem HELP
3692 Cls
3695 Print: Print "TYPE A VERB (MOVE/HEAD/GO/WALK) + AN 8 DIRECTIONAL COMPASS COMMAND TO MOVE"
3700 Print: Print "MOVEMENT COMMANDS:": Print "N/NORTH = NORTH": Print "E/EAST = EAST": Print "S/SOUTH = SOUTH": Print "W/WEST = WEST": Print "NE = NORTHEAST"
3710 Print "SE = SOUTHEAST": Print "SW = SOUTHWEST": Print "NW = NORTHWEST"
3720 Print: Print "OTHER COMMANDS:": Print "BAG = INVENTORY": Print "TAKE/GRAB + ITEM NAME = TO PICKUP AN ITEM": Print "QUIT = EXIT TO DOS": Print "HELP = HELP (THIS HELP LIST)"
3800 Return
4000 Rem ITEM PICKUP
4001 If C$ = "UP" And D$ + E$ = "" Then Print "You can't pick up nothing.": Print: Return
4002 If B$ = "PICKUP" And C$ + D$ + E$ = "" Then Print "You can't pick up nothing.": Print: Return
4003 If B$ = "GRAB" And C$ + D$ + E$ = "" Then Print "Grab what?": Print: Return
4004 If B$ = "TAKE" And C$ + D$ + E$ = "" Then Print "What do you want to take?": Print: Return
4005 If (A(RO, 13) <> 0 Or A(RO, 14) <> 0 Or A(RO, 15) <> 0) Then GoTo 5930
4010 On RO GOTO 4020, 4040, 4100, 4130, 4160, 4190, 4220, 4250, 4280, 4310, 4340, 4370, 4400, 4430, 4460, 4490, 4220, 4250, 4280
4020 Rem ***************
4025 Rem THIS IS ROOM 1
4030 Print "There is nothing to take.": Print: Return
4040 Rem ***************
4045 Rem THIS IS ROOM 2
4055 If BOXVASE = 0 GoTo 5900
4056 If (C$ = "BOX" Or C$ = "SMALL" And D$ = "BOX") Or (D$ = "BOX" Or D$ = "SMALL" And E$ = "BOX") Then GoTo 4070
4069 Print "I don't know what that is.": Print: Return
4070 If A(2, 11) = 0 Then GoTo 5900
4080 If A(2, 11) = 1 Then Print "You have taken the small box.": Print: A(2, 11) = 0: BOX = 1
4090 Return
4100 Rem ***************
4110 Rem THIS IS ROOM 3
4120 Print "There is nothing to take.": Print: Return
4130 Rem ***************
4140 Rem THIS IS ROOM 4
4150 Print "There is nothing to take.": Print: Return
4160 Rem ***************
4170 Rem THIS IS ROOM 5
4180 Print "There is nothing to take.": Print: Return
4190 Rem ***************
4200 Rem THIS IS ROOM 6
4210 Print "There is nothing to take.": Print: Return
4220 Rem ***************
4230 Rem THIS IS ROOM 7
4240 Print "There is nothing to take.": Print: Return
4250 Rem ***************
4260 Rem THIS IS ROOM 8
4270 Print "There is nothing to take.": Print: Return
4280 Rem ***************
4290 Rem THIS IS ROOM 9
4300 Print "There is nothing to take.": Print: Return
4310 Rem ***************
4320 Rem THIS IS ROOM 10
4330 Print "There is nothing to take.": Print: Return
4340 Rem ***************
4350 Rem THIS IS ROOM 11
4360 Print "There is nothing to take.": Print: Return
4370 Rem ***************
4380 Rem THIS IS ROOM 12
4390 Print "There is nothing to take.": Print: Return
4400 Rem ***************
4410 Rem THIS IS ROOM 13
4420 Print "There is nothing to take.": Print: Return
4430 Rem ***************
4440 Rem THIS IS ROOM 14
4450 Print "There is nothing to take.": Print: Return
4460 Rem ***************
4470 Rem THIS IS ROOM 15
4480 Print "There is nothing to take.": Print: Return
4490 Rem ***************
4500 Rem THIS IS ROOM 16
4510 Print "There is nothing to take.": Print: Return
4520 Rem ***************
4530 Rem THIS IS ROOM 17
4540 Print "There is nothing to take.": Print: Return
4550 Rem ***************
4560 Rem THIS IS ROOM 18
4570 Print "There is nothing to take.": Print: Return
4580 Rem ***************
4590 Rem THIS IS ROOM 19
4600 Print "There is nothing to take.": Print: Return
5900 If B$ = "TAKE" Then Print "There is nothing to take.": Print: Return
5910 If B$ = "GRAB" Then Print "There is nothing here to take.": Print: Return
5920 If B$ = "PICKUP" Or (B$ = "PICK" And C$ = "UP") Then Print "There isn't anything to pick up.": Print: Return

5930 Rem ***************
5931 Rem DROP/LEAVE CHECK
5932 If C$ = "BOX" Or D$ = "BOX" And A(RO, 13) = 1 Then Print "You have taken the box.": Print: A(RO, 13) = 0: BOX = 1: Return
5933 If C$ = "BOX" Or D$ = "BOX" And A(RO, 14) = 1 Then Print "You have taken the box.": Print: A(RO, 14) = 0: BOX = 1: Return
5934 If C$ = "BOX" Or D$ = "BOX" And A(RO, 15) = 1 Then Print "You have taken the box.": Print: A(RO, 15) = 0: BOX = 1: Return
5990 GoTo 4010

6000 Rem ***************
6010 Rem 2ND WORD MOVEMENT
6015 If N$ <> "ELLE" GoTo 6018
6016 Print "2ND WORD MOVEMENT C$='"; C$; "' RO="; RO: Print
6017 For I% = 1 To 8: Print A(RO, I%); ",";: Next: Print
6018 CS$ = Left$(C$ + "   ", 3)
6020 If (CS$ = "NOR" Or CS$ = "N  ") And A(RO, 1) = 0 Then 6200
6030 If (CS$ = "EAS" Or CS$ = "E  ") And A(RO, 2) = 0 Then 6200
6040 If (CS$ = "SOU" Or CS$ = "S  ") And A(RO, 3) = 0 Then 6200
6050 If (CS$ = "WES" Or CS$ = "W  ") And A(RO, 4) = 0 Then 6200
6060 If (CS$ = "NE ") And A(RO, 5) = 0 Then 6200
6070 If (CS$ = "SE ") And A(RO, 6) = 0 Then 6200
6080 If (CS$ = "SW ") And A(RO, 7) = 0 Then 6200
6090 If (CS$ = "NW ") And A(RO, 8) = 0 Then 6200
6100 If (CS$ = "NOR" Or CS$ = "N  ") Then RO = A(RO, 1): RD = 0: Return
6110 If (CS$ = "EAS" Or CS$ = "E  ") Then RO = A(RO, 2): RD = 0: Return
6120 If (CS$ = "SOU" Or CS$ = "S  ") Then RO = A(RO, 3): RD = 0: Return
6130 If (CS$ = "WES" Or CS$ = "W  ") Then RO = A(RO, 4): RD = 0: Return
6140 If CS$ = "NE " Then RO = A(RO, 5): RD = 0: Return
6150 If CS$ = "SE " Then RO = A(RO, 6): RD = 0: Return
6160 If CS$ = "SW " Then RO = A(RO, 7): RD = 0: Return
6170 If CS$ = "NW " Then RO = A(RO, 8): RD = 0: Return
6180 If N$ = "ELLE" Then Print "MOVING TO ROOM "; RO
6185 Print "I don't know that direction.": Print
6190 Return
6200 If Rnd(1) > .5 Then GoTo 6305
6201 If Rnd(1) > .75 Then GoTo 6309
6202 If Rnd(1) > .25 Then GoTo 6307
6203 If CS$ = "NOR" Or CS$ = "N  " Then GoTo 6289
6204 If CS$ = "EAS" Or CS$ = "E  " Then GoTo 6291
6205 If CS$ = "SOU" Or CS$ = "S  " Then GoTo 6293
6206 If CS$ = "WES" Or CS$ = "W  " Then GoTo 6295
6207 If CS$ = "NE " Then GoTo 6297
6208 If CS$ = "SE " Then GoTo 6299
6209 If CS$ = "SW " Then GoTo 6301
6210 If CS$ = "NW " Then GoTo 6303
6289 Print "There is no exit to the North.": Print
6290 Return
6291 Print "There is no exit to the East.": Print
6292 Return
6293 Print "There is no exit to the South.": Print
6294 Return
6295 Print "There is no exit to the West.": Print
6296 Return
6297 Print "There is no exit Northeast.": Print
6298 Return
6299 Print "There is no exit Southeast.": Print
6300 Return
6301 Print "There is no exit Southwest.": Print
6302 Return
6303 Print "There is no exit Northwest.": Print
6304 Return
6305 Print "You can't go that way.": Print
6306 Return
6307 Print "There isn't an exit that way.": Print
6308 Return
6309 Print "You can't go in that direction.": Print
6310 Return
6700 Rem ***************
6710 Rem AREA PRINT
6720 If RO = 7 Then AREA$ = "WOODEN CABIN"
6730 If RO = 8 Then AREA$ = "FOREST PATH"
6740 Return
7000 Rem ***************
7010 Rem DEBUG
7020 Print: Print "***************": Print "DEBUG INFO:": Print
7030 Print "RO="; RO: Print "A$="; A$: Print "B$="; B$: Print "C$="; C$
7035 Print "D$="; D$: Print "E$="; E$: Print: Print "RC="; RC: Print "***************"
7040 Return

10000 If D$ + E$ = "" Then GoTo 14000
10001 Rem ***************
10010 Rem CHECK INSIDE
10020 On RO GOTO 10030, 10070, 10100, 10140, 10160, 10190, 10220, 10250, 10280, 10310, 10340, 10370, 10400, 10430, 10460, 10490, 10520, 10550, 10580
10029 Rem ***************
10030 Rem THIS IS ROOM 1
10060 Return
10065 Rem ***************
10070 Rem THIS IS ROOM 2
10075 If A(2, 11) = 0 Then GoTo 10087
10080 If D$ = "VASE" Or D$ = "VASES" Then Print "Inside one of the vases, you spot a small box, partially buried in sand.": Print: BOXVASE = 1: Return
10087 If D$ = "VASE" Or D$ = "VASES" Then Print "There is nothing but sand inside.": Print: Return
10090 Print "I don't understand.": Print: Return
10100 Rem ***************
10110 Rem THIS IS ROOM 3
10120 Return
10130 Rem ***************
10140 Rem THIS IS ROOM 4
10150 Return
10160 Rem ***************
10170 Rem THIS IS ROOM 5
10180 Return
10190 Rem ***************
10200 Rem THIS IS ROOM 6
10210 Return
10220 Rem ***************
10230 Rem THIS IS ROOM 7
10240 Return
10250 Rem ***************
10260 Rem THIS IS ROOM 8
10270 Return
10280 Rem ***************
10290 Rem THIS IS ROOM 9
10300 Return
10310 Rem ***************
10320 Rem THIS IS ROOM 10
10330 Return
10340 Rem ***************
10350 Rem THIS IS ROOM 11
10360 Return
10370 Rem ***************
10380 Rem THIS IS ROOM 12
10390 Return
10400 Rem ***************
10410 Rem THIS IS ROOM 13
10420 Return
10430 Rem ***************
10440 Rem THIS IS ROOM 14
10450 Return
10460 Rem ***************
10470 Rem THIS IS ROOM 15
10480 Return
10490 Rem ***************
10500 Rem THIS IS ROOM 16
10510 Return
10520 Rem ***************
10530 Rem THIS IS ROOM 17
10540 Return
10550 Rem ***************
10560 Rem THIS IS ROOM 18
10570 Return
10580 Rem ***************
10590 Rem THIS IS ROOM 19
10600 Return
14000 Rem ***************
14010 If Rnd(1) > .5 Then GoTo 14050
14020 If B$ = "LOOK" Then Print "Look inside what?": Print
14030 If B$ = "CHECK" Then Print "Check inside what?": Print
14035 If B$ = "EXAMINE" Then Print "Examine inside of what?": Print
14040 Return
14050 If B$ = "LOOK" Then Print "What do you want to look inside?": Print
14060 If B$ = "CHECK" Then Print "What do you want to check inside?": Print
14065 If B$ = "EXAMINE" Then Print "What is it you want to examine inside of?": Print
14070 Return
15000 Rem ***************
15001 Rem EXAMINE/LOOK AT
15002 If B$ = "CHECK" And C$ = "" Then GoTo 15030
15003 If B$ = "EXAMINE" And C$ = "" Then GoTo 15090
15004 If B$ = "LOOK" And D$ = "" Then GoTo 15150
15005 On RO GOTO 15500, 15700, 15810, 15840, 15870, 15900, 15930, 15960, 15990, 16020, 16050, 16080, 16110, 16140, 16170, 16200, 16230, 16260, 16290
15030 If Rnd(1) > .75 Then GoTo 15060
15040 If Rnd(1) > .5 Then GoTo 15070
15050 Print "You can't check nothing!": Print: Return
15060 Print "What do you want to check?": Print: Return
15070 Print "Check what?": Print
15080 Return
15090 If Rnd(1) > .75 Then GoTo 15120
15100 If Rnd(1) > .5 Then GoTo 15130
15110 Print "You can't examine nothing!": Print: Return
15120 Print "What do you want to examine?": Print: Return
15130 Print "Examine what?": Print
15140 Return
15150 If Rnd(1) > .75 Then GoTo 15180
15160 If Rnd(1) > .5 Then GoTo 15190
15170 Print "You can't look at nothing!": Print: Return
15180 Print "What do you want to look at?": Print: Return
15190 Print "Look at what?": Print
15200 Return
15500 Rem ***************
15510 Rem THIS IS ROOM 1
15600 Return
15700 Rem ***************
15710 Rem THIS IS ROOM 2
15720 If (C$ = "VASE" Or C$ = "VASES") Or (D$ = "VASE" Or D$ = "VASES") Then Print "There are various vases in different sizes. Some are broken into several pieces and some appear to be intact.": Print: Return
15730 Print "I don't know what that is.": Print
15800 Return
15810 Rem ***************
15820 Rem THIS IS ROOM 3
15830 Return
15840 Rem ***************
15850 Rem THIS IS ROOM 4
15860 Return
15870 Rem ***************
15880 Rem THIS IS ROOM 5
15890 Return
15900 Rem ***************
15910 Rem THIS IS ROOM 6
15920 Return
15930 Rem ***************
15940 Rem THIS IS ROOM 7
15950 Return
15960 Rem ***************
15970 Rem THIS IS ROOM 8
15980 Return
15990 Rem ***************
16000 Rem THIS IS ROOM 9
16010 Return
16020 Rem ***************
16030 Rem THIS IS ROOM 10
16040 Return
16050 Rem ***************
16060 Rem THIS IS ROOM 11
16070 Return
16080 Rem ***************
16090 Rem THIS IS ROOM 12
16100 Return
16110 Rem ***************
16120 Rem THIS IS ROOM 13
16130 Return
16140 Rem ***************
16150 Rem THIS IS ROOM 14
16160 Return
16170 Rem ***************
16180 Rem THIS IS ROOM 15
16190 Return
16200 Rem ***************
16210 Rem THIS IS ROOM 16
16220 Return
16230 Rem ***************
16240 Rem THIS IS ROOM 17
16250 Return
16260 Rem ***************
16270 Rem THIS IS ROOM 18
16280 Return
16290 Rem ***************
16300 Rem THIS IS ROOM 19
16310 Return

17000 Rem ***************
17010 Rem DROP/LEAVE ITEM
17020 If C$ + D$ + E$ = "" Then GoTo 17960
17021 If C$ = "BOX" Then GoTo 17035
17032 If Rnd(1) > .5 Then GoTo 17034
17033 Print "You can't drop something you don't have!": Print: Return
17034 Print "You are not carrying anything like that.": Print: Return
17035 If B$ = "DROP" And BOX = 1 Then Print "You drop the box.": Print: GoTo 17200
17040 If B$ = "LEAVE" And BOX = 1 Then Print "You leave the box.": Print: GoTo 17200
17050 Print "You don't have a box!": Print: Return
17200 If A(RO, 13) = 0 Then A(RO, 13) = 1: BOX = 0: Return
17210 If A(RO, 14) = 0 Then A(RO, 14) = 1: BOX = 0: Return
17220 If A(RO, 15) = 0 Then A(RO, 15) = 1: BOX = 0: Return
17230 Print "There is no room to leave anything else.": Print
17240 Return
17960 If Rnd(1) > .5 Then GoTo 17980
17970 Print "Drop what?": Print: Return
17980 Print "What do you want to drop?": Print: Return



18000 Rem ***************
18010 Rem NOTES
18015 Rem *****ITEMS*****
18020 Rem 1=BOX, 2=NOTE
18030 Rem *****ARRAY*****
18040 Rem FIRST 8 ARE COMPASS DIRECTIONS. 9 AND 10 ARE RESERVED. 11-12 ARE ITEMS IN ROOM. 13-15 ITEMS TO DROP/LEAVE.



20000 Rem ***************
20010 Rem PLAYER STATUS
20015 GoSub 3520
20020 Print N$; ", this is your current status:"
20030 If LVL = 1 Then Print "LEVEL ="; LVL: Print "HP ="; HP; "/100": Print "XP ="; XP; "/100"
20035 If LVL = 2 Then Print "LEVEL =", LVL: Print "HP =", HP; "/160": Print "XP =", XP; "/220"
20040 If LVL = 3 Then Print "LEVEL =", LVL: Print "HP =", HP; "/226": Print "XP =", XP; "/370"
20045 If LVL = 4 Then Print "LEVEL =", LVL: Print "HP =", HP; "/298": Print "XP =", XP; "/550"
20050 If LVL = 5 Then Print "LEVEL =", LVL: Print "HP =", HP; "/377": Print "XP =", XP; "/760"
20055 If LVL = 6 Then Print "LEVEL =", LVL: Print "HP =", HP; "/464": Print "XP =", XP; "/1020"
20060 If LVL = 7 Then Print "LEVEL =", LVL: Print "HP =", HP; "/560": Print "XP =", XP; "/1330"
20065 If LVL = 8 Then Print "LEVEL =", LVL: Print "HP =", HP; "/666": Print "XP =", XP; "/1700"
20070 If LVL = 9 Then Print "LEVEL =", LVL: Print "HP =", HP; "/782": Print "XP =", XP; "/2150"
20075 If LVL = 10 Then Print "LEVEL =", LVL: Print "HP =", HP; "/910": Print "XP =", XP; "/2680"
20080 If LVL = 11 Then Print "LEVEL =", LVL: Print "HP =", HP; "/1051": Print "XP =", XP; "/3320"
20085 If LVL = 12 Then Print "LEVEL =", LVL: Print "HP =", HP; "/1206": Print "XP =", XP; "/4100"
20090 If LVL = 13 Then Print "LEVEL =", LVL: Print "HP =", HP; "/1380": Print "XP =", XP; "/5020"
20095 If LVL = 14 Then Print "LEVEL =", LVL: Print "HP =", HP; "/1568": Print "XP =", XP; "/6130"
20100 If LVL = 15 Then Print "LEVEL =", LVL: Print "HP =", HP; "/1774": Print "XP =", XP; "/7500"
20105 If LVL = 16 Then Print "LEVEL =", LVL: Print "HP =", HP; "/2000": Print "XP =", XP; "/9100"
20110 If LVL = 17 Then Print "LEVEL =", LVL: Print "HP =", HP; "/2250": Print "XP =", XP; "/11020"
20115 If LVL = 18 Then Print "LEVEL =", LVL: Print "HP =", HP; "/2525": Print "XP =", XP; "/13330"
20120 If LVL = 19 Then Print "LEVEL =", LVL: Print "HP =", HP; "/2827": Print "XP =", XP; "/16100"
20125 If LVL = 20 Then Print "LEVEL =", LVL: Print "HP =", HP; "/3000": Print "XP =", XP; "/19500"
20200 Print "ARMOUR = "; ARMOUR$
20210 Print "WEAPON = "; WEAPON$
20250 Print "ACCESSORY = "; ACCESSORY$
20252 Print "GOLD = "; GOLD
20255 Print
20260 Return

23000 Rem ***************
23010 Rem MONSTER CHECK
23020 If Rnd(1) > .5 Then GoSub 23500
23030 Return


23500 Rem ***************
23510 Rem 1ST FLOOR MONSTER CHOICE
23515 GoSub 3520
23520 If Rnd(1) > .85 Then GoTo 23560
23530 If Rnd(1) > .5 Then GoTo 23550
23540 Print "You encounter a Goblin!": Print: COMBAT = 1: GoSub 24000: Return
23550 Print "You encounter a Giant Rat!": Print: COMBAT = 1: GoSub 24100: Return
23560 Print "You encounter a Goblin Warrior!": COMBAT = 1: Print: GoSub 24200: Return

24000 Rem ***************
24010 Rem MONSTER FIGHT GOBLIN
24020 M$ = "GOBLIN": MN$ = "Goblin": MLVL = 2: MHP = 25: MSTR = 3: MDEF = 3: MWS = 3: MINI = 4: MWIS = 2: MMDEF = 2
24030 GoSub 26000
24040 Return
24100 Rem ***************
24110 Rem MONSTER FIGHT GIANT RAT
24120 M$ = "GIANTRAT": MN$ = "Giant Rat"
24130 GoSub 2600
24140 Return
24200 Rem ***************
24210 Rem MONSTER FIGHT GOBLIN WARRIOR
24220 M$ = "GOBLINWARRIOR": MN$ = "Goblin Warrior"
24230 GoSub 2600
24240 Return


25000 Rem ***************
25005 Rem GAMEOVER
25010 Cls
25020 Locate 160, 100
25030 Print "You have died"
25035 GoSub 3520
25040 Locate 161, 100
25050 Print "GAMEOVER"
25060 Rem INKEY$
25070 End



26000 Rem ***************
26010 Rem MONSTER BATTLE ROUTINE
26020 If INI < MINI Then GoTo 26040
26030 If HP = 0 Or HP < 0 Then GoTo 25000
26035 If COMBAT = 0 Then Return
26040 GoSub 3520
26050 A$ = "": B$ = "": C$ = "": D$ = "": E$ = ""
26060 Locate 24, 1
26070 Input ">", A$
26080 If A$ = "" Then Print "You must type something!": Print: GoTo 26030
26090 Rem EMULATE UCASE$
26100 For I = 1 To Len(A$): If Asc(Mid$(A$, I, 1)) > 90 Then Mid$(A$, I, 1) = Chr$(Asc(Mid$(A$, I, 1)) Xor 32)
26110 Next I
26160 A$ = Left$(A$ + Space$(30), 30): M = Len(A$): Rem :IF M<30 THEN A$=A$+" ":GOTO 26160
26170 N = 1
26180 GoSub 26320: B$ = R$
26200 If Left$(B$, 3) = "HEL" And C$ + D$ + E$ = "" Then GoSub 3690: GoTo 26030
26210 If Left$(B$, 3) = "QUI" And C$ + D$ + E$ = "" Then 120
26230 GoSub 26320: C$ = R$
26240 If Left$(C$, 1) <> " " Then 26290
26250 If Rnd(1) > .5 Then 26270
26260 Print "I don't understand that.": Print: GoTo 26030
26270 Print "I don't know what you mean.": Print: GoTo 26030
26280 Rem GET 2 MORE COMMANDS INTO D$ AND E$
26290 GoSub 26320: D$ = R$
26300 GoSub 26320: E$ = R$
26301 GoSub 26320: F$ = R$
26310 GoTo 26400

26320 R$ = "": While N <= M And Mid$(A$, N, 1) = " ": N = N + 1: Wend
26330 While N <= M And Mid$(A$, N, 1) <> " ": R$ = R$ + Mid$(A$, N, 1): N = N + 1: Wend
26340 Return
26350 Rem **************

26400 If B$ = "LOOK" And C$ = "" Then Print "You don't have time to be looking around!": Print: GoTo 26030
26401 If B$ = "LOOK" And C$ = "AT" And D$ = M$ Then Print "The "; MN$; " stares back at you...": Print: GoTo 26030
26410 If B$ = "LOOK" And C$ = "AT" And D$ = "THE" And E$ = M$ Then Print "The "; MN$; " stares back at you...": Print: GoTo 26030
26415 If B$ = "LOOK" And C$ = "AT" And D$ = "THE" And E$ + F$ = "GIANTRAT" Then Print "The "; MN$; " stares back at you...": Print: GoTo 26030
26417 If B$ = "LOOK" And C$ = "AT" And D$ = "THE" And E$ + F$ = "GOBLINWARRIOR" Then Print "The "; MN$; " stares back at you...": Print: GoTo 26030
26420 If B$ = "GO" Or B$ = "WALK" Or B$ = "MOVE" Or B$ = "HEAD" Then Print "You are in a fight! You can't go anywhere.": Print: GoTo 26030
26430 If B$ = "RUN" And C$ = "AWAY" Then GoSub 28000: GoTo 26030
26440 If B$ = "RUN" Or B$ = "FLEE" Then GoSub 28000: GoTo 26030
27000 GoTo 26250


28000 Rem ***************
28010 Rem RUN/FLEE
28020 GoSub 3520
28030 If LVL < MLVL Then GoTo 28050
28032 If LVL > MLVL Then GoTo 28060
28040 If LVL = MLVL Then GoTo 28070
28050 If Rnd(1) > .9 Then GoTo 28090
28055 Print "You failed to escape!": Print: Return
28060 If Rnd(1) > .25 Then GoTo 28090
28065 Print "You failed to escape!": Print: Return
28070 If Rnd(1) > .5 Then GoTo 28090
28075 Print "You failed to escape!": Print: Return
28090 Print "You escaped successfully.": Print: COMBAT = 0: Return













