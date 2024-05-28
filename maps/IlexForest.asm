IlexForest_MapScriptHeader:
	def_scene_scripts

	def_callbacks ;todo movement around the scene is really off.
	callback MAPCALLBACK_OBJECTS, Callback_IlexForest_Kurt2

	def_warp_events
	warp_event  3,  7, ROUTE_34_ILEX_FOREST_GATE, 3 ;ok
	warp_event  5, 44, ILEX_FOREST_AZALEA_GATE, 1 ;ok
	warp_event  5, 45, ILEX_FOREST_AZALEA_GATE, 2
;	warp_event 25, 24, HIDDEN_TREE_GROTTO, 1 ;need to see how these are implemented... 

	def_coord_events
	coord_event  7, 26, 1, IlexForestKurtEngineerScript

	def_bg_events
	bg_event  5, 19, BGEVENT_JUMPTEXT, Text_IlexForestSignpost0;
	bg_event 11, 31, BGEVENT_JUMPTEXT, Text_IlexForestSignpost1;
	bg_event 20, 29, BGEVENT_ITEM + ETHER, EVENT_ILEX_FOREST_HIDDEN_ETHER ;ok
	bg_event 24, 16, BGEVENT_ITEM + SUPER_POTION, EVENT_ILEX_FOREST_HIDDEN_SUPER_POTION;ok
	bg_event  3, 19, BGEVENT_ITEM + FULL_HEAL, EVENT_ILEX_FOREST_HIDDEN_FULL_HEAL;
	bg_event 20,  9, BGEVENT_JUMPTEXT, Text_IlexForestMossRock;
	bg_event  2, 31, BGEVENT_ITEM + SILVER_LEAF, EVENT_ILEX_FOREST_HIDDEN_SILVER_LEAF_1
	bg_event 15, 17, BGEVENT_ITEM + SILVER_LEAF, EVENT_ILEX_FOREST_HIDDEN_SILVER_LEAF_2 ;maybe make 
	bg_event 10, 24, BGEVENT_READ, IlexForestShrineScript
;	bg_event 17, 23, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ILEX_FOREST
;	bg_event 18, 23, BGEVENT_JUMPSTD, treegrotto, HIDDENGROTTO_ILEX_FOREST

	def_object_events ; BUG CATCHERS AND YOUNGSTERS
	object_event  8, 27, SPRITE_KURT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestKurtScript, EVENT_LOGGERS_ILEX_FOREST ;todo change this event for having gone back in time the first time
	object_event 11, 27, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EngineerCamdenScript, EVENT_LOGGERS_ILEX_FOREST 
	object_event 10, 26, SPRITE_BALL_CUT_FRUIT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GSBallScript, EVENT_LOGGERS_ILEX_FOREST
	pokemon_event  9, 27, SHUCKLE, -1, -1, PAL_NPC_RED, IlexForestShuckleText, EVENT_LOGGERS_ILEX_FOREST
	pokemon_event 10, 27, SCIZOR, -1, -1, PAL_NPC_RED, IlexForestScizorText, EVENT_LOGGERS_ILEX_FOREST
	object_event 10, 25, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestKurt2Script, EVENT_ILEX_SHRINE_CELEBI ;kurt2 should disappear until after EVENT_LOGGERS_ILEX_FOREST and then disappear after EVENT_ILEX_SHRINE_CELEBI
	object_event 10, 21, SPRITE_CELEBI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestCelebiScript, EVENT_KURTS_HOUSE_KURT_0
	object_event 25, 24, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexHealerScript, -1
	object_event  5, 35, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBug_catcherWade, -1 
	object_event 13, 36, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterJoey, -1 
	object_event 19, 25, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBug_catcherArnie, -1 
	object_event 29, 31, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerYoungsterMikey, -1 ; -
	object_event 25, 19, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPicnickerLiz, -1 ; 
	object_event 29, 11, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerEngineerSmith, EVENT_LOGGERS_ILEX_FOREST
	object_event 15, 14, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerOfficerMKeith, EVENT_LOGGERS_ILEX_FOREST ;todo move keith
	cuttree_event 19,  6, EVENT_ILEX_FOREST_CUT_TREE; ok
	itemball_event 22, 34, REVIVE, 1, EVENT_ILEX_FOREST_REVIVE ;ok
	itemball_event 13, 14, ANTIDOTE, 1, EVENT_ILEX_FOREST_ANTIDOTE ;ok
	itemball_event 19, 16, SUPER_POTION, 1, EVENT_ILEX_FOREST_MULCH;OK


	object_const_def
	const ILEX_FOREST_KURT
	const ILEX_FOREST_CAMDEN ;ENGINEER
	const ILEX_GS_BALL
	const ILEX_SHUCKLE
	const ILEX_SCIZOR 
	const ILEX_FOREST_KURT2
	const ILEX_CELEBI


