AzaleaPokeCenter1F_MapScriptHeader:
	def_scene_scripts
	scene_script AzaleaPokeCenterMintLeafTrigger ;she should have a happy emote t

	def_callbacks

	def_warp_events
	warp_event  5,  7, AZALEA_TOWN, 1
	warp_event  6,  7, AZALEA_TOWN, 1

	def_coord_events

	def_bg_events
	bg_event 10,  1, BGEVENT_READ, PokemonJournalBugsyScript

	def_object_events
	object_event  4,  5, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaPokeCenter1FPokefanScript, -1 ;she needs to give the 
	pc_nurse_event  5, 1
	object_event  8,  4, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaPokeCenter1FCooltrainermScript, -1 ; apricorn trader 
	object_event 11,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FGentlemanText, -1
	object_event  9,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FGentlemanText2, -1
	object_event  8,  1, SPRITE_SIGHTSEER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaPokeCenter1FSightseermText, -1
	object_event  9,  6, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IlexExcelsiorV4Script, -1

	object_const_def
	const AZALEA_POKECENTER_1F_MINTY
	
AzaleaPokeCenterMintLeafTrigger:
	sdefer .MintLeafScript
	end
	
.MintLeafScript:
	showemote EMOTE_HAPPY, AZALEA_POKECENTER_1F_MINTY, 30 ;this is to get you to talk to her
	setscene $1
	end

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
	faceplayer
	opentext
	writetext PearlForToughLeavesText ;;
	waitbutton
	checkitem BIG_PEARL
	iffalse .NoBigPearl
	writetext PearlForToughLeavesQuestionText ;;
	yesorno
	iffalse .NoBigPearl
	takeitem BIG_PEARL
	giveapricorn TOUGH_LEAVES, 5 ; ez mode
	jumpopenedtext PearlForToughLeavesEndText ;;

.NoBigPearl
	jumpopenedtext NoPearlForToughLeavesText ;;

PearlForToughLeavesText:
	text "Hey, did you know"
	line "raking leaves is"
	cont "fun? Heh, leaves"
	cont "in Ilex Forest"
	cont "are some of the"
	cont "toughest in the"
	cont "whole world."

	para "Way better than"
	line "a grimy big pearl."
	done

PearlForToughLeavesQuestionText:
	text "Why, if I was you,"
	line "I'd trade a big"
	cont "pearl for a few of"
	para "these withered-, "
	line "I mean verdant, "
	cont "leaves."
	done

PearlForToughLeavesEndText:
	text "<PLAYER> got 5"
	line "TOUGH LEAVES."

	para "Come back any"
	line "time."
	done

NoPearlForToughLeavesText:
	text "Oh, I thought you"
	line "had a big pearl."
	
	para "You can fish one "
	line "up anywhere."
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
	cont "Farfetch'd."
	done

AzaleaPokeCenter1FPokefanScript: 
	checkevent EVENT_GOT_MINT_LEAF ;;TO ADD
	iftrue_jumptextfaceplayer GiveMintLeafText
	faceplayer
	opentext	
	writetext MintLeafGiftText
	promptbutton
	verbosegiveitem MINT_LEAF
	iffalse_endtext
	setevent EVENT_GOT_MINT_LEAF 
	jumpopenedtext GiveMintLeafText 

MintLeafGiftText: 
	text "Oh, a new trai-"
	line "ner! You know,"
	cont "when I was a"
	cont "trainer, I"
	cont "traveled light."
	
	para "Instead of"
	line "carrying tooth-"
	cont "paste, I chewed"
	cont "on these every"
	cont "night."
	done
	
GiveMintLeafText: ;;
	text "That mint leaf"
	line "will make your"
	cont "breath smell"
	cont "great."
	
	para "Share it with"
	line "someone who"
	cont "wants to freshen"
	cont "their breath."
	done

;;;;;;;;;;;;;;;;;

IlexExcelsiorV4Script:
	opentext
	writetext WeirdTextAzaleaCenter
	closetext
	unowntypeface
	showtext IlexExcelsiorV4Text
	restoretypeface
	special MapCallbackSprites_LoadUsedSpritesGFX
	end

