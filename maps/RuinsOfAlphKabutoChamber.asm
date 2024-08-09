RuinsOfAlphKabutoChamber_MapScriptHeader:
	def_scene_scripts
	scene_script RuinsofAlphKabutoChamberTrigger0

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsofAlphKabutoChamberHiddenDoorsCallback

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  4,  0, RUINS_OF_ALPH_KABUTO_WORD_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  5,  3, BGEVENT_JUMPTEXT, RuinsofAlphStatueText
	bg_event  3,  2, BGEVENT_UP, MapRuinsofAlphKabutoChamberSignpost2Script
	bg_event  4,  2, BGEVENT_UP, MapRuinsofAlphKabutoChamberSignpost3Script
	bg_event  3,  0, BGEVENT_UP, MapRuinsofAlphKabutoChamberSignpost4Script
	bg_event  4,  0, BGEVENT_UP, MapRuinsofAlphKabutoChamberSignpost5Script

	def_object_events
	object_event  5,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphKabutoChamberScientistScript, -1

	object_const_def
	const RUINS_SCIENTIST

RuinsofAlphKabutoChamberTrigger0:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iffalse .End
	sdefer RuinsofAlphKabutoChamberWallOpenScript
.End
	end

RuinsofAlphKabutoChamberHiddenDoorsCallback:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $24 ;this should be closed unless we don't have the puzzle solved. 24 is the closed door
.WallOpen:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .FloorClosed
	endcallback

.FloorClosed:
	changeblock 2, 2, $1
	changeblock 4, 2, $2
	endcallback



RuinsofAlphKabutoChamberWallOpenScript:
;	pause 30
;	earthquake 30
;	showemote EMOTE_SHOCK, PLAYER, 20
;	pause 30
;	playsound SFX_STRENGTH
;	changeblock 4, 0, $25
;	reloadmappart
;	earthquake 50
	setscene $1
	end

MapRuinsofAlphKabutoChamberSignpost2Script:
	refreshscreen
	setval $0
	special Special_UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER ;no inner chamber so no EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_KABUTO_PUZZLE
;	setflag ENGINE_UNLOCKED_UNOWNS_A_TO_J
;	setevent EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	earthquake 30
	pause 15
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 4, 0, $25 ; open the door to the item room
	reloadmappart
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	pause 30
	showemote EMOTE_SHOCK, RUINS_SCIENTIST, 15
	opentext
	writetext StepBackText
	promptbutton
	closetext
	applymovement PLAYER, PlayerStepBack
	changeblock 2, 2, $14
	changeblock 4, 2, $15
	reloadmappart
	applymovement RUINS_SCIENTIST, RuinsScientistMovesToYou
	opentext
	writetext Scientist_TakeThisReport ;todo need to add an unown report to the key items
	promptbutton
	verbosegivekeyitem UNOWNREPORT
	setmapscene ILEX_FOREST, $2 ; for the celebi event
	writetext ScientistDescribesUnownReport
	waitbutton
.TryToGiveUnown
	writetext Scientist_TakeThisUnown
	yesorno
	iffalse .refusetotakeunown1
	givepoke UNOWN, 10
	iffalse_jumpopenedtext ScientistText_PartyAndBoxFull
	writetext ScientistText_TakeCareOfIt
	promptbutton
	waitsfx
	writetext ScientistText_GotUnown
	playsound SFX_KEY_ITEM
	waitsfx
	ifequal 1, .unowninparty
	special Special_CurBoxFullCheck
	iffalse .BoxNotFull
	farwritetext _CurBoxFullText
.BoxNotFull
	special GetCurBoxName
	writetext UnownSentToPC
	promptbutton
.unowninparty
	closetext
	setevent EVENT_GOT_UNOWN ; FROM SHUCKIE
	end	

.refusetotakeunown1
	jumpopenedtext DontBlameYou	

StepBackText:
	text "Step back!!"
	done

PlayerStepBack:
	step_down
	turn_head_right
	step_end

RuinsScientistMovesToYou:
	step_left
	step_end

Scientist_TakeThisReport:
	text "You solved the"
	line "mosaic! We have"
	cont "been trying to"
	cont "solve it for"
	cont "years."
	
	para "As a token of"
	line "our thanks,"
	cont "please take this"
	cont "Unown Report."
	done
	
