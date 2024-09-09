GauldenrodTower4F_MapScriptHeader:
	def_scene_scripts


	def_callbacks

	def_warp_events
	warp_event  3,  9, GAULDENROD_TOWER_3F, 2
	warp_event  8,  9, GAULDENROD_TOWER_1F, 4


	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_SANDRA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GauldenrodTower4FSandraScript, EVENT_BEAT_SANDRA
	object_event 10,  2, SPRITE_BRIGADER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_SANDRA
	object_event  2, 10, SPRITE_AMOS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_HOLLIS
	pokemon_event  14, 19, CLEFAIRY, -1, -1, PAL_NPC_RED, GauldenrodClefairyText, EVENT_BEAT_SANDRA
	tmhmball_event 4, 50, TM_ROOST, EVENT_TM_ROOST


	object_const_def
	const GAULDENRODTOWER4F_SANDRA
	const GAULDENRODTOWER4F_BRIGADER
	const GAULDENRODTOWER4F_AMOS
	const GAULDENRODTOWER4F_CLEFAIRY


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
	setevent EVENT_BEAT_SANDRA
	opentext
	writetext SandraAfterText
	setflag ENGINE_CASCADEBADGE ; todo
	waitbutton
	closetext
	appear GAULDENRODTOWER4F_BRIGADER
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
	disappear GAULDENRODTOWER4F_SANDRA
	disappear GAULDENRODTOWER4F_BRIGADER
	pause 15
	appear GAULDENRODTOWER4F_AMOS
	applymovement GAULDENRODTOWER4F_AMOS, AmosEnterMovement
	opentext
	writetext AmosText
	waitbutton
	closetext
	applymovement GAULDENRODTOWER4F_AMOS, AmosLeaveMovement
	disappear GAULDENRODTOWER4F_AMOS
	end

.Refused:
	writetext SandraRefusedText
	waitbutton
	closetext
	end

SandraIntroText:
	text "Player, you have"
	line "shown your connec-"
	cont "tion to #mon."
	cont "Why are you here?"

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
	text "Please, take this"
	line "badge as a sign"
	cont "of my respect."

	text "With my blessing"
	line "you can use the"
	cont "HM Strength."

	para "I have much to"
	line "tell you."
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
	text "AMOS: Excuse me,"
	line "Have you seen"
	line "Sandra?"
	
	para "..."

	para "Oh, you were just"
	line "with her before"
	cont "the brigaders"
	line "took her away to"
	cont "the stadium?"

	para "Then I was just a"
	line "little too late..."

	para "Say, you look"
	line "familiar."

	para "Oh, right! You"
	line "were in Anarres"
	cont "Town, interrupting"
	cont "my conversation"
	cont "with Hollis."
	
	para "I hope they are"
	line "doing OK. It's"
	cont "hard to get any"
	cont "intel these days."
	
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
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

AmosEnterMovement:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_right	
	step_right
	step_end

AmosLeaveMovement:
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_end

GauldenrodClefairyText:
	text "Supernova:"
	line "Shammoo!"
	done
