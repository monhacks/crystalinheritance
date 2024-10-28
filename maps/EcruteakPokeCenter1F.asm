EcruteakPokeCenter1F_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5,  7, ECRUTEAK_CITY, 6
	warp_event  6,  7, ECRUTEAK_CITY, 6

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalMortyScript ; ok 

	def_object_events
	pc_nurse_event  5, 1
	object_event 11,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EcruteakPokeCenter1FPokefanMScript, -1
	object_event  8,  1, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakPokeCenter1FGymGuyText, -1

	object_event 11,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptext, EcruteakPokeCenter1fPokefan2Text, -1
	object_event 10,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptext, EcruteakPokeCenter1fElderText, -1

	object_const_def


PokemonJournalMortyScript:
	setflag ENGINE_READ_MORTY_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "Leader Morty!"

	para "Recently un-"
	line "earthed paint-"
	cont "ings show that"
	
	para "he has a close"
	line "resemblance to"
	cont "former emperors"
	cont "of Johto."
	done

EcruteakPokeCenter1FPokefanMScript:
	jumpthistextfaceplayer

	text "The Kimono Girls"
	line "are putting on a"
	cont "very immersive"
	cont "show these days!"
	done



EcruteakPokeCenter1FGymGuyText:
	text "My friend in Mah-"
	line "ogany town says"
	cont "the Lake of Rage"
	cont "has some truly"
	cont "powerful #mon"
	cont "about, now that"
	cont "Silph abandoned"
	cont "their project."
	done
	
EcruteakPokeCenter1fPokefan2Text:
	text "Give it a rest,"
	line "gramps!"
	
	para "People want this,"
	line "entertainment and"
	cont "excitement."
	
	para "It's called ada-"
	line "pting to the"
	cont "times."
	done

EcruteakPokeCenter1fElderText:
	text "Adapting? Or"
	line "abandoning?"
	
	para "It's a thin"
	line "line!"
	done
