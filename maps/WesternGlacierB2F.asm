WesternGlacierB2F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 5, 9, WESTERN_GLACIER_B1F, 2 ; ladder 


	def_coord_events



	def_bg_events



	def_object_events
	object_event  5,  5, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, LUCARIO, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GlacierLucario, EVENT_GLACIER_LUCARIO

	object_const_def
	const WESTERN_GLACIER_LUCARIO
	
	

GlacierLucario:
	pause 15
	loadwildmon LUCARIO, 45
	startbattle
	disappear WESTERN_GLACIER_LUCARIO
	setevent EVENT_GLACIER_LUCARIO
	reloadmapafterbattle
	end