Callback_IlexForest_Kurt2:
	checkevent EVENT_LOGGERS_ILEX_FOREST
	iftrue .DoesKurt2Appear
	disappear ILEX_FOREST_KURT2
	endcallback

.Kurt2Disappears
	disappear ILEX_FOREST_KURT2
	endcallback

.DoesKurt2Appear:
	checkevent EVENT_ILEX_SHRINE_CELEBI
	iftrue .Kurt2Disappears
	appear ILEX_FOREST_KURT2
	endcallback


IlexForestKurtScript:
	faceplayer
	opentext
	writetext RuinsOfAlphText
	closetext
	end
	
Text_IlexForestMossRock:
	text "The rock is cover-"
	line "ed in moss."

	para "It feels pleasant-"
	line "ly cool."
	done

Text_IlexForestSignpost0:
	text "Ilex Forest is"
	line "so overgrown with"

	para "trees that you"
	line "can't see the sky."

	para "Please watch out"
	line "for items that may"
	cont "have been dropped."
	done

Text_IlexForestSignpost1:
	text "Report any susp-"
	line "icious activity"
	cont "to Goldenrod"
	cont "police or to"
	
	para "Silph Forestry,"
	line "on behalf of"
	cont "Violet City Gym"
	cont "Leader Falkner." 
	done

Text_IlexForestShrine:
	text "Ilex Forest"
	line "Shrine…"

	para "It's in honor of"
	line "the forest's"
	cont "protector…"
	done

GenericTrainerBug_catcherWade:
	generictrainer BUG_CATCHER, WADE1, EVENT_BEAT_BUG_CATCHER_WADE, Bug_catcherWadeSeenText, Bug_catcherWadeBeatenText

	text "If I find a"
	line "tinymushroom,"
	cont "could I grow"
	cont "it to a Paras?"
	done

Bug_catcherWadeSeenText:
	text "Bug #mon"
	line "are so cool!"
	done

Bug_catcherWadeBeatenText:
	text "When these "
	line "evolve, you will"
	cont "be sorry..."
	done

GenericTrainerYoungsterJoey:
	generictrainer YOUNGSTER, JOEY1, EVENT_BEAT_YOUNGSTER_JOEY, YoungsterJoeySeenText, YoungsterJoeyBeatenText

	text "If I ever need"
	line "money, pay day"
	line "comes in handy."
	done
	
YoungsterJoeySeenText:
	text "Isn't this"
	line "#mon cute?"
	done

YoungsterJoeyBeatenText:
	text "Yours is cute"
	line "and strong."
	done

GenericTrainerBug_catcherArnie:
	generictrainer BUG_CATCHER, ARNIE1, EVENT_BEAT_BUG_CATCHER_ARNIE, Bug_catcherArnieSeenText, Bug_catcherArnieBeatenText ;this seems to keep calling someone else... 

	text "My Yanma likes"
	line "it when we watch"
	cont "dragon movies."
	done

Bug_catcherArnieSeenText:
	text "The rarer the"
	line "#mon, the"
	cont "cooler you are"
	cont "to girls!"
	done

Bug_catcherArnieBeatenText:
	text "Lost my buzz."
	done

GenericTrainerYoungsterMikey:
	generictrainer YOUNGSTER, MIKEY, EVENT_BEAT_YOUNGSTER_MIKEY, YoungsterMikeySeenText, YoungsterMikeyBeatenText
	text "I always carry"
	line "antidotes when"
	cont "training EKANS."
	done
	
YoungsterMikeySeenText:
	text "I found these"
	line "#mon while"
	cont "camping!"
	done

YoungsterMikeyBeatenText:
	text "Maybe they're"
	line "no good."
	done
	
	
GenericTrainerPicnickerLiz:
	generictrainer PICNICKER, LIZ1, EVENT_BEAT_PICNICKER_LIZ, PicnickerLizSeenText, PicnickerLizBeatenText
	text "There used to be"
	line "way more campsites"
	cont "before Silph sta-"
	cont "rted logging."
	done
	
	PicnickerLizSeenText:
	text "When camping in"
	line "the forest, you"
	cont "need to put out"
	cont "your fire!"
	done
	
	PicnickerLizBeatenText:
	text "Doused!"
	done
	
GenericTrainerEngineerSmith:
	generictrainer ENGINEER, SMITH, EVENT_BEAT_ENGINEER_SMITH, EngineerSmithSeenText, EngineerSmithBeatenText	
	text "I thought it"
	line "would make a"
	cont "Magneton..."
	done
	
	EngineerSmithSeenText:
	text "Do you know about"
	line "the Steel type?"
	done
	
	EngineerSmithBeatenText:
	text "I thought it"
	line "would make a"
	cont "Magneton..."
	done
	
