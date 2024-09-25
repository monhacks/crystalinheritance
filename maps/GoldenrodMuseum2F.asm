GoldenrodMuseum2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 13,  7, GOLDENROD_MUSEUM_1F, 3

	def_coord_events

	def_bg_events
	bg_event  1,  0, BGEVENT_READ, LugiaPaintingScript
	bg_event  2,  0, BGEVENT_READ, LugiaPaintingScript
	bg_event  4,  0, BGEVENT_READ, BellTowerPaintingScript
	bg_event  5,  0, BGEVENT_READ, BellTowerPaintingScript
	bg_event  7,  0, BGEVENT_READ, HoOhPaintingScript
	bg_event  8,  0, BGEVENT_READ, HoOhPaintingScript
	bg_event  0,  4, BGEVENT_READ, KabutoPuzzleScript
	bg_event  0,  5, BGEVENT_READ, KabutoPuzzleScript
	bg_event  3,  4, BGEVENT_READ, OmanytePuzzleScript
	bg_event  3,  5, BGEVENT_READ, OmanytePuzzleScript
	bg_event  0,  6, BGEVENT_READ, AerodactylPuzzleScript
	bg_event  0,  7, BGEVENT_READ, AerodactylPuzzleScript
	bg_event  3,  6, BGEVENT_READ, HoOhPuzzleScript
	bg_event  3,  7, BGEVENT_READ, HoOhPuzzleScript
    bg_event 10,  0, BGEVENT_READ, GoldenrodMuseum2FExhibit3
    bg_event 12,  0, BGEVENT_READ, GoldenrodMuseum2FExhibit4

	def_object_events
    object_event 11,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodMuseum2FNPC3Script, -1
    object_event 12,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodMuseum2FNPC4Script, -1
    object_event  5,  5, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodMuseum2FNPC5Script, -1
    object_event  7,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodMuseum2FScientistScript, -1

LugiaPaintingScript:
	refreshscreen
	paintingpic LUGIA_PAINTING
	waitbutton
	closepokepic
	jumpthistext

	text "  The Leviathan"
	line "     Awakens"
	done

HoOhPaintingScript:
	refreshscreen
	paintingpic HO_OH_PAINTING
	waitbutton
	closepokepic
	jumpthistext

	text "   The Phoenix"
	line "    Ascending"
	done

BellTowerPaintingScript:
	refreshscreen
	paintingpic BELL_TOWER_PAINTING
	waitbutton
	closepokepic
	jumpthistext

	text "    Friendship"
	line "     and Hope"
	done

KabutoPuzzleScript:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse_jumptext UnsolvedPuzzleText
	refreshscreen
	paintingpic CELEBI_PUZZLE
	waitbutton
	closepokepic
	jumpthistext

	text "It's the completed"
	line "Celebi panel!"
	done

OmanytePuzzleScript:
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iffalse_jumptext UnsolvedPuzzleText
	refreshscreen
	paintingpic BRONZONG_PUZZLE
	waitbutton
	closepokepic
	jumpthistext

	text "It's the completed"
	line "Bronzong panel!"
	done

AerodactylPuzzleScript:
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iffalse_jumptext UnsolvedPuzzleText
	refreshscreen
	paintingpic LUGIA_PUZZLE
	waitbutton
	closepokepic
	jumpthistext

	text "It's the completed"
	line "Lugia panel!"
	done

HoOhPuzzleScript:
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iffalse_jumptext UnsolvedPuzzleText
	refreshscreen
	paintingpic HEATRAN_PUZZLE
	waitbutton
	closepokepic
	jumpthistext

	text "It's the completed"
	line "Heatran panel!"
	done

UnsolvedPuzzleText:
	text "The display is"
	line "still empty…"
	done


GoldenrodMuseum2FNPC3Script:
    jumptextfaceplayer GoldenrodMuseum2FNPC3Text

GoldenrodMuseum2FNPC4Script:
    jumptextfaceplayer GoldenrodMuseum2FNPC4Text

GoldenrodMuseum2FNPC5Script:
    jumptextfaceplayer GoldenrodMuseum2FNPC5Text

