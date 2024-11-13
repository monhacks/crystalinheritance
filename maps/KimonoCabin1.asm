KimonoCabin1_MapScriptHeader: ; should be like  "BurnedTowerB1F_MapScriptHeader"
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event  19, 19, KIMONO_CABIN, 1


	def_coord_events



	def_bg_events



	def_object_events
	object_event  5,  0, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, DRATINI, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KimonoCabin1Dratini, EVENT_KIMONO_CABIN_DRATINI
	tmhmball_event  18, 19, TM_ROCK_SMASH, EVENT_UNION_CAVE_B1F_NORTH_X_DEFEND ;brick break, disappears if you already have it
	smashrock_event 18, 10
	smashrock_event 13, 5
	smashrock_event 13, 11
	smashrock_event  7, 10
	smashrock_event  3, 6
	smashrock_event  9, 17
	smashrock_event  3, 11
	smashrock_event  11, 11
	itemball_event  4, 0, SITRUS_BERRY, 1, EVENT_KIMONO_CABIN_SITRUS


	object_const_def
	const KIMONO_CABIN_1_DRATINI ;  
	
KimonoCabin1Dratini:
	faceplayer
	cry DRATINI
	pause 15
	loadwildmon DRATINI, 5
	startbattle
	disappear KIMONO_CABIN_1_DRATINI
	setevent EVENT_KIMONO_CABIN_DRATINI
	reloadmapafterbattle
	end