GenericTrainerOfficerMKeith:	
	generictrainer OFFICERM, KEITH, EVENT_BEAT_OFFICERM_KEITH, OfficerMKeithSeenText, OfficerMKeithBeatenText	
	text "Stay out of"
	line "trouble."
	done
	
	OfficerMKeithSeenText:
	text "Halt! Do you have"
	line "a permit to be"
	cont "here?"
	done
	
	OfficerMKeithBeatenText:
	text "There's been a"
	line "lot of vandalism"
	cont "here. Let me know"
	cont "if you see"
	cont "anything."
	done
	
IlexHealerScript:
	opentext
	writetext WantToHeal
	yesorno
	iftrue IlexHealing
	end ;used to be endtext
	
WantToHeal:
	text "My kids are out"
	line "playing with"
	cont "#mon. I have"
	cont "healing items, if"
	cont "you want some."
	done

IlexHealing:
	special HealParty
	special SaveMusic	
	writetext IlexHealedPokemon
	playmusic MUSIC_NONE	
	special RestoreMusic
	end
	
IlexForestKurtEngineerScript: 
	disappear ILEX_SHUCKLE
	disappear ILEX_SCIZOR
	applymovement ILEX_FOREST_KURT, KurtMovesAfterBattle
	applymovement ILEX_FOREST_CAMDEN, CamdenMovesAfterBattle
	applymovement PLAYER, PlayerMovesBelowKurtMovement 
	showemote EMOTE_SHOCK, ILEX_FOREST_KURT, 15
	opentext
	writetext KurtText1 
	closetext
	applymovement ILEX_FOREST_CAMDEN, CamdenMoves1
	opentext
	writetext CamdenText1
	writetext KurtText2
	closetext
	disappear ILEX_GS_BALL
	applymovement ILEX_FOREST_CAMDEN, CamdenMoves2
	opentext
	writetext CamdenText2
	closetext
	clearevent EVENT_LOGGERS_ILEX_FOREST
	winlosstext CamdenWinText, 0
	setlasttalked ILEX_FOREST_CAMDEN
	loadtrainer ENGINEER, CAMDEN
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
;	special DeleteSavedMusic
;	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CamdenLeavingText ; should i opentext closetext this?
	closetext
	applymovement ILEX_FOREST_CAMDEN, CamdenExitMovement
	disappear ILEX_FOREST_CAMDEN
	applymovement ILEX_FOREST_KURT, KurtShowsShrineMovement
	applymovement PLAYER, PlayerMovesToShrine
	opentext
	writetext KurtExplainsGSBallText
	showemote EMOTE_SHOCK, ILEX_FOREST_KURT, 15
	turnobject ILEX_FOREST_KURT, LEFT
	turnobject PLAYER, RIGHT
	writetext KurtExplainsGSBallText2
	closetext
	setevent EVENT_LOGGERS_ILEX_FOREST
	setscene $0 ;won't get set for the time travel until ruins of alph is done
	waitsfx
	playmapmusic
	end	

KurtMovesAfterBattle:
	step_up
	step_right
	step_end
	
CamdenMovesAfterBattle:
	step_up
	turn_head_left
	step_end

PlayerMovesBelowKurtMovement:
	step_right
	step_down
	step_right
	step_end
	
KurtText1:
	text "This place is"
	line "sacred!"
	done
	
CamdenMoves1:
	step_down
	step_end
	
CamdenText1:
	text "We need this lum-"
	line "ber for the Vio-"
	cont "let tower. They"
	cont "are putting a "
	cont "very heavy"
	cont "#mon on top."
	done

KurtText2:
	text "Your steel types"
	line "are abominations!"
	
	para "They cut down so"
	line "many trees.  Just"
	cont "look at what"
	cont "you've dug up!"
	
	para "This ball honors"
	line "the forest's"
	cont "protector."

	para "I will take it"
	line "for safe keeping."
	done
	
CamdenMoves2:
	step_left
	step_end
	
CamdenText2:
	text "Steel types are"
	line "natural, just as"
	cont "I naturally"
	cont "beat you."
	
	para "Ah? You have some"
	line "reinforcements?"
	cont "How cute. I'll"
	cont "dispatch you too!"
	done

CamdenWinText:
	text "Impressive to"
	line "beat my steel"
	cont "type."
	done

CamdenLeavingText:
	text "Tch. We will"
	line "leave for now,"
	cont "but later be"
	cont "back with a"
	cont "vengeance."
	done

