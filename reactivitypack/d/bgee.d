/* 
  Wizard Slayers, Blackguards & Paladins can interject during Edwin's recruitment
  Component will conflict with any Edwin expansions. Might need adjustments.
                                                                                 */
EXTEND_BOTTOM EDWIN 0
+ ~Kit(Player1,WIZARDSLAYER)~ + ~Dealing with mages is my speciality. I'll do as you ask.~ EXTERN EDWIN 8	
+ ~Kit(Player1,WIZARDSLAYER)~ + ~Why should I seek out this witch, when I could kill the wizard in front of me just as easily? I've no interest in your task.~ EXTERN EDWIN 7		
+ ~Kit(Player1,Blackguard)~ + ~I never turn down a chance to spill some blood. I'll do as you ask.~ EXTERN EDWIN 8	
+ ~Class(Player1,PALADIN_ALL) !Kit(Player1,Blackguard)~ + ~I won't allow you to kill this innocent woman. Forsake this path or face justice.~ EXTERN EDWIN BFS.RPEDWIN1											
END

EXTEND_BOTTOM EDWIN 1
+ ~Kit(Player1,WIZARDSLAYER)~ + ~Dealing with mages is my speciality. I'll do as you ask.~ EXTERN EDWIN 8	
+ ~Kit(Player1,WIZARDSLAYER)~ + ~Why should I seek out this witch, when I could kill the wizard in front of me just as easily? I've no interest in your task.~ EXTERN EDWIN 7
+ ~Kit(Player1,Blackguard)~ + ~I never turn down a chance to spill some blood. I'll do as you ask.~ EXTERN EDWIN 8
+ ~Class(Player1,PALADIN_ALL) !Kit(Player1,Blackguard)~ + ~I won't allow you to kill this innocent woman. Forsake this path or face justice.~ EXTERN EDWIN BFS.RPEDWIN1													
END

EXTEND_BOTTOM EDWIN 2
+ ~Kit(Player1,WIZARDSLAYER)~ + ~Dealing with mages is my speciality. I'll do as you ask.~ EXTERN EDWIN 8		
+ ~Kit(Player1,WIZARDSLAYER)~ + ~Why should I seek out this witch, when I could kill the wizard in front of me just as easily? I've no interest in your task.~ EXTERN EDWIN 7	
+ ~Kit(Player1,Blackguard)~ + ~I never turn down a chance to spill some blood. I'll do as you ask.~ EXTERN EDWIN 8
+ ~Class(Player1,PALADIN_ALL) !Kit(Player1,Blackguard)~ + ~I won't allow you to kill this innocent woman. Forsake this path or face justice.~ EXTERN EDWIN BFS.RPEDWIN1											
END

EXTEND_BOTTOM EDWIN 3
+ ~Kit(Player1,WIZARDSLAYER)~ + ~Dealing with mages is my speciality. I'll do as you ask.~ EXTERN EDWIN 8	
+ ~Kit(Player1,WIZARDSLAYER)~ + ~Why should I seek out this witch, when I could kill the wizard in front of me just as easily? I've no interest in your task.~ EXTERN EDWIN 7	
+ ~Kit(Player1,Blackguard)~ + ~I never turn down a chance to spill some blood. I'll do as you ask.~ EXTERN EDWIN 8
+ ~Class(Player1,PALADIN_ALL) !Kit(Player1,Blackguard)~ + ~I won't allow you to kill this innocent woman. Forsake this path or face justice.~ EXTERN EDWIN BFS.RPEDWIN1												
END

EXTEND_BOTTOM EDWIN 4
+ ~Kit(Player1,WIZARDSLAYER)~ + ~Dealing with mages is my speciality. I'll do as you ask.~ EXTERN EDWIN 8	
+ ~Kit(Player1,WIZARDSLAYER)~ + ~Why should I seek out this witch, when I could kill the wizard in front of me just as easily? I've no interest in your task.~ EXTERN EDWIN 7
+ ~Kit(Player1,Blackguard)~ + ~I never turn down a chance to spill some blood. I'll do as you ask.~ EXTERN EDWIN 8	
+ ~Class(Player1,PALADIN_ALL) !Kit(Player1,Blackguard)~ + ~I won't allow you to kill this innocent woman. Forsake this path or face justice.~ EXTERN EDWIN BFS.RPEDWIN1												
END

