GoldenrodHPUpHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 21
	warp_event  3,  7, GOLDENROD_CITY, 21

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHPUpFisherScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodHPUpHousePokefanFText, -1
	pokemon_event  6,  3, QUAGSIRE, -1, -1, PAL_NPC_BLUE, GoldenrodHPUpHousePikachuText, -1

FisherGoodRodScript:
    faceplayer
    opentext
    checkkeyitem GOOD_ROD
    iftrue .AlreadyHaveRod
    writetext FisherIntroText
    promptbutton
    verbosegivekeyitem GOOD_ROD
    iffalse .BagFull
    setevent EVENT_GOT_GOOD_ROD
    jumpthisopenedtext FisherGiveRodText
.AlreadyHaveRod
    jumpthisopenedtext FisherAfterText
.BagFull
    jumpthisopenedtext FisherBagFullText

FisherIntroText:
    text "I was married to"
    line "the sea."
	
	para "We had a tough"
	line "breakup - she"
	cont "got to be too"
	cont "tempestuous for"
	cont "me."
	
	para "Ah, so I don't"
	line "need this any"
	cont "longer."
    done

FisherGiveRodText:
    text "You never know"
	line "what you'll pull"
	cont "up with that!"
    done

FisherAfterText:
    text "Remember - "
	line "there's always"
	cont "more fish in"
	cont "the sea!"
    done

FisherBagFullText:
    text "Your bag's full!"
    line "Come back when"
    cont "you have space."
    done


GoldenrodHPUpHousePokefanFText:
	text "After the wedding"
	line "I realized I was"
	cont "Whicash-fished."
	
	para "His ex took all"
	line "of his stuff in"
	cont "the divorce."
	done

GoldenrodHPUpHousePikachuText:
	text "Quagsire: "
	line "Qua!"
	done
