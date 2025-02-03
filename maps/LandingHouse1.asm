LandingHouse1_MapScriptHeader: 

	def_scene_scripts


	def_callbacks


	def_warp_events



	def_coord_events



	def_bg_events



	def_object_events
	object_event  5,  4, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LandingHouse1MomScript, -1 
	object_event  2,  4, NOMAD_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LandingHouse1SonScript, EVENT_NOMAD_ISLANDS_HOUSE ; todo, put in initializevents



	object_const_def


LandingHouse1MomScript:
	faceplayer
	checkevent EVENT_NOMAD_NEXUS
	iffalse_jumpopenedtext LandingHouseWhereSonText
	checkevent EVENT_GOT_LIFE_ORB ; CHECK 
	iftrue_jumptextfaceplayer LandingHouse1_GotLifeOrb
	opentext
	writetext LandingHouse1_GiveLifeOrb
	promptbutton
	verbosegiveitem LIFE_ORB
	setevent EVENT_GOT_LIFE_ORB
	jumpthisopenedtext

LandingHouse1_GotLifeOrb:
	text "Thank goodness my"
	line "son is back."
	
	para "Even though our"
	line "lives are diffe-"
	cont "rent, we can at"
	para "least depend on"
	line "our families."
	done

LandingHouse1_GiveLifeOrb:
	text "Thank you for"
	line "saving my son's"
	cont "life."
	
	para "We craft these"
	line "orbs when we"
	cont "need strength to"
	para "break through a"
	line "tough storm..."
	
	para "Please, accept"
	line "this gift."
	done
	
LandingHouseWhereSonText:
	text "Where is my son?"
	line "I wish I could"
	cont "see him one more"
	cont "time... He told"
	para "me he was going"
	line "back to the"
	cont "islands..."
	done
	

LandingHouse1SonScript:
	checkevent EVENT_GOT_TM_FLASH ; CHECK 
	iftrue_jumptextfaceplayer LandingHouse1_GotFlash
	faceplayer
	opentext
	writetext LandingHouse1_GiveFlash
	promptbutton
	verbosegivetmhm TM_FLASH
	setevent EVENT_GOT_TM_FLASH
	jumpthisopenedtext

LandingHouse1_GotFlash:
	text "I won't need that"
	line "anymore. I'm"
	cont "needed here."
	done
	
LandingHouse1_GiveFlash:
	text "Thanks for help-"
	line "ing me out of the"
	cont "caves. Here, this"
	para "will help you if"
	line "you find any more"
	cont "dark areas."
	done
