ClastsCradle1F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 19,  7, CLASTS_CRADLE_2F, 2
	warp_event 3, 19, CLASTS_CRADLE_B1F, 1
	; HOLES
	warp_event 14, 21, CLASTS_CRADLE_B1F, 2 ; 3
	warp_event 18, 27, CLASTS_CRADLE_B1F, 2 ; 4 
	warp_event 16, 41, CLASTS_CRADLE_B1F, 2 ; 5


	def_coord_events



	def_bg_events
; HIDDEN ITEMS - BIG_NUGGET X2 AT 30, 11 AND 4, 16 , METAL COAT AT 18, 43


	def_object_events
	object_event  22,  4, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBrigader16, EVENT_BEAT_ADRINNA_MINE
	object_event  31, 16, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBrigader17, EVENT_BEAT_ADRINNA_MINE
	object_event   3, 22, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBrigader18, EVENT_BEAT_ADRINNA_MINE

	object_event  14, 28, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerEngineerNobel, EVENT_BEAT_ADRINNA_MINE	
	object_event  11, 39, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerEngineerIngsol, EVENT_BEAT_ADRINNA_MINE

	
	object_event   0,  0, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerDragonTamerHank2, EVENT_BEAT_ADRINNA_MINE	
	object_event   0,  0, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerDragonTamerJones2, EVENT_BEAT_ADRINNA_MINE
	object_event   0,  0, SPRITE_DRAGON_TAMER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerDragonTamerLeland2, EVENT_BEAT_ADRINNA_MINE

	strengthboulder_event 22, 16; goes to hole at 3
	strengthboulder_event 30, 23; goes to hole at 4
	strengthboulder_event 23, 35; goes to hole at 5

	itemball_event 9, 9, NUGGET, 1, EVENT_CRADLE_1F_NUGGET
	itemball_event 28, 35, FULL_RESTORE, 1, EVENT_CRADLE_1F_FULL_RESTORE
	itemball_event 19, 33, MAX_REVIVE, 1, EVENT_CRADLE_1F_MAX_REVIVE
	itemball_event 11, 27, ODD_SOUVENIR, 1, EVENT_CRADLE_1F_SOUVENIR
	tmhmball_event 7, 16, TM_SWORDS_DANCE, EVENT_TM_SWORDS_DANCE

	object_const_def


GenericTrainerBrigader16: ; dragons 
	generictrainer BRIGADER, 16, EVENT_BEAT_ROCKET_GRUNTM_16, Brigader16SeenText, Brigader16BeatenText  

Brigader16BeatenText:
	text "..."
	done

Brigader16SeenText:
	text "..."
	done
	
GenericTrainerBrigader17: ; poison
	generictrainer BRIGADER, 17, EVENT_BEAT_ROCKET_GRUNTM_17, Brigader17SeenText, Brigader17BeatenText  

Brigader17BeatenText:
	text "..."
	done

Brigader17SeenText:
	text "..."
	done
	
GenericTrainerBrigader18: ; normal
	generictrainer BRIGADER, 18, EVENT_BEAT_ROCKET_GRUNTM_18, Brigader18SeenText, Brigader18BeatenText  

Brigader18BeatenText:
	text "..."
	done

Brigader18SeenText:
	text "..."
	done