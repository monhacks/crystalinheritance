EcruteakGym_MapScriptHeader:
	def_scene_scripts


	def_callbacks

	def_warp_events
	warp_event  4, 17, ECRUTEAK_CITY, 10
	warp_event  5, 17, ECRUTEAK_CITY, 10
	warp_event  4, 14, ECRUTEAK_GYM, 4
	warp_event  2,  4, ECRUTEAK_GYM, 3
	warp_event  2,  5, ECRUTEAK_GYM, 3
	warp_event  2,  6, ECRUTEAK_GYM, 3
	warp_event  2,  7, ECRUTEAK_GYM, 3	
	warp_event  2,  8, ECRUTEAK_GYM, 3
	warp_event  2,  9, ECRUTEAK_GYM, 3
	warp_event  2,  10, ECRUTEAK_GYM, 3	
	warp_event  3,  10, ECRUTEAK_GYM, 3	
	warp_event  4,  10, ECRUTEAK_GYM, 3	
	warp_event  5,  10, ECRUTEAK_GYM, 3		
	warp_event  6,  10, ECRUTEAK_GYM, 3		
	warp_event  6,  11, ECRUTEAK_GYM, 3			
	warp_event  6,  9, ECRUTEAK_GYM, 3			
	warp_event  6,  8, ECRUTEAK_GYM, 3			

	warp_event  4,  4, ECRUTEAK_GYM, 3			
	warp_event  4,  5, ECRUTEAK_GYM, 3			
	warp_event  4,  6, ECRUTEAK_GYM, 3			
	warp_event  4,  7, ECRUTEAK_GYM, 3			
	warp_event  5,  4, ECRUTEAK_GYM, 3			
	warp_event  6,  4, ECRUTEAK_GYM, 3		
	warp_event  6,  5, ECRUTEAK_GYM, 3			
	warp_event  6,  6, ECRUTEAK_GYM, 3				
	warp_event  7,  6, ECRUTEAK_GYM, 3				

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, EcruteakGymStatue
	bg_event  6, 15, BGEVENT_READ, EcruteakGymStatue

	def_object_events
	object_event  5,  1, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakGymMortyScript, -1 ; inaccessible until you show morty something good  ; 
	object_event  5, 14, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, EcruteakGymPryceScript, EVENT_BURNED_TOWER_MORTY
	pokemon_event  6, 27, MAMOSWINE, -1, -1, PAL_NPC_BLUE, EcruteakMamoswineText, EVENT_BURNED_TOWER_MORTY
	strengthboulder_event 4, 12
	strengthboulder_event 4, 8

	object_const_def


EcruteakGymMortyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY_GYM
	iftrue .FightDone
	writetext MortyIntroText
	waitbutton
	closetext
	winlosstext MortyWinLossText, 0
	loadtrainer MORTY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	opentext
	writetext Text_ReceivedFogBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
.FightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue_jumpopenedtext MortyFightDoneText
	writetext MortyText_FogBadgeSpeech
	promptbutton
	verbosegivetmhm TM_SHADOW_BALL
	setevent EVENT_GOT_TM30_SHADOW_BALL
	jumpopenedtext MortyText_ShadowBallSpeech

EcruteakGymPryceScript:
	text "<PLAYER> - Morty"
	line "isn't here."
	
	para "He's in the Burned"
	line "Tower, chasing his"
	cont "trail hunting a"
	cont "legendary beast,"
	
	para "hoping it will"
	line "draw guests."

	para "I think he is"
	line "misguided, but"
	cont "he won't hear it."
	done
	
MortyIntroText:
	text "<PLAYER>. Thank"
	line "you for showing"
	cont "me the need to"
	cont "reflect, without"
	cont "distraction."
	
	para "I was caught up"
	line "making spectacles,"
	cont "I forgot that real"
	cont "reflection comes"
	cont "from deep, auth-"
	cont "entic connections."
	
	para "Battle me, and"
	line "show me your"
	cont "bonds!"
	done



MortyWinLossText:
	text "I see. Your"
	line "connection is"
	cont "even stronger"
	cont "than I thought."
	done

Text_ReceivedFogBadge:
	text "Take this Fog"
	line "Badge."
	done
	
MortyText_FogBadgeSpeech:
	text "It shows that"
	line "you can find a"
	cont "way on unfamil-"
	cont "iar paths."
	done

MortyFightDoneText:
	text "My gym will re-"
	line "turn to a place"
	cont "where trainers "
	cont "can look inward."
	
	para "What would you"
	line "find, if you"
	
	para "looked beyond" ; past your doubts?
	line "your fears?"
	done

MortyText_ShadowBallSpeech:
	text "That's Shadow"
	line "Ball. It's a "
	cont "demonstration of"
	cont "the power of the"
	cont "unseen forces in"
	cont "our lives."
	
	para "What would you"
	line "find, if you"
	
	para "looked beyond"
	line "your fears?"
	done

EcruteakMamoswineText:
	text "Mamooo!"
	done
