HollysHolt_MapScriptHeader:
	def_scene_scripts
	scene_script HollysHoltTrigger

	def_callbacks


	def_warp_events 
	warp_event  7, 44, ANARRES_TOWN, 1
	warp_event  7, 45, ANARRES_TOWN, 2
;	warp_event  4,  6, CALM_COAST, 1
;	warp_event  5,  6, CALM_COAST, 2

	
	def_coord_events


	def_bg_events ;TODO ADD A FEW SIGNPOSTS
	bg_event  5, 19, BGEVENT_JUMPTEXT, HH_Sign1Text
	bg_event 25, 25, BGEVENT_JUMPTEXT, HH_Sign2Text
	bg_event 21, 41, BGEVENT_ITEM + SILVERPOWDER, EVENT_HOLLYS_HOLT_HIDDEN_SILVERPOWDER ;ok
	bg_event 16,  2, BGEVENT_ITEM + REVIVAL_HERB, EVENT_HOLLYS_HOLT_HIDDEN_REVIVAL_HERB ;ok
	bg_event 10, 24, BGEVENT_READ, HollysHoltShrineScript 

	def_object_events
	object_event  9, 25, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HollysHoltKurtScript, EVENT_BEAT_HOLLIS ;todo add this 
	object_event  8, 25, SPRITE_HOLLIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HollysHoltHollisScript, EVENT_TALKED_TO_HOLLIS;todo add this
	object_event  8, 16, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, HollysHoltNPC1Text, -1
	object_event 23, 24, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, jumptextfaceplayer, HollysHoltNPC2Script, -1 ; TODO this one should give you someting
	object_event 16, 36, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, HollysHoltNPC3Text, -1 ; THIS ONE DISAPPEARS AFTER BEATING HOLLIS
	object_event 19, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, HollysHoltNPC4Text, -1 
	object_event 24, 38, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptextfaceplayer, HollysHoltNPC5Text, -1 
	itemball_event 28, 14, ENERGYPOWDER, 1, EVENT_HOLLYS_HOLT_ENERGYPOWDER ;TODO
	itemball_event 19, 16, REVIVAL_HERB, 1, EVENT_ILEX_FOREST_REVIVAL_HERB ;TODO
	tmhmball_event 24, 33, TM_U_TURN, EVENT_GOT_TM69_U_TURN
	cuttree_event 25, 5, EVENT_HOLLYS_HOLT_CUT_TREE

	object_const_def
	const HOLLYS_HOLT_KURT
	const HOLLYS_HOLT_HOLLIS

HollysHoltTrigger:
	sdefer HollysHoltScript1
	end

HollysHoltScript1:
	playmusic MUSIC_CELADON_CITY
	showemote EMOTE_SHOCK, HOLLYS_HOLT_KURT, 15
	showemote EMOTE_SHOCK, HOLLYS_HOLT_HOLLIS, 15
	turnobject HOLLYS_HOLT_KURT, LEFT
	turnobject HOLLYS_HOLT_HOLLIS, RIGHT
	opentext
	writetext HH_HollisHello
	closetext
	applymovement HH_HollisSpins
	opentext
	writetext HH_KurtExplains
	closetext
	showemote EMOTE_QUESTION, HOLLYS_HOLT_HOLLIS, 15
	opentext
	writetext HH_HollisPinecos
	closetext
	showemote EMOTE_SHOCK, HOLLYS_HOLT_KURT, 15
	opentext
	writetext HH_KurtHasAPlan
	closetext
	setevent EVENT_TALKED_TO_HOLLIS
	setscene $1 ;shouldn't let you see it multiple times
	end

HollysHoltKurtScript:
	faceplayer
	opentext
	writetext HH_KurtHasAPlan
	closetext
	end
	
HollysHoltHollisScript:
	faceplayer
	opentext
	writetext HH_HollisHello
	closetext
	end

HH_HollisHello:
	text "Hello! How did"
	line "you get behind"
	cont "the shrine?"
	
	para "Are you also"
	line "from Hisui?"
	
	para "My name is"
	line "Hollis. I am"
	cont "the elder here."
	
	para "We wanted to"
	line "give you a better"
	cont "welcome, but"
	cont "there are so"
	cont "many pineco on"
	cont "the trees that"
	cont "the forest is"
	cont "overrun."
	done
	
