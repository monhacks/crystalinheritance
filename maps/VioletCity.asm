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

	def_object_events
	object_event 28, 32, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityLassText, -1 ; 
	object_event 26, 18, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_WANDER, 2, 1, -1, 0, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityCooltrainerM1Text, -1 ;
	object_event 26, 18, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_WANDER, 2, 1, -1, 0, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityCooltrainerFText, -1 ;
	object_event 17, 24, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityGrampsText, -1 ;
	object_event  5, 22, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityCooltrainerM2Text, -1 ;
	object_event 26, 13, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityFisherText, -1 ;
	object_event  7, 16, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityImmigrationText, -1; 
	object_event 34, 31, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityImmigrationText, -1; 
	object_event 34, 31, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityTowerBlockingText, EVENT_BEAT_FALKNER; 
	object_event 34, 31, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, VioletCityTowerBlockingText, EVENT_BEAT_FALKNER; 	
	cuttree_event 36, 23, EVENT_VIOLET_CITY_CUT_TREE
	fruittree_event 14, 33, FRUITTREE_VIOLET_CITY, PNK_APRICORN, PAL_NPC_RED ; 
	itemball_event 10,  6, PP_MAX, 1, EVENT_VIOLET_CITY_PP_UP
	itemball_event 35, 12, RARE_CANDY, 1, EVENT_VIOLET_CITY_RARE_CANDY

	object_const_def


VioletCityFlyPoint:
	setflag ENGINE_FLYPOINT_VIOLET
	endcallback

VioletCityLassText:
	text "The drought's so"
	line "bad, Bellsprout"
	cont "roots couldn't"
	cont "hold the tower!"
	para "Thank goodness"
	line "Falkner renovated"
	cont "it in time."
	done

VioletCityCooltrainerM1Text:
	text "People think"
	line "Falkner's self-"
	cont "made, but he"
	para "started with his"
	line "dad's #mon."
	done

VioletCityCooltrainerFText:
	text "They want Bronz-"
	line "ong atop the tower"
	cont "for rain dance."
	para "But it's not"
	line "working. Seems"
	cont "they're just"
	cont "hurting it..."
	done

VioletCityGrampsText:
	text "Falkner pushed"
	line "out the sages to"
	cont "build his weather"
	cont "tower."
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
	cont "drought forever."
	para "He raised alarm"
	line "long before it"
	cont "was mainstream."
	done

VioletCitySignText:
	text "Violet City"

	para "The City of"
	line "Nostalgic Scents"
	done

VioletGymSignText:
	text "Violet City"
	line "#mon Gym"
	cont "Leader: Falkner"

	para "The Elegant Master"
	line "of Flying #mon"
	done

SproutTowerSignText:
	text "Violet Weather"
	line "Institute"

	done

EarlsPokemonAcademySignText:
	text "#mon Academy:"
	
	para "Management by"
	line "Elder Li"

	done


VioletCityImmigrationText:
	text "We limit entrance"
	line "to Violet City "
	cont "due to the low"
	cont "water levels."
	done

VioletCityTowerBlockingText:
	text "Sprout Tower is"
	line "only accessible"
	cont "with Elder Li's"
	cont "blessing."
	done
