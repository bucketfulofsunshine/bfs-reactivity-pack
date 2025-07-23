/* 
  Druid & Ranger CHARNAME holds an interest in Faldorn's cause.
  Tree Huggers Unite.
  Component will conflict with any Faldorn expansions. Possibly even BG1NPCs.
                                                                             */ 
EXTEND_BOTTOM FALDOR 0 
+ ~OR(2) Class(Player1,DRUID_ALL) Class(Player1,RANGER_ALL)~ + ~While nature suffers, we share a common cause. Join us and we'll attend to this threat. Any differences between us can be settled afterwards.~ EXTERN FALDOR 3
+ ~OR(2) Class(Player1,DRUID_ALL) Class(Player1,RANGER_ALL)~ + ~Every wound they have inflicted upon nature will be returned tenfold. Join us and we'll see these men punished.~ EXTERN FALDOR 3															  
END															  

/* 
  Druid, Ranger & Elven CHARNAME are invested during Dryad's tree conversation. 
  I'd love to expand this to talking Caldo down but it might cause all kinds of compat issues.
  So we're only adding new lines for now.
  Tree Huggers Unite Part Two.
                                                                                              */
EXTEND_BOTTOM DRYAD 0 
+ ~OR(3) Class(Player1,DRUID_ALL) Class(Player1,RANGER_ALL) Race(Player1,ELF)~ + ~No protector of nature would ever disregard your plea. Please, lead on, and we will speak for the forest together.~ EXTERN DRYAD 3
+ ~OR(3) Class(Player1,DRUID_ALL) Class(Player1,RANGER_ALL) Race(Player1,ELF)~ + ~More city-dwellers threatening the sanctivity of the forest. They will pay for their disrespect!~ EXTERN DRYAD 3
END

EXTEND_BOTTOM CALDO 0
+ ~OR(3) Class(Player1,DRUID_ALL) Class(Player1,RANGER_ALL) Race(Player1,ELF)~ + ~This tree is older than both of you. It contributes to a thriving society of inspects, and plants, and you want to *cut it down*? Have you no shame!~ EXTERN CALDO 5
+ ~OR(3) Class(Player1,DRUID_ALL) Class(Player1,RANGER_ALL) Race(Player1,ELF)~ + ~Take one further swing at that tree and I'll cut both of *you* down.~ EXTERN CALDO 2
END

EXTEND_BOTTOM CALDO 1
+ ~OR(3) Class(Player1,DRUID_ALL) Class(Player1,RANGER_ALL) Race(Player1,ELF)~ + ~This tree is older than both of you. It contributes to a thriving society of inspects, and plants, and you want to *cut it down*? Have you no shame!~ EXTERN CALDO 5
+ ~OR(3) Class(Player1,DRUID_ALL) Class(Player1,RANGER_ALL) Race(Player1,ELF)~ + ~Take one further swing at that tree and I'll cut both of *you* down.~ EXTERN CALDO 2
END

/* 
  Thief CHARNAME can call Safana out on her bs because that was sus.
  Component will conflict with any Safana expansions. Possibly even BG1NPCs I'll have to check. 
                                                                                               */
EXTEND_BOTTOM SAFANA 0										   
+ ~Class(Player1,THIEF_ALL)~ + ~Decent effort, sloppy execution. Your trickery's wasted on me however.~ EXTERN SAFANA BFS.RPSAFANA1
END

CHAIN SAFANA BFS.RPSAFANA1
~An unfortunate turn of events, but I can appreciate one who knows their craft. Perhaps we can still be of some...assistance to one another?~ 
END
IF ~~ EXTERN SAFANA 17

/* 
  Time to intimidate, or persuade, those annoying Flaming Fist mercs who accost you on the road.
                                                                                               */ 
EXTEND_BOTTOM FLAM5 0
+ ~Class(Player1,PALADIN_ALL) !Kit(Player1,Blackguard)~ + ~I am a champion of justice, I would never resort to banditry!~ EXTERN FLAM5 5	
+ ~OR(3) Kit(Player1,BARBARIAN) Kit(Player1,BERSERKER) Kit(Player1,Blackguard)~ + ~There will be trouble. The kind you can't handle. Move, now, or face my wrath!~ EXTERN FLAM5 BFS.RPFLAM1
+ ~Race(Player1,HALFLING)~ + ~Is this because I'm a halfling, huh? You think you can pick on anyone smaller than you? Or that all halflings are thieves or...~ EXTERN FLAM5 BFS.RPFLAM2	
+ ~Race(Player1,HALFORC)~ + ~Threaten someone your own size. I'm a half-orc, I can easily crush you!~ EXTERN FLAM5 BFS.RPFLAM1 /* word this line better later omg */ 
END

