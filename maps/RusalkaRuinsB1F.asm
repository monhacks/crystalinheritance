RusalkaRuinsB1F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event  1, 12, PHANTOM_FJORD, 2
	warp_event  26, 6, RUSALKA_RUINS_1F, 1
	warp_event  0, 4, RUSALKA_RUINS_1F, 2

	warp_event  26, 3, RUSALKA_RUINS_1F, 1 ; hole drop FOR MOST  
	warp_event  3, 10, RUSALKA_RUINS_1F, 1 ; hole drop FOR CAPTAIN 
	warp_event  8, 2, RUSALKA_RUINS_1F, 1 ; hole drop FOR DARK CABIN   	


	def_coord_events
; IF MEMORY ADDRESSES PERMIT, TODO PUT A STALKING SPIRITOMB ON THIS LEVEL 


	def_bg_events



	def_object_events
	object_event  1,  10, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptext, CaptainsLog01, -1
	object_event  8,  10, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptext, CaptainsLog02, -1
	object_event  13,  6, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptext, CaptainsLog03, -1
	object_event  20,  4, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptext, CaptainsLog04, -1
	object_event  4,  2, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptext, CaptainsLog08, -1	

	bg_event  5,  7, BGEVENT_ITEM + X_ATTACK, EVENT_RUSALKA_B1F_X_ATTACK ;
	bg_event 27, 13, BGEVENT_ITEM + X_SPEED, EVENT_RUSALKA_B1F_X_SPEED ;


	object_const_def

CaptainsLog01:
	text "Captain's Log 1"
	line "March 01"
	
	para "Another trophy"
	line "for my case!"
	
	para "The battle was"
	line "decisive for"
	cont "our 108 souls."
	
	para "The locals"
	line "surrendered with"
	cont "surprising"
	cont "grace."
	
	para "Their chief's"
	line "wife insisted"
	cont "on accompanying"
	cont "us to port,"
	cont "bearing some"
	cont "sort of stone"
	cont "as tribute."
	
	para "Dark,"
	line "unremarkable"
	cont "thing."
	
	para "Will look fine"
	line "beside the"
	cont "captured flag."
	done

CaptainsLog02:
	text "Captain's Log 2"
	line "March 16"
	
	para "More Pidgey mail"
	line "cluttering my"
	cont "desk."
	
	para "Eleanor writes"
	line "faithfully -"
	cont "perhaps too"
	cont "faithfully."
	
	para "I'll read them"
	line "when we've"
	cont "properly secured"
	cont "our new"
	cont "territories."
	
	para "That stone..."
	line "there's"
	cont "something regal"
	cont "about it."
	
	para "Had crew take"
	line "shifts standing"
	cont "guard all night."
	
	para "Can't risk"
	line "anyone getting"
	cont "ideas about my"
	cont "collection."
	done

CaptainsLog03:
	text "Captain's Log 3"
	line "April 09"
	
	para "Long voyage"
	line "called for a"
	cont "story."
	
	para "I regaled them"
	line "with one of my"
	cont "best, the time"
	cont "I sacrificed"
	cont "the life boats"
	cont "to get enough"
	cont "speed to catch"
	cont "a shiny Swanna."
	
	para "Also, found a"
	line "few crew"
	cont "stealing - sent"
	cont "them below deck"
	cont "in the cells."
	done

CaptainsLog04:
	text "Captain's Log 4"
	line "April 12"
	
	para "Even more mail"
	line "for the pile."
	
	para "She's using a"
	line "Togepi stamp"
	cont "for each one."
	
	para "I plan to read"
	line "it once I finish"
	cont "investigating"
	cont "the faint green"
	cont "glow emanating"
	cont "from the stone."
	
	para "It began to"
	line "glow last night."
	
	para "Incidentally,"
	line "the four crew"
	cont "locked up have"
	cont "disappeared."
	done

CaptainsLog08:
	text "Captain's Log 8"
	line "June 05"
	
	para "The expedition"
	line "came back"
	cont "missing half"
	cont "the crew."
	
	para "However, a"
	line "dozen greedy"
	cont "sailors"
	cont "kidnapped the"
	cont "woman and"
	cont "forced her to"
	cont "take them."
	
	para "They got their"
	line "comeuppance"
	cont "when she was"
	cont "the only one to"
	cont "come back."
	
	para "The alluring"
	line "glow from the"
	cont "stone is"
	cont "brighter"
	cont "tonight."
	
	para "Eleanor, how"
	line "could I have"
	cont "done this!"
	
	para "Finally read"
	line "your mail."
	
	para "I shall be a"
	line "father!"
	
	para "I have dallied"
	line "around these"
	cont "islands too"
	cont "long thinking"
	cont "about riches."
	
	para "The life within"
	line "you is what I"
	cont "want to hold."
	done
