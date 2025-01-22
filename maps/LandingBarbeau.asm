LandingBarbeau_MapScriptHeader: ;	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 3, 8, TRADERS_LANDING, 1


	def_coord_events



	def_bg_events
	bg_event 0, 0, BGEVENT_JUMPTEXT, BarbeauJournal


	def_object_events
	object_event 0, 0, SPRITE_BARBEAU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BarbeauBarbeauScript, -1
;KURT 

	object_const_def
	const TRADERS_BARBEAU_BARBEAU
	const TRADERS_BARBEAU_KURT 
	
BarbeauJournal:
	text "Barbeau's Journal"
	
	para "The people grow"
	line "restless... Is"
	cont "Amos' plan really"
	para "enough to repel"
	line "the barbarians"
	cont "and the Emperor?"
	done
	
BarbeauBarbeauScript:
	
	