AnarresStockroom_MapScriptHeader:
	def_scene_scripts


	def_callbacks


	def_warp_events 
	warp_event  3,  7, ANARRES_TOWN, 7
	warp_event  4,  7, ANARRES_TOWN, 7

	def_coord_events


	def_bg_events 
;	bg_event 8,  2, BGEVENT_READ, ASApricornBenchScript

	def_object_events 
	mart_clerk_event  2,  3, MARTTYPE_STANDARD, MART_ANARRES
	object_event 2, 5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, jumptextfaceplayer, AnarresStockroomNPC1Script, -1 ;
	object_event 5, 2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, AnarresStockroomNPC2Text, -1 ;
	object_event 7, 2, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, AnarresStockroomNPC3Text, -1 ;


	object_const_def
	const ANARRES_STOCKROOM_BERRY_GRAMPS


AnarresStockroomNPC1Script:
	checkevent EVENT_GOT_ANARRES_BERRY ;;TO ADD
	iftrue_jumptextfaceplayer GiveAnarresBerryText
	faceplayer
	opentext	
	writetext AnarresBerryGiftText
	promptbutton
	verbosegiveitem SITRUS_BERRY
	iffalse_endtext
	setevent EVENT_GOT_ANARRES_BERRY 
	jumpopenedtext GiveAnarresBerryText 

AnarresBerryGiftText: 
	text "Our ceremonies"
	line "remind us that"
	cont "it's natural to"
	cont "change. A season"
	cont "for Sitrus Berry"
	cont "Jam, a season to"
	cont "gather honey."
	cont "Hey, I'm hungry!"
	cont "Share a berry?"
	done
	
GiveAnarresBerryText: ;;
	text "Different"
	line "berries are good"
	cont "for different"
	cont "environments!"
	done

AnarresStockroomNPC2Text:
	text "We nearly hunted"
	line "Farfetch'd to"
	cont "extinction in"
	cont "Johto, but there"
	cont "are still some"
	cont "left."
	done

AnarresStockroomNPC3Text:
	text "Why does the"
	line "Elder use bug"
	cont "#mon? To"
	cont "remind us that"
	cont "nature isn't"
	cont "just cute"
	cont "Pikachu, but"
	cont "also scary"
	cont "Ariados."
	done
