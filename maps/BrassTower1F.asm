BrassTower1F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events


	def_coord_events



	def_bg_events



	def_object_events
	object_event 6, 2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TowerKurtScript, -1 ; 
	object_event 7, 13, SPRITE_AMOS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, BrassTowerAmosScript, -1 ; done
	object_event  5,  13, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, pokemart, MARTTYPE_STANDARD, MART_WESTERN_CAPITAL_PREP, -1
	object_event 9, 13, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, BrassTowerHealScript, -1 ; done
	object_event  5,  5, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptext, BrassTowerKurtJournalText, -1


	object_const_def

BrassTowerAmosScript:
	faceplayer
	opentext
	writetext BrassTowerAmosText1
	yesorno
	iffalse_jumptext BrassTowerAmosText
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp TIMELESS_TAPESTRY, 12, 21
	end

BrassTowerAmosText1:
	text "If you need any-"
	line "thing, one of our"
	cont "soldiers can sell"
	cont "you some items or"
	cont "heal you."

	para "If you need more"
	line "preparation, I"
	para "can warp you out"
	line "of here."
	done

BrassTowerAmosText:
	text "Let's go. I'll"
	line "hold off anyone"
	cont "who tries to come"
	cont "up behind."
	done

BrassTowerHealScript: ; cf ilex healer
	faceplayer
	opentext
	writetext WantToHealBrassTower
	waitbutton
	playmusic MUSIC_HEAL
	special HealParty
	special SaveMusic	
	writetext BrassHealedPokemon
	waitbutton
	closetext
	playmusic MUSIC_NONE	
	special RestoreMusic
	end

WantToHealBrassTower:
	text "Shall I heal"
	line "your #mon?"
	done

BrassHealedPokemon:
	text "All healed."
	done

TowerKurtScript: 
	faceplayer
	writetext TowerKurtPCQuestion
	yesorno
	iffalse_jumpopenedtext KurtTowerDeclineText
	writetext KurtTowerText2
	promptbutton
	special PokemonCenterPC
	end

TowerKurtPCQuestion:
	text "Do you need me to"
	line "manage your party"
	cont "for you?"
	done

KurtTowerDeclineText:
	text "Let's finish what"
	line "we started."
	
	para "If we let the"
	line "Consul reign,"
	para "Johto will be"
	line "on a path to"
	cont "destruction."

	para "We need to get"
	line "to him before we"
	para "get caught in the"
	line "rainstorm."
	done

KurtTowerText2:
	text "I can run back"
	line "to manage your"
	cont "party."
	done

BrassTowerKurtJournalText:
	text "Kurt's Journal"
	line "Brass Tower"
	
	para "In this city, I'm"
	line "reminded of the"
	cont "last time I was"
	cont "here..."
	
	para "..."
	
	para "Hm? He hasn't"
	line "finished it."
	done