ScientistDescribesUnownReport:
	text "It contains all"
	line "of the unown we"
	cont "have encountered."
	
	para "Of course, the"
	line "Ruins are so fra-"
	cont "gile that no one"
	cont "is allowed in the"
	cont "main chamber."
	done
	
Scientist_TakeThisUnown:
	text "Oh, you have a"
	line "#dex. Would"
	cont "you like to have"
	cont "an Unown?"
	
	para "We have dozens"
	line "of them at the"
	cont "research center."
	done


ScientistText_PartyAndBoxFull:
	text "Oh, you don't"
	line "have any room."
	
	para "Come back later."
	done

ScientistText_TakeCareOfIt:
	text "Take care of it!"
	line "I hear that some"
	cont "people find them"
	cont "fascinating."
	done

ScientistText_GotUnown:
	text "<PLAYER> received"
	line "Unown."
	done

UnownSentToPC:
	text "Unown was sent"
	line "to the PC."
	done

RuinsOfAlphKabutoChamberScientistScript:
	faceplayer
	opentext
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .PuzzleIncomplete
	checkevent EVENT_GOT_UNOWN
	iffalse .TryToGiveUnown2
	writetext RuinsOfAlphKabutoChamberScientistTremorText
	promptbutton
	closetext
	end

.TryToGiveUnown2:
	writetext Scientist_TakeThisUnown
	yesorno
	iffalse .refusetotakeunown
	givepoke UNOWN, 10
	iffalse_jumpopenedtext ScientistText_PartyAndBoxFull
	writetext ScientistText_TakeCareOfIt
	promptbutton
	waitsfx
	writetext ScientistText_GotUnown
	playsound SFX_KEY_ITEM
	waitsfx
	ifequal 1, .unowninparty
	special Special_CurBoxFullCheck
	iffalse .BoxNotFull
	farwritetext _CurBoxFullText
.BoxNotFull
	special GetCurBoxName
	writetext UnownSentToPC
	promptbutton
.unowninparty
	closetext
	setevent EVENT_GOT_UNOWN ; FROM SHUCKIE
	end	
.refusetotakeunown
	jumpopenedtext DontBlameYou	

.PuzzleIncomplete:
	writetext RuinsOfAlphKabutoChamberScientistCrypticText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

MapRuinsofAlphKabutoChamberSignpost3Script:
	unowntypeface
	showtext RuinsOfAlphKabutoChamberDescriptionText
	restoretypeface
	special MapCallbackSprites_LoadUsedSpritesGFX
	end

MapRuinsofAlphKabutoChamberSignpost4Script:
	unowntypeface
	showtext RuinsOfAlphItemRoomDescriptionText
	restoretypeface
	special MapCallbackSprites_LoadUsedSpritesGFX
	end

MapRuinsofAlphKabutoChamberSignpost5Script:
	unowntypeface
	showtext RuinsOfAlphItemRoomDescriptionText
	restoretypeface
	special MapCallbackSprites_LoadUsedSpritesGFX
	end

RuinsOfAlphKabutoChamberReceptionistText:
	text "Welcome to this"
	line "chamber."

	para "There are sliding"
	line "panels that depict"

	para "a #mon drawn by"
	line "the ancients."

	para "Slide the panels"
	line "around to form the"
	cont "picture."

	para "To the right is a"
	line "description of the"
	cont "#mon."

	para "Scientists in the"
	line "back are examining"

	para "some newly found"
	line "patterns."
	done

RuinsOfAlphKabutoChamberScientistCrypticText:
	text "Recently, strange,"
	line "cryptic patterns"
	cont "have appeared."

	para "It's odd. They"
	line "weren't here a"
	cont "little while ago…"

	para "You should take a"
	line "look at the walls."
	done

RuinsOfAlphKabutoChamberScientistHoleText:
	text "Ah! Here's another"
	line "huge hole!"

	para "It's big enough to"
	line "go through!"
	done

RuinsOfAlphKabutoChamberScientistTremorText:
	text "That tremor was"
	line "pretty scary!"
	done

RuinsOfAlphKabutoChamberDescriptionText:
	text "The forest kami"
	line "time travels"

	para "like a morning"
	line "stroll."
	done

RuinsOfAlphItemRoomDescriptionText:
	text "Timeless Trove"
	done

DontBlameYou:
	text "Don't blame you"
	line "at all. They're"
	cont "hard to train."
	done
