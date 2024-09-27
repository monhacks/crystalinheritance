RadioTower3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, CardKeyShutterCallback

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event 17,  0, RADIO_TOWER_4F, 4

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_JUMPTEXT, RadioTower3FPersonnelSignText
	bg_event  9,  0, BGEVENT_JUMPTEXT, RadioTower3FPokemonMusicSignText
	bg_event 14,  0, BGEVENT_UP, CardKeySlotScript

    def_object_events
    object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerMWriter, -1
    object_event  6,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerMLightUp, -1
    object_event  9,  3, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerBeautyCharm, -1
    object_event 14,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerMEndurance, -1

CardKeyShutterCallback:
;	changeblock 14, 2, $2a
;	changeblock 14, 4, $1
	endcallback

RadioTower3FCardKeySlotText: ; keep
	text "It's the Card Key"
	line "slot."
	done

InsertedTheCardKeyText:; keep
	text "<PLAYER> inserted"
	line "the Card Key."
	done

RadioTower3FPersonnelSignText:
	text "3F Writers"
	line "Room"
	done

RadioTower3FPokemonMusicSignText:
	text "#mon Music with"
	line "Host DJ Ben"
	done


TrainerCooltrainerMWriter:
    generictrainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainerMWriterSeenText, CooltrainerMWriterBeatenText

    text "My hunch says that"
    line "they'll have the"
    cont "power back on"
    cont "soon. Then they'll"
    cont "catch you."
    done

TrainerCooltrainerMLightUp:
    generictrainer COOLTRAINERM, CODY, EVENT_BEAT_COOLTRAINERM_CODY, CooltrainerMLightUpSeenText, CooltrainerMLightUpBeatenText

    text "You lit me up."
    done

TrainerBeautyCharm:
    generictrainer BEAUTY, VALENCIA, EVENT_BEAT_BEAUTY_VALENCIA, BeautyCharmSeenText, BeautyCharmBeatenText

    text "It's tough to work"
    line "for Whitney. Very"
    cont "few get to where"
    cont "I am."
    para "That's why I'm"
    line "here, to prove"
    cont "that anyone can"
    cont "do it!"
    done

TrainerCooltrainerMEndurance:
    generictrainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainerMEnduranceSeenText, CooltrainerMEnduranceBeatenText

    text "Whitney's up"
    line "ahead. She"
    cont "sounded pretty"
    cont "mad that her show"
    cont "was cut short."
    done

CooltrainerMWriterSeenText:
    text "What are you"
    line "doing in the"
    cont "writer's room?"
    done

CooltrainerMWriterBeatenText:
    text "scratch that…"
    done

CooltrainerMLightUpSeenText:
    text "My #mon will"
    line "light up the"
    cont "room!"
    done

CooltrainerMLightUpBeatenText:
    text "No, you lit me up."
    done

BeautyCharmSeenText:
    text "Just because I"
    line "have cute #mon"
    cont "doesn't mean I'm"
    cont "a pushover!"
    done

BeautyCharmBeatenText:
    text "It's tough to work"
    line "for Whitney. Very"
    cont "few get to where"
    cont "I am."
    para "That's why I'm"
    line "here, to prove"
    cont "that anyone can"
    cont "do it!"
    done


CooltrainerMEnduranceSeenText:
    text "That's it!"
    done

CooltrainerMEnduranceBeatenText:
    text "Whitney's up"
    line "ahead. She"
    cont "sounded pretty"
    cont "mad that her show"
    cont "was cut short."
    done
