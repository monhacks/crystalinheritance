GoldenrodPokecomCenter1F_MapScriptHeader:
	def_scene_scripts


	def_callbacks

	def_warp_events
	warp_event  6, 15, GOLDENROD_CITY, 15
	warp_event  7, 15, GOLDENROD_CITY, 15


	def_coord_events

	def_bg_events
	bg_event 11,  7, BGEVENT_READ, PokemonJournalWhitneyScript
	bg_event 24,  5, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  6, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  7, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  8, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24,  9, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 24, 10, BGEVENT_RIGHT, JudgeMachineScript
	bg_event 25, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 26, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 27, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 28, 11, BGEVENT_UP, JudgeMachineScript
	bg_event 29,  5, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  6, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  7, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  8, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29,  9, BGEVENT_LEFT, JudgeMachineScript
	bg_event 29, 10, BGEVENT_LEFT, JudgeMachineScript
	bg_event 24,  3, BGEVENT_ITEM + RARE_CANDY, EVENT_GOLDENROD_POKECOM_CENTER_1F_HIDDEN_RARE_CANDY

	def_object_events
	object_event  5, 12, SPRITE_KURT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokecomKurtScript, EVENT_GOT_BASEMENT_KEY
	object_event  7,  7, SPRITE_BOWING_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event  1,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MapNameNPC1Script, -1
	object_event  9, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MapNameNPC2Script, -1
	object_event  3, 12, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MapNameNPC3Script, -1
	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WonderTradeReceptionistScript, -1

	object_const_def
	const POKECOM_KURT



PokecomKurtScript:
	faceplayer
	opentext
	writetext KurtHasSomeFansText
	waitbutton
	closetext
	checkevent EVENT_GOT_BASEMENT_KEY
	iftrue .end
	givekeyitem BASEMENT_KEY
	setevent EVENT_GOT_BASEMENT_KEY
.end
	end

GoldenrodPokecenter1FNurseScript:
	setevent EVENT_WELCOMING_TO_POKECOM_CENTER
	jumpstd pokecenternurse


InfoSignScript:
	jumpthistext

	text "#Com Center"
	line "1F Information"

	para "Left:"
	line "Administration"

	para "Center:"
	line "Wonder Trade Hub"

	para "Right:"
	line "<PK><MN> Judge Machine"
	done

PokemonJournalWhitneyScript:
	setflag ENGINE_READ_WHITNEY_JOURNAL
	jumpthistext

	text "#mon Journal"

	para "Special Feature:"
	line "Leader Whitney!"

	para "Whitney is said to"
	line "admire Bruno of"
	cont "the Elite Four."
	done

JudgeMachineScript:
	opentext
	special JudgeMachine
	waitendtext


MapNameNPC1Script:
	jumptextfaceplayer MapNameNPC1Text

MapNameNPC2Script:
	jumptextfaceplayer MapNameNPC2Text

MapNameNPC3Script:
	jumptextfaceplayer MapNameNPC3Text

MapNameNPC1Text:
	text "New technology"
	line "is so amazing."
	para "But I wish I"
	line "didn't have to"
	cont "take out a loan"
	cont "to get a new"
	cont "#dex every"
	cont "other year…"
	done

MapNameNPC2Text:
	text "With my new Bike"
	line "I can deliver"
	cont "groceries so"
	cont "much faster!"
	done

MapNameNPC3Text:
	text "The Radio Tower"
	line "has had to"
	cont "increase"
	cont "security even"
	cont "more. It's just"
	cont "a magnet for"
	cont "crime."
	done


WonderTradeReceptionistScript:
	opentext
	writetext WonderTradeIntroText
	waitbutton
	checkevent EVENT_INTRODUCED_TEALA
	iftrue .introduced
	writetext IntroduceTealaText
	waitbutton
	setevent EVENT_INTRODUCED_TEALA
.introduced
	writetext WonderTradeExplanationText
	promptbutton
	special WonderTrade
	iffalse .done
	playmusic MUSIC_POKECOM_CENTER
	writetext WonderTradeCompleteText
	playsound SFX_DEX_FANFARE_80_109
	waitsfx
	ifnotequal 2, .done
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	playmusic MUSIC_SPIKY_EARED_PICHU_HGSS
	writetext WonderTradeForGSBallPichuText
	promptbutton
	verbosegivekeyitem GS_BALL
	writetext WonderTradeForGSBallPichuText2
	waitbutton
.done
	jumpopenedtext WonderTradeGoodbyeText

WonderTradeIntroText:
	text "Hello! Welcome to"
	line "#Com Center"
	cont "Wonder Trade Hub."
	done

IntroduceTealaText:
	text "I'm Teala, your"
	line "trade attendant."
	done

WonderTradeExplanationText:
	text "You can trade"
	line "#mon with other"
	cont "people far away."
	done

WonderTradeCompleteText:
	text "It's your new"
	line "partner."

	para "Please take care"
	line "of it with love."
	done

WonderTradeGoodbyeText:
	text "We hope to see you"
	line "again."
	done

WonderTradeForGSBallPichuText:
	text "…But what's this?"
	line "Is something wrong"

	para "with the Wonder"
	line "Trade machine?"

	para "It seems like you"
	line "just traded a"

	para "#mon with"
	line "yourself."

	para "But that can't be"
	line "right… You can't"

	para "be in two places"
	line "at once."

	para "Besides, the ma-"
	line "chine communicates"

	para "through space,"
	line "not time…"

	para "And what is that"
	line "strange Ball it's"

	para "holding? Is it an"
	line "Apricorn Ball?"

	para "Here, take a look…"
	done

WonderTradeForGSBallPichuText2:
	text "It may be unusual,"
	line "but a #mon"
	cont "is a #mon."

	para "Please look after"
	line "it carefully."
	done

KurtHasSomeFansText:
    text "<PLAYER> - "
	line "our fans in the"
	cont "city have found"
	cont "me. They say"
	cont "that there is"
	cont "a secret path"
	cont "on the magnet"
	cont "tracks we can"
	cont "use to get"
	cont "closer to Ec-"
	cont "ruteak."
	
	para "They heard about"
	line "our driving out"
	cont "the loggers in"
	cont "Ilex, and they"
	cont "think we have"
	cont "similar goals."
	
	para "In this city,"
	line "many view Silph's"
	cont "broadcast of"
	cont "Whitney's show, "
	cont "ReArming Voice."
	
	para "She cultivates"
	line "a parasocial re-"
	cont "lationship with"
	cont "her broadcast."
	
	para "She convinces "
	line "them that their"
	cont "families and ne-"
	cont "ighbors aren't"
	cont "like them."

	para "So, our 'fans'"
	line "would like our"
	cont "help stopping"
	cont "her broadcast."

	para "They've requested"
	line "our help in the"
	cont "Goldenrod Under-"
	cont "ground, where "
	cont "there's an old"
	cont "access tunnel"
	cont "underneath the"
	cont "Radio Tower."
	
    para "Meet me there."
    done
