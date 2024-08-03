AzaleaTown_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, AzaleaTownFlypointCallback


	def_warp_events ; good
	warp_event 17,  5, AZALEA_POKECENTER_1F, 1
	warp_event 21, 13, CHARCOAL_KILN, 1
	warp_event 21,  5, AZALEA_MART, 2
	warp_event  9,  5, KURTS_HOUSE, 1
	warp_event 10, 15, AZALEA_GYM, 1
	warp_event 31,  7, SLOWPOKE_WELL_ENTRANCE, 1
	warp_event  2, 10, ILEX_FOREST_AZALEA_GATE, 3
	warp_event  2, 11, ILEX_FOREST_AZALEA_GATE, 4
	warp_event 14,  0, TINDER_GARDEN, 1
	warp_event 15,  0, TINDER_GARDEN, 1

	def_coord_events
	coord_event  5, 10, 0, Azalea_PokefanStopsYouTrigger1
	coord_event  5, 11, 0, Azalea_PokefanStopsYouTrigger2
	coord_event 20, 10, 0, Azalea_GrampsStopsYouTrigger1
	coord_event 20, 11, 0, Azalea_GrampsStopsYouTrigger2

	def_bg_events
	bg_event 22,  8, BGEVENT_JUMPTEXT, AzaleaTownSignText
	bg_event 10,  9, BGEVENT_JUMPTEXT, KurtsHouseSignText
	bg_event 14, 15, BGEVENT_JUMPTEXT, AzaleaGymSignText
	bg_event 29,  8, BGEVENT_JUMPTEXT, SlowpokeWellSignText ;TODO EDIT THIS
	bg_event 19, 13, BGEVENT_JUMPTEXT, CharcoalKilnSignText
	bg_event  3,  9, BGEVENT_JUMPTEXT, AzaleaTownIlexForestSignText
	bg_event 31,  6, BGEVENT_ITEM + FULL_HEAL, EVENT_AZALEA_TOWN_HIDDEN_FULL_HEAL ; hidden item

	def_object_events
	object_event 18, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaTownGrampsScript, -1
	object_event  7, 10, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaTownPokefanFScript, -1
	object_event 12, 16, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownMatronScript, -1
	object_event 13,  8, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtAZScript, EVENT_CHARCOAL_TALKED
	object_event 13, 11, SPRITE_CAMPER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AzaleaTownYoungsterText, -1
	object_event  8, 17, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, -1
	object_event 29,  9, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, -1
	object_event 15, 15, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWPOKE, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, -1
	fruittree_event  8,  2, FRUITTREE_AZALEA_TOWN, WHT_APRICORN, PAL_NPC_SILVER


	object_const_def
	const AZALEATOWN_GRAMPS
	const AZALEATOWN_POKEFAN_F
	const AZALEATOWN_CAMPER
	const AZALEATOWN_KURT

AzaleaTownFlypointCallback:
	setflag ENGINE_FLYPOINT_AZALEA
	endcallback

Azalea_PokefanStopsYouTrigger1: ;todo how do these people know when it's time to let you do it?... 
	playmusic MUSIC_MOM
	turnobject AZALEATOWN_POKEFAN_F, LEFT
	showtext Text_WaitPlayer
	turnobject PLAYER, RIGHT
	applymovement AZALEATOWN_POKEFAN_F, Movement_PokefanFRunsToYou1_AT
	showtext Text_WhatDoYouThinkYoureDoing
	follow AZALEATOWN_POKEFAN_F, PLAYER
	applymovement AZALEATOWN_POKEFAN_F, Movement_PokefanFBringsYouBack1_AT
	stopfollow
	showtext Text_ItsDangerousToGoAlone
	special RestartMapMusic
	end

Azalea_PokefanStopsYouTrigger2:
	playmusic MUSIC_MOM
	turnobject AZALEATOWN_POKEFAN_F, LEFT
	showtext Text_WaitPlayer
	turnobject PLAYER, RIGHT
	applymovement AZALEATOWN_POKEFAN_F, Movement_PokefanFRunsToYou2_AT
	showtext Text_WhatDoYouThinkYoureDoing
	follow AZALEATOWN_POKEFAN_F, PLAYER
	applymovement AZALEATOWN_POKEFAN_F, Movement_PokefanFBringsYouBack2_AT
	stopfollow
	showtext Text_ItsDangerousToGoAlone
	special RestartMapMusic
	end

Azalea_GrampsStopsYouTrigger1:
	playmusic MUSIC_MOM
	turnobject AZALEATOWN_GRAMPS, RIGHT
	showtext Text_WaitPlayer
	turnobject PLAYER, LEFT
	applymovement AZALEATOWN_GRAMPS, Movement_GrampsRunsToYou1_AT
	showtext Text_WhatDoYouThinkYoureDoing
	follow AZALEATOWN_GRAMPS, PLAYER
	applymovement AZALEATOWN_GRAMPS, Movement_GrampsBringsYouBack1_AT
	stopfollow
	showtext Text_ItsDangerousToGoAlone
	special RestartMapMusic
	end
	
