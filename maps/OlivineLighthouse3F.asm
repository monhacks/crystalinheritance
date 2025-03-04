OlivineLighthouse3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_2F, 2
	warp_event 9, 11, OLIVINE_LIGHTHOUSE_6F, 1


	def_coord_events

	def_bg_events

	def_object_events
;	object_event  9, 14, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse3FBattleGirlEmy, -1
;	object_event  9,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSailorTerrell, -1
;	object_event 13,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerGentlemanPreston, EVENT_OLIVINE_LIGHTHOUSE_JASMINE
;	object_event  3,  9, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBird_keeperTheo, -1
	itemball_event  8,  2, ETHER, 1, EVENT_OLIVINE_LIGHTHOUSE_3F_ETHER

	object_const_def
