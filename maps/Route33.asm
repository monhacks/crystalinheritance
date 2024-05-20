Route33_MapScriptHeader:
	def_scene_scripts

	def_callbacks
;	callback MAPCALLBACK_TILES, Route33RainScript

	def_warp_events
	warp_event 11,  9, UNION_CAVE_1F, 3

	def_coord_events

	def_bg_events
	bg_event 11, 11, BGEVENT_JUMPTEXT, Route33SignText

	def_object_events
	object_event 11, 12, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerHikerAnthony, -1
	object_event 12, 17, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolgirlImogen, -1
	object_event 13, 16, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route33PayDayScript, -1 ;todo make this cost a silver leaf
	fruittree_event 14, 16, FRUITTREE_ROUTE_33, PECHA_BERRY, PAL_NPC_RED

;Route33RainScript:
;	special Special_GetOvercastIndex
;	ifequal AZALEA_OVERCAST, .rain
;	changemapblocks Route33_BlockData
;	endcallback

;.rain
;	changemapblocks Route33Raining_BlockData
;	endcallback

TrainerHikerAnthony: ;rewrite him as a generic trainer todo
	trainer HIKER, ANTHONY1, EVENT_BEAT_HIKER_ANTHONY, HikerAnthony1SeenText, HikerAnthony1BeatenText, 0, .Script

.Script:
;	loadvar VAR_CALLERID, PHONE_HIKER_ANTHONY
	faceplayer
	opentext
;	checkflag ENGINE_ANTHONY_READY_FOR_REMATCH
;	iftrue .Rematch
;	checkflag ENGINE_DUNSPARCE_SWARM
;	iftrue_jumpopenedtext HikerAnthonyDunsparceText
;	checkcellnum PHONE_HIKER_ANTHONY
;	iftrue .NumberAccepted
;	checkevent EVENT_ANTHONY_ASKED_FOR_PHONE_NUMBER
;	iftrue .AskAgain
	writetext HikerAnthony1AfterText
	closetext
	done
;	promptbutton
;	setevent EVENT_ANTHONY_ASKED_FOR_PHONE_NUMBER
;	callstd asknumber1m
;	sjump .AskForPhoneNumber


GenericTrainerSchoolgirlImogen:
	generictrainer SCHOOLGIRL, IMOGEN, EVENT_BEAT_SCHOOLGIRL_IMOGEN, SchoolgirlImogenSeenText, SchoolgirlImogenBeatenText

	text "I'm trying hard so"
	line "I can be the star"
	cont "in my class."
	done

HikerAnthony1SeenText:
	text "Do you have the"
	line "strength to work"
	cont "in the cave?"
	done

HikerAnthony1BeatenText:
	text "I sure don't."
	done

HikerAnthony1AfterText:
	text "Be careful."
	
	para "They're mining"
	line "in Union Cave."
	done

SchoolgirlImogenSeenText:
	text "I got this cute"
	line "#mon from"
	cont "Prof. Elm."
	done

SchoolgirlImogenBeatenText:
	text "I wonder where"
	line "everyone else"
	cont "got theirs?"
	done

Route33SignText:
	text "Danger: no"
	line "unauthorized"
	cont "spelunking!"
	done

Route33PayDayScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_PAY_DAY_INTRO
	iftrue Route33TutorPayDayScript
	writetext Text_PayDayIntro
	waitbutton
	setevent EVENT_LISTENED_TO_PAY_DAY_INTRO
Route33TutorPayDayScript:
	writetext Text_Route33TutorPayDay ;;
	waitbutton
	checkitem SILVER_LEAF
	iffalse .NoSilverLeaf
	writetext Text_Route33TutorQuestion ;;
	yesorno
	iffalse .TutorRefused
	setval PAY_DAY
	writetext ClearText
	special Special_MoveTutor
	ifequal $0, .TeachMove
.TutorRefused
	jumpopenedtext Text_Route33TutorRefused ;; 

.NoSilverLeaf
	jumpopenedtext Text_Route33TutorNoSilverLeaf

.TeachMove
	takeitem SILVER_LEAF
	jumpopenedtext Text_Route33TutorTaught ;;
	
Text_PayDayIntro: 
	text "I got fired"
	line "from my job as"
	cont "a dishwasher."
	
	para "I don't know"
	line "why, I was just"
	cont "using cold water"
	cont "to rinse the"
	cont "dishes."
	
	para "Anyway, now"
	line "we are farming"
	cont "Pay Day to "
	cont "make rent."
	done

Text_Route33TutorPayDay:
	text "I can teach your"
	line "#mon to use"

	para "Pay Day, for"
	line "a Silver Leaf."
	done

Text_Route33TutorNoSilverLeaf:
	text "You don't have"
	line "a Silver Leaf."
	
	para "Check Ilex For-"
	line "est, or the"
	cont "Azalea Mart."
	done

Text_Route33TutorQuestion:
	text "Should I teach"
	line "your #mon"
	cont "Pay Day?"
	done

Text_Route33TutorRefused:
	text "Alright then."
	done

Text_Route33TutorTaught:
	text "Use Pay Day to"
	line "get some coins"
	cont "in a pinch!"
	done
