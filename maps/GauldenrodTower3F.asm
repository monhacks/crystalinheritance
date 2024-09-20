GauldenrodTower3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  6,  1, GAULDENROD_TOWER_1F, 6
	warp_event  5,  9, GAULDENROD_TOWER_4F, 1
	warp_event  4,  11, GAULDENROD_TOWER_1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  0, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBirdKeeperVance, EVENT_BEAT_SANDRA
	object_event  9,  0, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFirebreatherNed, EVENT_BEAT_SANDRA
	object_event 10,  0, SPRITE_VETERAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerVeteranFJoanne, EVENT_BEAT_SANDRA

GenericTrainerBirdKeeperVance:
	generictrainer BIRD_KEEPER, VANCE1, EVENT_BEAT_BIRD_KEEPER_VANCE, BirdKeeperVanceSeenText, BirdKeeperVanceBeatenText

	text "I heard that you"
	line "organized against"
	cont "the Anarres elder."
	cont "He was getting too"
	cont "power-hungry. I"
	cont "hope you will join"
	cont "our movement."
	done

BirdKeeperVanceSeenText:
	text "When you let your"
	line "feelings flow"
	cont "through you, you"
	cont "can get through"
	cont "anything."
	done

BirdKeeperVanceBeatenText:
	text "Your flow is"
	line "astounding."
	done

GenericTrainerFirebreatherNed:
	generictrainer FIREBREATHER, NED, EVENT_BEAT_FIREBREATHER_NED, FirebreatherNedSeenText, FirebreatherNedBeatenText

	text "If people learn to"
	line "reject the stadium"
	cont "as a distraction"
	cont "then they will see"
	cont "how their attent-"
	cont "ions have been put"
	cont "to terrible things."
	done

FirebreatherNedSeenText:
	text "The bell at the"
	line "top of this tower"
	cont "was forged from"
	cont "intense heat. Can"
	cont "you handle it?"
	done

FirebreatherNedBeatenText:
	text "You are tempered."
	done

GenericTrainerVeteranFJoanne:
	generictrainer VETERANF, JOANNE, EVENT_BEAT_VETERANF_JOANNE, VeteranFJoanneSeenText, VeteranFJoanneBeatenText

	text "Sandra has been"
	line "trying to coax the"
	cont "rainbow bird"
	cont "#mon back to"
	cont "our roof for some"
	cont "time."
	done

VeteranFJoanneSeenText:
	text "My colleagues say"
	line "that you have a"
	cont "strong connection"
	cont "to your #MON."
	done

VeteranFJoanneBeatenText:
	text "Indeed, you are"
	line "pure of heart…"
	cont "you should see"
	cont "the Elder Sandra."
	done