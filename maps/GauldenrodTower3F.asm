GauldenrodTower3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  7, 15, GAULDENROD_TOWER_2F, 2
	warp_event  7,  2, GAULDENROD_TOWER_4F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSageNAME1, -1
	object_event 10,  9, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSageNAME2, -1
	object_event  8,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSageNAME3, -1

GenericTrainerSageNAME1:
	generictrainer SAGE, NAME1, EVENT_BEAT_GAULDENROD_TOWER_3F_TRAINER_1, SageNAME1SeenText, SageNAME1BeatenText

	text "I heard that you"
	line "organized against"
	cont "the Anarres elder."
	cont "He was getting too"
	cont "power-hungry. I"
	cont "hope you will join"
	cont "our movement."
	done

SageNAME1SeenText:
	text "When you let your"
	line "feelings flow"
	cont "through you, you"
	cont "can get through"
	cont "anything."
	done

SageNAME1BeatenText:
	text "Your flow is"
	line "astounding."
	done

GenericTrainerSageNAME2:
	generictrainer SAGE, NAME2, EVENT_BEAT_GAULDENROD_TOWER_3F_TRAINER_2, SageNAME2SeenText, SageNAME2BeatenText

	text "If people learn to"
	line "reject the stadium"
	cont "as a distraction"
	cont "then they will see"
	cont "how their attent-"
	cont "ions have been put"
	cont "to terrible things."
	done

SageNAME2SeenText:
	text "The bell at the"
	line "top of this tower"
	cont "was forged from"
	cont "intense heat. Can"
	cont "you handle it?"
	done

SageNAME2BeatenText:
	text "You are tempered."
	done

GenericTrainerSageNAME3:
	generictrainer SAGE, NAME3, EVENT_BEAT_GAULDENROD_TOWER_3F_TRAINER_3, SageNAME3SeenText, SageNAME3BeatenText

	text "Sandra has been"
	line "trying to coax the"
	cont "rainbow bird"
	cont "#MON back to"
	cont "our roof for some"
	cont "time."
	done

SageNAME3SeenText:
	text "My colleagues say"
	line "that you have a"
	cont "strong connection"
	cont "to your #MON."
	done

SageNAME3BeatenText:
	text "Indeed, you are"
	line "pure of heart…"
	cont "you should see"
	cont "the Elder Sandra."
	done