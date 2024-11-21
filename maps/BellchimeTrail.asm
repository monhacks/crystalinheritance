BellchimeTrail_MapScriptHeader:
	def_scene_scripts
	scene_script BellchimeTrailStepDownTrigger

	def_callbacks

	def_warp_events
	warp_event  4,  4, WISE_TRIOS_ROOM, 1
	warp_event  4,  5, WISE_TRIOS_ROOM, 2
	warp_event 21,  9, TIN_TOWER_1F, 1 ; hole

	def_coord_events
	coord_event 21,  9, 1, BellchimeTrailPanUpTrigger

	def_bg_events
	bg_event 22, 12, BGEVENT_JUMPTEXT, TinTowerSignText

	def_object_events
	object_event 14,  4, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BellchimeTrailEmiScript, -1
	object_event 21, 10, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, BellchimeBlockerText, EVENT_BEAT_MORTY_GYM ;

	object_const_def
	

BellchimeTrailStepDownTrigger:
	sdefer .Script
	end

.Script:
	readvar VAR_YCOORD
	ifnotequal $9, .Done
	readvar VAR_XCOORD
	ifnotequal $15, .Done
	applyonemovement PLAYER, step_down
.Done
	setscene $1
	end

BellchimeTrailPanUpTrigger:
	playsound SFX_EXIT_BUILDING
	applyonemovement PLAYER, hide_object
	waitsfx
	applymovement PLAYER, .PanUpMovement
	disappear PLAYER
	pause 10
	special Special_FadeOutMusic
	special FadeOutPalettes
	pause 15
	setscene $0
	warpfacing UP, TIN_TOWER_1F, 7, 15
	end

.PanUpMovement:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

TinTowerSignText:
	text "Bell Tower"

	para "A legendary #-"
	line "mon is said to"
	cont "roost here."
	done

BellchimeTrailEmiScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KIMONO_GIRL_EMI
	iftrue .AskToTimeTravel
	writetext KimonoGirlEmiIntroText
	waitbutton
	writetext EmiBattleText
	yesorno
	iffalse_jumpopenedtext EmiRefusedText
	writetext EmiAcceptedText
	waitbutton
	closetext
	winlosstext EmiBeatenText, 0
	loadtrainer VALERIE, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KIMONO_GIRL_EMI
	opentext
	writetext KimonoGirlEmiRewardText
	promptbutton
	verbosegiveitem ODD_SOUVENIR ; hisui stone
	writetext EmiHealsYouText
	playmusic MUSIC_HEAL
	special HealParty
	special SaveMusic	
	writetext EmiHealedPokemonText	; 
.AskToTimeTravel:
	writetext BellchimeTrailAskToTimeTravelText
	yesorno
	iffalse_jumpopenedtext BellChimeTrailNoTimeTravelText
	writetext BellChimeTrailYesTimeTravelText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp EMPERORS_GARDEN, 28, 28
	end

KimonoGirlEmiIntroText:
	text "I sensed your"
	line "arrival when"
	cont "you arrived."

	para "You have come"
	line "very far, "

	para "looking for a"
	line "way to save"
	cont "your heritage."
	
	para "You have already"
	line "brought people"
	cont "together in"
	cont "Goldenrod and"
	
	para "calmed the"
	line "gales in"
	cont "Violet, and now"
	
	para "you seek the"
	line "blossom tree"
	cont "here…"
	
	para "Hahaha, so many"
	line "similarities!"
	done

EmiBattleText:
	text "Eh, you want to"
	line "know the ending"
	cont "of the story?"

	para "I'll tell you if"
	line "you can beat"
	cont "me!"
	done

EmiRefusedText:
	text "You refuse?"
	
	para "You can't run"
	line "from destiny"
	cont "forever!"
	done

EmiAcceptedText:
	text "Face your fate!"

EmiBeatenText:
	text "So the legends"
	line "are true."
	
	para "Allow me to ex-"
	line "plain the rest"
	cont "of the story"
	cont "of these towers."
	done


KimonoGirlEmiRewardText:
	text "The infamous"
	line "lightning"
	cont "strike…"
	
	para "It struck the"
	line "Brass tower just"
	cont "as the emperor"
	cont "raised his"
	cont "hands…"
	
	para "But few know"
	line "of the other"
	cont "figure there"
	cont "that day…"
	
	para "Standing in the"
	line "shadows was"
	cont "someone with"
	cont "hair like"
	cont "spring leaves…"
	
	para "After those"
	line "events, visit-"
	cont "ors from Hisui"
	cont "stopped coming."
	
	para "Some of the only"
	line "evidence we"
	cont "have is in"
	cont "unique stones"
	cont "like this."
	done

EmiHealsYouText:
	text "Please, let me"
	line "heal your #mon."
	done

EmiHealedPokemonText:



BellchimeTrailAskToTimeTravelText:


BellChimeTrailNoTimeTravelText:


BellChimeTrailYesTimeTravelText:



BellchimeBlockerText:
	text "The tower is off-"
	line "limits to those"
	cont "without a Clear"
	cont "Bell..."
	
	para "If Morty returns"
	line "to his duty, he"
	cont "may test if you"
	cont "are worthy to"
	cont "hold it."
	done
