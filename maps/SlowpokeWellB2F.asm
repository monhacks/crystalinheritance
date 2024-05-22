SlowpokeWellB2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks


	def_warp_events
	warp_event  9, 11, SLOWPOKE_WELL_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWBRO, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SlowpokeWellSlowbro, EVENT_SLOWPOKE_WELL_SLOWBRO

	object_const_def
	const SLOWPOKE_WELL_B2F_SLOWBRO

SlowpokeWellSlowbro:
	faceplayer
	cry SLOWBRO
	pause 15
	loadwildmon SLOWBRO, 30 ;should have shell smash
	startbattle
	disappear SLOWPOKE_WELL_B2F_SLOWBRO
	setevent EVENT_SLOWPOKE_WELL_SLOWBRO
	reloadmapafterbattle
	end
