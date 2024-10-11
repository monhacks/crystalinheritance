RadioTower5F_MapScriptHeader: 
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 12, 0, RADIO_TOWER_4F, 3
	warp_event 17, 7, GOLDENROD_MAGNET_TRAIN_STATION, 3

	def_coord_events


	def_bg_events


	def_object_events
    object_event  9,  2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtRadioTower5FScript, EVENT_BEAT_RADIO_TOWER_RIVAL ; should be disappeared
    object_event 11,  7, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhitneyScriptRadioTower5F, EVENT_BEAT_WHITNEY


	object_const_def
    const RADIOTOWER_KURT
    const RADIOTOWER_WHITNEY


WhitneyScriptRadioTower5F:
	checkevent EVENT_BEAT_WHITNEY
	iftrue_jumptextfaceplayer WhitneyAfterBattleText
    faceplayer
    opentext
    writetext WhitneyIntroText
    promptbutton
	closetext
    appear RADIOTOWER_KURT
    applymovement RADIOTOWER_KURT, KurtEnterMovement
	opentext
    writetext KurtConfrontationText
    promptbutton
    writetext WhitneyResponseText
	promptbutton
    winlosstext WhitneyBeatenText, 0
    loadtrainer WHITNEY, 1
    startbattle
    reloadmapafterbattle
	opentext
	writetext WhitneyAttractText
	verbosegivetmhm TM_ATTRACT
	waitbutton
	closetext
    applymovement RADIOTOWER_WHITNEY, WhitneyMoveAsideMovement
	turnobject RADIOTOWER_KURT, DOWN
	turnobject PLAYER, UP
	opentext
    writetext KurtFinalText
    waitbutton
    closetext
	playmusic MUSIC_HEAL
    special HealParty
	special SaveMusic	
	playmusic MUSIC_NONE	
	special RestoreMusic
	setevent EVENT_BEAT_WHITNEY
	clearevent EVENT_WHITNEY_GYM
	setflag ENGINE_PLAINBADGE
    end

WhitneyIntroText:
    text "Whitney: "
	line "Oh? Are you the"
	cont "one responsible"
	cont "for cutting my"
	cont "broadcast short?"
	
	para "Jealous of my"
	line "popularity?"
	
    para "I started off as"
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

KurtConfrontationText:
    text "Kurt: Whitney."
    line "Your radio show is"
    cont "inflammatory."
    para "It brings out"
	line "the worst in"
	cont "people."
	
	para "You drifted too"
	line "far from your"
	cont "heritage."
    done

WhitneyResponseText:
    text "Whitney: Please. I"
    line "have the top rated"
    cont "show in all of"
    cont "Johto."

    para "Do you know why"
	line "no one comes to"
	cont "your ceremony"
	cont "anymore?"
	
    para "Because your"
	line "idealized his-"
	cont "tory of Johto is"
	cont "boring."

	para "Blah blah, "
	line "people lived in"
	cont "perfect harmony"
	cont "with #mon,"
    cont "yadda yadda."
	
	para "People want a"
	line "conflict."
	
	para "People want to"
	line "cheer for some-"
	cont "thing."
	
	para "People want to"
	line "see someone come"
	cont "up."
	
	para "People want to"
	line "channel someone"
	cont "like me, stomping"
	cont "on everyone they"
	cont "don't like!"
    done

WhitneyBeatenText:
    text "I'm flattened…"
    line "So this is what"
    cont "it feels like to"
    cont "lose."
	
    para "All those"
    line "friendships"
    cont "because of how"
    cont "I never tried"
	cont "to see the good"
	cont "in anyone else."
    done
	
WhitneyAttractText:
	text "<PLAYER>, you"
	line "beat me. Please,"
	cont "take this badge"
	cont "and TM."
	
	para "You reminded me"
	line "that as a gym"
	cont "leader, I should"
	cont "uplift others,"
	cont "not exalt my-"
	cont "self."
	done
	
WhitneyAfterBattleText:
	text "Thank you for"
	line "showing me my"
	cont "effect on others."
	
	para "Maybe it isn't"
	line "too late to"
	cont "re-make my gym."

KurtFinalText:
    text "Kurt: <PLAYER>,"
    line "let's go."
	
	para "Whitney showed"
	line "remorse, but"
	cont "I know her type."
	
	para "People like her"
	line "can't change."

	para "Anyway - "
	
    para "Take that fire"
    line "ladder, and then"
    cont "we can take the"
    cont "mountain path to"
    cont "the East."
	
	para "I'll heal your"
	line "party before we"
	cont "embark."
    done

KurtEnterMovement:
	step_down
	step_down
	step_down
	step_down
	step_right
    step_end

WhitneyMoveAsideMovement:
    step_right
	step_right
	step_up
    turn_head_down
    step_end

KurtRadioTower5FScript:
	faceplayer
	opentext
	writetext KurtFinalText
	promptbutton
	closetext
	end