WeirdTextAzaleaCenter:
	text "Hm? What's this"
	line "weird pamphlet?"
	done

IlexExcelsiorV4Text:
	text "Ilex Excelsior"
	
	para "When the tree"
	line "rings, will"
	cont "you answer"
	
	para "Fourth Edition"

	para "Silph has no"
	line "right to trees"
	
	para "sabotage their"
	line "equipment"
	
	done
	
;;;;;;;;;;;;;;;;;

IlexExcelsiorV3Script:
	opentext
	writetext WeirdTextGoldenrodCenter
	closetext
	unowntypeface
	showtext IlexExcelsiorV3Text
	restoretypeface
	special MapCallbackSprites_LoadUsedSpritesGFX
	end

WeirdTextGoldenrodCenter:
	text "Hm? What's this"
	line "weird pamphlet?"
	done

IlexExcelsiorV3Text:
	text "Ilex Excelsior"
	
	para "When the tree"
	line "rings, will"
	cont "you answer"
	
	para "Third Edition"

	para "Stop the high"
	line "frequency radio"
	cont "by going low"	
	done
	
;;;;;;;;;;;;;


IlexExcelsiorV2Script:
	opentext
	writetext WeirdTextOlivineCenter
	closetext
	unowntypeface
	showtext IlexExcelsiorV2Text
	restoretypeface
	special MapCallbackSprites_LoadUsedSpritesGFX
	end

WeirdTextOlivineCenter:
	text "Hm? What's this"
	line "weird pamphlet?"
	done

IlexExcelsiorV2Text:
	text "Ilex Excelsior"
	
	para "When the tree"
	line "rings, will"
	cont "you answer"
	
	para "Second Edition"

	para "The Desal Plant"
	line "poisons minds"
	
	para "remove parts"
	line "from basement"
	done

;;;;;;;;;;;;;;;;;;

IlexExcelsiorV1Script:
	opentext
	writetext WeirdTextEcruteakCenter
	closetext
	unowntypeface
	showtext IlexExcelsiorV1Text
	restoretypeface
	special MapCallbackSprites_LoadUsedSpritesGFX
	end

WeirdTextEcruteakCenter:
	text "Hm? What's this"
	line "weird pamphlet?"
	done

IlexExcelsiorV1Text:
	text "Ilex Excelsior"
	
	para "When the tree"
	line "rings, will"
	cont "you answer"
	
	para "First Edition"

	para "If we lose the"
	line "theatre we lose"
	cont "our history"
	done

;;;;;;;;;;;;;;;;;;

IlexExcelsiorV6Script:
	opentext
	writetext WeirdTextVioletCenter
	closetext
	unowntypeface
	showtext IlexExcelsiorV6Text
	restoretypeface
	special MapCallbackSprites_LoadUsedSpritesGFX
	end

WeirdTextVioletCenter:
	text "Hm? What's this"
	line "weird pamphlet?"
	done

IlexExcelsiorV6Text:
	text "Ilex Excelsior"
	
	para "When the tree"
	line "rings, will"
	cont "you answer"
	
	para "Sixth Edition"

	para "Falkner tower"
	line "clouds views"
	done
	

;;;;;;;;;;;;;;;;;;

IlexExcelsiorV7Script:
	opentext
	writetext WeirdTextMahoganyCenter
	closetext
	unowntypeface
	showtext IlexExcelsiorV7Text
	restoretypeface
	special MapCallbackSprites_LoadUsedSpritesGFX
	end

WeirdTextMahoganyCenter:
	text "Hm? What's this"
	line "weird pamphlet?"
	done

IlexExcelsiorV7Text:
	text "Ilex Excelsior"
	
	para "When the tree"
	line "rings, will"
	cont "you answer"
	
	para "Seventh Edition"

	para "starting over"
	line "when filled "
	cont "with rage"
	done

;;;;;;;;;;;;;;;;;
	
AzaleaPokeCenter1FGentlemanText2:
	text "What a strange"
	line "pamphlet, left"
	cont "here on the "

	para "table. Who can"
	line "even read this?"
	done
	