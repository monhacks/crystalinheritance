MistyBasin_MapScriptHeader: ; should be like  "BurnedTowerB1F_MapScriptHeader"
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event  17, 15, ANARRES_TOWN, 8


	def_coord_events


	def_bg_events


	def_object_events
	object_event 14, 13, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, jumptextfaceplayer, MistyBasonMatronText, -1 ;
	object_event  4, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSageChow, EVENT_BEAT_HOLLIS 
	object_event  5,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSageNico, EVENT_BEAT_HOLLIS
	object_event 13,  3, SPRITE_MEDIUM, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerMediumMartha, EVENT_BEAT_HOLLIS
	object_event 14,  2, SPRITE_TAMMY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TammyScript, EVENT_BEAT_HOLLIS

	object_const_def


MistyBasonMatronText:
	text "A slowpoke yawn"
	line "causes rain. Ten"
	cont "elders ago,"
	cont "there was a"
	cont "drought, and it"
	cont "broke once we"
	cont "revered the"
	cont "simple act of a"
	cont "slowpoke yawn."
	done

GenericTrainerSageChow:
	generictrainer SAGE, CHOW, EVENT_BEAT_SAGE_CHOW, SageChowSeenText, SageChowBeatenText

	text "The Elder hoards"
	line "the HM Cut for"
	cont "himself. It’s"
	cont "not right!"
	done

SageChowSeenText:
	text "Why are you"
	line "interrupting our"
	cont "meeting?"
	done

SageChowBeatenText:
	text "We’re trying to"
	line "save the forest."
	done

GenericTrainerSageNico:
	generictrainer SAGE, CHOW, EVENT_BEAT_SAGE_CHOW, SageNicoSeenText, SageNicoBeatenText

	text "We're going to"
	line "confront the"
	cont "Elder."
	done

SageNicoSeenText:
	text "Don't tell"
	line "anyone we're"
	cont "here!"
	done

SageNicoBeatenText:
	text "Deflated."
	done

GenericTrainerMediumMartha:
	generictrainer SAGE, CHOW, EVENT_BEAT_SAGE_CHOW, MediumMarthaSeenText, MediumMarthaBeatenText

	text "Tammy developed"
	line "a method of"
	cont "hitting the"
	cont "trees to knock"
	cont "off Pineco."
	done

MediumMarthaSeenText:
	text "We'll fight from"
	line "the shadows if"
	cont "we have to!"
	done

MediumMarthaBeatenText:
	text "Whose side are"
	line "you on?"
	done

TammyScript:
	faceplayer
	showtext TammySeenText
	winlosstext TammyBeatenText, 0
	loadtrainer TAMMY, TAMMY1 ; call the right trainer?
	startbattle
	reloadmapafterbattle
	opentext
	setevent EVENT_BEAT_TAMMY
	jumpthisopenedtext

	text "I invented a way"
	line "to teach"
	cont "techniques,"
	cont "ramming a tree."
	cont "It shakes off"
	cont "pineco without"
	cont "damaging the"
	cont "tree. The elder"
	cont "says it’s"
	cont "unnatural. I"
	cont "want to talk to"
	cont "him, but he just"
	cont "sits on top of"
	cont "the tower. Since"
	cont "you’re so"
	cont "strong, can you"
	cont "talk to him with"
	cont "me?"
	done

TammySeenText:
	text "You’ve found our"
	line "secret meeting."
	cont "We’ve organized"
	cont "to confront the"
	cont "Elder. Oh?"
	cont "You’re also"
	cont "trying to get"
	cont "the HM? Let’s"
	cont "see if you’re"
	cont "strong enough."
	done

TammyBeatenText:
	text "You've proven"
	line "yourself as a"
	cont "strong trainer."
	done
