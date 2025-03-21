RuinsOfAlphHoOhChamber_MapScriptHeader: ; heatran 
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsOfAlphHoOhChamberHiddenDoorsCallback

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 1
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 1
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 2
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 3
	warp_event  4,  0, RUINS_OF_ALPH_HO_OH_ITEM_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  3,  2, BGEVENT_UP, MapRuinsofAlphHoOhChamberSignpost2Script
	bg_event  4,  2, BGEVENT_UP, MapRuinsofAlphHoOhChamberSignpost3Script

	def_object_events


RuinsOfAlphHoOhChamberHiddenDoorsCallback:
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $24
.WallOpen:
	endcallback


MapRuinsofAlphHoOhChamberSignpost2Script:
	refreshscreen
	setval $3
	special Special_UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_SOLVED_HO_OH_PUZZLE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 4, 0, $25
	reloadmappart
	pause 30
	playsound SFX_STRENGTH
	waitsfx
	pause 20
	end

MapRuinsofAlphHoOhChamberSignpost3Script:
	unowntypeface
	showtext RuinsOfAlphHoOhChamberDescriptionText
	restoretypeface
	special MapCallbackSprites_LoadUsedSpritesGFX
	end

RuinsOfAlphHoOhChamberDescriptionText:
	text "If unleashed from"
	line "volcanic cradle,"
	
	para "It will melt all"
	line "to blank slate"
	done
