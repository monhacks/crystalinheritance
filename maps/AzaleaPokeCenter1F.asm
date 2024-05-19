AzaleaPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, AZALEA_TOWN, 1
	warp_event  6,  7, AZALEA_TOWN, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalBugsyScript

	def_object_events
	pc_nurse_event  5, 1
	object_event  8,  4, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokeCenter1FCooltrainermScript, -1
	object_event 11,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FGentlemanText, -1
	object_event  8,  1, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FSightseermText, -1
	object_event  2,  5, SPRITE_MATRON, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FPokefanfText, -1

PokemonJournalBugsyScript:
	setflag ENGINE_READ_BUGSY_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "I studied the"
	line "tree rings in"
	cont "Ilex Forest."
	
	para "Very few are"
	line "older than 160"
	cont "years old. What"
	cont "is the reason?"
	
	para "I've tried to"
	line "get resources to"
	cont "see what was"
	cont "so damaging."
	done

AzaleaPokeCenter1FCooltrainermScript:
	checktime (1 << EVE) | (1 << NITE)
	iftrue_jumptextfaceplayer .NiteText
	jumpthistextfaceplayer

	text "For a guy who"
	line "makes # Balls,"

	para "Kurt isn't much of"
	line "a trainer."

	para "He does have a"
	line "#mon, but he"

	para "doesn't use it"
	line "much."
	done

.NiteText:
	text "Kurt and Prof.Oak"
	line "are old friends."
	done

AzaleaPokeCenter1FGentlemanText:
	text "It has been so"
	line "since it rained."
	
	para "It must have to"
	line "do with the slow-"
	cont "poke driven out"
	cont "of the well."
	done

AzaleaPokeCenter1FSightseermText:
	text "Hard to believe"
	line "that the charcoal"
	cont "boy is old en-"
	cont "ough to build"
	cont "the shrine."
	
	para "Seems like just"
	line "yesterday, he"
	cont "lost his dad's"
	cont "Farfetchd."
	done

AzaleaPokeCenter1FPokefanfText: 
	text "My husband likes"
	line "to fish in Slow-"
	cont "poke well."
	
	para "To be honest,"
	line "he doesn't bring"
	cont "home fewer fish"
	cont "than before the"
	cont "drought."
	done
