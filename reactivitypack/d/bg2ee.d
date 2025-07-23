/*
  Let Rangers or Druids recognize what Guril Berries are then offer alternatives themselves
                                                                                           */
EXTEND_BOTTOM MURDGIRL 11
+ ~OR(2) Class(Player1,DRUID_ALL) Class(Player1,RANGER_ALL)~ + ~Guril Berries are often used in folk remedies. For salves and such.~ DO ~SetGlobal("TalkedToHooker1","GLOBAL",1) SetGlobal("BFSTalkedToRose","GLOBAL",1)~ + BFS.GurilBerries1
END

CHAIN MURDGIRL BFS.GurilBerries1
~It doesn't seem like a murderer would use healing salves...but that's what I smelled, I'm certain of it.~
END
++ ~There are other options. Items with similar scents. Solik Berries or Oak Bark for instance.~ EXTERN MURDGIRL BFS.GurilBerries2

CHAIN MURDGIRL BFS.GurilBerries2
~Well, if you can find samples, I'll give them a sniff. Try your luck with Bel, the merchant.~ 
END
++ ~Thank you. I'll return as soon as I can.~ EXTERN MURDGIRL BFS.GurilBerries3

CHAIN MURDGIRL BFS.GurilBerries3
~I'll be waiting. You bought your time.~
END
IF ~~ EXIT

/* Ask Bel for the Items */ 
EXTEND_TOP MERCHANT 2 /* not ideal to extend_top here, might break some interjections */ 
+ ~Global("BFSTalkedToRose","GLOBAL",1)~ + ~Do you have Guril Berries, Oak Bark and Solik Berries in stock?~ + BFS.GurilBerries4
END

CHAIN MERCHANT BFS.GurilBerries4
~Just so happens I do. Free of charge because it's been a slow day.~ DO ~SetGlobal("GaveSmellyItems","GLOBAL",1) SetGlobal("BFSTalkedToRose","GLOBAL",2) GiveItem("MISC6C",LastTalkedToBy) GiveItem("MISC6D",LastTalkedToBy) GiveItem("MISC6E",LastTalkedToBy)~
END
IF ~~ EXIT

/* 
  Shaman can offer to assist Wellyn's parents
                                             */ 
EXTEND_TOP MOURNER6 2 /* not ideal to extend_top here, might break some interjections */ 
+ ~Class(Player1,SHAMAN) Global("BFSShamanOfferedAssist","LOCALS",0)~ + ~I have an affinity for talking with spirits. Perhaps I can be of some assistance?~ DO ~SetGlobal("BFSShamanOfferedAssist","LOCALS",1)~ + BFS.ShamanAssist
END

CHAIN MOURNER6 BFS.ShamanAssist
~Truly? We have nothing of value to offer stranger. Save our gratitude and the warmth of our harth.~
= ~Wellyn's appeared to us at night. If you would help us, that's when you ought to seek him out.~ 
END
IF ~~ EXIT

/* 
  Clerics of Lathander can have a little bonding moment with Amaunator's avatar 
  A little 4E nod, which won't be popular with everyone, but YOLO
                                                                               */ 
EXTEND_BOTTOM RIFTG03 4 
+ ~Kit(Player1,GODLATHANDER)~ + ~There is something almost familiar about you.~ + BFS.AmaunatorLathanderLink
END																			   

CHAIN RIFTG03 BFS.AmaunatorLathanderLink
~Your presence draws a faint whisper of power. But you stoke an ember where I require a wildfire.~
= ~Those outside follow no longer.~ 
END
IF ~~ EXTERN RIFTG03 5

/* 
  ANY Cleric or Paladin can sense a touch of the divine about Amaunator's avatar 
                                                                     */
EXTEND_BOTTOM RIFTG03 0 
+ ~Or(2) Class(Player1,PALADIN_ALL) Class(Player1,CLERIC_ALL)~ + ~I sense a touch of the divine. Who are you?~ EXTERN RIFTG03 1
END																		 

