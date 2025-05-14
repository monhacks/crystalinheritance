OlivineCity_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, OlivineCityFlyPoint

	def_warp_events
	warp_event 13, 17, OLIVINE_POKECENTER_1F, 1
	warp_event 10,  7, OLIVINE_GYM, 1
	warp_event 25,  7, OLIVINE_TIMS_HOUSE, 1
	warp_event 29,  7, OLIVINE_PUNISHMENT_SPEECH_HOUSE, 1
	warp_event 13, 11, OLIVINE_GOOD_ROD_HOUSE, 1
	warp_event  7, 17, OLIVINE_CAFE, 1
	warp_event 19, 13, OLIVINE_MART, 2
	warp_event 33, 19, OLIVINE_LIGHTHOUSE_1F, 1
	warp_event 19, 25, OLIVINE_DESAL_1F, 1
	warp_event 20, 25, OLIVINE_DESAL_1F, 2

	def_coord_events


	def_bg_events ; fix the signs 
	bg_event 17,  7, BGEVENT_JUMPTEXT, OlivineCitySignText
	bg_event 20, 22, BGEVENT_JUMPTEXT, OlivineCityPortSignText
	bg_event  7,  7, BGEVENT_JUMPTEXT, OlivineGymSignText
	bg_event 34, 20, BGEVENT_JUMPTEXT, OlivineLighthouseSignText
	bg_event  1, 21, BGEVENT_JUMPTEXT, OlivineCityBattleTowerSignText
	bg_event 50, 27, BGEVENT_JUMPTEXT, OlivineCityPokeathlonDomeSignText
	bg_event 10, 17, BGEVENT_JUMPTEXT, OlivineCityCafeSignText
	bg_event 36, 14, BGEVENT_ITEM + RARE_CANDY, EVENT_OLIVINE_CITY_HIDDEN_RARE_CANDY
	bg_event 47, 17, BGEVENT_ITEM + BIG_PEARL, EVENT_OLIVINE_CITY_HIDDEN_BIG_PEARL
	bg_event 49, 29, BGEVENT_ITEM + SOFT_SAND, EVENT_OLIVINE_CITY_HIDDEN_SOFT_SAND

	def_object_events
	object_event 20,  8, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCityYoungster1Text, -1
	object_event 26, 22, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCitySailor1Text, -1
	object_event 11, 23, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCityPokefanFText, -1
	object_event 23, 17, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCitySchoolBoyText, -1
	object_event 23, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCityPokefanMText, -1
	smashrock_event 52, 23
	smashrock_event 55, 26
    object_event 19, 20, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineCityPnkApricornScript, -1
	object_event 18, 17, SPRITE_PHARMACIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineCityRefugeeText, -1
;roadblocks, their text is in route 40 
	object_event -1, 19, SPRITE_OFFICER,  SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineOfficerText, EVENT_BEAT_CHUCK ; redo text and heal you 
	object_event -1, 18, SPRITE_OFFICER,  SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineOfficerText, EVENT_BEAT_CHUCK ; redo text and heal you 
	object_event 19, 0, SPRITE_OFFICER,  SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineOfficerText, EVENT_BEAT_CHUCK ; redo text and heal you 
	object_event 20, 0, SPRITE_OFFICER,  SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineOfficerText, EVENT_BEAT_CHUCK ; redo text and heal you 
	tmhmball_event 8, 3, TM_VOLT_SWITCH, EVENT_TM_VOLT_SWITCH
	

	object_const_def


OlivineCityFlyPoint:
	setflag ENGINE_FLYPOINT_OLIVINE
	endcallback

OlivineCityYoungster1Text:
	text "Super Slowking"
	line "keeps us safe!"
	done

OlivineCitySailor1Text:
	text "The lighthouse"
	line "was a natural"
	para "place to put"
	line "the OMLAS."
	done

OlivineCityPokefanFText:
	text "The Desal plant"
	line "has briny runoff,"
	
	para "so the only place"
	line "to get good fish"
	para "is at the"
	line "Fish Market."
	done

OlivineCitySchoolBoyText:
	text "I'm using the Su-"
	line "per Slowking to"
	cont "write a perfect"
	cont "essay."
	done

OlivineCityPokefanMText:
	text "I have to worry"
	line "what the future"
	para "holds. If Super"
	line "Slowking can do"
	cont "what I do faster"
	para "and cheaper, then"
	line "why do anything"
	cont "at all?"
	done

OlivineCitySignText:
	text "Olivine City"

	para "The Port Closest"
	line "to Foreign Lands"
	done

OlivineCityPortSignText:
	text "Olivine Desal"
	line "Plant"
	done

OlivineGymSignText:
	text "Olivine City"
	line "#mon Gym"
	cont "Leader: Jasmine"

	para "The Steel-Clad"
	line "Defense Girl"
	done

OlivineLighthouseSignText:
	text "Olivine Lighthouse"
	line "Also known as the"
	cont "Glitter Lighthouse"
	done

OlivineCityBattleTowerSignText:
	text "Battle Tower Ahead"
	line "Opening Now!"
	done

OlivineCityPokeathlonDomeSignText:
	text "The #athlon"
	line "Project Has"
	cont "Started!"
	done

OlivineCityCafeSignText:
	text "Olivine Café"
	done

;;;
OlivineCityPnkApricornScript:
	faceplayer
	opentext
	writetext PearlForPnkApricornText ;;
	waitbutton
	checkitem BIG_PEARL
	iffalse .NoBigPearl
	writetext PearlForPnkApricornQuestionText ;;
	yesorno
	iffalse .NoBigPearl
	takeitem BIG_PEARL
	giveapricorn PNK_APRICORN, 5 ; ez mode
	jumpopenedtext PearlForPnkApricornEndText ;;

.NoBigPearl
	jumpopenedtext NoPearlForPnkApricornText ;;

PearlForPnkApricornText:
	text "I tried to grow"
	line "a peach tree in"
	cont "my backyard,"
	
	para "but it was a-"
	line "useless Pink"
	cont "Apricorn tree!"

	para "I can't eat those."
	line "I want to eat a"
	cont "BIG Boba pearl."
	done

PearlForPnkApricornQuestionText:
	text "Please trade me,"
	line "I can't eat these"
	cont "apricorns!"
	
	para "A big boba pearl"
	line "sounds so good,"
	cont "here on the dock."
	done

PearlForPnkApricornEndText:
	text "<PLAYER> got 5"
	line "PNK APRICORN."
	
	para "Thanks! Hey,"
	line "this isn't a"
	cont "boba pearl!"
	done

NoPearlForPnkApricornText:
	text "You don't have"
	line "it? Guess I'll"
	cont "stay hungry."
	done

OlivineCityRefugeeText:
	text "Olivine isn't as"
	line "quiet as Cianwood"
	para "but it's better"
	line "than living on"
	cont "a sandbar."
	done
