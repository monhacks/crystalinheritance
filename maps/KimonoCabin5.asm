KimonoCabin5_MapScriptHeader: ; should be like  "BurnedTowerB1F_MapScriptHeader"
	def_scene_scripts


	def_callbacks


	def_warp_events



	def_coord_events






	def_bg_events
	bg_event 0,  0, BGEVENT_READ, KimonoCabin5Switch1Script
	bg_event 0,  0, BGEVENT_READ, KimonoCabin5Switch2Script
	bg_event 0,  0, BGEVENT_READ, KimonoCabin5Switch3Script
	bg_event 0,  0, BGEVENT_READ, KimonoCabin5Switch4Script

	


	def_object_events
	object_event  0, 0, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED,  OBJECTTYPE_SCRIPT, 0, KimonoCabin4Script, -1
	object_event  0,  0, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED,  OBJECTTYPE_SCRIPT, 0, KimonoCabin5Lass, -1


	object_const_def
	const KIMONO_CABIN_4_GRANNY
	const KIMONO_CABIN_4_LAPRAS

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

KimonoCabin4Script:
	faceplayer
	opentext
	checkevent EVENT_EXPLAINED_SUDOKU
	iftrue CheckSudokuSolved
	writetext ExplainSudokuText
	setevent EVENT_EXPLAINED_SUDOKU
	end
	
	
CheckSudokuSolved:
	checkevent EVENT_KC4_11
	iffalse_jumpopenedtext SudokuNotSolvedText
	...
	writetext TheGardenLooksBeautifulText
	closetext
	checkevent EVENT_KIMONO_4_LAPRAS
	iftrue_jumpopenedtext WhatABeautifulSpecimenThatWasText
	checkevent EVENT_KIMONO_CABIN_4_GAVE_BUB_BALL
	iftrue_jumpopenedtext GoCatchThatLaprasText
	appear KIMONO_CABIN_4_LAPRAS
	writetext LaprasIsHereText
	verbosegiveitem BUB_BALL
	setevent EVENT_KIMONO_CABIN_4_GAVE_BUB_BALL
	closetext
	done




	




ExplainSudokuText:
	text "Sudo: This garden will be a marvel, drawing rare #mon far and wide! I started decorating, but now I'm too weak to finish. I have a vision... each of the four rows has all four colors of stone, each column has all four colors, and each 2x2 grid has all four colors. 


SudokuNotSolvedText:
	text "Sudoki: The garden isn't up to my standards. It needs one stone of each color in every row, column, and in each of the 2x2 squares."

TheGardenLooksBeautifulText:
	text "Sudoki: good heavens! What a gorgeous garden."
	
LaprasIsHereText:
	text "Look! A beautiful Lapras. You're a competent trainer, you might find a use for this."

WhatABeautifulSpecimenThatWasText:
	text "Why, it's not every day you get to see a #mon as graceful as that."

GoCatchThatLaprasText:
	text "What are you waiting for? A chance like this doesn't come around every day."

Switch11Script:
	opentext
	writetext ChooseAStoneColorText
	promptbutton
	loadmenu StoneColorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RedStone11
	ifequal 2, .BrownStone11
	ifequal 3, .GreenStone11
	ifequal 4, .BlueStone11
	jumptext NoChangeToStoneText

.RedStone11:
	changeblock 0, 0, $00
	setevent EVENT_KC4_11
	waitbutton
	closetext
	end

.BrownStone11:
	changeblock 0, 0, $00
	writetext SetTheColorText
	waitbutton
	closetext
	end

.GreenStone11:
	changeblock 0, 0, $00
	waitbutton
	closetext
	end

.GreenStone11:
	changeblock 0, 0, $00
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


;	givepoke EEVEE, NO_FORM, 5, LUM_BERRY, LOVE_BALL, GROWTH