CHAIN FLAM5 BFS.RPFLAM1
~You've the manner of a bandit about you...but we know when we're outmatched. If we catch you again, you will answer to the law!~
DO ~ReputationInc(-1) EscapeArea()~ 
EXIT

CHAIN FLAM5 BFS.RPFLAM2
~What? No! Just move along and don't let us catch you again.~
DO ~EscapeArea()~ 
EXIT

/* 
  Paladins can try to set Bardolan at ease.
  Key word being TRY.  
                                           */
EXTEND_BOTTOM BARDOL 0 										  
+ ~NumInPartyGT(1) Class(Player1,PALADIN_ALL) !Kit(Player1,Blackguard)~ + ~You seem on edge. I am <CHARNAME> and, upon my honor, my party will cause no harm while we're in your town.~ EXTERN BARDOL 2	
+ ~!NumInPartyGT(1) Class(Player1,PALADIN_ALL) !Kit(Player1,Blackguard)~ + ~You seem on edge. I am <CHARNAME> and, upon my honor, I will cause no harm while I'm in your town.~ EXTERN BARDOL 2
END

/* 
  Dark Soul Monk is more enthusiastic about Viconia joining.
  Component will conflict with any Viconia expansions. Might need adjustments.
                                                                              */
EXTEND_BOTTOM VICONI 5
+ ~Kit(Player1,DARK_MOON)~ + ~Only in darkness do we see clearly, sister, let us serve Shar together.~ EXTERN VICONI 9 
END

EXTEND_BOTTOM VICONI 6
+ ~Kit(Player1,DARK_MOON)~ + ~I know what you are - our kind never speak plainly. Thus only in darkness do we see clearly, sister, let us serve Shar together.~ EXTERN VICONI 9 
END												   

/* 
   Sun Soul monks recognize what Rasaad is and mention their own patron.
   Dark Soul monks recognize him and can choose to kill him - avoiding his quest. 
   Sun Soul reactions should extend to RASAADJ but I haven't touched those yet.
   Component will conflict with any Rasaad expansions. Might need adjustments.
                                                                                 */
EXTEND_BOTTOM RASAAD 1
+ ~Kit(Player1,SUN_SOUL)~ + ~A fellow follower of the Moonmaiden. May Selûne guide your steps in the night, and bring them to the new dawn.~ EXTERN RASAAD BFS.RPRASSELU
+ ~Kit(Player1,SUN_SOUL)~ + ~While I do not worship Selûne, we walk a similar path, brother.~ EXTERN RASAAD BFS.RPRASSUN
+ ~Kit(Player1,DARK_MOON)~ + ~Your presence offends my goddess, Shar. Say your prayers and face the dark embrace of the night.~ EXTERN RASAAD BFS.RPRASSHAR
END

EXTEND_BOTTOM RASAAD 2
+ ~Kit(Player1,SUN_SOUL)~ + ~A fellow follower of the Moonmaiden. May Selûne guide your steps in the night, and bring them to the new dawn.~ EXTERN RASAAD BFS.RPRASSELU
+ ~Kit(Player1,SUN_SOUL)~ + ~While I do not worship Selûne, we walk a similar path brother.~ EXTERN RASAAD BFS.RPRASSUN
+ ~Kit(Player1,DARK_MOON)~ + ~Your presence offends my goddess, Shar. Say your prayers and face the dark embrace of the night.~ EXTERN RASAAD BFS.RPRASSHAR
END

CHAIN RASAAD BFS.RPRASSHAR
~While I never seek out conflict, I will not shy away from it when threatened.~ DO ~ReputationInc(-2) Enemy()~ 
EXIT

CHAIN RASAAD BFS.RPRASSELU 
~An unexpected surprise to find someone like you here but a welcome one nonetheless.~
= ~My name is Rasaad. I was demonstrating the ways in which we Sun Soul monks reflect our spiritual light through physical activity. Though my audience has been less than...~
END
IF ~~ EXTERN RSCOMN01 0

CHAIN RASAAD BFS.RPRASSUN
~An unexpected surprise to find someone like you here but a welcome one. Who do you follow, <PRO_BROTHERSISTER>?~
END
++ ~Lathander.~ EXTERN RASAAD BFS.RPRASINTRO
++ ~Sune.~ EXTERN RASAAD BFS.RPRASINTRO

