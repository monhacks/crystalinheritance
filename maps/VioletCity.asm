VioletCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, VioletCityFlyPoint

	def_warp_events
	warp_event  9, 21, VIOLET_MART, 2
	warp_event 18, 21, VIOLET_GYM, 1
	warp_event 30, 21, EARLS_POKEMON_ACADEMY, 1
	warp_event  3, 19, VIOLET_NICKNAME_SPEECH_HOUSE, 1
	warp_event 31, 29, VIOLET_POKECENTER_1F, 1
	warp_event 21, 33, VIOLET_ONIX_TRADE_HOUSE, 1
	warp_event 23,  5, SPROUT_TOWER_1F, 1
	warp_event 29, 17, EARLS_POKEMON_ACADEMY, 3
	warp_event 30, 17, EARLS_POKEMON_ACADEMY, 4
	warp_event 39, 28, ROUTE_36_VIOLET_GATE, 1 ; NOT ACCESSIBLE
	warp_event 39, 29, ROUTE_36_VIOLET_GATE, 2 ; NOT ACCESSIBLE
	warp_event  2, 12, ROUTE_36_VIOLET_GATE, 3 ; NOT ACCESSIBLE 
	warp_event  2, 13, ROUTE_36_VIOLET_GATE, 4 ; NOT ACCESSIBLE

	def_coord_events

	def_bg_events
	bg_event 24, 24, BGEVENT_JUMPTEXT, VioletCitySignText
	bg_event 15, 21, BGEVENT_JUMPTEXT, VioletGymSignText
	bg_event 25,  7, BGEVENT_JUMPTEXT, SproutTowerSignText
	bg_event 27, 21, BGEVENT_JUMPTEXT, EarlsPokemonAcademySignText
	bg_event 37, 18, BGEVENT_ITEM + NUGGET, EVENT_VIOLET_CITY_HIDDEN_HYPER_POTION
	bg_event 21, 13, BGEVENT_ITEM + NUGGET, EVENT_VIOLET_CITY_HIDDEN_POKE_BALL
	bg_event  1,  0, BGEVENT_JUMPTEXT, VioletTombstoneText
	bg_event  5,  0, BGEVENT_JUMPTEXT, VioletTombstoneText
;	bg_event  3,  0, BGEVENT_READ, NoctowlTombstone


	def_object_events
	object_event 28, 32, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, 					OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityLassText, -1 
	object_event 26, 18, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_WANDER, 2, 1, -1, 0, 0, 							OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityCooltrainerM1Text, -1 
	object_event 26, 18, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_WANDER, 2, 1, -1, 0, 0, 							OBJECTTYPE_SCRIPT, 0, VioletCityCooltrainerFScript, -1
	object_event 17, 24, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, 						OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityGrampsText, -1 ;
	object_event  5, 22, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, PAL_NPC_GREEN, 	OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityCooltrainerM2Text, -1 ;
	object_event 26, 20, SPRITE_FAT_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, 				OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityFisherText, -1 ;
	; road blocks 
	object_event  6, 16, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityImmigrationText, -1; ROUTE 36 
	object_event  7, 16, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityImmigrationText, -1; ROUTE 36
	object_event 34, 30, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityImmigrationText, -1; ; ROUTE 31 
	object_event 34, 31, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityImmigrationText, -1; ; ROUTE 31
 	object_event 12, 31, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityImmigrationText, -1; 	ROUTE 32 
	object_event 13, 31, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityImmigrationText, -1; 	ROUTE 32 
	object_event 23, 10, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityTowerBlockingText, EVENT_BEAT_FALKNER; 
	object_event 24, 10, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityTowerBlockingText, EVENT_BEAT_FALKNER; 	
	; others 
	cuttree_event  8, 33, EVENT_VIOLET_CITY_CUT_TREE
	smashrock_event 16, 34	
	smashrock_event 16, 35	
	fruittree_event 14, 33, FRUITTREE_VIOLET_CITY, PNK_APRICORN, PAL_NPC_RED ; 
	itemball_event 10,  6, PP_MAX, 1, EVENT_VIOLET_CITY_PP_UP
	itemball_event 35, 12, RARE_CANDY, 1, EVENT_VIOLET_CITY_RARE_CANDY



VioletCityFlyPoint:
	setflag ENGINE_FLYPOINT_VIOLET
	endcallback

VioletCityLassText:
	text "The drought's so"
	line "bad, Bellsprout"
	para "roots couldn't"
	line "hold the tower!"
	para "Thank goodness"
	line "it was renovated."
	done

VioletCityCooltrainerM1Text:
	text "People think"
	line "Falkner's self-"
	para "made, but he"
	line "started with his"
	cont "dad's #mon."
	done

VioletCityCooltrainerFScript:
	checkevent EVENT_BEAT_FALKNER
	iftrue_jumptextfaceplayer .Text1
	jumpthistextfaceplayer

	text "They want Bronz-"
	line "ong atop the tower"
	cont "for a rain dance."
	done

.Text1: 
	text "I'm kinda sad that"
	line "there won't be a"
	para "Bronzong. I've"
	line "always admired"
	cont "campaniles."
	done 


VioletCityGrampsText:
	text "Falkner pushed"
	line "out the sages to"
	para "build his weather"
	line "tower."
	done

VioletCityFisherText:
	text "Elders lost their"
	line "tower, but keep"
	cont "their duty."
	para "They hold tight"
	line "to tradition,"
	cont "tower or not."
	done

VioletCityCooltrainerM2Text:
	text "Falkner's been"
	line "trying to fix the"
	para "drought forever."
	line "He raised alarm"
	para "long before it"
	para "was mainstream."
	done

VioletCitySignText:
	text "Violet City"
	line "Conserve Water!"
	done

VioletGymSignText:
	text "Violet City"
	line "#mon Gym"

	para "Closed until"
	line "further notice"
	done

SproutTowerSignText:
	text "Violet Weather"
	line "Institute"
	done

EarlsPokemonAcademySignText:
	text "#mon Academy"
	
	para "Management by"
	line "Elder Li"
	done


VioletCityImmigrationText:
	text "We limit entrance"
	line "to Violet City "
	para "due to the low"
	line "water levels."
	
	para "Only trainers who"
	line "can contribute"
	para "with HM mastery"
	line "are allowed."
	done

VioletCityTowerBlockingText:
	text "Sprout Tower is"
	line "only accessible"
	para "with Elder Li's"
	line "blessing."
	done

VioletTombstoneText:
	text "The tombstone is"
	line "covered in moss."
	done

;NoctowlTombstone:
;	checkevent EVENT_HEARD_ABOUT_HEIRLOOM
;	iffalse_jumpopenedtext VioletTombstoneText
;	opentext
;	writetext AskToVentureText
;	yesorno
;	iffalse_jumpopenedtext NoVentureText
;	writetext VenturingText
;	waitbutton
;	closetext
;	playsound SFX_WARP_TO
;	special FadeOutPalettes
;	waitsfx
;	warp VIOLET_CATACOMBS,  0,  0
;	end
	