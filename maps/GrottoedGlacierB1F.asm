GrottoedGlacierB1F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 15, 9, GROTTOED_GLACIER_1F, 2
	warp_event 3, 21, GROTTOED_GLACIER_B2F, 1
;HOLES 
	warp_event 8, 21, GROTTOED_GLACIER_B2F, 2
	warp_event 2, 17, GROTTOED_GLACIER_B2F, 2

	def_coord_events



	def_bg_events



	def_object_events
	; MEDIUM ESTHER AND SAGE VIRGIL 
	strengthboulder_event 3, 7, ; event
	strengthboulder_event 11, 12, ; event
	object_event 12,  9, SPRITE_MEDIUM, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerMediumEsther, EVENT_BEAT_KANNA
	object_event  4, 19, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSageVirgil, EVENT_BEAT_KANNA


	object_const_def


GenericTrainerMediumEsther:
	generictrainer MEDIUM, ESTHER, EVENT_BEAT_MEDIUM_ESTHER, .SeenText, .BeatenText

.BeatenText:
	text "Elder Kanna will"
	line "handle General"
	cont "Adrinna."
	
	para "There's no need"
	line "for you to go any"
	cont "further."	
	done

.SeenText:
	text "You're not from"
	line "Hisui - are you"
	cont "Adrinna's?"	
	done



GenericTrainerSageVirgil: ; todo 
	generictrainer SAGE, VIRGIL, EVENT_BEAT_SAGE_VIRGIL, .SeenText1, .BeatenText1

.BeatenText1:
	text "I hope I held"
	line "you back long"
	cont "enough."	
	done

.SeenText1:
	text "The ceremony must"
	line "not be stopped!"	
	done

