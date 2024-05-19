SlowpokeWellB1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 17, 15, SLOWPOKE_WELL_ENTRANCE, 2
	warp_event  7, 11, SLOWPOKE_WELL_B2F, 1
	warp_event 13,  2, UNION_CAVE_B1F_SOUTH, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 13, 3, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FGuardScript, SLOWPOKE_WELL_MOVED_ASIDE
	strengthboulder_event  3, 2
	itemball_event 10,  3, SUPER_POTION, 1, EVENT_SLOWPOKE_WELL_B1F_SUPER_POTION

	object_const_def
	const SLOWPOKE_WELL_B1F_SCHOOLBOY ;fixed?

SlowpokeWellB1FGuardScript:
	faceplayer
	opentext
	checkevent EVENT_LOGGERS_ILEX_FOREST
	iftrue .MovesAside
	writetext SlowpokeWellImGuardingText
	closetext
	done ;is this how it is done?
.MovesAside:
	writetext SlowpokeWellMovesAsideText
	applymovement SLOWPOKE_WELL_B1F_SCHOOLBOY, MovesAsideMovement
	setevent SLOWPOKE_WELL_MOVED_ASIDE
	closetext
	done

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
