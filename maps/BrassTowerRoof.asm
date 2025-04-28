BrassTowerRoof_MapScriptHeader: 
	def_scene_scripts
	scene_script BrassTowerRoofScript

	def_callbacks


	def_warp_events
	warp_event 9, 7, BRASS_TOWER_4F, 3


	def_coord_events



	def_bg_events



	def_object_events
	object_event  9, 9, SPRITE_MEJIMI, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CRADLE_CUTSCENE
	object_event  9, 7, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CRADLE_CUTSCENE
	object_event  9,  7, SPRITE_ADRINNA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CRADLE_CUTSCENE

	object_event  	8, 9, SPRITE_MON_ICON, 	SPRITEMOVEDATA_POKEMON, 0, LUGIA, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROOF_LUGIA 
	object_event  	10, 9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, HO_OH, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROOF_HOOH 
	object_event  	10, 9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, CELEBI, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROOF_HOOH

	object_const_def
	const BRASS_TOWER_ROOF_MEJIMI
	const BRASS_TOWER_ROOF_KURT
	const BRASS_TOWER_ROOF_ADRINNA
	const BRASS_TOWER_ROOF_LUGIA
	const BRASS_TOWER_ROOF_LUGIA
	const BRASS_TOWER_ROOF_HOOH
	
BrassTowerRoofScript:
	checkevent EVENT_ACCEPTED_ADRINNA
	iftrue .AcceptedAdrinnaRoofScript
	sdefer .DeclinedAdrinnaRoofScript
	end
	
.Script:
	applymovement PLAYER, ..
	

;reset all the tower events so you can redo the tower if you want to 
	end