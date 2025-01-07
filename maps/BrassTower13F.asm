BrassTower13F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 3, 1, BRASS_TOWER_12F, 3
	warp_event 11, 1, BRASS_TOWER_12F, 4
	warp_event 2, 15, BRASS_TOWER_15F, 3
	warp_event 10,15, BRASS_TOWER_16F, 3

	def_coord_events



	def_bg_events
	bg_event 2, 8, BrassTower13FSwitchScript


	def_object_events
	object_event  10,  8, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, UNOWN, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BrassTower13FUnownScript, EVENT_BRASS_TOWER_13F_UNOWN
	pokemon_event  3,  5, GENGAR, -1, -1, PAL_NPC_RED, BrassTowerGuardText, EVENT_BRASS_TOWER_RIGHT_GUARD
	pokemon_event  11, 12, GENGAR, -1, -1, PAL_NPC_RED, BrassTowerGuardText, EVENT_BRASS_TOWER_RIGHT_GUARD
	pokemon_event  10,  5, MISDREAVUS, -1, -1, PAL_NPC_RED, BrassTowerGuardText, EVENT_BRASS_TOWER_LEFT_GUARD
	pokemon_event  2, 12, MISDREAVUS, -1, -1, PAL_NPC_RED, BrassTowerGuardText, EVENT_BRASS_TOWER_LEFT_GUARD


	object_const_def
	const BRASS_TOWER_13F_UNOWN

BrassTowerGuardText:
	text "A spirit blocks"
	line "the path."
	done

BrassTower13FSwitchScript:
	checkevent EVENT_BRASS_TOWER_RIGHT_GUARD
	iftrue .AskSwitchToLeft
	opentext
	writetext SwitchSpiritsText
	yesorno
	iffalse_jumpopenedtext NotSwitchingText
	clearevent EVENT_BRASS_TOWER_RIGHT_GUARD
	setevent EVENT_BRASS_TOWER_LEFT_GUARD
	;fade to black, reload map
	reloadmap
	
BrassTower13FUnownScript:
	showtext BrassTowerUnownText
	cry UNOWN
	pause 15
	loadwildmon UNOWN, 50
	startbattle
	disappear BRASS_TOWER_13F_UNOWN
	setevent EVENT_BRASS_TOWER_13F_UNOWN
	reloadmapafterbattle
	end
	
BrassTowerUnownText:
	text "The Unown proj-"
	line "ects an aura on"
	cont "the tower!"
	done
