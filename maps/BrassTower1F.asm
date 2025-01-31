BrassTower1F_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 7, 15, WESTERN_CAPITAL, 1 ; CHECK THE WARP
	warp_event 8, 15, WESTERN_CAPITAL, 1 ; CHECK THE WARP

	def_coord_events



	def_bg_events



	def_object_events
; KURT - pontificates
; AMOS - sells items 
	object_event 0, 0, SPRITE_KURT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TowerKurtScript, -1 ; 
	; lugia
	object_event 0, 0, SPRITE_AMOS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_COMMAND, jumptextfaceplayer, BrassTowerAmosText, -1 ; done
	; lucario 
	object_event 0, 0, SPRITE_NINJA, ; MART 

	object_const_def


TowerKurtScript: 
	faceplayer
	opentext
	writetext KurtHearAStoryQuestionTower
	yesorno
	iffalse .AskPC
	writetext BrassTowerKurtStoryText
	setevent EVENT_LISTENED_TO_KURT_5; FOR USE IN KURTS HOUSE
	waitbutton
.AskPC
	writetext TowerKurtPCQuestion
	yesorno
	iffalse_jumpopenedtext KurtTowerDeclineText
	writetext KurtTowerText2
	promptbutton
	special PokemonCenterPC ; per engine/events/std_scripts.asm this is how it should be done. 
	endtext
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
	
	para "Before he arrived"
	line "I looked in the "
	cont "bag and found his"
	cont "apricorn. "
	
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
