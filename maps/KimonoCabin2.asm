KimonoCabin2_MapScriptHeader: ; should be like  "BurnedTowerB1F_MapScriptHeader"
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event  8, 13, KIMONO_CABIN, 1
	warp_event  9, 13, KIMONO_CABIN, 1


	def_coord_events



	def_bg_events



	def_object_events
	object_event  8, 7, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN,  OBJECTTYPE_SCRIPT, 0, KimonoCabin2RepelScript, -1

	itemball_event 10, 7, POMEG_BERRY, 1, EVENT_KIMONO_CABIN_POMEG_1
	itemball_event  7, 7, POMEG_BERRY, 1, EVENT_KIMONO_CABIN_POMEG_2
	itemball_event 10, 4, POMEG_BERRY, 1, EVENT_KIMONO_CABIN_POMEG_3
	itemball_event  9, 0, POMEG_BERRY, 1, EVENT_KIMONO_CABIN_POMEG_4
	itemball_event  5, 5, POMEG_BERRY, 1, EVENT_KIMONO_CABIN_POMEG_5
	itemball_event  7, 2, POMEG_BERRY, 1, EVENT_KIMONO_CABIN_POMEG_6
	itemball_event  4, 3, POMEG_BERRY, 1, EVENT_KIMONO_CABIN_POMEG_7
	itemball_event  6, 0, POMEG_BERRY, 1, EVENT_KIMONO_CABIN_POMEG_8
	itemball_event  1, 0, POMEG_BERRY, 1, EVENT_KIMONO_CABIN_POMEG_9
	itemball_event  4, 1, POMEG_BERRY, 1, EVENT_KIMONO_CABIN_POMEG_10
	itemball_event  0, 3, POMEG_BERRY, 1, EVENT_KIMONO_CABIN_POMEG_11
	itemball_event  2, 4, POMEG_BERRY, 1, EVENT_KIMONO_CABIN_POMEG_12
	itemball_event  0, 5, POMEG_BERRY, 1, EVENT_KIMONO_CABIN_POMEG_13
	itemball_event  0, 7, POMEG_BERRY, 1, EVENT_KIMONO_CABIN_POMEG_14
	itemball_event  3, 7, POMEG_BERRY, 1, EVENT_KIMONO_CABIN_POMEG_15
	itemball_event  4, 3, POMEG_BERRY, 1, EVENT_KIMONO_CABIN_POMEG_16

	itemball_event  8, 9, REPEL, 1, EVENT_KIMONO_CABIN_REPEL

	object_const_def
	const KIMONO_CABIN_2_KIMONO_GIRL


KimonoCabin2RepelScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_KIMONO_2_2
	iftrue CheckRepelCounterScript2 ; should be 100 minus X
	checkevent EVENT_TALKED_TO_KIMONO_2_1
	iftrue CheckRepelCounterScript1 ; should be 100 steps
	writetext Kimono2ExplainsTheGameText
	closetext
	applymovement KIMONO_CABIN_2_KIMONO_GIRL, KimonoCabin2KimonoGirlMoves1
	setevent EVENT_TALKED_TO_KIMONO_2
	
	
	
	
	applymovement KIMONO_CABIN_2_KIMONO_GIRL, KimonoCabin2KimonoGirlMoves
	end
	

Kimono2ExplainsTheGameText:
	text "I have placed"
	line "berries all"
	cont "over this"
	cont "clearing to"
	para "attract that"
	line "ornery"
	cont "hedgehog."
	para "If you step on"
	line "every blade of"
	cont "grass once and"
	para "pick up all the"
	line "berries, then"
	cont "the hedgehog"
	para "will be corner-"
	line "ed in the"
	cont "middle."
	para "OK, I'll go"
	line "wait in the"
	cont "middle to"
	cont "ambush!"
	
	para "You start that"
	line "repel right now,"
	cont "OK?"
	done
	
KimonoCabin2KimonoGirlMoves1:
	step_up
	turn_head_down
	step_end

KimonoCabin2KimonoGirlMoves:
	step_up
	step_left
	step_up
	step_left
	step_left
	turn_head_down
	step_end

CheckRepelCounterScript2:
	writetext CheckYourStepsText
	
	
	
CheckYourStepsText:
	text "How's that repel?"
	line "You have taken"


	
	para "caught "
	text_decimal wRepelEffect, 1, 3
	text " steps"
	line "of #mon."

	
	
	ifgreater 20, .HereYouGo ; greater, not greater or equal to
.UhOh
	jumpopenedtext ProfOaksAide1UhOhText