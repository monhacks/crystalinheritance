RuinsOfAlphOmanyteChamber_MapScriptHeader: ; bronzong puzzle
	def_scene_scripts


	def_callbacks
	callback MAPCALLBACK_TILES, RuinsofAlphOmanyteChamberHiddenDoorsCallback

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 3
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 3
	warp_event  4,  0, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  3,  2, BGEVENT_UP, MapRuinsofAlphOmanyteChamberSignpost2Script
	bg_event  4,  2, BGEVENT_UP, MapRuinsofAlphOmanyteChamberSignpost3Script


	def_object_events


RuinsofAlphOmanyteChamberHiddenDoorsCallback:
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iftrue .WallOpen
	changeblock 4, 0, $24
.WallOpen:
	endcallback


MapRuinsofAlphOmanyteChamberSignpost2Script:
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iftrue_jumptext PuzzleSolvedText
	refreshscreen
	setval $1
	special Special_UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_SOLVED_OMANYTE_PUZZLE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 4, 0, $25
	reloadmappart
	pause 30
	playsound SFX_STRENGTH
	waitsfx
	pause 20
	end

MapRuinsofAlphOmanyteChamberSignpost3Script:
	unowntypeface
	showtext RuinsOfAlphOmanyteChamberDescriptionText
	restoretypeface
	special MapCallbackSprites_LoadUsedSpritesGFX
	end

RuinsOfAlphOmanyteChamberDescriptionText:
	text "Its tones"
	line "resonate with"
	
	para "incipient"
	line "raindrops."
	done

PuzzleSolvedText:
	text "The mosaic is"
	line "solved."
	done
