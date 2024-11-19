CharcoalKiln_MapScriptHeader:
	def_scene_scripts
	scene_script CharcoalKilnGettingReadyTrigger

	def_callbacks

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 2
	warp_event  4,  7, AZALEA_TOWN, 2

	def_coord_events

	
	def_bg_events
	bg_event  1,  3, BGEVENT_JUMPTEXT, CharcoalKilnStillText

	def_object_events
	object_event  3,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnBoss, -1
	object_event  4,  4, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnApprentice, EVENT_GOT_A_POKEMON ; should not appear after you get a mon
	object_event  8,  6, SPRITE_FARFETCH_D, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnFarfetchdScript, -1

	object_const_def
	const CHARCOAL_BLACK_BELT
	const CHARCOAL_RIVAL

CharcoalKilnGettingReadyTrigger:
	sdefer .Script
	end

.Script:
	pause 30
	turnobject CHARCOAL_BLACK_BELT, LEFT
	waitsfx
	applymovement CHARCOAL_BLACK_BELT, .Movement1
	pause 60
	opentext
	writetext .CharcoalKilnLookingText
	waitbutton
	applymovement CHARCOAL_BLACK_BELT, .Movement2
	applymovement CHARCOAL_RIVAL, .Movement3
	writetext .CharcoalKilnSoonText
	closetext
	setscene $1
	setevent EVENT_CHARCOAL_TALKED
	end

.Movement1:
	turn_head_left
	step_left
	step_left
	turn_head_up
	step_end

.CharcoalKilnLookingText:
	text "You are always"
	line "losing things!..."
	cont "Here. Why did you"
	cont "put it there?"
	done

.Movement2:
	turn_head_right
	step_right
	step_right
	turn_head_down
	step_end
	
.Movement3:
	turn_head_down
	step_end
	
.CharcoalKilnSoonText:
	text  "Ah, <PLAYER>."
	line "We will be there"
	cont "soon."
	done
	
CharcoalKilnBoss:
	checkevent EVENT_GOT_A_POKEMON
	iftrue_jumptextfaceplayer .Text3
	jumpthistextfaceplayer

	text "Made any nice"
	line "apricorns?"

	para "That's a handy"
	line "thing to do."
	
	para "Sigh..."
	
	para "If they keep log-"
	line "ging, I don't"
	cont "know what we will"
	cont "do."
	done

.Text3:
	text "I wonder where"
	line "my son went..."
	
	para "I wonder if I"
	line "was too harsh"
	cont "on him."
	done

CharcoalKilnApprentice:
	faceplayer
	opentext
	writetext .Text1
	promptbutton
	endtext

.Text1:
	text "Do you know what"
	line "this ceremony"
	cont "is? I hope it"
	cont "means I can be"
	cont "more independent."
	done

CharcoalKilnFarfetchdScript:
	faceplayer
	showcrytext .Text, FARFETCH_D
	end

.Text:
	text "Farfetch'd: Kwaa!"
	done

CharcoalKilnStillText:
	text "A design for"
	line "extracting oil"
	cont "from Apricorns."
	
	para "Looks like a"
	line "lot of work"
	cont "went into it."
	done
