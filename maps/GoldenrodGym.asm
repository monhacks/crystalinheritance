GoldenrodGym_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2, 17, GOLDENROD_CITY, 1
	warp_event  3, 17, GOLDENROD_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  1, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event  4, 15, BGEVENT_READ, GoldenrodGymStatue

	def_object_events
	object_event  0,  1, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrJoandcath1, -1
	object_event  1,  1, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrJoandcath2, -1
	object_event  9, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerLassCathy, -1
	object_event  9,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerBeautyVictoria, -1
	object_event  8,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PryceScript, EVENT_GAVE_FACADE

	object_const_def


GenericTrainerSrandjrJoandcath2:
GenericTrainerSrandjrJoandcath1:
    generictrainer SRANDJR, JOANDCATH1, EVENT_BEAT_SRANDJR_JOANDCATH1, SrandjrJoandcath1SeenText, SrandjrJoandcath1BeatenText

    text "Whitney made it"
    line "all look so easy."
    para "Maybe we need to"
    line "rethink things."
    done

SrandjrJoandcath1SeenText:
    text "We thought we had"
    line "paradise here."
    para "But at what cost?"
    done

SrandjrJoandcath1BeatenText:
    text "Huh. Didn't see"
    line "that coming."
    done
	
GenericTrainerLassCathy:
    generictrainer LASS, CATHY, EVENT_BEAT_LASS_CATHY, LassCathySeenText, LassCathyBeatenText

    text "We used to idolize"
    line "Whitney, you know?"
    para "Now I wonder if we"
    line "were too hasty."
    done

LassCathySeenText:
    text "I've been here"
    line "since the start."
    para "Let me show you"
    line "how we battle!"
    done

LassCathyBeatenText:
    text "Times change,"
    line "don't they?"
    done
	
GenericTrainerBeautyVictoria:
    generictrainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText

    text "My little corner"
    line "here is perfect."
    para "No need for"
    line "Whitney's glamour."
    done

BeautyVictoriaSeenText:
    text "Welcome to our"
    line "sanctuary."
    para "Care for a battle?"
    done

BeautyVictoriaBeatenText:
    text "Defeat is just"
    line "part of life."
    done

PryceScript:
    faceplayer
    opentext
    checkevent EVENT_GAVE_FACADE
    iftrue .AlreadyGaveTM
    writetext PryceText
    promptbutton
    verbosegivetmhm TM_FACADE
    iffalse .NoRoom
    setevent EVENT_GAVE_FACADE
    jumpthisopenedtext PryceAfterText
.AlreadyGaveTM
    writetext PryceAfterText
    waitbutton
    closetext
    end
.NoRoom
    jumpthisopenedtext PryceNoRoomText

PryceText:
    text "Pryce: <PLAYER>…"
    line "what are you"
    cont "doing here?"
    para "… Ah, I see."
    line "Well you are"
    cont "probably asking"
    cont "the same of me."
    para "I came here to"
    line "confront Whitney,"
    cont "but she is in the"
    cont "Radio Tower."
    para "Her gym trainers"
    line "are still"
    cont "grinding away,"
    cont "though."
    para "They seem to"
    line "think her cute"
    cont "demeanor was just"
    cont "a Facade."
	para "For your trouble,"
	line "please take this"
	cont "TM."
    done

PryceAfterText:
    text "I hear Whitney is"
    line "at the radio"
    cont "tower now, and"
    cont "has her own show."
    para "Its following"
    line "is... far from"
    cont "underground, if"
    cont "you catch my"
    cont "drift."
    done

PryceNoRoomText:
    text "You don't have"
    line "room for this TM."
    para "Come back when"
    line "you've made space"
    cont "in your pack."
    done
