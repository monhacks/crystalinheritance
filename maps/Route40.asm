Route40_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 14, 10, BGEVENT_JUMPTEXT, Route40SignText ; fix sign 
	bg_event  7,  8, BGEVENT_ITEM + HYPER_POTION, EVENT_ROUTE_40_HIDDEN_HYPER_POTION

	def_object_events
	; npc who gives you razor claw for defeating them all 
	object_event 0, 0, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, 0, RazorScavengerScript, -1
;monica
	object_event  8, 10, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MonicaScript, -1
	smashrock_event  7, 11
	smashrock_event  6, 9
	smashrock_event  7, 8
; double edge 
	object_event 16, 27, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40FisherScript, -1
;scavengers
	object_event 13, 16, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmermHarold -1
	object_event 18, 33, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerSwimmermSimon, -1
	object_event  3, 19, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSwimmermRandall, -1
	object_event  9, 25, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSwimmermCharlie, -1
; beach NPCs
	object_event 11, 13, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route40Lass1Text, -1 ; redo text and heal you 
	object_event 13,  4, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route40Lass2Text, -1 ; redo text 
; roadblock NPCs, quarantine the city while they look for who took the part 
	object_event 0, 0, SPRITE_OFFICER,  SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineOfficerText, EVENT_BEAT_CHUCK ; redo text and heal you 
	object_event 0, 0, SPRITE_OFFICER,  SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, OlivineOfficerText, EVENT_BEAT_CHUCK ; redo text and heal you 


	object_const_def
	const ROUTE40_SCAVENGER

OlivineOfficerText:
	text "Olivine is in a"
	line "strict lockdown."
	
	para "We need to catch"
	line "a crook who took"
	para "a part from the"
	line "desal plant."
	done

RazorScavengerScript: ; check route 31 script if not working 
;	endifjustbattled
	checkevent EVENT_GOT_RAZOR_ITEM_ROUTE_40
	iftrue_jumptextfaceplayer .AfterText2
	faceplayer
	opentext
	checkevent EVENT_BEAT_SWIMMERM_GEORGE
	iftrue .Beaten
	checkevent EVENT_BEAT_SWIMMER_M_HAROLD
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_SWIMMER_M_SIMON
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_SWIMMER_M_RANDALL
	iffalse_jumpopenedtext .IntroText
	checkevent EVENT_BEAT_SWIMMER_M_CHARLIE
	iffalse_jumpopenedtext .IntroText
	writetext .QuestionText
	yesorno
	iffalse_jumpopenedtext .RefusedText
	writetext .SeenText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	setlasttalked ROUTE40_SCAVENGER
	loadtrainer SWIMMER_M, GEORGE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SWIMMERM_GEORGE
	opentext
.Beaten:
	writetext .AfterText1
	promptbutton
	verbosegiveitem RAZOR_CLAW
	iffalse_endtext
	setevent EVENT_GOT_RAZOR_ITEM_ROUTE_40
	jumpthisopenedtext

.AfterText2: ;  
	text "Without so many"
	line "boats around, it"
	cont "is safe to dive."
	
	para "The corals really"
	line "took a hit with"
	cont "the desal plant,"
	cont "though."
	done

.IntroText:;  
	text "The other scav-"
	line "engers are good"
	cont "divers, but not"
	
	para "so much battlers."
	line "If you beat them"
	cont "all, come talk to"
	para "me, so I can have"
	line "an interesting"
	cont "battle."
	
	done

.QuestionText:;  
	text "You defeated all"
	line "others!"
	
	para "Shall we battle?"
	line "If you win, I'll"
	para "give you a nice"
	line "item I found in"
	cont "a wreck."
	done

.RefusedText:;  
	text "Fine, I'll keep"
	line "my Razor Claw."
	done

.SeenText:;  
	text "Let's go!"
	done

.BeatenText:;  
	text "You're sharp!"
	done

.AfterText1:;  
	text "That was a rush!"
	line "Please take this."
	
	para "I found it in a"
	line "shipwreck."
	done
	


MonicaScript:
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue_jumptextfaceplayer MonicaGaveGiftText
	faceplayer
	opentext
	writetext MonicaGivesGiftText
	promptbutton
	verbosegivetmhm TM_ACROBATICS
	iffalse MonicaDoneScript
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	jumpopenedtext MonicaGaveGiftText

MonicaDoneScript:
	end

MonicaGivesGiftText:
	text "Monica: Glad to"
	line "meet you. I'm"
	cont "Monica of Monday."

	para "I wish I was like"
	line "a bird, dancing"

	para "above it all, not"
	line "a worry in my"
	cont "pocket."	

	para "That's why I use"
	line "this TM -"
	cont "Acrobatics!"
	done

