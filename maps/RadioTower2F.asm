BLUE_CARD_POINT_CAP EQU 30

RadioTower2F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event 15,  0, RADIO_TOWER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, RadioTower2FSalesSignText
	bg_event  5,  0, BGEVENT_JUMPTEXT, RadioTower2FOaksPKMNTalkSignText
	bg_event 13,  0, BGEVENT_JUMPTEXT, RadioTower2FPokemonRadioSignText

	def_object_events
    object_event  2,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerGentlemanGregory, -1
    object_event  8,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerGentlemanPreston, -1
    object_event 13,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerGentlemanEdward, -1


	object_const_def




RadioTower2FSalesSignText:
	text "2F Sales"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "Prof.Oak's #mon"
	line "Talk"

	para "The Hottest Show"
	line "on the Air!"
	done

RadioTower2FPokemonRadioSignText:
	text "Anywhere, Anytime"
	line "#mon Radio"
	done

TrainerGentlemanGregory:
    trainer GENTLEMAN, GREGORY, EVENT_BEAT_GENTLEMAN_GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText, 0, .Script

.Script:
    endifjustbattled
    opentext
    writetext GentlemanGregoryAfterText
    waitbutton
    closetext
    end

TrainerGentlemanPreston:
    trainer GENTLEMAN, PRESTON, EVENT_BEAT_GENTLEMAN_PRESTON, GentlemanPrestonSeenText, GentlemanPrestonBeatenText, 0, .Script

.Script:
    endifjustbattled
    opentext
    writetext GentlemanPrestonAfterText
    waitbutton
    closetext
    end

TrainerGentlemanEdward:
    trainer GENTLEMAN, EDWARD, EVENT_BEAT_GENTLEMAN_EDWARD, GentlemanEdwardSeenText, GentlemanEdwardBeatenText, 0, .Script

.Script:
    endifjustbattled
    opentext
    writetext GentlemanEdwardAfterText
    waitbutton
    closetext
    end

GentlemanGregorySeenText:
    text "Hey! Who turned"
    line "off the lights?"
    done

GentlemanGregoryBeatenText:
    text "I'm scared of the"
    line "dark!"
    done

GentlemanGregoryAfterText:
    text "I'm scared of the"
    line "dark!"
    done

GentlemanPrestonSeenText:
    text "Is this a bit for"
    line "the show?"
    done

GentlemanPrestonBeatenText:
    text "No, that was"
    line "real…"
    done

GentlemanPrestonAfterText:
    text "How is security"
    line "so bad at this"
    cont "radio tower?"
    done

GentlemanEdwardSeenText:
    text "Stop right there!"
    done

GentlemanEdwardBeatenText:
    text "Can't stop you"
    line "any more…"
    done

GentlemanEdwardAfterText:
    text "Can't stop you"
    line "any more…"
    done