// Let Rangers or Druid recognize what Guril Berries are - then offer alternatives themselves
EXTEND_BOTTOM MURDGIRL 11
+ ~OR(2) Class(Player1,DRUID_ALL) Class(Player1,RANGER_ALL)~ + ~Guril Berries are often used for folk remedies. Salves and the like.~ DO ~SetGlobal("TalkedToHooker1","GLOBAL",1) SetGlobal("BFSTalkedToRose","GLOBAL",1)~ + BFS.GurilBerries1
END

CHAIN MURDGIRL BFS.GurilBerries1
~It doesn't seem like a murderer would use healing salves. Still, that's what I smelled, I'm sure of it.~
END
++ ~There are other options. Items with similar scents. Solik Berries or Oak Bark for instance.~ EXTERN MURDGIRL BFS.GurilBerries2

CHAIN MURDGIRL BFS.GurilBerries2
~Well, if you can find samples, I'm willing to smell them. Try your luck with Bel, the merchant.~ 
END
++ ~Thank you. I'll be back as soon as I can.~ EXTERN MURDGIRL BFS.GurilBerries3

CHAIN MURDGIRL BFS.GurilBerries3
~I'll be waiting. You bought your time.~
END
IF ~~ EXIT

// Ask Bel for the Items
EXTEND_TOP MERCHANT 2
+ ~Global("BFSTalkedToRose","GLOBAL",1)~ + ~Do you have Guril Berries, Oak Bark and Solik Berries in stock?~ + BFS.GurilBerries4
END

CHAIN MERCHANT BFS.GurilBerries4
~Just so happens I do. Free of charge because it's been a slow day.~ DO ~SetGlobal("GaveSmellyItems","GLOBAL",1) SetGlobal("BFSTalkedToRose","GLOBAL",2) GiveItem("MISC6C",LastTalkedToBy) GiveItem("MISC6D",LastTalkedToBy) GiveItem("MISC6E",LastTalkedToBy)~
END
IF ~~ EXIT


