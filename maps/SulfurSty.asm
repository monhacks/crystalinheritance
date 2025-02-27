SulfurSty_MapScriptHeader: ;	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 9, 17, SULFUR_STY_HOUSE_1, 1
	warp_event 51,17, SULFUR_STY_HOUSE_2, 1
	warp_event 34, 7, CLASTS_CRADLE_3F, 1


	def_coord_events



	def_bg_events



	def_object_events
; brigaders fighting ninjas
; ninjas with heracross or ursaring, brigaders with primeape or electabuzz or scizor


	tmhmball_event 21, 8, TM_FOCUS_BLAST, EVENT_GOT_TM_FOCUS_BLAST

	object_event  46,  25, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, 0, NinjaScript, EVENT_BEAT_ADRINNA_MINE ; LIKE THE GAMEBOY BOYS, FACING YOU THEN BACK
	pokemon_event 47, 25, CROBAT, -1, -1, PAL_NPC_BLUE, StyCrobatText, -1
	object_event  49, 25, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, 0, BrigaderScript, EVENT_BEAT_ADRINNA_MINE ; LIKE THE GAMEBOY BOYS, FACING YOU THEN BACK
	pokemon_event 48, 25, RHYDON, -1, -1, PAL_NPC_BROWN, StyRhydonTExt, -1
	
	object_event  24, 23, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, 0, NinjaScript, EVENT_BEAT_ADRINNA_MINE ; LIKE THE GAMEBOY BOYS, FACING YOU THEN BACK
	pokemon_event 25, 23, SNEASLER, -1, -1, PAL_NPC_BLUE, StySneaslerText, -1
	object_event  27, 23, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, 0, BrigaderScript, EVENT_BEAT_ADRINNA_MINE ; LIKE THE GAMEBOY BOYS, FACING YOU THEN BACK
	pokemon_event 26, 23, MACHAMP, -1, -1, PAL_NPC_BROWN, StyRhydonTExt, -1

	object_event  22,  6, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, 0, NinjaScript, EVENT_BEAT_ADRINNA_MINE ; LIKE THE GAMEBOY BOYS, FACING YOU THEN BACK
	pokemon_event 23, 6, GRANBULL, -1, -1, PAL_NPC_RED, StyGranbullText, -1
	object_event  25,  6, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, 0, BrigaderScript, EVENT_BEAT_ADRINNA_MINE ; LIKE THE GAMEBOY BOYS, FACING YOU THEN BACK
	pokemon_event 24, 6, MAGNETON, -1, -1, PAL_NPC_BROWN, StyMagnetonText, -1

	object_event  35, 19, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokefanMRobert, -1
	object_event  37, 16, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokefanMRobert, -1
	object_event  22, 13, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokefanMRobert, -1



	object_const_def
