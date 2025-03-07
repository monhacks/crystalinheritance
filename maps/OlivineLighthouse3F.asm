OlivineLighthouse3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_2F, 2
	warp_event 9, 11, OLIVINE_LIGHTHOUSE_6F, 1


	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  0, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, 	TrainerScientistPiotr, -1 ; drifblim 
	object_event  0,  0, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, 	TrainerGentlemanBattleBirlRonda, -1
	object_event  0,  0, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, 	TrainerEngineerHoward, -1

	itemball_event  8,  2, ELIXIR, 1, EVENT_OLIVINE_LIGHTHOUSE_3F_ETHER

	object_const_def
