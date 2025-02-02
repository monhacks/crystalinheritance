OlivineCityDesal1F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 3, 0, OLIVINE_CITY, 9
	warp_event 4, 0, OLIVINE_CITY, 10	
	warp_event 3, 4, OLIVINE_DESAL_B1F, 1


	def_coord_events



	def_bg_events



	def_object_events
	object_event  4,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Desal1FNPCText, -1


	object_const_def


Desal1FNPCText:
	text "How horrible!"
	line "Someone stole a"
	cont "machine part from"
	cont "the Desal plant."
	done
