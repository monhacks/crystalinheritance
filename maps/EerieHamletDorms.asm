EerieHamletDorms_MapScriptHeader: 

	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 3, 9, EERIE_HAMLET, 4


	def_coord_events



	def_bg_events
	object_event 6,  6, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EerieDormsSleepTalkScript, -1 


	def_object_events



	object_const_def


EerieDormsSleepTalkScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_SLEEP_TALK_INTRO
	iftrue EerieDormsTutorSleepTalkScript
	writetext Text_SleepTalkIntro
	waitbutton
	setevent EVENT_LISTENED_TO_SLEEP_TALK_INTRO
EerieDormsTutorSleepTalkScript:
	writetext Text_EerieDormsTutorSleepTalk ;;
	waitbutton
	checkitem SILVER_LEAF
	iffalse .NoSilverLeaf
	writetext Text_EerieDormsTutorQuestion ;;
	yesorno
	iffalse .TutorRefused
	setval SLEEP_TALK
	writetext ClearText
	special Special_MoveTutor
	ifequal $0, .TeachMove
.TutorRefused
	jumpopenedtext Text_EerieDormsTutorRefused ;; 

.NoSilverLeaf
	jumpopenedtext Text_EerieDormsTutorNoSilverLeaf

.TeachMove
	takeitem SILVER_LEAF
	jumpopenedtext Text_EerieDormsTutorTaught ;;
	
Text_SleepTalkIntro: 
	text "I'm the resident"
	line "sleep expert."
	
	para "While we sleep,"
	line "our deepest fears"
	cont "and desires speak"
	cont "through our sub-"
	cont "conscious."
	
	para "Master this power"
	line "and you control"
	cont "what lies beneath"
	cont "the waking mind!"	
	done

Text_EerieDormsTutorSleepTalk:
	text "I can teach you"
	line "to listen to your"
	para "#mon's Sleep"
	line "Talk, for a"
	cont "Silver Leaf."
	done

Text_EerieDormsTutorNoSilverLeaf:
	text "You don't have"
	line "a Silver Leaf."
	done

Text_EerieDormsTutorQuestion:
	text "Should I teach"
	line "your #mon"
	cont "to Sleep Talk?"
	done

Text_EerieDormsTutorRefused:
	text "Don't let the"
	line "bed bugs bite."
	done

Text_EerieDormsTutorTaught:
	text "Come see me if"
	line "you need another"
	cont "tutor."
	done
