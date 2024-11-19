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
	warp_event 15, 23, KIMONO_CABIN_3, 3
	warp_event 15, 24, KIMONO_CABIN_3, 3
	warp_event 15, 25, KIMONO_CABIN_3, 3
	warp_event 17, 26, KIMONO_CABIN_3, 3
	warp_event 17, 27, KIMONO_CABIN_3, 3
	
	warp_event  5, 15, KIMONO_CABIN_3, 4
	warp_event  5, 14, KIMONO_CABIN_3, 4
	
	warp_event  3, 12, KIMONO_CABIN_3, 4
	warp_event  3, 13, KIMONO_CABIN_3, 4
	
	warp_event  0, 4, KIMONO_CABIN_3, 4
	warp_event  0, 5, KIMONO_CABIN_3, 4
	warp_event  0, 8, KIMONO_CABIN_3, 4
	warp_event  0, 9, KIMONO_CABIN_3, 4	
	
	warp_event  2, 6, KIMONO_CABIN_3, 4
	warp_event  2, 7, KIMONO_CABIN_3, 4	

	warp_event  4, 9, KIMONO_CABIN_3, 4
	warp_event  5, 9, KIMONO_CABIN_3, 4
	warp_event  6, 9, KIMONO_CABIN_3, 4
	
	warp_event  6, 6, KIMONO_CABIN_3, 4
	warp_event  6, 7, KIMONO_CABIN_3, 4
	warp_event  6, 8, KIMONO_CABIN_3, 4
	
	warp_event  4, 3, KIMONO_CABIN_3, 4
	warp_event  5, 3, KIMONO_CABIN_3, 4
	
	warp_event  8, 0, KIMONO_CABIN_3, 4
	warp_event  9, 0, KIMONO_CABIN_3, 4

	warp_event  8, 8, KIMONO_CABIN_3, 4
	warp_event  9, 8, KIMONO_CABIN_3, 4
	warp_event 10, 8, KIMONO_CABIN_3, 4
	warp_event 11, 8, KIMONO_CABIN_3, 4
	
	warp_event  15, 2, KIMONO_CABIN_3, 4
	warp_event  15, 3, KIMONO_CABIN_3, 4	
	
	warp_event  16, 4, KIMONO_CABIN_3, 4
	warp_event  17, 4, KIMONO_CABIN_3, 4	
	
	warp_event  19, 6, KIMONO_CABIN_3, 4
	warp_event  19, 7, KIMONO_CABIN_3, 4	
	
	warp_event  14, 10, KIMONO_CABIN_3, 4
	warp_event  15, 10, KIMONO_CABIN_3, 4	
	
	warp_event  10, 13, KIMONO_CABIN_3, 4
	warp_event  11, 13, KIMONO_CABIN_3, 4	

	warp_event  10, 11, KIMONO_CABIN_3, 4
	warp_event  10, 10, KIMONO_CABIN_3, 4		

	warp_event  14,  6, KIMONO_CABIN_3, 4
	warp_event  15,  6, KIMONO_CABIN_3, 4		
	
	def_coord_events



	def_bg_events



	def_object_events
	object_event  5, 26, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN,  OBJECTTYPE_SCRIPT, 0, KimonoCabin33Script, EVENT_KIMONO_CABIN_SNEASEL
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
	tmhmball_event 24, 33, TM_DARK_PULSE, EVENT_KIMONO_CABIN_TM_DARK_PULSE
	

	object_const_def
	const KIMONO_CABIN_3_SNEASEL ;  
	
KimonoCabin33Script:
	faceplayer
	opentext
	checkevent EVENT_KIMONO_CABIN_3_JEZEBALLS
	iftrue_jumpopenedtext KimonoCabin3Explains1Text
	writetext KimonoCabin3GivesJezeballs
	verbosegiveitem JEZE_BALL, 5
	writetext KimonoCabin3Explains1Text

KimonoCabin3GivesJezeballs:
	text "Samaria: Whatever"
	line "is up here must"
	cont "love the dark."
	
	para "Take these."
	done
	
KimonoCabin3Explains1Text:
	text "There's so many"
	line "holes in the"
	cont "attic rafters - "
	
	para "Try not to fall"
	line "thru, and don't"
	cont "mind the clutter."
	done

	

KimonoCabin3Sneasel:
	cry SNEASEL
	pause 15
	loadwildmon SNEASEL, 19
	startbattle
	disappear KIMONO_CABIN_3_SNEASEL
	setevent EVENT_KIMONO_CABIN_SNEASEL
	reloadmapafterbattle
	end