HH_KurtExplains:
	text "Actually, we're"
	line "here to stop"
	cont "Steel types from"
	cont "entering Johto."
	
	para "They are an"
	line "unnatural type,"
	cont "intrinsically"
	cont "damaging."
	done

HH_HollisPinecos:
	text "Steel types?"
	line "Pineco becomes"
	cont "a steel type"
	cont "when it evolves,"
	cont "but they're a"
	cont "problem before"
	cont "that!"
	
	para "The Hisuians"
	line "said that there"
	cont "were some steel"
	cont "types brought"
	cont "in through the"
	cont "port west of the"
	cont "Capital."
	done

HH_KurtHasAPlan:
	text "<PLAYER>!"
	line "Of course, the"
	cont "steel types are"
	cont "being brought"
	cont "through Olivine!"
	
	para "We have to get"
	line "there. We will"
	cont "need to find a"
	cont "way north of"
	cont "this forest."
	done
	
HH_HollisSpins:
	turn_head_down
	pause 5
	turn_head_left
	pause 5
	turn_head_up
	pause 5
	turn_head_right
	step_end



HollysHoltNPC1Text:
	text "Hi! Did you"
	line "visit to honor"
	cont "the new shrine?"
	
	para "We just built"
	line "it to honor"
	cont "Celebi."
	
	para "The visitors"
	line "from the north"
	cont "helped build it."
	done

HollysHoltNPC2Script:
	checkevent EVENT_GOT_MIRACLE_SEED
	iftrue_jumptextfaceplayer HHNPC2_GotSeed
	faceplayer
	opentext
	writetext HHNPC2_GiveSeed
	promptbutton
	verbosegiveitem MIRACLE_SEED
	iffalse_endtext
	setevent EVENT_GOT_MIRACLE_SEED
	jumpthisopenedtext

HHNPC2_GotSeed:
	text "It's a Miracle"
	line "seed. It could"
	cont "grow anywhere."
	
	para "A grass-type"
	line "#mon would"
	cont "be happy to"
	cont "hold it."
	done


HHNPC2_GiveSeed:
	text "Do you know"
	line "about Celebi?"
	
	para "Celebi is the"
	line "forest and its"
	cont "guardian."
	
	para "When the forest"
	line "is threatened,"
	cont "Celebi protects"
	cont "it. When it is"
	cont "damaged, Celebi"
	cont "will heal it."
	
	para "When we honor"
	line "Celebi, we"
	cont "honor the forest."
	
	para "Honestly, this"
	line "forest is a"
	cont "miracle."
	done

HollysHoltNPC3Text:
	text "There are so"
	line "many Pineco."
	
	para "When so many"
	line "get on a tree,"
	cont "they destroy it."
	
	para "The bagworms"
	line "can't help but"
	cont "reproduce this"
	cont "way. We have to"
	cont "find a way to"
	cont "restore balance."
	done

HollysHoltNPC4Text: ; rollout move tutor?
	text "Just like me,"
	line "this used to be"
	cont "a rolling stone."

	para "I used to roll"
	line "down hills, and"
	cont "over boulders."
	
	para "Until one day"
	line "I rolled here to"
	cont "put down roots."
	done
	
HollysHoltNPC5Text:
	text "Celebi isn't"
	line "just the forest"
	cont "protector. It is"
	cont "the forest."
	
	para "Like a Tangela"
	line "vine, it exists"
	cont "at all times"
	cont "and extents of"
	cont "the forest."

	para "At least that's"
	line "what we learned"
	cont "at the ritual."
	done

HH_HollisHello:
	text "Please, visit"
	line "Anarres Town."
	
	para "The town isn't"
	line "as lively as"
	cont "usual, due to"
	cont "the bagworms"
	cont "sickening so"
	cont "many of the"
	cont "trees."
	done

HollysHoltShrineScript:
	opentext
	writetext HHAskToTimeTravelText
	yesorno
	iffalse_jumpopenedtext HHNoTimeTravelText
	writetext HHYesTimeTravelText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp ILEX_FOREST, 10, 25
	end

HHAskToTimeTravelText:
	text "Travel back"
	line "to present?"
	done

HHNoTimeTravelText:
	text "Staying in"
	line "the past." 
	done
	
HHYesTimeTravelText:
	text "Time to go!"
	done

HH_Sign1Text:
	text "Holly's Holt:"
	line "Home of 
	done

HH_Sign2Text
