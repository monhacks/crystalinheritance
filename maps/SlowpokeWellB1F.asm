SlowpokeWellB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events ;todo not warping me to b1f
	warp_event 17, 15, SLOWPOKE_WELL_ENTRANCE, 2
	warp_event  7, 11, SLOWPOKE_WELL_B2F, 1
	warp_event 13,  1, UNION_CAVE_B1F_SOUTH, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 13, 2, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FGuardScript, SLOWPOKE_WELL_MOVED_ASIDE
	strengthboulder_event  3, 2
	itemball_event 10,  3, SUPER_POTION, 1, EVENT_SLOWPOKE_WELL_B1F_SUPER_POTION
	object_event  5,  4, SPRITE_BAKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FRolloutScript, -1 ;todo make this cost a silver leaf

	object_const_def
	const SLOWPOKE_WELL_B1F_SCHOOLBOY ;fixed?

SlowpokeWellB1FGuardScript:
	faceplayer
	opentext
	checkevent SLOWPOKE_WELL_MOVED_ASIDE
	iftrue .MovedAside
	checkevent EVENT_LOGGERS_ILEX_FOREST
	iftrue .MovesAside
	writetext SlowpokeWellImGuardingText
	closetext
	end ;is this how it is done?
	
.MovesAside:
	writetext SlowpokeWellMovesAsideText
	applymovement SLOWPOKE_WELL_B1F_SCHOOLBOY, MovesAsideMovement
	setevent SLOWPOKE_WELL_MOVED_ASIDE
	closetext
	end

.MovedAside:
	writetext SlowpokeWellMovesAsideText
	closetext
	end

SlowpokeWellImGuardingText:
	text "The miners in Un-"
	line "ion cave want to"
	cont "expand to Slowpoke"
	cont "well. I won't let"
	cont "anyone do that!"
	done

MovesAsideMovement:
	step_left
	turn_head_down
	step_end

SlowpokeWellMovesAsideText:
	text "Oh, you stopped"
	line "the clear-cutters"
	cont "in Ilex?"
	
	para "That's cool. If"
	line "you want to pass,"
	cont "you can."
	done

SlowpokeWellB1FRolloutScript:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_ROLLOUT_INTRO
	iftrue SlowpokeWellTutorRolloutScript
	writetext Text_RolloutIntro
	waitbutton
	setevent EVENT_LISTENED_TO_PAY_DAY_INTRO
SlowpokeWellTutorRolloutScript:
	writetext Text_RolloutTutor ;;
	waitbutton
	checkitem SILVER_LEAF
	iffalse .NoSilverLeaf
	writetext Text_RolloutTutorQuestion ;;
	yesorno
	iffalse .TutorRefused
	setval ROLLOUT
	writetext ClearText
	special Special_MoveTutor
	ifequal $0, .TeachMove
.TutorRefused
	jumpopenedtext Text_RolloutTutorRefused ;; 

.NoSilverLeaf
	jumpopenedtext Text_RolloutTutorNoSilverLeaf

.TeachMove
	takeitem SILVER_LEAF
	jumpopenedtext Text_RolloutTutorTaught ;;
	
Text_RolloutIntro: 
	text "Some say that"
	line "Unova-style pizza"
	cont "is best. But I"
	cont "prefer Azalea"
	cont "style! Why?"
	
	para "Because the dough"
	line "is rolled out"
	cont "here in Slowpoke"
	cont "Well!"

	para "...?"
	
	para "What's that? You"
	line "don't like Azalea"
	cont "style pizza?"
	
	para "Well make your"
	line "own pizza then!"
	done

Text_RolloutTutor:
	text "I can teach your"
	line "#mon to use"

	para "Rollout, for"
	line "a Silver Leaf."
	done

Text_RolloutTutorNoSilverLeaf:
	text "My lessons aren't"
	line "free!"
	
	para "Check Ilex For-"
	line "est, or the"
	cont "Azalea Mart."
	done

Text_RolloutTutorQuestion:
	text "Should I teach"
	line "your #mon"
	cont "Rollout?"
	done

Text_RolloutTutorRefused:
	text "Alright then."
	done

Text_RolloutTutorTaught:
	text "Rolling out"
	line "your own dough"
	cont "is great. Once"
	cont "you start, it's"
	cont "hard to stop!"
	done

