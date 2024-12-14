SlowpokeWellB2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, SlowpokeWellB2FCallBack

	def_warp_events
	warp_event  9, 11, SLOWPOKE_WELL_B1F, 1 ; todo 
	warp_event  5,  1, UNION_CAVE_B1F_SOUTH, 3
	warp_event  11,  3, SLOWPOKE_WELL_B3F, 1

	def_coord_events


	def_bg_events


	def_object_events
	object_event 5, 2, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB2FGuardScript, SLOWPOKE_WELL_MOVED_ASIDE
	strengthboulder_event   6, 2
	strengthboulder_event  4, 2


	object_const_def
	const SLOWPOKE_WELL_B1F_SCHOOLBOY ;fixed?

SlowpokeWellB2FCallBack:
	checkevent EVENT_MISTY_BASIN_B1F_BLACKBELT
	iffalse .Done
	changeblock  5,  4, $02
	changeblock  6,  4, $28
.Done:
	endcallback

SlowpokeWellB2FGuardScript:
	faceplayer
	opentext
	checkevent SLOWPOKE_WELL_MOVED_ASIDE
	iftrue .MovedAside
	checkevent EVENT_LOGGERS_ILEX_FOREST
	iftrue .MovesAside
	writetext SlowpokeWellImGuardingText
	waitbutton
	closetext
	end 
	
.MovesAside:
	writetext SlowpokeWellMovesAsideText
	waitbutton
	closetext
	applyonemovement PLAYER, step_down
	turnobject PLAYER, UP
	applymovement SLOWPOKE_WELL_B2F_SCHOOLBOY, MovesAsideMovement
	setevent SLOWPOKE_WELL_MOVED_ASIDE
	clearevent EVENT_TALKED_TO_PRYCE_TINDER_GARDEN 
	end

.MovedAside:
	writetext SlowpokeWellMovesAsideText
	waitbutton
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
	step_down
	step_right
	turn_head_left
	step_end

SlowpokeWellMovesAsideText:
	text "Oh, you stopped"
	line "the clear-cutters"
	cont "in Ilex?"
	
	para "That's cool. If"
	line "you want to pass,"
	cont "you can."
	done