CHAIN EDWIN BFS.RPEDWIN1
~You dare to threaten your betters? (They cannot conceive the mistake they've made in crossing me.)~
= ~I care nothing for your notions of justice. But I will leave - and you will regret this.~ DO ~EraseJournalEntry(27031) AddJournalEntry(27032, QUEST_DONE) EscapeArea()~ EXIT

/*
  Blackguards can recognize what Dorn is and generally be his edgelord buddy - RoyalProtector (G3) 
  Component will conflict with any Dorn expansions released in the future. Might need adjustments.
                                                                                                  */
EXTEND_BOTTOM DORN 0
+ ~Kit(Player1,Blackguard)~ + ~Is that how you address someone who shares your calling?~ EXTERN DORN BFS.DORN1
END								

CHAIN DORN BFS.DORN1
~Hah! My patron would be interested in you. But my bloody path calls me elsewhere - after I down my drink.~
DO ~SetGlobal("DORNPLOT","GLOBAL",1)
SetGlobalTimer("oh_dorn_abmush","GLOBAL",ONE_DAY)
AddJournalEntry(30814,INFO)~ EXIT

EXTEND_BOTTOM DORN 9
+ ~!CheckStatGT(Player1,15,INT) Kit(Player1,Blackguard)~ + ~You're a blackguard- like I am - aren't you?~ EXTERN DORN 10
END

EXTEND_BOTTOM DORN 6
+ ~Kit(Player1,Blackguard)~ + ~My patron would accept nothing less.~ EXTERN DORN 7
+ ~Kit(Player1,Blackguard)~ + ~You're not the only terror stalking the Sword Coast.~ EXTERN DORN 7
END	

EXTEND_BOTTOM DORNJ 2
+ ~Kit(Player1,Blackguard)~ + ~Let's see if my interrogation methods prove superior to yours. Where might she be found?~ EXTERN DORNJ 3
END

EXTEND_BOTTOM DORNJ 6
+ ~Kit(Player1,Blackguard)~ + ~A bloody task worthy of my talents.~ DO ~SetGlobal("kryll_conv","GLOBAL",1)~ EXIT
END

EXTEND_BOTTOM DORNJ 15
+ ~Alignment(Player1,MASK_EVIL)~ + ~They break so easily. Taris, I suggest that you tell us everything.~ EXTERN TARIS 5
END

EXTEND_TOP DORNJ 25
+ ~Kit(Player1,Blackguard)~ + ~What happened to Simmeon before the battle? It looked as if he had powers like ours.~ DO ~SetGlobal("DORNPLOT","GLOBAL",5)~ EXTERN DORNJ BFS.RPDORN2
END

CHAIN DORNJ BFS.RPDORN2
~As I understand it, Simmeon accepted the same dark pact as we did, only with a different patron, an enemy of Ur-Gothoz.~
END
++ ~Ur-Gothoz? What exactly is he? It?~ EXTERN DORNJ 28
++ ~Simmeon made a poor choice, it seems. What will you do now that he has fallen?~ EXTERN DORNJ 26

/* 
  Thieves can get a discount from Black Lily - RoyalProtector (G3)
                                                                  */ 
EXTEND_BOTTOM BLACKL 0
+ ~Class(Player1,THIEF_ALL)~ + ~I can shed light on a few issues if you're willing to offer me a discount.~ EXTERN BLACKL BFS.RPBLACKL1
END

CHAIN BLACKL BFS.RPBLACKL1
~Might be you're speaking my language. Information's always welcome in our line of work.~
/* still need to add the actual discounts to the store */ 
DO ~StartStore("stoblack",LastTalkedToBy(Myself))~ 
EXIT

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

