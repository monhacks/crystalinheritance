OlivineLighthouse1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 10, 17, OLIVINE_CITY, 8
	warp_event 11, 17, OLIVINE_CITY, 8
	warp_event  3, 11, OLIVINE_LIGHTHOUSE_2F, 1


	def_coord_events

	def_bg_events

	def_object_events ; black belts 
	object_event  0,  0, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, 	TrainerScientistJoseph, -1; elec
	object_event  0,  0, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, 	TrainerBlackBeltWai, -1
	object_event  0,  0, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, 	TrainerEngineerLang, -1

