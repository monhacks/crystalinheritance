LandingStockroom_MapScriptHeader: 

	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event  3,  7, TRADERS_LANDING, 2
	warp_event  4,  7, TRADERS_LANDING, 2


	def_coord_events



	def_bg_events



	def_object_events
	object_event 2, 3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, LandingStockroomNPC1Text, -1 ; done
	object_event 5, 2, SPRITE_NOMAD_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, LandingStockroomNPC2Text, -1
	object_event 3, 5, SPRITE_NOMAD_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, LandingStockroomNPC3Text, -1
	object_event  9,  0, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_TRADERS_LANDING, -1


	object_const_def



LandingStockroomNPC1Text:
	text "I thought that"
	line "these #balls"
	cont "were barbaric,"
	
	para "but now I find"
	line "it hard to go"
	cont "back."
	done
	
LandingStockroomNPC2Text:
	text "The mart has"
	line "wares from far"
	cont "away."
	done
	
LandingStockroomNPC3Text:
	text "I'm saving up to"
	line "buy my own"
	cont "#balls. Then"
	para "I can go make"
	line "my own way."
	done
