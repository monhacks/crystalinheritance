LakeOfRage_MapScriptHeader:
	def_scene_scripts


	def_callbacks
	callback MAPCALLBACK_NEWMAP, LakeOfRageFlyPoint


	def_warp_events
	warp_event  7,  3, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, 1 ; pryce's cabin 
	warp_event 27, 31, LAKE_OF_RAGE_MAGIKARP_HOUSE, 1

	def_coord_events
	coord_event 0, 0, 0, LakeShrineEvent

	def_bg_events
	bg_event 21, 27, BGEVENT_JUMPTEXT, LakeOfRageSignText
	bg_event  4,  4, BGEVENT_ITEM + RARE_CANDY, EVENT_LAKE_OF_RAGE_HIDDEN_RARE_CANDY
	bg_event 35,  5, BGEVENT_ITEM + MAX_POTION, EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION
	bg_event 11, 28, BGEVENT_ITEM + FULL_RESTORE, EVENT_LAKE_OF_RAGE_HIDDEN_FULL_RESTORE


	def_object_events
	; SIGHTSEERm blaise, gareth, sightseerf kamila, noelle, POKEMANIACS CALVIN AND SHANE 
	object_event 0, 0, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT,0, LakePryceScript, EVENT_LAKE_PRYCE ; INITIALIZE todo 
	object_event 0, 0, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAKE_KURT ; INITIALIZE 
	object_event 0, 0, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAKE_RIVAL ; INITIALIZE 
;trainers
	object_event  4,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, -1
	pokemon_event 0,  0, MEOWTH, -1, -1, PAL_NPC_BROWN, WesleyMeowthText, -1
	object_event  0,  0, SPRITE_SIGHTSEERM, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSightseerMBlaise, -1
	object_event  0,  0, SPRITE_SIGHTSEERM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerSightseerMGareth, -1
	object_event  0,  0, SPRITE_SIGHTSEERF, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSightseerFKamila, -1
	object_event  0,  0, SPRITE_SIGHTSEERF, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSightseerFNoelle, -1
	object_event 0, 0,  SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokemaniacCalvin, -1
	object_event 0, 0,  SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokemaniacShane, -1
;itemballs
	itemball_event 13,  2, ELIXIR, 1, EVENT_LAKE_OF_RAGE_ELIXIR
	itemball_event  7, 10, MAX_REVIVE, 1, EVENT_LAKE_OF_RAGE_MAX_REVIVE
	tmhmball_event 31, 3, TM_WILD_CHARGE, EVENT_GOT_TM_WILD_CHARGE 

	object_const_def
	const LAKEOFRAGE_PRYCE
	const LAKEOFRAGE_KURT
	const LAKEOFRAGE_RIVAL 

LakeOfRageFlyPoint:
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	endcallback


LakeOfRageSignText:
	text "Sil__ _pring_"
	
	para "Form___y kn__n"
	line "L___ __ _a_e"
	
	para "The paint on the"
	line "sign is faded."
	done

LakePryceScript:
	showtext LakeShrineQuestion
	yesorno
	iffalse_jumptext LakeNoText
	showtext LakePrayerText
	waitbutton
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp TRANQUIL_TARN, 0, 0 ; TODO GET THIS COORDINATE 
	end

LakeShrineQuestion:
	text "Pryce: <PLAYER>,"
	line "would you like to"
	cont "pray to Celebi"
	cont "with me?"
	done

LakeNoText:
	text "Some other time."
	done

LakePrayerText:
	text "Take us back to"
	line "days of old,"
	
	para "When balance"
	line "stood intact,"
	
	para "Let truth now"
	line "be retold,"
	
	para "The past we"
	line "must enact."
	done

WesleyScript:
	checkevent EVENT_GOT_BLACK_BELT_FROM_WESLEY
	iftrue_jumptextfaceplayer WesleyDynamicPunchText
	faceplayer
	opentext
	iftrue .MetWesley
	writetext MeetWesleyText
	promptbutton
	writetext WesleyGivesGiftText
	promptbutton
	verbosegivetmhm TM_DYNAMICPUNCH ; 
	iffalse_endtext
	setevent EVENT_GOT_BLACK_BELT_FROM_WESLEY
	jumpopenedtext WesleyDynamicPunchText


MeetWesleyText:
	text "I am Wesley"
	line "Wednesday."

	para "Wednesday is the"
	line "exact middle of"
	cont "the week."
	
	para "A day for the"
	line "uncertainties of"
	cont "the universe to"
	
	para "collapse into one"
	line "of two states."
	done

WesleyGivesGiftText:
	text "That's why I love"
	line "this technique."
	
	para "Dynamicpunch: it"
	line "will hit or miss,"
	
	para "But you won't"
	line "know which until"
	cont "you use it!"
	
	para "Exactly like the"
	line "famous experiment"
	cont "with the Meowth-"
	
	para "Oh, nevermind."
	done

WesleyDynamicPunchText:
	text "That move has a"
	line "lot of momentum"
	
	para "but the position"
	line "is unknown."	
	done

WesleyMeowthText:
	text "Meeeowww!"
	line "It's purring!"
	done

GenericTrainerSightseerFKamila:
	generictrainer SIGHTSEER_F, KAMILA, EVENT_BEAT_SIGHTSEERF_KAMILA, .SeenText1, .BeatenText1

.BeatenText1:
	text "..."
	done

.SeenText1:
	text "..."
	done

GenericTrainerSightseerFNoelle:
	generictrainer SIGHTSEER_F, NOELLE, EVENT_BEAT_SIGHTSEERF_NOELLE, .SeenText2, .BeatenText2

.BeatenText2:
	text "..."
	done

.SeenText2:
	text "..."
	done
	
GenericTrainerSightseerMBlaise:
	generictrainer SIGHTSEER_F, BLAISE, EVENT_BEAT_SIGHTSEERM_BLAISE, .SeenText3, .BeatenText3

.BeatenText3:
	text "..."
	done

.SeenText3:
	text "..."
	done

GenericTrainerSightseerMGareth:
	generictrainer SIGHTSEER_F, GARETH, EVENT_BEAT_SIGHTSEERM_GARETH, .SeenText4, .BeatenText4

.BeatenText4:
	text "..."
	done

.SeenText4:
	text "..."
	done

GenericTrainerPokemaniacCalvin:
	generictrainer POKEMANIAC, CALVIN, EVENT_BEAT_POKEMANIAC_CALVIN, .SeenText5, .BeatenText5

.BeatenText5:
	text "..."
	done

.SeenText5:
	text "..."
	done


GenericTrainerPokemaniacShane:
	generictrainer POKEMANIAC, SHANE, EVENT_BEAT_POKEMANIAC_SHANE, .SeenText6, .BeatenText6

.BeatenText6:
	text "..."
	done

.SeenText6:
	text "..."
	done
