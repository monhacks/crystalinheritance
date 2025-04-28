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
	opentext
	writetext KurtHearAStoryQuestionTower ; todo, move this to the roof 
	yesorno
	iffalse .AskPC
	writetext BrassTowerKurtStoryText
	setevent EVENT_LISTENED_TO_KURT_5; TODO in kurt's house 
	waitbutton
.AskPC
	writetext TowerKurtPCQuestion
	yesorno
	iffalse_jumpopenedtext KurtTowerDeclineText
	writetext KurtTowerText2
	promptbutton
	special PokemonCenterPC
	end

KurtHearAStoryQuestionTower:
	text "Would you like"
	line "to hear a story?"
	
	para "It's the last I"
	line "was here, at the"
	cont "burned tower in"
	cont "our time."
	done

BrassTowerKurtStoryText:
	text "For the new year"
	line "celebration befo-"
	cont "re you were born,"

	para "your dad and I "
	line "met here. I was "
	cont "so excited."

	para "I wanted to rem-"
	line "ind him of his "
	cont "1st #mon,"
	
	para "since he was abo-"
	line "ut to have you. "
	
	para "While I waited,"
	line "I looked in the "
	cont "bag and found his"
	cont "apricorn."
	
	para "The paint was ne-"
	line "arly all chipped"
	cont "off, so only he "
	cont "and I would know"
	cont "what it once was." 
	
	para "When I picked it"
	line "up it was cold"
	cont "and still - not"
	cont "as it should be."
	
	para "When I opened it,"
	line "the inside was "
	cont "dark. I tried re-"
	cont "opening it to no"
	cont "avail."
	
	para "I closed it for"
	line "the last time,"
	cont "marking the end"
	cont "of that part of"
	cont "my life."

	para "I still think of"
	line "those good days"
	cont "whenever I see"
	cont "an apricorn, "
	
	para "wishing I could"
	line "see him catch his"
	cont "first one again."
	done

TowerKurtPCQuestion:
	text "..."
	done

KurtTowerDeclineText:
	text "Let's finish what"
	line "we started."
	
	para "If we let the"
	line "Emperor reign,"
	cont "Johto will be"
	cont "on a path to"
	cont "destruction."

	para "We need to get"
	line "to him before we"
	cont "get caught in the"
	cont "rainstorm."
	done

KurtTowerText2:
	text "I can run back"
	line "to manage your"
	cont "party."
	done