Azalea_GrampsStopsYouTrigger2:
	playmusic MUSIC_MOM
	turnobject AZALEATOWN_GRAMPS, RIGHT
	showtext Text_WaitPlayer
	turnobject PLAYER, LEFT
	applymovement AZALEATOWN_GRAMPS, Movement_GrampsRunsToYou2_AT
	showtext Text_WhatDoYouThinkYoureDoing
	follow AZALEATOWN_GRAMPS, PLAYER
	applymovement AZALEATOWN_GRAMPS, Movement_GrampsBringsYouBack2_AT
	stopfollow
	showtext Text_ItsDangerousToGoAlone
	special RestartMapMusic
	end

AzaleaTownSignText:
	text "Azalea Town"
	line "Where People and"

	para "#mon Live in"
	line "Happy Harmony"
	done

KurtsHouseSignText:
	text "Kurt's House"
	done

AzaleaGymSignText:
	text "Azalea Town"
	line "#mon Gym"
	cont "Leader: Bugsy"

	para "The Walking"
	line "Bug #mon"
	cont "Encyclopedia"
	done

SlowpokeWellSignText:
	text "Slowpoke Well"

	para "Also known as the"
	line "Rainmaker Well."

	para "Locals believe"
	line "that a Slowpoke's"
	cont "yawn summons rain."

	para "Records show that"
	line "a Slowpoke's yawn"

	para "ended a drought"
	line "400 years ago."
	done

CharcoalKilnSignText:
	text "Charcoal Kiln"
	done

AzaleaTownIlexForestSignText:
	text "Ilex Forest"

	para "Enter through the"
	line "gate."
	done

AzaleaTownGrampsScript:
	checkevent EVENT_GOT_A_POKEMON
	iftrue_jumptextfaceplayer .Text2
	jumpthistextfaceplayer

	text "<PLAYER>, you"
	line "have a ceremony"
	cont "today."
	
	para "At mine, we had"
	line "so many people."
	
	para "I hope you get"
	line "a good showing."
	done

.Text2:
	text "Slowpoke well"
	line "is so deep."

	para "I wonder if it"
	line "connects to"
	cont "Union Cave?"
	done

KurtAZScript:
	opentext
	jumpthisopenedtext
	
	text "Follow this path"
	line "when you have"
	cont "talked to the"
	cont "Charcoal family."
	done

AzaleaTownPokefanFScript:
	checkevent EVENT_GOT_A_POKEMON
	iftrue_jumptextfaceplayer .Text3
	jumpthistextfaceplayer

	text "Good luck at"
	line "your ceremony!"
	done
	
.Text3:
	text "The legend of"
	line "Slowpoke Well?"
	
	para "There was a"
	line "deep drought."
	
	para "Azaleans dug"
	line "for water. A"
	cont "Slowpoke crawled"
	cont "out of the hole,"
	cont "yawned, and a"
	cont "rain started for"
	cont "thirty days!"
	done

AzaleaTownYoungsterText:
	text "If I had my own"
	line "#mon, I would"
	cont "go exploring."
	
	para "I've never even"
	line "been to Slowpoke"
	cont "Well or Route 33."
	
	para "My dad says that"
	line "he hears a mad"
	cont "Slowbro at the"
	cont "bottom of the"
	cont "Well."
	done

AzaleaTownMatronScript:
	checkevent EVENT_BEAT_BUGSY
	iftrue_jumptextfaceplayer .BugsyIsHappyText
	jumpthistextfaceplayer
	
	text "Bugsy has been"
	line "so down. No one"
	cont "is interested in"
	cont "his research."
	done
	
.BugsyIsHappyText
	text "Bugsy has made"
	line "some amazing new"
	cont "discovery!"
	
	para "He is back to"
	line "feeling like"
	cont "himself again."
	done

AzaleaTownSlowpokeScript:
	opentext
	writethistext
		text "A robotic foun-"
		line "tain sculpture"
		cont "of a Slowpoke"
		cont "yawning."
		
		para "But there's no"
		line "water, just some"
		cont "dusty leaves."
		done
	endtext

Text_WaitPlayer:
	text "Wait, <PLAYER>!"
	done

Text_WhatDoYouThinkYoureDoing:
	text "What do you think"
	line "you're doing?"
	done

Text_ItsDangerousToGoAlone:
	text "Aren't you and"
	line "the charcoal boy"
	cont "in a ceremony"
	cont "today?"
	done

Movement_PokefanFRunsToYou1_AT:
	step_left
	step_end

Movement_PokefanFRunsToYou2_AT:
	step_left
	step_left
	turn_head_down
	step_end

Movement_PokefanFBringsYouBack2_AT:
	step_right
Movement_PokefanFBringsYouBack1_AT:
	step_right
	turn_head_left
	step_end ;todo check the head on both of these
	
Movement_GrampsRunsToYou1_AT:
	step_right
	step_end

Movement_GrampsRunsToYou2_AT:
	step_right
	step_right
	turn_head_down
	step_end

Movement_GrampsBringsYouBack2_AT:
	step_left
Movement_GrampsBringsYouBack1_AT:
	step_left
	turn_head_right
	step_end ;todo check the head on both of these
