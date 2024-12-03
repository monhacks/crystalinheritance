SproutTower3F_MapScriptHeader:
	def_scene_scripts

	def_callbacks


	def_warp_events
	warp_event  8, 14, SPROUT_TOWER_2F, 2

	def_coord_events


	def_bg_events


	def_object_events
	object_event  9, 7, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ElderHealsScript, EVENT_BEAT_FALKNER	
	object_event  9, 7, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBirdKeeperToby, -1
	object_event  6, 7, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBirdKeeperDennis, -1
	object_event  5,  1, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, -1

	object_const_def


ElderHealsScript:
	showtext ElderHealsText1
	special FadeOutPalettes
	special LoadMapPalettes
	playsound SFX_FULL_HEAL
	special HealParty
	special FadeInPalettes
	showtext ElderHealsText2
	end
	
ElderHealsText1:
	text "Edler: Falkner"
	line "hasn't left this"
	cont "floor in weeks."
	
	para "I'm here to heal"
	line "any #mon."
	
	para "Please, allow me."
	done
	
ElderHealsText2:
	text "Your #mon are"
	line "now healed."
	done

GenericTrainerBirdKeeperToby:
    generictrainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, BirdKeeperTobySeenText, BirdKeeperTobyBeatenText

    text "Wow, you're more"
    line "powerful than a"
    cont "Sky Attack."
    done

GenericTrainerBirdKeeperDennis:
    generictrainer BIRD_KEEPER, DENIS, EVENT_BEAT_BIRD_KEEPER_DENIS, BirdKeeperDennisSeenText, BirdKeeperDennisBeatenText

    text "We're building a"
    line "tower to the sky"
    cont "to direct clouds"
    cont "to Violet City."
    done

BirdKeeperTobySeenText:
    text "You want to"
    line "challenge Falkner?"
    para "You'll have to get"
    line "through me first!"
    done

BirdKeeperTobyBeatenText:
    text "Wow, you're more"
    line "powerful than a"
    cont "Sky Attack."
    done

BirdKeeperDennisSeenText:
    text "I've been with"
    line "Falkner since he"
    cont "started this"
    cont "project!"
    done

BirdKeeperDennisBeatenText:
    text "Ouch, my wings!"
    done

VioletGymFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	promptbutton
	verbosegivetmhm TM_AERIAL_ACE
	setevent EVENT_GOT_TM_AERIAL_ACE
.FightDone:
	jumpopenedtext FalknerAfterText

FalknerIntroText:
	text "I've seen you"
	line "coming, player."
	cont "But you're too"
	cont "late to stop me."

	para "The Bronzong is"
	line "nearly unearthed."
	cont "Its tones will"
	cont "bring rains for"
	cont "many weeks."

	para "Yes, there are"
	line "costs. The old"
	cont "tower, perhaps my"
	cont "own integrity."

	para "But I'll ensure"
	line "water for some."
	cont "That's all that"
	cont "matters now!"
	
FalknerWinLossText:
	text "Your #mon's"
	line "teamwork... It's"
	cont "opened my eyes."

	para "I see now that I've"
	line "been short-sighted."
	cont "My actions would"
	cont "harm all of Johto."

	para "Pushing clouds,"
	line "forcing rain dances"
	cont "- it's not sustain-"
	cont "able. Or right."
	done

ReceivedZephyrBadgeText:
	text "Please, take this"
	line "TM  and badge."
	cont "Use it wisely."
	done

FalknerAfterText:
	text "I need to reassess"
	line "my approach. Work"
	cont "with nature, not"
	cont "against it."

	para "I'll halt the"
	line "excavation on"
	cont "Route 32 at once."

	para "Thank you for this"
	line "... valuable"
	cont "lesson, trainer."
	done
	