MonicaGaveGiftText:
	text "That TM is best"
	line "if you're unteth-"
	cont "ered from the"
	para "complexities of"
	line "battle items."
	
	para "Take a load off"
	line "and see how good"
	cont "it feels!"
	done


Route40FisherScript: ; double edge 
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_DOUBLE_EDGE_INTRO
	iftrue Route40TutorDoubleEdgeScript
	writetext Text_DoubleEdgeIntro
	waitbutton
	setevent EVENT_LISTENED_TO_DOUBLE_EDGE_INTRO
Route40TutorDoubleEdgeScript:
	writetext Text_Route40TutorDoubleEdge ;;
	waitbutton
	checkitem SILVER_LEAF
	iffalse .NoSilverLeaf
	writetext Text_Route40TutorQuestion ;;
	yesorno
	iffalse .TutorRefused
	setval DOUBLE_EDGE
	writetext ClearText
	special Special_MoveTutor
	ifequal $0, .TeachMove
.TutorRefused
	jumpopenedtext Text_Route40TutorRefused ;; 

.NoSilverLeaf
	jumpopenedtext Text_Route40TutorNoSilverLeaf

.TeachMove
	takeitem SILVER_LEAF
	jumpopenedtext Text_Route40TutorTaught ;;
	
Text_DoubleEdgeIntro: 
	text "Technology is a"
	line "double-edged"
	cont "sword."
		
	para "Like a double-"
	line "edged sword, it"
	cont "cuts both ways."

	para "In Olivine, we"
	line "sailors once"
	cont "mended our own"
	cont "vessels."

	para "But now, complex"
	line "new models demand"
	cont "specialized hands."

	para "Ah, speaking of"
	line "double-edged..."

	done

Text_Route40TutorDoubleEdge:
	text "I can teach your"
	line "#mon to use"

	para "Double Edge, for"
	line "a Silver Leaf."
	done

Text_Route40TutorNoSilverLeaf:
	text "You don't have"
	line "a Silver Leaf."
	done

Text_Route40TutorQuestion:
	text "Should I teach"
	line "your #mon"
	cont "Double Edge?""
	
	done

Text_Route40TutorRefused:
	text "Wary of the cost?"
	line "A prudent choice"
	cont "for now, perhaps."
	done

Text_Route40TutorTaught:
	text "There - now you"
	line "can feel the dou-"
	cont "ble-edged sword"
	
	para "of progress for"
	line "yourself."
	done

GenericTrainerSwimmerfElaine:
	generictrainer SWIMMERF, ELAINE, EVENT_BEAT_SWIMMERF_ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText

	text "I'd say I'm a bet-"
	line "ter swimmer than"
	cont "you. Yeah!"
	done

GenericTrainerSwimmerfPaula:
	generictrainer SWIMMERF, PAULA, EVENT_BEAT_SWIMMERF_PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText

	text "While I float like"
	line "this, the waves"
	cont "carry me along."
	done

GenericTrainerSwimmermSimon:
	generictrainer SWIMMERM, SIMON, EVENT_BEAT_SWIMMERM_SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText

	text "Cianwood City is"
	line "a good distance"
	cont "away from here."
	done

GenericTrainerSwimmermRandall:
	generictrainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText

	text "Swimming exercises"
	line "your entire body."
	cont "It's healthy."
	done

SwimmermSimonSeenText:
	text "You have to warm"
	line "up before going"
	cont "into the water."

	para "That's basic."
	done

SwimmermSimonBeatenText:
	text "OK! Uncle! I give!"
	done

SwimmermRandallSeenText:
	text "Hey, you're young"
	line "and fit!"

	para "Don't ride your"
	line "#mon! Swim!"
	done

SwimmermRandallBeatenText:
	text "Uh-oh. I lost…"
	done

SwimmerfElaineSeenText:
	text "Are you going to"
	line "Cianwood?"

	para "How about a quick"
	line "battle first?"
	done

SwimmerfElaineBeatenText:
	text "I lost that one!"
	done

SwimmerfPaulaSeenText:
	text "No inner tube for"
	line "me."

	para "I'm hanging on to"
	line "a sea #mon!"
	done

SwimmerfPaulaBeatenText:
	text "Ooh, I'm feeling"
	line "dizzy!"
	done

Route40Lass1Text:
	text "Although you can't"
	line "see it from here,"

	para "Cianwood is across"
	line "the sea."
	done

Route40Lass2Text:
	text "I came to Olivine"
	line "by ship to see the"

	para "sights and soak up"
	line "the atmosphere."

	para "Being a port, it"
	line "feels so different"
	cont "from a big city."
	done

Route40SignText:
	text "Route 40"

	para "Cianwood City -"
	line "Olivine City"
	done
