LakeOfRage_MapScriptHeader:
	def_scene_scripts



;	para "Take us back to"
;	line "days of old,"
;	
;	para "When balance"
;	line "stood intact,"
;	
;	para "Let truth now"
;	line "be retold,"
;	
;	para "The past we"
;	line "must enact."

	def_callbacks
	callback MAPCALLBACK_NEWMAP, LakeOfRageFlyPoint


	def_warp_events
	warp_event  7,  3, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, 1 ; pryce's cabin 
	warp_event 27, 31, LAKE_OF_RAGE_MAGIKARP_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 21, 27, BGEVENT_JUMPTEXT, LakeOfRageSignText
	bg_event  4,  4, BGEVENT_ITEM + RARE_CANDY, EVENT_LAKE_OF_RAGE_HIDDEN_RARE_CANDY
	bg_event 35,  5, BGEVENT_ITEM + MAX_POTION, EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION
	bg_event 11, 28, BGEVENT_ITEM + FULL_RESTORE, EVENT_LAKE_OF_RAGE_HIDDEN_FULL_RESTORE

	def_object_events
	; SIGHTSEERm blaise, gareth, sightseerf kamila, noelle, POKEMANIACS CALVIN AND SHANE 
	object_event  4,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, -1
;trainers
	object_event  4, 15, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCooltrainermAaron, -1
	object_event 36,  7, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, GenericTrainerCooltrainerfLois, -1
	object_event 30, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherAndre, -1
	object_event 24, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherRaymond, -1
;itemballs 
	itemball_event 13,  2, ELIXIR, 1, EVENT_LAKE_OF_RAGE_ELIXIR
	itemball_event  7, 10, MAX_REVIVE, 1, EVENT_LAKE_OF_RAGE_MAX_REVIVE
	tmhmball_event 31, 3, TM_WILD_CHARGE, EVENT_GOT_TM_WILD_CHARGE 

	object_const_def
	const LAKEOFRAGE_WESLEY

LakeOfRageFlyPoint:
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	endcallback

LakeOfRageSignText:
	text "_ake _f R__e"
	
	para "..."
	
	para "The paint on the"
	line "sign is faded."
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
	cont "devastating for"
	cont "either party,"
	
	para "But you won't"
	line "know which until"
	cont "you use it!"
	
	para "Exactly like the"
	line "famous experiment"
	para "with the Meowth"
	line "in the box with"
	cont "the radioact-"
	
	para "Oh, nevermind."
	done

WesleyDynamicPunchText:
	text "That move has a"
	line "lot of momentum"
	
	para "but the position"
	line "is unknown."	
	done

GenericTrainerCooltrainermAaron:
	generictrainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, .SeenText, .BeatenText

	text "#mon and their"
	line "trainer become"

	para "powerful through"
	line "constant battling."
	done

.SeenText:
	text "If a trainer spots"
	line "another trainer,"

	para "he has to make a"
	line "challenge."

	para "That is our"
	line "destiny."
	done

.BeatenText:
	text "Whew…"
	line "Good battle."
	done

GenericTrainerCooltrainerfLois:
	generictrainer COOLTRAINERF, LOIS, EVENT_BEAT_COOLTRAINERF_LOIS, .SeenText, .BeatenText

	text "Come to think of"
	line "it, I've seen a"
	cont "pink Butterfree."
	done

.SeenText:
	text "What happened to"
	line "the red Gyarados?"

	para "It's gone?"

	para "Oh, darn. I came"
	line "here for nothing?"

	para "I know--let's"
	line "battle!"
	done

.BeatenText:
	text "Good going!"
	done

GenericTrainerFisherAndre:
	generictrainer FISHER, ANDRE, EVENT_BEAT_FISHER_ANDRE, FisherAndreSeenText, FisherAndreBeatenText

	text "I won't lose as an"
	line "angler! I catch"
	cont "#mon all day."
	done

FisherAndreSeenText:
	text "Let me battle with"
	line "the #mon I just"
	cont "caught!"
	done

FisherAndreBeatenText:
	text "I might be an ex-"
	line "pert angler, but"

	para "I stink as a #-"
	line "mon trainer…"
	done

GenericTrainerFisherRaymond:
	generictrainer FISHER, RAYMOND, EVENT_BEAT_FISHER_RAYMOND, FisherRaymondSeenText, FisherRaymondBeatenText

	text "Why can't I catch"
	line "any good #mon?"
	done

FisherRaymondSeenText:
	text "No matter what I"
	line "do, all I catch"

	para "are the same #-"
	line "mon…"
	done

FisherRaymondBeatenText:
	text "My line's all"
	line "tangled up…"
	done

LakeOfRageGrampsScript:
	jumpthistextfaceplayer

	text "The Gyarados are"
	line "angry!"

	para "It's a bad omen!"
	done

.Text2:
	text "Hahah! The Magi-"
	line "karp are biting!"
	done

LakeOfRageSuperNerdText:
	text "I heard this lake"
	line "was made by ram-"
	cont "paging Gyarados."

	para "I wonder if there"
	line "is any connection"

	para "to their mass out-"
	line "break now?"
	done

LakeOfRageCooltrainerFText:
	text "Did my eyes de-"
	line "ceive me? I saw a"

	para "red Gyarados in"
	line "the lake…"

	para "But I thought"
	line "Gyarados were"
	cont "usually blue?"
	done



	