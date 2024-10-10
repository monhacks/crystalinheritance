Route43_MapScriptHeader:
	def_scene_scripts

	def_callbacks


	def_warp_events
	warp_event  9, 51, ROUTE_43_MAHOGANY_GATE, 1
	warp_event 10, 51, ROUTE_43_MAHOGANY_GATE, 2
	warp_event 17, 35, ROUTE_43_GATE, 3
	warp_event 17, 31, ROUTE_43_GATE, 1
	warp_event 18, 31, ROUTE_43_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 13,  3, BGEVENT_JUMPTEXT, Route43Sign1Text
	bg_event 11, 49, BGEVENT_JUMPTEXT, Route43Sign2Text
	bg_event 16, 38, BGEVENT_JUMPTEXT, Route43TrainerTipsText

	def_object_events
	object_event 13,  5, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokemaniacBen, -1
	object_event 14,  7, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokemaniacRon, -1
	object_event  4, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerFisherMarvin, -1
	object_event 11, 24, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrIvyandamy1, -1
	object_event 11, 25, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSrandjrIvyandamy2, -1
	cuttree_event  2, 28, EVENT_ROUTE_43_CUT_TREE
	fruittree_event  1, 26, FRUITTREE_ROUTE_43, PERSIM_BERRY, PAL_NPC_RED
	itemball_event 12, 32, MAX_ETHER, 1, EVENT_ROUTE_43_MAX_ETHER

	object_const_def


GenericTrainerSrandjrIvyandamy1:
	generictrainer SR_AND_JR, IVYANDAMY1, EVENT_BEAT_SR_AND_JR_IVY_AND_AMY, SrandjrIvyandamy1SeenText, SrandjrIvyandamy1BeatenText

	text "Ivy: I don't want"
	line "my junior to think"
	cont "I can't help her."
	done

GenericTrainerSrandjrIvyandamy2:
	generictrainer SR_AND_JR, IVYANDAMY2, EVENT_BEAT_SR_AND_JR_IVY_AND_AMY, SrandjrIvyandamy2SeenText, SrandjrIvyandamy2BeatenText

	text "Amy: I hope my"
	line "senior noticed"
	cont "how hard I tried."
	done

GenericTrainerCamperSpencer:
	generictrainer CAMPER, SPENCER, EVENT_BEAT_CAMPER_SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText

	text "What is going on"
	line "at Lake of Rage?"

	para "We were planning"
	line "to camp there."
	done

GenericTrainerPokemaniacBen:
	generictrainer POKEMANIAC, BEN, EVENT_BEAT_POKEMANIAC_BEN, PokemaniacBenSeenText, PokemaniacBenBeatenText

	text "What else do I"
	line "like besides"
	cont "#mon?"

	para "Mary on the radio."
	line "I bet she's cute!"
	done

GenericTrainerPokemaniacRon:
	generictrainer POKEMANIAC, RON, EVENT_BEAT_POKEMANIAC_RON, PokemaniacRonSeenText, PokemaniacRonBeatenText

	text "It's OK for people"
	line "to like different"
	cont "types of #mon."

	para "#mon isn't just"
	line "about having the"
	cont "most powerful one."
	done

GenericTrainerFisherMarvin:
	generictrainer FISHER, MARVIN, EVENT_BEAT_FISHER_MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText

	text "Kurt's Lure Ball"
	line "is the best for"

	para "catching hooked"
	line "#mon."

	para "It's much more"
	line "effective than a"
	cont "Ultra Ball."
	done


PokemaniacBenSeenText:
	text "I love #mon!"

	para "That's why I"
	line "started--and why"

	para "I'll keep on col-"
	line "lecting #mon!"
	done

PokemaniacBenBeatenText:
	text "How could you do"
	line "this to me?"
	done

PokemaniacBrent1SeenText:
	text "Hey! Do you have"
	line "any rare #mon?"
	done

PokemaniacBrent1BeatenText:
	text "Oh, my poor #-"
	line "mon! Darlings!"
	done

PokemaniacBrentAfterBattleText:
	text "I'd be happy just"
	line "to own a single"
	cont "rare #mon."
	done

PokemaniacRonSeenText:
	text "Would you get"
	line "this?"

	para "Some <RIVAL> guy"
	line "made fun of my"
	cont "#mon!"

	para "Darn it! My #-"
	line "mon's great!"
	done

PokemaniacRonBeatenText:
	text "My Nidoking did"
	line "pretty right on!"
	done

FisherMarvinSeenText:
	text "I'm in a slump."

	para "Maybe it's the"
	line "gear I'm using."

	para "Let's battle for a"
	line "change of pace!"
	done

FisherMarvinBeatenText:
	text "I lost, but I feel"
	line "better anyway."
	done

CamperSpencerSeenText:
	text "I can do so much"
	line "with my #mon--"
	cont "it's super fun!"
	done

CamperSpencerBeatenText:
	text "Losing isn't fun"
	line "at all…"
	done

PicnickerTiffany1SeenText:
	text "Are you going to"
	line "Lake of Rage too?"

	para "Let's play for a"
	line "little while!"
	done

PicnickerTiffany1BeatenText:
	text "I played too much!"
	done

PicnickerTiffanyWantsPicnicText:
	text "I'm having a pic-"
	line "nic with #mon."

	para "Won't you join us?"
	done

PicnickerTiffanyClefairyText:
	text "Isn't my Clefairy"
	line "just the most"
	cont "adorable thing?"
	done

SrandjrIvyandamy1SeenText:
	text "Ivy: I'll show my"
	line "junior how it's"
	cont "done!"
	done

SrandjrIvyandamy1BeatenText:
	text "Ivy: You embarass-"
	line "ed me in front of"
	cont "my junior…"
	done

SrandjrIvyandamy2SeenText:
	text "Amy: A trainer!"
	line "Senior, please"
	cont "help me win!"
	done

SrandjrIvyandamy2BeatenText:
	text "Amy: We couldn't"
	line "do it…"
	done

Route43Sign1Text:
	text "Route 43"

	para "Lake of Rage -"
	line "Mahogany Town"
	done

Route43Sign2Text:
	text "Route 43"

	para "Lake of Rage -"
	line "Mahogany Town"
	done

Route43TrainerTipsText:
	text "Trainer Tips"

	para "All #mon have"
	line "pros and cons"

	para "depending on their"
	line "types."

	para "If their types"
	line "differ, a higher-"

	para "level #mon may"
	line "lose in battle."

	para "Learn which types"
	line "are strong and"

	para "weak against your"
	line "#mon's type."
	done
