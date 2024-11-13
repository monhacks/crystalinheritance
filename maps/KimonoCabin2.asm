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

	object_const_def
	const KIMONO_CABIN_2_KIMONO_GIRL


KimonoCabin2RepelScript:
	faceplayer
	opentext
	checkevent EVENT_KIMONO_CABIN_LARVITAR
	iftrue_jumpopenedtext GladThatsOverText
	checkevent EVENT_TALKED_TO_KIMONO_2_2
	iftrue CheckRepelCounterScript2 ; should be 100 minus X
	checkevent EVENT_TALKED_TO_KIMONO_2_1
	iftrue CheckRepelCounterScript1 ; should be 100 steps
	writetext Kimono2ExplainsTheGameText
	verbosegiveitem REPEL
	closetext
	applymovement KIMONO_CABIN_2_KIMONO_GIRL, KimonoCabin2KimonoGirlMoves1
	setevent EVENT_TALKED_TO_KIMONO_2_1
	end
	

Kimono2ExplainsTheGameText:
	text "I have placed"
	line "berries all"
	cont "over this"
	cont "clearing to"

	para "attract that"
	line "ornery hedgehog."

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
	
	para "You start this"
	line "repel right now,"
	cont "OK?"
	done
	
KimonoCabin2KimonoGirlMoves1:
	step_up
	turn_head_down
	step_end



CheckRepelCounterScript1: ; checks that you have 99 steps remaining on repel. 
	writetext Check99StepsText
	writetext CheckYourStepsText
	readmem wRepelEffect
	ifequal 99, KimonoCabin2Moves2
	writetext TryAgainText
	end

KimonoCabin2Moves2:
	writetext KimonoCabin2ExplainsSecondTime
	applymovement KIMONO_CABIN_2_KIMONO_GIRL, KimonoCabin2KimonoGirlMoves2
	end

KimonoCabin2ExplainsSecondTime:
	text "OK, go pick up"
	line "all those berries"
	cont "and meet me with"
	cont "at least __ steps"
	cont "left on the repel!"
	done

KimonoCabin2KimonoGirlMoves2:
	step_up
	step_left
	step_up
	step_left
	step_left
	turn_head_down
	step_end

CheckRepelCounterScript2:
	checkevent EVENT_KIMONO_CABIN_POMEG_1
	iffalse_jumpopenedtext NotAllBerriesText
	checkevent EVENT_KIMONO_CABIN_POMEG_2
	iffalse_jumpopenedtext NotAllBerriesText
	checkevent EVENT_KIMONO_CABIN_POMEG_3
	iffalse_jumpopenedtext NotAllBerriesText
	checkevent EVENT_KIMONO_CABIN_POMEG_4
	iffalse_jumpopenedtext NotAllBerriesText
	checkevent EVENT_KIMONO_CABIN_POMEG_5
	iffalse_jumpopenedtext NotAllBerriesText
	checkevent EVENT_KIMONO_CABIN_POMEG_6
	iffalse_jumpopenedtext NotAllBerriesText
	checkevent EVENT_KIMONO_CABIN_POMEG_7
	iffalse_jumpopenedtext NotAllBerriesText
	checkevent EVENT_KIMONO_CABIN_POMEG_8
	iffalse_jumpopenedtext NotAllBerriesText
	checkevent EVENT_KIMONO_CABIN_POMEG_9
	iffalse_jumpopenedtext NotAllBerriesText
	checkevent EVENT_KIMONO_CABIN_POMEG_10
	iffalse_jumpopenedtext NotAllBerriesText
	checkevent EVENT_KIMONO_CABIN_POMEG_11
	iffalse_jumpopenedtext NotAllBerriesText
	checkevent EVENT_KIMONO_CABIN_POMEG_12
	iffalse_jumpopenedtext NotAllBerriesText
	checkevent EVENT_KIMONO_CABIN_POMEG_13
	iffalse_jumpopenedtext NotAllBerriesText
	checkevent EVENT_KIMONO_CABIN_POMEG_14
	iffalse_jumpopenedtext NotAllBerriesText
	checkevent EVENT_KIMONO_CABIN_POMEG_15
	iffalse_jumpopenedtext NotAllBerriesText
	checkevent EVENT_KIMONO_CABIN_POMEG_16
	iffalse_jumpopenedtext NotAllBerriesText
	writetext CheckYourStepsText
	readmem wInverseBattleScore
	ifgreater 1, HedgeHogInteraction ; load the battle with the larvitar
	writetext NotEnoughRepelStepsLeft
	end


Check99StepsText:
	text "My Repel should"
	line "have 99 steps..."
	
	para "Let me check."
	done
	
CheckYourStepsText:
	text "How's that repel?"
	para "There's "
	
	text_decimal wRepelEffect, 1, 3
	text " steps"
	line "remaining."
	done

TryAgainText:
	text "Oh, you don't"
	line "have the right"
	cont "amount of Repel"
	cont "remaining."
	
	para "Go back to the"
	line "cabin, and we can"
	cont "try again."
	done

NotAllBerriesText:
	text "You don't have all"
	line "the berries!"
	
	para "Here's a hint - "
	
	para "We will flush the"
	line "hedgehog to the"
	cont "middle, so you"
	cont "should try to"
	cont "step on each spot"
	cont "just one time!"
	done

NotEnoughRepelStepsLeft:
	text "Oh, there isn't"
	line "enough steps"
	cont "left on the repel."
	done

HedgeHogInteraction:
	writetext HeresThatOrneryHedgehog
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	loadwildmon LARVITAR, 15
	startbattle
	setevent EVENT_KIMONO_CABIN_LARVITAR
	reloadmapafterbattle
	writetext GladThatsOverText
	end

GladThatsOverText:
	text "Nice job dealing"
	line "with that ornery"
	cont "creature."
	
	para "It would have eat-"
	line "en all the dirt"
	cont "from the garden"
	cont "if we didn't deal"
	cont "with it!"
	done
