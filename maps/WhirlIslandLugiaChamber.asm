WhirlIslandLugiaChamber_MapScriptHeader:
	def_scene_scripts
; scene in which Kurt catches LUGIA
; revise the map so that Kurt can stand 
	scene_script WhirlIslandKurtLugiaScript

	def_callbacks
	callback MAPCALLBACK_OBJECTS, WhirlIslandLugiaChamberLugia

	def_warp_events
	warp_event  9, 13, WHIRL_ISLAND_B3F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, LUGIA, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_WHIRL_ISLAND_LUGIA_CHAMBER_LUGIA
	object_event  9, 11, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, ObjectEvent, EVENT_GOT_WHIRLPOOL_WHIRL_ISLANDS ;
	object_event  9, 10, SPRITE_BALL_CUT_FRUIT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LUGIA_POKEBALL
	
	
	object_const_def
	const WHIRLISLANDLUGIACHAMBER_LUGIA
	const WHIRLISLANDLUGIACHAMBER_KURT
	const WHIRLISLANDLUGIACHAMBER_BALL


WhirlIslandKurtLugiaScript:
	sdefer .Script
	end
	
.Script:
	applyonemovement PLAYER, UP
	showemote EMOTE_BOLT, WHIRLISLANDLUGIACHAMBER_KURT, 15
	showtext KurtLugiaText1
	appear WHIRLISLANDLUGIACHAMBER_BALL
	pause 30
	disappear WHIRLISLANDLUGIACHAMBER_LUGIA
	pause 30
	disappear WHIRLISLANDLUGIACHAMBER_BALL
	pause 30
	turnobject WHIRLISLANDLUGIACHAMBER_KURT, DOWN
	showtext KurtLugiaText2
	applymovement KurtLeavesMovement, WHIRLISLANDLUGIACHAMBER_KURT
	disappear WHIRLISLANDLUGIACHAMBER_KURT
	setscene $1 ; need to add to scenes
	end
	
KurtBallText1:
	text "Kurt: Lugia, give"
	line "me your power!"
	done

KurtLugiaText2: ; need to have kurt go to the top floor and tell the player here to go 
	text "<PLAYER>, I've"
	line "caught Lugia."
	
	para "Now it can wreak"
	line "havoc at the"
	cont "Emperor's port."
	
	para "There may be a"
	line "shrine we can use"
	cont "at Cianwood that"
	cont "still stands."
	done

KurtLeavesMovement:
	step_right
	step_down
	step_down
	step_down
	step_left
	turn_head_down
	step_end