CamdenExitMovement:
	step_up
	step_up
	step_left
	step_left
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

KurtShowsShrineMovement:
	step_right
	step_up
	step_end
	
PlayerMovesToShrine:
	step_up
	step_up
	step_end
	
KurtExplainsGSBallText:
	text "Only recently were"
	line "steel types used"
	cont "widely in Johto."
	
	para "I wish we could"
	line "go back in time"
	cont "and make it so"
	cont "they never were."
	
	para "Just look at what"
	line "Steel types do to"
	cont "the forest! They"
	cont "cut near the shr-"
	cont "ine, and nearly"
	cont "destroyed this"
	cont "artifact..."
	done
	
KurtExplainsGSBallText2:
	text "<PLAYER>!"
	line "This is the GS"
	cont "Ball, used to"
	cont "summon Celebi."
	
	para "It just needs an"
	line "inscription. If"
	cont "I had a copy of"
	cont "ancient writing,"
	cont "I could restore"
	cont "it."
	
	para "<PLAYER>, you"
	line "need to go to"
	cont "the Ruins of"
	cont "Alph, and then"
	cont "we can summon"
	cont "Celebi to go"
	cont "back in time!"
	done



IlexHealedPokemon:
	text "Your #mon"
	line "were healed!"
	done

EngineerCamdenScript: ;shouldn't be able to access this
	faceplayer
	done
	
GSBallScript: ;shouldn't be able to access this
	opentext
	writetext GSBallText
	closetext
	done
	
GSBallText: ;shouldn't be able to access this
	text "A damaged"
	line "artifact."
	done

IlexForestShuckleText: ; shouldn't be able to access this
	text "Shucka shuck!"
	done
	
IlexForestScizorText:
	text "Snip"
	done ; shouldn't be able to access this

IlexForestKurt2Script:
	faceplayer
	opentext
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER ;got unown report
	iftrue .SummonCelebi
	writetext RuinsOfAlphText
	closetext
	end

.SummonCelebi:
	writetext GotTheUnownReport
	turnobject ILEX_FOREST_KURT2, UP
	writetext InsertingGSBallText
	closetext
	appear ILEX_CELEBI
	applymovement ILEX_CELEBI, IlexCelebiMovement
	opentext
	writetext WhatIsNaturalText
	closetext
	applymovement ILEX_CELEBI, IlexCelebiMoves2
	setevent SUMMONED_CELEBI_IN_ILEX
	opentext
	writetext AskToTimeTravelText
	yesorno
	iffalse_jumpopenedtext .NoTimeTravelText
	writetext .YesTimeTravelText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp KURTS_HOUSE, 15, 6
	end

IlexForestShrineScript:
	checkevent SUMMONED_CELEBI_IN_ILEX
	iffalse .BeautifulShrine
	opentext
	writetext AskToTimeTravelText
	yesorno
	iffalse_jumpopenedtext .NoTimeTravelText
	writetext .YesTimeTravelText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp KURTS_HOUSE, 15, 6
	end

.BeautifulShrine:
	jumpthistext

	text "A beautiful"
	line "shrine built 20"
	cont "years ago to honor"
	cont "Celebi."
	done

AskToTimeTravelText:
	text "Travel back"
	line "in time?"
	done

.NoTimeTravelText:
	text "More to do in"
	line "the present." 
	done
	
.YesTimeTravelText:
	text "Time to go!"
	done

RuinsOfAlphText:
	text "The GS Ball needs"
	line "an inscription"
	cont "of ancient wri-"
	cont "ting. I need you"
	cont "to get a sample"
	cont "from the Ruins"
	cont "of Alph."
	done

GotTheUnownReport:
	text "Ah, <PLAYER>!"
	line "Great work."
	cont "The Unown Report"
	cont "will do great."
	
	para "Now we can ask"
	line "Celebi for help"
	cont "traveling back"
	cont "in time to stop"
	cont "Steel types from"
	cont "taking over."
	
	para "I'll inscribe"
	cont "the ball with"
	cont "the ancient"
	cont "markings..."
	done
	
InsertingGSBallText:
	text "Perfect. The ball"
	line "goes onto the"
	cont "stage of the"
	cont "shrine, like so."
	done

IlexCelebiMovement:
	step_down
	step_down
	step_down
	step_end ;should end right on the shrine
	
IlexCelebiMoves2:
	step_left
	step_right
	turn_head_down
	step_end
	
WhatIsNaturalText:
	text "Celebi: An"
	line "unnatural inv-"
	cont "ention destroys"
	cont "my forest."
	
	para "If you decide"
	line "to help me, it"
	cont "will take you"
	cont "to unexpected"
	cont "places."	
	done
	