CHAIN RASAAD BFS.RPRASINTRO
~Another worthy inheritor of Amaunator's legacy.~
= ~My name is Rasaad. I was demonstrating the ways in which we Sun Soul monks reflect our spiritual light through physical activity. Though my audience has been less than...~
END
IF ~~ EXTERN RSCOMN01 0

EXTEND_BOTTOM RSCOMN01 3
+ ~Kit(Player1,SUN_SOUL)~ + ~They don't recognize the dedication our path requires. Don't take their reactions to heart.~ EXTERN RASAAD BFS.RPRASCOM
END

CHAIN RASAAD BFS.RPRASCOM
~Your presence soothes the wounds others would inflict with their words.~
END
++ ~Perhaps you'd like to join me? We can seek enlightenment together.~ EXTERN RASAAD 28
++ ~I'm afraid I must be off. Be well, Rasaad.~ EXTERN RASAAD 29 

/* 
  Wizard Slayers, Blackguards & Paladins can interject during Edwin's recruitment.
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
~You dare to threaten your betters? I care nothing for your notions of justice. But I will leave - and you will regret this.~ DO ~EraseJournalEntry(27031) AddJournalEntry(27032, QUEST_DONE) EscapeArea()~ EXIT

/*
  Blackguards can recognize what Dorn is and generally be his edgelord buddy. 
  Component will conflict with any Dorn expansions released in the future. Might need adjustments.
                                                                                                  */
EXTEND_BOTTOM DORN 0
+ ~Kit(Player1,Blackguard)~ + ~Is that how you address someone who shares your calling?~ EXTERN DORN BFS.DORN1
END								

CHAIN DORN BFS.DORN1
~Hah! My patron would be interested in you. But my bloody path calls me elsewhere - after I finish my drink.~
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
+ ~Kit(Player1,Blackguard)~ + ~What happened to Simmeon before the battle? It looked as though he had powers like ours.~ DO ~SetGlobal("DORNPLOT","GLOBAL",5)~ EXTERN DORNJ BFS.RPDORN2
END

CHAIN DORNJ BFS.RPDORN2
~As I understand it, Simmeon accepted the same dark pact as we did, only with a different patron, an enemy of Ur-Gothoz.~
END
++ ~Ur-Gothoz? What exactly is he? It?~ EXTERN DORNJ 28
++ ~Simmeon made a poor choice, it seems. What will you do now that he has fallen?~ EXTERN DORNJ 26

/* 
  Thieves can get a discount from Black Lily.
                                             */ 
EXTEND_BOTTOM BLACKL 1
+ ~Global("BFSLilyDiscount","LOCALS",0) Class(Player1,THIEF_ALL)~ + ~I can shed light on a few issues if you're willing to offer me a discount.~ EXTERN BLACKL BFS.RPBLACKL1
+ ~Global("BFSLilyDiscount","LOCALS",0) Class(Player1,THIEF_ALL)~ + ~Show me what you have in stock.~ DO ~StartStore("stoblack",LastTalkedToBy(Myself))~ EXIT
END

CHAIN BLACKL BFS.RPBLACKL1
~Might be you're speaking my language. Information's always welcome in our line of work.~ DO ~SetGlobal("BFSLilyDiscount","LOCALS",1) ChangeStoreMarkup("stoblack",30,130) StartStore("stoblack",LastTalkedToBy(Myself))~ 
EXIT

/* 
  Tranzig's not the only mage - it's MAGIC DUEL time
                                                    */
EXTEND_BOTTOM TRANZI 4
+ ~Class(Player1,SORCERER)~ + ~Magic courses through my veins. Do you truly believe you pose any threat?~ EXTERN TRANZI 5
+ ~Kit(Player1,WILDMAGE)~ + ~You're not the only spellcaster present. I'm a Wild Mage - if anyone poses a threat here it's me.~ EXTERN TRANZI 5
+ ~!Kit(Player1,WILDMAGE) !Class(Player1,SORCERER) Class(Player1,MAGE_ALL)~ + ~You're not the only spellcaster present. Let's see who wields magic more deftly.~ EXTERN TRANZI 5
+ ~!Class(Player1,MAGE_ALL) OR(5) Class(Player2,MAGE_ALL) Class(Player3,MAGE_ALL) Class(Player4,MAGE_ALL) Class(Player5,MAGE_ALL) Class(Player6,MAGE_ALL)~ + ~Your threats are meaningless, we also have a mage in our party. Let's see who wields magic more deftly.~ EXTERN TRANZI 5
END

/* 
  Blackguards, Berserkers, Half-Orcs and Barbarians can intimidate Karlat. 
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
  Bards can perform at taverns to earn some coin. 
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

