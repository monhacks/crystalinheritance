RadioTower5F_MapScriptHeader: ; tm attract, plainbadge
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12,  0, RADIO_TOWER_4F, 3

	def_coord_events


	def_bg_events


	def_object_events
    object_event  2,  3, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhitneyScript, EVENT_BEAT_WHITNEY
    object_event 12,  0, SPRITE_LANNA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, LannaScript, EVENT_BEAT_RADIO_TOWER_RIVAL

	object_const_def



WhitneyScript:
    faceplayer
    opentext
    writetext WhitneyIntroText
    promptbutton
    appear RADIOTOWER_LANNA
    applymovement RADIOTOWER_LANNA, LannaEnterMovement
    turnobject PLAYER, UP
    writetext LannaConfrontationText
    promptbutton
    writetext WhitneyResponseText
    winlosstext WhitneyBeatenText, 0
    loadtrainer WHITNEY, 1
    startbattle
    reloadmapafterbattle
	opentext
	writetext WhitneyAttractText
	waitbutton
	closetext
    applymovement RADIOTOWER_WHITNEY, WhitneyMoveAsideMovement
    turnobject RADIOTOWER_WHITNEY, RIGHT
    writetext LannaFinalText
    waitbutton
    closetext
	setevent EVENT_BEAT_WHITNEY
	clearevent EVENT_WHITNEY_GYM
	setengine ENGINE_PLAINBADGE
    end

WhitneyIntroText:
    text "Whitney: Congrats,"
    line "trainer. You've"
    cont "made it to the"
    cont "top."
    para "I started out as"
    line "a picnicker. I got"
    cont "stomped because my"
    cont "cute #mon"
    cont "weren't taken"
    cont "seriously."
    para "So I started my"
    line "own gym. That got"
    cont "me attention, and"
    cont "now I'm an"
    cont "inspiration to the"
    cont "cuties who want to"
    cont "hit a defense-"
    cont "curl-boosted"
    cont "5-turn rollout."
    done

LannaConfrontationText:
    text "Lanna: Whitney."
    line "Your radio show is"
    cont "inflammatory."
    para "It makes the worst"
    line "people in our city"
    cont "even worse!"
    done

WhitneyResponseText:
    text "Whitney: Please. I"
    line "have the top rated"
    cont "show in all of"
    cont "Johto."
    para "Lanna, your mag"
    line "isn't worth the"
    cont "ink you use to"
    cont "print it."
    para "Do you know why no"
    line "one reads it?"
    para "Because your"
    line "characters are"
    cont "boring – oh, this"
    cont "one is evil, this"
    cont "one magnificent,"
    cont "yadda yadda."
    para "Actually, enough"
    line "chit chat. I'm"
    cont "going to stomp you"
    cont "both, and then"
    cont "brag about it on"
    cont "my show!"
    done

WhitneyBeatenText:
    text "I'm flattened…"
    line "Is this what it"
    cont "feels like to"
    cont "lose?"
    para "All those"
    line "friendships"
    cont "because of how"
    cont "competitive I"
    cont "was…"
    done
	
WhitneyAttractText:
	text "<PLAYER>, you"
	line "beat me. Please,"
	cont "take this badge"
	cont "and TM."
	
	para "You reminded me"
	line "that as a gym"
	cont "leader, I should"
	cont "uplifts others,"
	cont "not exalt my-"
	cont "self."
	done

LannaFinalText:
    text "Lanna: <PLAYER>,"
    line "thank you for"
    cont "your help."
	
	para "Whitney showed"
	line "remorse, but"
	cont "I know her type."
	
	para "She'll be back"
	line "as a shock jock"
	cont "soon, I'm sure"
	cont "of it."

	para "Anyway - "
	
    para "Take that fire"
    line "escape, and then"
    cont "you can take the"
    cont "mountain path to"
    cont "the East."
    done

LannaEnterMovement:
    step UP
    step UP
    step UP
    step_end

WhitneyMoveAsideMovement:
    step RIGHT
    turn_head LEFT
    step_end