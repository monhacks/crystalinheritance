OlivineCityDesalB1F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks
	warp_event 3, 8, OLIVINE_DESAL_1F, 3

	def_warp_events



	def_coord_events



	def_bg_events



	def_object_events
	object_event  5,  7, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, DesalB1FText1, -1
	object_event  7,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, DesalB1FText2, -1
	itemball_event 3, 0, ELECTIRIZER, 1, EVENT_GOT_ELECTRIZER


	object_const_def


DesalB1FText1:
	text "If we don't get"
	line "this plant going"
	cont "soon, Slowking"
	
	para "won't have enough"
	line "water! The whole"
	cont "thing will grind"
	cont "to a halt!"
	done
	
DesalB1FText2:
	text "The desal plant"
	line "operates at over"
	cont "1000 PSI."
	
	para "But the pressure"
	line "we're under to"
	cont "manage right now"
	cont "is double that!"
	done
	