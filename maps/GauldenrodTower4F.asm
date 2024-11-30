GauldenrodTower4F_MapScriptHeader:
	def_scene_scripts


	def_callbacks

	def_warp_events
	warp_event  3,  9, GAULDENROD_TOWER_3F, 2
	warp_event  8,  9, GAULDENROD_TOWER_1F, 4


	def_coord_events

	def_bg_events

	def_object_events
	object_event   5,  2, SPRITE_SANDRA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GauldenrodTower4FSandraScript, EVENT_BEAT_SANDRA
	object_event  10,  2, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_SANDRA
	object_event   1,  7, SPRITE_AMOS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GAULDENROD_AMOS ; initialize this
	pokemon_event  6,  2, CLEFAIRY, -1, -1, PAL_NPC_RED, GauldenrodClefairyText, EVENT_BEAT_SANDRA
	object_event   1,  7, SPRITE_ADRINNA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GAULDENROD_ADRINNA ; initialize this
	tmhmball_event 5,  1, TM_ROOST, EVENT_TM_ROOST
; new 


	object_const_def
	const GAULDENRODTOWER4F_SANDRA
	const GAULDENRODTOWER4F_BRIGADER
	const GAULDENRODTOWER4F_AMOS
	const GAULDENRODTOWER4F_CLEFAIRY
	const GAULDENRODTOWER4F_ADRINNA

GauldenrodTower4FSandraScript:
	faceplayer
	opentext
	writetext SandraIntroText
	yesorno
	iffalse .Refused
	writetext SandraChallengeText
	waitbutton
	closetext
	winlosstext SandraWinText, 0
	loadtrainer SANDRA, 1
	startbattle
	reloadmapafterbattle
	disappear GAULDENRODTOWER4F_CLEFAIRY
	opentext
	writetext SandraAfterText
	givekeyitem RAINBOW_WING
	setflag ENGINE_CASCADEBADGE ; todo
	waitbutton
	closetext
	applymovement GAULDENRODTOWER4F_BRIGADER, BrigaderApproachMovement
	turnobject GAULDENRODTOWER4F_SANDRA, RIGHT
	opentext
	writetext BrigaderInterruptText
	waitbutton
	writetext SandraResponseText
	waitbutton
	writetext BrigaderExplanationText
	waitbutton
	writetext SandraAgreementText
	waitbutton
	closetext
	applymovement GAULDENRODTOWER4F_BRIGADER, BrigaderLeaveMovement1
	applymovement GAULDENRODTOWER4F_SANDRA, SandraLeaveMovement
	applymovement GAULDENRODTOWER4F_BRIGADER, BrigaderLeaveMovement2
	pause 15
	appear GAULDENRODTOWER4F_AMOS;, AmosMovement1
	applymovement GAULDENRODTOWER4F_AMOS, AmosEnterMovement1
; inserting this 
	showemote EMOTE_SHOCK, PLAYER, 15
	applyonemovement GAULDENRODTOWER4F_ADRINNA, teleport_to ; APPEAR 
	opentext
	writetext AdrinnaGauldenrodTowerText
	waitbutton
	verbosegivetmhm HM_STRENGTH
	closetext
	applyonemovement GAULDENRODTOWER4F_ADRINNA, teleport_from ; APPEAR
	disappear GAULDENRODTOWER4F_ADRINNA
	applymovement GAULDENRODTOWER4F_AMOS, AmosEnterMovement2
;;
	turnobject PLAYER, LEFT
	opentext
	writetext AmosText
	waitbutton
	closetext
	applymovement GAULDENRODTOWER4F_AMOS, AmosLeaveMovement
	disappear GAULDENRODTOWER4F_SANDRA
	disappear GAULDENRODTOWER4F_BRIGADER
	disappear GAULDENRODTOWER4F_AMOS
	setevent EVENT_BEAT_SANDRA
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	special Special_FadeInQuickly
	end

.Refused:
	writetext SandraRefusedText
	waitbutton
	closetext
	end

SandraIntroText:
	text "Sandra: Why"
	line "have you come"
	cont "to me?"
	
	para "..."
	
	para "Ah, you seek"
	line "entrance to"
	cont "Trader's Landing"
	cont "to stop steel"
	cont "types from"
	cont "entering Johto."

	para "Tell me, is it the"
	line "steel types or"
	cont "something else"
	cont "that causes"
	cont "destruction?"

	para "Ha, you will learn"
	line "soon enough."

	para "Would you like"
	line "a lesson?"
	done

SandraChallengeText:
	text "Show me your"
	line "connection with"
	cont "your #mon!"
	done

SandraWinText:
	text "Magnificent"
	line "battle."
	done

SandraAfterText:
	text "Take this."
	
	para "With my blessing"
	line "you can use the"
	cont "HM Strength."
	
	para "Also, please"
	line "accept this Rain-"
	cont "bow wing."
	
	para "It is a feather of"
	line "the mighty Ho-Oh."
	
	para "It signifies that"
	line "you are pure of"
	cont "heart."
	done

SandraRefusedText:
	text "I see. Perhaps"
	line "you're not ready"
	cont "yet."
	done

BrigaderInterruptText:
	text "Brigader:"
	line "Sandra! You must"
	cont "come with us, now!"
	done

SandraResponseText:
	text "Sandra:"
	line "What's this?"
	done

BrigaderExplanationText:
	text "Brigader:"
	line "You'll see! You are"
	cont "summoned by"
	cont "General Bobesh to"
	cont "the stadium!"
	done

SandraAgreementText:
	text "Sandra:"
	line "Very well."
	
	para "I have wanted to"
	line "talk to him for"
	cont "some time."
	done

AmosText:
	text "Amos: Excuse me,"
	line "have you seen"
	cont "Sandra?"
	
	para "..."

	para "Oh, you were just"
	line "with her before"
	cont "the brigaders"
	cont "took her away to"
	cont "the stadium?"

	para "Then I was just a"
	line "little too late."

	para "Say, you look"
	line "familiar."

	para "Oh, right! You"
	line "were in Anarres"
	cont "Town, interrupting"
	cont "my conversation"
	cont "with Hollis."
	
	para "..."

	para "Well, I'd better"
	line "get out of here,"
	cont "before any"
	cont "brigaders find me."
	done

BrigaderApproachMovement:
	step_left
	step_left
	step_left
	step_left
	step_end

SandraLeaveMovement:
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down	
	step_end

BrigaderLeaveMovement1:
	step_up
	turn_head_down
	step_end

BrigaderLeaveMovement2:
	step_down
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

AmosMovement1:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left	
	step_end

AmosEnterMovement1:
	step_up
	step_up
	step_up	
	step_up
	step_end

AmosEnterMovement2:
	step_up
	step_right	
	step_right
	step_end

AmosLeaveMovement:
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

GauldenrodClefairyText:
	text "Supernova:"
	line "Shammoo!"
	done

AdrinnaGauldenrodTowerText:
	text "Adrinna: So you're"
	line "the one my bird-"
	cont "ies are all"
	cont "worked up over."

	para "Don't be alarmed,"
	line "I'm not here to"
	cont "fight."

	para "My name is Gen-"
	line "eral Adrinna."
	
	para "What do you th-"
	line "ink of Bobesh's"
	cont "stadium?"
	
	para "Hm, do you ever"
	line "see the strong-"
	cont "est trainers"
	cont "watching it?"
	
	para "You look like a"
	line "strong trainer."
	cont "This might be"
	cont "of use to you."
	done
	
	
	
	