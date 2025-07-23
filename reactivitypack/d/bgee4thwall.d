/*
  Elven & Half Elven CHARNAME can call Winthrop out for his 'elven arse' comment
                                                                                */
EXTEND_BOTTOM INNKE2 6
+ ~OR(2) OR(2) Race(Player1,ELF) Race(Player1,HALF_ELF) Global("BFSWinthropCallout","LOCALS",0)~ + ~Why do you keep comparing your inn's cleanliness to an elven arse?~ DO ~SetGlobal("BFSWinthropCallout","LOCALS",1)~ + BFS.RPWinthropCallout
+ ~OR(2) OR(2) Race(Player1,ELF) Race(Player1,HALF_ELF) Global("BFSWinthropCallout","LOCALS",0)~ + ~Just show me your usual.~ DO ~StartStore("Inn2616",LastTalkedToBy(Myself))~ EXIT
END

CHAIN INNKE2 BFS.RPWinthropCallout
~I don't mean anything rude by it, <CHARNAME>. Just having a bit o' fun.~
= ~Take it as a compliment. Wouldn't be badmouthing my own inn now would I?~ 
END
++ ~Just show me your usual.~ DO ~StartStore("Inn2616",LastTalkedToBy(Myself))~ EXIT
++ ~I'll be leaving then.~ EXIT
