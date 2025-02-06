BrassTower12F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event  5,  1, BRASS_TOWER_1F, 2
	warp_event 10,  1, BRASS_TOWER_19F, 1
	warp_event  1,  13, BRASS_TOWER_13F, 1
	warp_event 15,  15, BRASS_TOWER_13F, 2

	def_coord_events



	def_bg_events



	def_object_events
	object_event  1, 15, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerElderNoboru, -1
	object_event  14,15, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerElderTakashi, -1
	

	object_const_def


GenericTrainerElderNoboru:
    generictrainer ELDER, NOBORU, EVENT_BEAT_ELDER_NOBORU, NoboruSeenText, NoboruBeatenText

NoboruBeatenText:
    text "I fell to the"
	line "ground..."
    done
	
NoboruSeenText:
	text "This tower will"
	line "pierce the sky!"
	done



GenericTrainerElderTakashi:
    generictrainer ELDER, TAKASHI, EVENT_BEAT_ELDER_TAKASHI, TakashiSeenText, TakashiBeatenText

NoboruBeatenText:
    text "I should have"
	line "revered you..."
    done
	
NoboruSeenText:
    text "The emperor must"
	line "be revered!"
	done
