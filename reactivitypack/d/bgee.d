/* 
Druid or Ranger can talk the rats down - RoyalProtector (G3)
*/ 
EXTEND_BOTTOM REEVOR 0
+ ~OR(2) Class(Player1,RANGER_ALL) Class(Player1,DRUID_ALL)~ + ~I'm not killing the rats for you, Reevor. But I will talk them down. This is no safe place for them.~ EXTERN REEVOR BFS.RPReevor1
+ ~OR(2) Class(Player1,RANGER_ALL) Class(Player1,DRUID_ALL)~ + ~On my way.~ EXTERN REEVOR BFS.RPReevor2
END

CHAIN REEVOR BFS.RPReevor1
~I don't care how you do it, long as they're out of the building. Won't be good for anyone in Candlekeep if they eat through our provisions.~
DO ~SetGlobal("BFSSaveTheRatties","GLOBAL",1) AddJournalEntry(@100001, QUEST)~
EXIT

CHAIN REEVOR BFS.RPReevor2
~I'll be waiting.~ DO ~AddJournalEntry(27411, QUEST)~
EXIT

// Append Reevor dialogue for reward to NOT mention killing rats

/* 
Tranzig's not the only mage - it's MAGIC DUEL time
*/
EXTEND_BOTTOM TRANZI 4
+ ~Class(Player1,SORCERER)~ + ~Magic courses through my veins. Do you truly believe you pose any threat?~ EXTERN TRANZI 5
+ ~Kit(Player1,WILDMAGE)~ + ~You're not the only spellcaster present. I'm a Wild Mage - if anyone poses a threat here it's me.~ EXTERN TRANZI 5
+ ~!Kit(Player1,WILDMAGE) !Class(Player1,SORCERER) Class(Player1,MAGE_ALL)~ + ~You're not the only spellcaster present. Let's see who wields magic more deftly.~ EXTERN TRANZI 5
END

/* 
Blackguards and Barbarians can intimidate Karlat 
*/ 

EXTEND_BOTTOM KARLAT 0
+ ~OR(4) Race(Player1,HALFORC) Kit(Player1,BERSERKER) Kit(Player1,BARBARIAN) Kit(Player1,Blackguard)~ + ~You dare to threaten me? You're less than dirt beneath my boot.~ EXTERN KARLAT BFS.RPKarlat
END

CHAIN KARLAT BFS.RPKarlat
~Reckon you're more than I signed up for. A lot more.~ 
= ~Gotta run.~ 
DO ~GiveGoldForce(38) GiveItemCreate("SCRLKAR",Player1,1,0,0) GiveItemCreate("SHLD03",Player1,1,0,0) GiveItemCreate("AX1H01",Player1,1,0,0) GiveItemCreate("CHAN01",Player1,1,0,0) EscapeArea()~
EXIT

/* 
Bards can perform at taverns for a moderate fee 
*/ 

/* Friendly Arm Inn */ 
EXTEND_BOTTOM BENTLY 0
+ ~Global("BFSBentlyPerform","LOCALS",0) Class(Player1,BARD_ALL)~ + ~I'm hoping to earn some coin. May I perform at your inn for a few hours?~ DO ~SetGlobal("BFSBentlyPerform","LOCALS",1)~ + BFS.RPBently1
END

EXTEND_BOTTOM BENTLY 1
+ ~Global("BFSBentlyPerform","LOCALS",0) Class(Player1,BARD_ALL)~ + ~I'm hoping to earn some coin. May I perform at your inn for a few hours?~ DO ~SetGlobal("BFSBentlyPerform","LOCALS",1)~ + BFS.RPBently1
END

CHAIN BENTLY BFS.RPBently1
~Not many folk passing through, but those who do are weighed down with worries. Perhaps a tune will lift their spirits.~ 
= ~Tell you what, I'll pay you fifty-gold for your time, and you'll get a mug of ale from me afterwards.~ 
END
++ ~It's a deal. Point me to the stage...~ EXTERN BENTLY BFS.RPBentlyPerform
++ ~That's less than I hoped for. I cannot accept your offer.~ EXTERN BENTLY BFS.RPBently2
++ ~That offer is insulting. I refuse!~ EXTERN BENTLY BFS.RPBently2

CHAIN BENTLY BFS.RPBently2
~I can't afford more than that, I'm afraid.~ 
EXIT

CHAIN BENTLY BFS.RPBentlyPerform
~Just settle in wherever seems comfortable.~ 
DO ~GiveGoldForce(50) AddXPObject(Player1,200) RestParty()~ 
EXIT

