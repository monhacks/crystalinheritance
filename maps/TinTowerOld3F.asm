TinTowerOld3F_MapScriptHeader: ;	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event 0, 15, TIN_TOWER_OLD_1F, 3 ; WARP 
	warp_event 1, 1, TIN_TOWER_OLD_2F, 3 ; STAIRS 
	warp_event 4, 5, TIN_TOWER_OLD_2F, 4 ; HOLE 

	def_coord_events
	coord_event 7, 10, 0, TT3F_CW_Bottom_Trigger
	coord_event 7, 10, 1, TT3F_CW_Bottom_Trigger

	def_bg_events



	def_object_events
	object_event  6, 10, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, HAUNTER, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_TIN_TOWER_OLD_HAUNTER_1
	object_event  9, 10, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, HAUNTER, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_TIN_TOWER_OLD_HAUNTER_2
	object_event  6, 7, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, HAUNTER, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_TIN_TOWER_OLD_HAUNTER_3
	object_event  9, 7, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, HAUNTER, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_TIN_TOWER_OLD_HAUNTER_4

	object_event  0, 0, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSage___, -1
	object_event  0, 0, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSage___, -1
	object_event  0, 0, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerSage___, -1

	object_event  5,  1, SPRITE_SAMSARA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower3FSamsaraScript, -1


	object_const_def
	const TIN_TOWER_OLD_3F_HAUNTER_1
	const TIN_TOWER_OLD_3F_HAUNTER_2
	const TIN_TOWER_OLD_3F_HAUNTER_3
	const TIN_TOWER_OLD_3F_HAUNTER_4

TT3F_CW_Bottom_Trigger:
	showemote EMOTE_SHOCK, PLAYER, 5
	pause 5
	appear TIN_TOWER_OLD_3F_HAUNTER_1
	pause 5
	disappear TIN_TOWER_OLD_3F_HAUNTER_1
	pause 5
	appear TIN_TOWER_OLD_3F_HAUNTER_2
	pause 5
	disappear TIN_TOWER_OLD_3F_HAUNTER_2
	pause 5
	appear TIN_TOWER_OLD_3F_HAUNTER_3
	pause 5
	disappear TIN_TOWER_OLD_3F_HAUNTER_3
	pause 5
	appear TIN_TOWER_OLD_3F_HAUNTER_4
	pause 5
	disappear TIN_TOWER_OLD_3F_HAUNTER_4
	pause 5
	applymovment PLAYER, PlayerMovesClockwiseFromBottomMovement
	setscene $1
	end

PlayerMovesClockwiseFromBottomMovement:
	step_up
	step_right
	step_right
	step_right
	step_right
	step_end
	
GenericTrainerBirdKeeperToby:
    generictrainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, BirdKeeperTobySeenText, BirdKeeperTobyBeatenText

    text "Wow, you're more"
    line "powerful than a"
    cont "Sky Attack."
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



TinTower3FSamsaraScript:
	faceplayer
	checkevent EVENT_BEAT_SAMSARA
	iftrue_jumpopenedtext BeatSamsaraText
	checkevent EVENT_BEAT_SAGE_...
	iffalse_jumpopenedtest TinTower3FStudyHarderText
	checkevent EVENT_BEAT_SAGE_...
	iffalse_jumpopenedtest TinTower3FStudyHarderText
	checkevent EVENT_BEAT_SAGE_...
	iffalse_jumpopenedtest TinTower3FStudyHarderText
	writetext SamsaraIntroText
	waitbutton
	closetext
	winlosstext SamsaraWinLossText, 0
	loadtrainer SAMSARA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SAMSARA
	opentext
	writetext ReceivedHeavensBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	promptbutton
	verbosegivetmhm TM_SHADOW_CLAW
.FightDone:
	jumpopenedtext SamsaraAfterText


Sage1: Our sacred duty, protect Ho-Oh! You may pass, but beware of what you may find ahead. 
Sage2: Ancestors, give us strength! You have a strong heritage. You should see the Elder. 
Sage3: The seasons may change, but the cycle stays the same! And with my poor training, my outcome the same… 
Samsara: “You would like to prove yourself to earn the Surf HM? Please, show me if your soul is pure enough!” “Indeed, your connection with your pokemon is nearly as strong as the emperor’s was. You can be trusted not to abuse this HM for personal gain.” “You have a rainbow feather? Quite beautifulI think the emperor has one like that.”


ReceivedHeavensBadgeText:
	text "Please, take this"
	line "Heavens badge."
	
	para "It symbolizes the"
	line "duality present"
	cont "in all things."
	
	para "Oh, and this TM"
	line "is also from me."
	para "It's a reminder"
	line "that the past is"
	cont "always trying to"
	para "reach into the"
	line "future!"
	done
	