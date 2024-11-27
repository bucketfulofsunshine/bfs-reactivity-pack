/*Shadows of Amn */
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

EXTEND_TOP MERCHANT 2
+ ~Global("BFSTalkedToRose","GLOBAL",1)~ + ~Do you have Guril Berries, Oak Bark and Solik Berries in stock?~ + BFS.GurilBerries4
END

CHAIN MERCHANT BFS.GurilBerries4
~Just so happens I do. Free of charge because it's been a slow day.~ DO ~SetGlobal("GaveSmellyItems","GLOBAL",1) SetGlobal("BFSTalkedToRose","GLOBAL",2) GiveItem("MISC6C",LastTalkedToBy) GiveItem("MISC6D",LastTalkedToBy) GiveItem("MISC6E",LastTalkedToBy)~
END
IF ~~ EXIT


/* Throne of Bhaal */ 
/* 
  Dwarves can defend their kin in Saradush 
                                          */
EXTEND_BOTTOM SARBUL01 1
+ ~Race(Player1,DWARF)~ + ~Do you something against dwarves? If you pick a fight with them, you're also picking a fight with me!~ EXTERN SARBUL01 6
END		

/* 
  Elves can defend their kin in Saradush 
                                        */
EXTEND_BOTTOM SARBUL05 0
+ ~OR(2) Race(Player1,ELF) Race(Player1,HALF_ELF)~ + ~I won't allow you to threaten my kin. Leave us elves alone or face the wrath of a child of Bhaal!~ EXTERN SARBUL05 5
END										 

/* 
  Paladins can tell Countess Santele in Saradush is lying 
  Expand in V2.0 so Paladins can skip Errard 
  and find Ardic by themselves after detecting his lies
                                                         */ 
EXTEND_BOTTOM SARCPT01 19
+ ~Class(Player1,PALADIN) !Kit(Player1,Blackguard)~ + ~There is no justice in imprisoning Mateo without proof. I sensed something amiss with the Countess - she wasn't being wholly truthful.~ EXTERN SARCPT01 21
END				

EXTEND_BOTTOM SARCPT01 23
+ ~Class(Player1,PALADIN) !Kit(Player1,Blackguard)~ + ~My vows compel me to investigate this case.~ EXTERN SARCPT01 24
END													 

EXTEND_BOTTOM SARMAT01 2
+ ~Class(Player1,PALADIN) !Kit(Player1,Blackguard)~ + ~My name is <CHARNAME> and I seek to know the truth. Only then can true justice prevail. Countess Santele's words rang with falsehoods - perhaps you can offer some clarity?~ EXTERN SARMAT01 9
END	 

EXTEND_BOTTOM SARCNT01 4
+ ~Class(Player1,PALADIN) !Kit(Player1,Blackguard)~ + ~I sense your deception, Countess Santele. Why would you implicate Mateo?~ DO ~SetGlobal("MateoJob","GLOBAL",1)~ EXTERN SARCNT01 6
END	 

EXTEND_BOTTOM SARKIS01 29
+ ~Class(Player1,PALADIN) !Kit(Player1,Blackguard)~ + ~Your words ring with falsehoods. I can sense your deception.~ EXTERN SARKIS01 BFS.PaladinTruthSenseKis
END	 

CHAIN SARKIS01 BFS.PaladinTruthSenseKis
~An unfortunate turn of events. I cannot lie to one such as you - but I still hold greater influence.~ 
END
IF ~~ EXTERN SARKIS01 31


