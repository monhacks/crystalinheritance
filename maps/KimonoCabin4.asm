KimonoCabin4_MapScriptHeader: ;REVISE THE TEXT 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event  6, 11, KIMONO_CABIN, 1
	warp_event  7, 11, KIMONO_CABIN, 1

	def_coord_events



	def_bg_events
	bg_event 0,  0, BGEVENT_READ, Switch00Script
;	bg_event 16,  1, BGEVENT_READ, Switch01Script
;	bg_event 16,  1, BGEVENT_READ, Switch02Script
;	bg_event 16,  1, BGEVENT_READ, Switch03Script
	
;	bg_event 16,  1, BGEVENT_READ, Switch10Script
;	bg_event 16,  1, BGEVENT_READ, Switch11Script
;	bg_event 16,  1, BGEVENT_READ, Switch12Script
;	bg_event 16,  1, BGEVENT_READ, Switch13Script
	
;	bg_event 16,  1, BGEVENT_READ, Switch20Script
;	bg_event 16,  1, BGEVENT_READ, Switch21Script
;	bg_event 16,  1, BGEVENT_READ, Switch22Script
;	bg_event 16,  1, BGEVENT_READ, Switch23Script
	
;	bg_event 16,  1, BGEVENT_READ, Switch30Script
;	bg_event 16,  1, BGEVENT_READ, Switch31Script
;	bg_event 16,  1, BGEVENT_READ, Switch32Script
;	bg_event 16,  1, BGEVENT_READ, Switch33Script
	


	def_object_events
	object_event  0, 0, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED,  OBJECTTYPE_SCRIPT, 0, KimonoCabin44Script, -1
	object_event  0,  0, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, LAPRAS, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KimonoCabin4Lapras, EVENT_KIMONO_4_LAPRAS


	object_const_def
	const KIMONO_CABIN_4_GRANNY
	const KIMONO_CABIN_4_LAPRAS


Switch00Script:
	opentext
	writetext ChooseAStoneColorText
	promptbutton
	loadmenu StoneColorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RedStone00
	ifequal 2, .BrownStone00
	ifequal 3, .GreenStone00
	ifequal 4, .BlueStone00
	jumptext NoChangeToStoneText

.RedStone00:
	changeblock 0, 0, $86
	setevent EVENT_KC4_00
	waitbutton
	closetext
	end

.BrownStone00:
	changeblock 0, 0, $5A
	clearevent EVENT_KC4_00
	waitbutton
	closetext
	end

.GreenStone00:
	changeblock 0, 0, $87
	clearevent EVENT_KC4_00
	waitbutton
	closetext
	end

.BlueStone00:
	changeblock 0, 0, $59
	clearevent EVENT_KC4_00
	waitbutton
	closetext
	end

StoneColorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, TEXTBOX_Y - 1
	dw MenuData
	db 1 ; default option

MenuData:
	db STATICMENU_CURSOR ; flags
	db 5 ; items
	db "RED@"
	db "BROWN@"
	db "GREEN@"
	db "BLUE@"
	db "CANCEL@"

ChooseAStoneColorText:	
	text "Which color?"
	done

KimonoCabin4Lapras:
	faceplayer
	cry LAPRAS
	pause 15
	loadwildmon LAPRAS, 30
	startbattle
	disappear KIMONO_CABIN_4_LAPRAS
	setevent EVENT_KIMONO_4_LAPRAS
	reloadmapafterbattle
	end

KimonoCabin44Script:
	faceplayer
	opentext
	checkevent KIMONO_CABIN_4_LAPRAS 
	iftrue_jumpopenedtext WhatABeautifulSpecimenThatWasText
	checkevent EVENT_EXPLAINED_SUDOKU
	iftrue CheckSudokuSolved
	writetext ExplainSudokuText
	setevent EVENT_EXPLAINED_SUDOKU
	end
	
	
CheckSudokuSolved: ; should give you a bub ball 
	checkevent EVENT_KC4_00
	iffalse_jumpopenedtext SudokuNotSolvedText
	; sudoku puzzle solved from here 
	writetext TheGardenLooksBeautifulText
	closetext
	checkevent EVENT_KIMONO_4_LAPRAS
	iftrue_jumpopenedtext WhatABeautifulSpecimenThatWasText
	checkevent EVENT_KIMONO_CABIN_4_GAVE_BUB_BALL
	iftrue_jumpopenedtext GoCatchThatLaprasText
	appear KIMONO_CABIN_4_LAPRAS
	writetext LaprasIsHereText
	verbosegiveitem BUB_BALL, 5
	writetext Kimono4OddSouvenirText
	verbosegiveitem ODD_SOUVENIR
	setevent EVENT_KIMONO_CABIN_4_GAVE_BUB_BALL
	closetext
	done


ExplainSudokuText:
	text "Shiji: This will"
	line "be a marvel, like"
	cont "the ones of my"
	cont "youth!"
	
	para "#mon will come"
	line "far and wide."
	
	para "Oh, but I don't"
	line "have the strength"
	cont "I used to."
	
	para "The method:"
	
	para "Each column, row"
	line "and 2x2 plot "
	cont "needs one stone"
	cont "of each color."	
	done

SudokuNotSolvedText:
	text "Shiji: It isn't"
	line "up to snuff."

	para "One of each color"
	line "per row, column,"
	cont "and 2x2 plot."
	
	para "Try again, the "
	line "next generations"
	cont "are counting on"
	cont "you to learn!"
	done
	
TheGardenLooksBeautifulText:
	text "Shiji: Heavens!"
	line "It's gorgeous."
	done
	
LaprasIsHereText:
	text "Oh, a Lapras."
	line "You're a trainer,"
	cont "Can you use this?"

Kimono4OddSouvenirText:
	text "Oh, and I should"
	line "give you this as"
	cont "thanks. It was"
	cont "given to me by"
	cont "a distant friend."
	done

WhatABeautifulSpecimenThatWasText:
	text "It's not every "
	line "day you can see"
	cont "a #mon as"
	cont "graceful as that."

GoCatchThatLaprasText:
	text "What's the holdup?"
	line "Fate waits for"
	cont "no one."
	done

NoChangeToStoneText:
	text "No change."
	done
	