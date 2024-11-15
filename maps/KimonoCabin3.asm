KimonoCabin3_MapScriptHeader: ; should be like  "BurnedTowerB1F_MapScriptHeader"
	def_scene_scripts


	def_callbacks


	def_warp_events ; FINISH ADDING THESE
	warp_event  5, 29, KIMONO_CABIN, 1
	warp_event 10, 7, KIMONO_CABIN, 1
	warp_event  4, 17, KIMONO_CABIN_3, 5 ; HALFWAY POINT
	warp_event 15,  5, KIMONO_CABIN_3, 5 ; TWO_THIRDS POINT
	
	warp_event  1, 24, KIMONO_CABIN_3, 3
	warp_event  1, 25, KIMONO_CABIN_3, 3
	warp_event  3, 24, KIMONO_CABIN_3, 3
	warp_event  4, 24, KIMONO_CABIN_3, 3
	warp_event  5, 24, KIMONO_CABIN_3, 3

	
	warp_event  4, 22, KIMONO_CABIN_3, 3
	warp_event  5, 22, KIMONO_CABIN_3, 3
	warp_event  6, 22, KIMONO_CABIN_3, 3
	warp_event  7, 22, KIMONO_CABIN_3, 3
	
	warp_event  10, 26, KIMONO_CABIN_3, 3
	warp_event  11, 26, KIMONO_CABIN_3, 3	

	warp_event  8, 24, KIMONO_CABIN_3, 3
	warp_event  9, 24, KIMONO_CABIN_3, 3
	warp_event 11, 24, KIMONO_CABIN_3, 3
	;;;
	warp_event 12, 27, KIMONO_CABIN_3, 3
	warp_event 13, 27, KIMONO_CABIN_3, 3
	warp_event 14, 27, KIMONO_CABIN_3, 3

	warp_event 13, 22, KIMONO_CABIN_3, 3
	warp_event 13, 23, KIMONO_CABIN_3, 3
	warp_event 14, 23, KIMONO_CABIN_3, 3
	warp_event 15, 24, KIMONO_CABIN_3, 3
	warp_event 15, 25, KIMONO_CABIN_3, 3
	warp_event 17, 26, KIMONO_CABIN_3, 3
	warp_event 17, 27, KIMONO_CABIN_3, 3
	
	def_coord_events



	def_bg_events



	def_object_events
	object_event  5, 26, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN,  OBJECTTYPE_COMMAND, jumptextfaceplayer, KimonoCabin3GameExplainText, EVENT_KIMONO_CABIN_SNEASEL
	strengthboulder_event 4, 25
	strengthboulder_event 2, 24
	strengthboulder_event 10, 24
	strengthboulder_event 14, 26
	strengthboulder_event 16, 28

	strengthboulder_event  4, 15
	strengthboulder_event  1,  9
	strengthboulder_event  8,  1
	strengthboulder_event 16,  5	
	strengthboulder_event 18,  6	
	strengthboulder_event 15, 11	
	strengthboulder_event 11, 12	
	strengthboulder_event  8, 10	

	object_event  9,  4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SNEASEL, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KimonoCabin3Sneasel, EVENT_KIMONO_CABIN_SNEASEL

	object_const_def
	const KIMONO_CABIN_3_SNEASEL ;  
	
KimonoCabin3GameExplainText:
	text "Samari: We're in the attic. I can hear that creature raking its claws from all the way over here. Now, there's a bunch of junk, so if it's in your way, just push it off the rafters. Oh yeah, I painted the rafters black so that they would blend in from below. Sorry about that. Anyway, please make your way over there and deal with that gremlin!"
	

KimonoCabin3Sneasel:
	faceplayer
	cry DRATINI
	pause 15
	loadwildmon SNEASEL, 19
	startbattle
	disappear KIMONO_CABIN_3_SNEASEL
	setevent EVENT_KIMONO_CABIN_SNEASEL
	reloadmapafterbattle
	end

