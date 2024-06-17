AnarresCharcoalKiln_MapScriptHeader:
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event  3,  7, ANARRES_TOWN, 4
	warp_event  4,  7, ANARRES_TOWN, 4

	def_coord_events


	def_bg_events
;	bg_event 22, 12, BGEVENT_JUMPTEXT, TinTowerSignText

	def_object_events
	object_event 7, 4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, jumptextfaceplayer, AnarresKilnCharcoalScript, -1 ; gives the charcoal
	object_event 2, 5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, AnarresKilnNPC2Text, -1 ;
	object_event 5, 5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, AnarresKilnNPC3Text, -1 ;

	object_const_def
	const ANARRES_KILN_BLACKBELT


AnarresKilnCharcoalScript:
	checkevent EVENT_GOT_CHARCOAL
	iftrue_jumptextfaceplayer AnarresKiln_GotCharcoal
	faceplayer
	opentext
	writetext AnarresKiln_GiveCharcoal
	promptbutton
	verbosegiveitem CHARCOAL
	setevent EVENT_GOT_CHARCOAL
	jumpthisopenedtext

AnarresKiln_GotCharcoal:
	text "It's Charcoal."
	line "Smells good, no?"
	
	para "Maybe one day,"
	line "someone will"
	cont "invent something"
	cont "a way to store"
	cont "aromas without"
	cont "all this ash."
	done


AnarresKiln_GiveCharcoal:
	text "The trees smell"
	line "so wonderful."
	
	para "We process the"
	line "bark in this"
	cont "oven to make"
	cont "charcoal."
	
	para "Here, take some"
	line "to remember this"
	cont "place by. Don't"
	cont "mind the soot."
	done

AnarresKilnNPC2Text:
	text "The elder is in"
	line "charge of the"
	cont "work schedule."
	
	para "But he always"
	line "gives himself"
	cont "the easiest jobs."
	done

AnarresKilnNPC3Text:
	text "The elder is the"
	line "only one who can"
	cont "use Cut."
	
	para "How will we save"
	line "the forest if"
	cont "we can't remove"
	cont "the sick trees?"
	done
