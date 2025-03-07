Route42_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  0,  8, ROUTE_42_ECRUTEAK_GATE, 3
	warp_event  0,  9, ROUTE_42_ECRUTEAK_GATE, 4
; entei's cavern 
	warp_event 46,  7, MOUNT_MORTAR_1F_OUTSIDE, 3

	def_coord_events


	def_bg_events
	bg_event  4, 10, BGEVENT_JUMPTEXT, Route42Sign1Text
	bg_event  7,  5, BGEVENT_JUMPTEXT, MtMortarSign1Text
	bg_event 45,  9, BGEVENT_JUMPTEXT, MtMortarSign2Text
	bg_event 54,  8, BGEVENT_JUMPTEXT, Route42Sign2Text
	bg_event 16, 11, BGEVENT_ITEM + MAX_POTION, EVENT_ROUTE_42_HIDDEN_MAX_POTION
;entei's cavern if you have the pumice harp 

	def_object_events
	object_event  0,  0, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerFisherArnold, -1; husbands that fish together 
	object_event  0,  0, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerFisherKyle, -1	;

	object_event  0,  0, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperDean, -1	;
	object_event  0,  0, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerCamperSid, -1	;
	
	object_event  0,  0, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerAromaLadyHeather, -1	; wives that fish together 
	object_event  0,  0, SPRITE_AROMA_LADY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerAromaLadyHolly, -1;
	
	object_event  2,  8, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route42OfficerText, EVENT_BEAT_CHUCK
	object_event  2,  9, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route42OfficerText, EVENT_BEAT_CHUCK
	itemball_event  6,  4, ULTRA_BALL, 1, EVENT_ROUTE_42_ULTRA_BALL
	itemball_event 33,  8, SUPER_POTION, 1, EVENT_ROUTE_42_SUPER_POTION
	tmhmball_event 10, 2, TM_SCALD, EVENT_GOT_TM_SCALD 


	object_const_def


GenericTrainerPokemaniacShane:
	generictrainer POKEMANIAC, SHANE, EVENT_BEAT_POKEMANIAC_SHANE, PokemaniacShaneSeenText, PokemaniacShaneBeatenText

	text "You're working on"
	line "a #dex?"

	para "Wow, you must know"
	line "some pretty rare"
	cont "#mon!"

	para "May I please see"
	line "it. Please?"
	done

PokemaniacShaneSeenText:
	text "HEY!"

	para "This is my secret"
	line "place! Get lost,"
	cont "you outsider!"
	done

PokemaniacShaneBeatenText:
	text "I should have used"
	line "my Moon Stone…"
	done

Route42OfficerText:
	text "Sorry, you can't"
	line "come this way."

	para "There's been an"
	line "avalanche on"
	cont "Mt.Mortar."

	para "We're still clear-"
	line "ing the rubble."
	done

Route42Sign1Text:
	text "Route 42"

	para "Ecruteak City -"
	line "Mahogany Town"
	done

MtMortarSign1Text:
	text "Mt.Mortar"

	para "Waterfall Cave"
	line "Inside"
	done

MtMortarSign2Text:
	text "Mt.Mortar"

	para "Waterfall Cave"
	line "Inside"
	done

Route42Sign2Text:
	text "Route 42"

	para "Ecruteak City -"
	line "Mahogany Town"
	done