GoldenrodMuseum2FScientistScript:
    faceplayer
    opentext
    checkevent EVENT_TRADED_BRICK_PIECE
    iftrue .AfterTrade
    checkitem BRICK_PIECE
    iftrue .HasBrickPiece
    writetext GoldenrodMuseum2FScientistText1
    waitbutton
    closetext
    end

.HasBrickPiece
    writetext GoldenrodMuseum2FScientistText2
    yesorno
    iftrue .Trade
    writetext GoldenrodMuseum2FScientistText3
    waitbutton
    closetext
    end

.Trade
    takeitem BRICK_PIECE
    giveitem RAGECANDYBAR
    writetext GoldenrodMuseum2FScientistText4
    waitbutton
    closetext
    setevent EVENT_TRADED_BRICK_PIECE
    end

.AfterTrade
    writetext GoldenrodMuseum2FScientistText5
    waitbutton
    closetext
    end

GoldenrodMuseum2FExhibit3:
    jumptext GoldenrodMuseum2FExhibit3Text

GoldenrodMuseum2FExhibit4:
    jumptext GoldenrodMuseum2FExhibit4Text

GoldenrodMuseum2FNPC3Text:
    text "If I had to do"
    line "the challenge, I"
    cont "could definitely"
    cont "bring back a lot"
    cont "of unown."
    para "I would have the"
    line "whole alphabet!"
    done

GoldenrodMuseum2FNPC4Text:
    text "Ho-Oh is such a"
    line "wise #mon…"
    para "A cycle of"
    line "violence darkens"
    cont "the heart."
    done

GoldenrodMuseum2FNPC5Text:
    text "I heard that"
    line "Ho-Oh is sometimes"
    cont "spotted at the"
    cont "top of the Bell"
    cont "Tower nowadays."
    done

GoldenrodMuseum2FScientistText1:
    text "I tried to make"
    line "progress studying"
    cont "the sunken"
    cont "stadium but I"
    cont "can't find any"
    cont "samples."
    para "Now I'm stuck"
    line "writing reports"
    cont "about the rocket"
    cont "hideout in"
    cont "Mahogany town…"
    done

GoldenrodMuseum2FScientistText2:
    text "Oh my --- is that"
    line "a piece from the"
    cont "old stadium?"
    para "Would you please"
    line "trade it to me?"
    para "I would give you"
    line "this one of a"
    cont "kind RageCandyBar."
    done

GoldenrodMuseum2FScientistText3:
    text "Oh, I see.. well"
    line "please let me"
    cont "know if you"
    cont "change your mind."
    done

GoldenrodMuseum2FScientistText4:
    text "Thank you so much."
    para "That RageCandyBar"
    line "was quite a"
    cont "treat… about ten"
    cont "years ago."
    done

GoldenrodMuseum2FScientistText5:
    text "Thanks again for"
    line "the Brick Piece."
    para "My research is"
    line "progressing well!"
    done

GoldenrodMuseum2FExhibit3Text:
    text "A rite of passage"
    line "in old Goldenrod"
    cont "was to travel"
    cont "over the mountain"
    cont "pass to the Ruins"
    cont "of Alph and bring"
    cont "back an unown."
    para "It was thought"
    line "that some"
    cont "challengers would"
    cont "perish on the"
    cont "travel, but"
    cont "recent data has"
    cont "shown that it was"
    cont "more common to"
    cont "simply leave for"
    cont "Violet City,"
    cont "drawn by a"
    cont "different culture."
    done

GoldenrodMuseum2FExhibit4Text:
    text "Goldenrod Tower"
    line "was one of the"
    cont "Ho-Oh's resting"
    cont "places, along"
    cont "with the Ecruteak"
    cont "Bell Tower."
    para "However, during"
    line "Ecruteak's time"
    cont "of expansion,"
    cont "Ho-Oh was"
    cont "repelled by the"
    cont "violence and fled."
    para "Only ten years"
    line "ago was the"
    cont "rainbow #mon"
    cont "seen, following"
    cont "the ouster of"
    cont "Team Rocket by a"
    cont "young person from"
    cont "New Bark Town."
    done
