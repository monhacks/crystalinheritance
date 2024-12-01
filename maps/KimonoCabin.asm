KimonoCabin_MapScriptHeader: ; these people have all fled Capital for fear of losing their knowledge
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event  3, 9, HOLLYS_HOLT, 5
	warp_event  4, 9, HOLLYS_HOLT, 6

	def_coord_events



	def_bg_events
	bg_event  0, 0, BGEVENT_JUMPTEXT, KimonoCabinBookshelfText


	def_object_events ; sprites: cute_girl, lass, ace_trainer_f, matron, granny
	object_event  5,  6, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, KimonoCabin1Script, -1 ; "Vera" , revise dialogue to be a scared little girl
	; vera should figure out ways to INTERACT with the natural world
	; shiji is proud of her for learning how to interact with the world 

	object_event  2,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN,  OBJECTTYPE_SCRIPT, 0, KimonoCabin2Script, -1 ; " Piper", a young girl who wants to save the garden
	; trying to use a natural method to coax the hedgehog out
	; had just about to be promoted into the clan, now she needs to prove herself again 
	; cynical, wants to let the world burn and live in this perfect harmony 

	object_event  9,  4, SPRITE_ACE_TRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN,  OBJECTTYPE_SCRIPT, 0, KimonoCabin3Script, -1 ; "Samaria" , a  woman who is ready to face fears
	; fears of darkness and the unknown are inevitable, must journey into the unknown 
	; mad that piper uses all the hot water in the house
	; 

	object_event  6,  3, SPRITE_VETERAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED,  OBJECTTYPE_SCRIPT, 0, KimonoCabin4Script, -1 ; "Shiji" , an older woman who wants her vision to be accepted
	; sees herself losing faculties, so she must teach others to maintain the utopia
	; sad that people had already forgotten how to make apricorns 
	; optimistic that a better world is possible, unwilling to give up on people 

	object_event  3,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE,  OBJECTTYPE_SCRIPT, 0, KimonoCabin5Script, -1 
	; "Morphea", a granny who is aware of her limitations and unsure of how the future will be for her progeny, feels that she is suddenly adrift in time, and realizes that she can only help her children adapt rather than forcing them to take a certain path.
	; when she sees herself as a young girl again, she is able to see the actions of her parents for what they were, good and bad. 
	; she finds herself as a young child and with her own great-great-grandmother, learning how to make her own path
	
	; once all five of them are helped, they will say that Amos has come by, telling them that 
	; there is going to be a big event soon. The emperor is destroying books, and the only way
	; to preserve knowledge and wisdom is to etch it into stone. 

	object_event  7,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptext, KimonoCabinShijiNotebook1, EVENT_KIMONO_CABIN_DRATINI
	object_event  8,  4, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptext, KimonoCabinSamariaNotebook1, -1

	object_event  3,  5, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptext, KimonoCabinPiperNotebook1, -1
	object_event  4,  6, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptext, KimonoCabinVeraNotebook1, -1

	object_event  2,  2, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptext, KimonoCabinMorpheaNotebook1, EVENT_KIMONO_CABIN_MORPHEA_NOTEBOOK

	object_const_def


KimonoCabin1Script:
	faceplayer
	opentext
	checkevent EVENT_KIMONO_CABIN_DRATINI
	iftrue_jumpopenedtext Kimono1HelpedText
	writetext Kimono1AskHelpText
	yesorno
	iffalse_jumpopenedtext Kimono1DeclinedText
	writetext Kimono1ThanksForHelpingText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp KIMONO_CABIN_1, 18, 18
	end

Kimono1HelpedText:
	text "Vera: Hey cool"
	line "trainer!"
	cont "Thanks for your"
	cont "help."
	para "Great-grandma"
	line "Shiji is proud"
	cont "that I can"
	cont "rock smash now."
	done
	
Kimono1AskHelpText:
	text "Vera: Hi! My"
	line "name is Vera"
	cont "Mecti but you"
	para "can call me"
	line "Vera. Um, are"
	cont "you from"
	cont "Anarres?"
	para "Can you tell me"
	line "if it gets more"
	cont "fun here?"
	para "My great-"
	line "grandma Shiji"
	cont "made us move"
	cont "here, and now"
	para "I have chores."
	para "For instance I"
	line "have to go down"
	para "to fuh-reezing"
	line "cellar to clear"
	cont "rocks."
	para "And there's a"
	line "big scary worm"
	cont "just writhing"
	cont "around."
	para "Would you help"
	line "me? Pleeease?"
	done

Kimono1DeclinedText:
	text "Vera: Oh"
	line "brother... I'm"
	cont "never gonna"
	cont "make it here."
	done

Kimono1ThanksForHelpingText:
	text "Vera: Thanks!"
	line "Here, I'll show"
	cont "you the way."
	done
	

KimonoCabin2Script:
	faceplayer
	opentext
	checkevent EVENT_KIMONO_CABIN_LARVITAR
	iftrue_jumpopenedtext Kimono2HelpedText
	checkevent EVENT_BEAT_HOLLIS
	iffalse_jumpopenedtext Kimono2NotStrongEnoughText
	checkevent EVENT_KIMONO_CABIN_DRATINI
	iffalse_jumpopenedtext Kimono2NotStrongEnoughText
	writetext Kimono2AskHelpText
	yesorno
	iffalse_jumpopenedtext Kimono2DeclinedText
	writetext Kimono2ThanksForHelpingText
	waitbutton
	closetext
	clearevent EVENT_KIMONO_CABIN_POMEG_1
	clearevent EVENT_KIMONO_CABIN_POMEG_2
	clearevent EVENT_KIMONO_CABIN_POMEG_3
	clearevent EVENT_KIMONO_CABIN_POMEG_4
	clearevent EVENT_KIMONO_CABIN_POMEG_5
	clearevent EVENT_KIMONO_CABIN_POMEG_6
	clearevent EVENT_KIMONO_CABIN_POMEG_7
	clearevent EVENT_KIMONO_CABIN_POMEG_8
	clearevent EVENT_KIMONO_CABIN_POMEG_9
	clearevent EVENT_KIMONO_CABIN_POMEG_10
	clearevent EVENT_KIMONO_CABIN_POMEG_11
	clearevent EVENT_KIMONO_CABIN_POMEG_12
	clearevent EVENT_KIMONO_CABIN_POMEG_13
	clearevent EVENT_KIMONO_CABIN_POMEG_14
	clearevent EVENT_KIMONO_CABIN_POMEG_15
	clearevent EVENT_KIMONO_CABIN_POMEG_16
	clearevent EVENT_TALKED_TO_KIMONO_2_1
	clearevent EVENT_TALKED_TO_KIMONO_2_2
	clearevent EVENT_KIMONO_CABIN_REPEL ; new 
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp KIMONO_CABIN_2,  8, 11
	end

Kimono2HelpedText:
	text "Piper: Thanks"
	line "for your help"
	cont "out there."
	para "I wasn't sure"
	line "about that"
	cont "natural method"

	para "grandma Shiji"
	line "told me about."

	para "Maybe people"
	line "can learn,"
	cont "after all."
	done
	
Kimono2NotStrongEnoughText:
	text "Piper: It's so"
	line "unfair. My"
	cont "dancing was"
	para "about to get me"
	line "promoted, but"
	cont "now I'm here"
	para "thanks to that"
	line "dumb emperor"
	cont "and his"
	cont "supporters."
	para "Why does"
	line "grandma Shiji"
	cont "even bother"
	cont "with her notes?"
	para "Hey, tell you"
	line "what. I'm"
	cont "setting up a"
	cont "garden, but"
	para "have to coax"
	line "this weird"
	cont "hedgehog out"
	cont "of the ground."
	para "I would show"
	line "you how, but"
	cont "you don't look"
	para "like you could"
	line "handle it."
	done
	
Kimono2AskHelpText:
	text "Piper: It's so"
	line "unfair. My"
	cont "dancing was"
	para "about to get me"
	line "promoted, but"
	cont "now I'm here"
	para "thanks to that"
	line "dumb emperor"
	cont "and his"
	cont "supporters."
	para "Why does"
	line "grandma Shiji"
	cont "even bother"
	cont "with her notes?"
	para "Hey, tell you"
	line "what. I'm"
	cont "setting up a"
	cont "garden, but"
	para "have to coax"
	line "this weird"
	cont "hedgehog out"
	cont "of the ground."
	para "If I can teach"
	line "you, an out-"
	cont "sider, how to"
	para "use Shiji's"
	line "natural method,"
	para "then maybe"
	line "there will be"
	cont "hope for"
	cont "others."
	done

Kimono2DeclinedText:
	text "Piper: No?"
	line "Figures, enjoy"
	cont "living under"
	para "the emperor's"
	line "boots. We'll"
	cont "still be here,"
	para "living off the"
	line "land."
	done
	
Kimono2ThanksForHelpingText:
	text "Piper: OK,"
	line "Great! I'll"
	cont "show you the"
	cont "way to the"
	cont "garden."
	para "Don't screw"
	line "this up, OK?"
	done



	
KimonoCabin3Script: ; samaria 
	faceplayer
	opentext
	checkevent EVENT_KIMONO_CABIN_SNEASEL
	iftrue_jumpopenedtext Kimono3HelpedText
	checkevent EVENT_BEAT_BOBESH_STADIUM
	iffalse_jumpopenedtext Kimono3NotStrongEnoughText
	checkevent EVENT_KIMONO_CABIN_LARVITAR
	iffalse_jumpopenedtext Kimono3NotStrongEnoughText
	checkevent EVENT_KIMONO_CABIN_LARVITAR
	writetext Kimono3AskHelpText
	yesorno
	iffalse_jumpopenedtext Kimono3DeclinedText
	writetext Kimono3ThanksForHelpingText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp KIMONO_CABIN_3,  5, 27
	end

	; fears of darkness and the unknown are inevitable, must journey into the unknown 
	; mad that piper uses all the hot water in the house
	; 

Kimono3HelpedText:
	text "Samaria: Oh,"
	line "Good to see"
	cont "you."
	para "Thanks again"
	line "for your help"
	cont "in the attic."
	done

Kimono3NotStrongEnoughText:
	text "Samaria: Oh,"
	line "hello. Welcome"
	cont "to our cabin."
	para "Sorry if we"
	line "smell, my"
	cont "daughter Piper"
	para "keeps taking"
	line "all the hot"
	cont "water."
	para "Say, I stashed"
	line "some soaps in"
	cont "the attic, but"
	para "I hear some-"
	line "thing scratch-"
	cont "ing around up"
	cont "there."
	para "Oh, you look"
	line "pretty green..."
	para "I doubt you"
	line "could help."
	done
	
Kimono3AskHelpText:
	text "Samaria: Oh,"
	line "hello. Welcome"
	cont "to our cabin."
	para "Sorry if we"
	line "smell, my"
	cont "daughter Piper"
	para "keeps taking"
	line "all the hot"
	cont "water."
	para "Say, I stashed"
	line "some soaps in"
	cont "the attic, but"
	para "I hear some-"
	line "thing scratch-"
	cont "ing around up"
	cont "there."
	para "You look brave"
	line "- would you"
	cont "help me see"
	cont "what's up"
	cont "there?"
	done
	
Kimono3DeclinedText:
	text "Samaria: No?"
	line "Well, I suppose"
	cont "we can always"
	done

Kimono3ThanksForHelpingText:
	text "Samaria:"
	line "Thanks! I'll"
	cont "take you up"
	cont "there now."
	done



KimonoCabin4Script: ; shiji 
	faceplayer
	opentext
	checkevent EVENT_KIMONO_CABIN_LAPRAS
	iftrue_jumpopenedtext Kimono4HelpedText
	checkevent EVENT_BEAT_REI
	iffalse_jumpopenedtext Kimono4NotStrongEnoughText
	checkevent EVENT_KIMONO_CABIN_SNEASEL
	iffalse_jumpopenedtext Kimono4NotStrongEnoughText
	writetext Kimono4AskHelpText
	yesorno
	iffalse_jumpopenedtext Kimono4DeclinedText
	writetext Kimono4ThanksForHelpingText
	clearevent EVENT_SOLVED_KIMONO_4_SUDOKU ; 
	clearevent EVENT_EXPLAINED_SUDOKU
	waitbutton
	closetext
	; clearevents for the switches
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp KIMONO_CABIN_4,  6, 8
	end

; "Shiji" , an older woman who wants her vision to be accepted
	; sees herself losing faculties, so she must teach others to maintain the utopia
	; sad that people had already forgotten how to make apricorns 
	; optimistic that a better world is possible, unwilling to give up on people

Kimono4HelpedText:
	text "Shiji: Darling!"
	para "Thanks again"
	line "for your help"
	cont "in the garden."
	para "When you get"
	line "old and grey"
	cont "like me, make"
	cont "sure you teach"
	cont "someone else,"
	cont "hear?"
	done

Kimono4NotStrongEnoughText:
	text "Shiji: Darling!"
	line "A visitor!"
	para "I knew we would"
	line "have some soon"
	cont "enough."
	para "Have you come"
	line "to learn how to"
	cont "work with"
	cont "nature?"
	para "I'm setting up"
	line "a garden, but"
	cont "I'm not strong"
	para "enough to move"
	line "the landscaping"
	cont "around."
	para "Oh, but you"
	line "don't look"
	cont "strong enough"
	cont "..."
	para "maybe this"
	line "whole move was"
	cont "a bad idea."
	done

Kimono4AskHelpText:
	text "Oh Darling! A"
	line "visitor!"
	para "I knew we would"
	line "have some soon"
	cont "enough."
	para "Have you come"
	line "to learn how to"
	cont "work with"
	cont "nature?"
	para "I'm setting up"
	line "a garden, but"
	cont "I'm not strong"
	para "enough to move"
	line "the landscaping"
	cont "around."
	para "I can teach you"
	line "some landscap-"
	cont "ing to attract"
	cont "rare #mon."
	done

Kimono4DeclinedText:
	text "Really? That is"
	line "quite sad..."
	para "maybe the last"
	line "garden in Johto"
	cont "has already"
	cont "been tilled."
	done

Kimono4ThanksForHelpingText:
	text "Wonderful! You"
	line "won't regret"
	cont "it."
	para "Please come"
	line "with me!"
	done



KimonoCabin5Script: ; todo check that all others have been done
	faceplayer
	opentext
	checkevent EVENT_KIMONO_CABIN_EEVEE
	iftrue_jumpopenedtext Kimono5HelpedText
	checkevent EVENT_BEAT_KENSEY_DOCKS
	iffalse_jumpopenedtext Kimono5NotStrongEnoughText
	checkevent EVENT_KIMONO_CABIN_LAPRAS
	iffalse_jumpopenedtext Kimono5NotStrongEnoughText
	writetext Kimono5AskHelpText
	yesorno
	iffalse_jumpopenedtext Kimono5DeclinedText
	writetext Kimono5ThanksForHelpingText
	waitbutton
	closetext
	; clear events for the warps
	setevent EVENT_KIMONO_CABIN_5_GRANNY
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp KIMONO_CABIN_5,  8, 16
	end

	; "Morphea", a granny who is aware of her limitations and unsure of how the future will be for her progeny, feels that she is suddenly adrift in time, and realizes that she can only help her children adapt rather than forcing them to take a certain path.
	; when she sees herself as a young girl again, she is able to see the actions of her parents for what they were, good and bad. 
	; she finds herself as a young child and with her own great-great-grandmother, learning how to make her own path

Kimono5HelpedText:
	text "Morphea:"
	line "Thank you again"
	cont "for your help."
	para "We will be"
	line "leaving this"
	cont "cabin very"
	cont "soon..."
	para "my great-"
	line "grandson Amos"
	cont "tells me that"
	cont "the time is"
	cont "nigh to"
	para "inscribe our"
	line "knowledge"
	cont "across Johto."
	para "Others like us"
	line "are already"
	cont "started."
	done

Kimono5NotStrongEnoughText:
	text "Morphea:"
	line "stay still, my"
	cont "eyes are so"
	cont "bad."
	para "The only time I"
	line "see clearly is"
	cont "in my dreams."
	para "Every night, I"
	line "dream that I am"
	cont "adrift in the"
	cont "winds of fate"
	cont "..."
	para "But who has"
	line "time for dreams"
	cont "when my family"
	cont "still has such"
	cont "strife?"
	done
	
Kimono5AskHelpText:
	text "Morphea:"
	line "Stay still, my"
	cont "eyes are so"
	cont "bad."
	para "The only time I"
	line "see clearly is"
	cont "in my dreams."
	para "Every night, I"
	line "dream that I am"
	cont "adrift in the"
	cont "winds of fate"
	cont "..."
	para "Do you think"
	line "you can help me"
	cont "interpret it?"
	done

Kimono5DeclinedText:
	text "Morphea: Who "
	line  "could blame"
	cont "you... we can't"
	cont "force anyone to"
	cont "choose any"
	cont "path, I"
	cont "suppose."
	done

Kimono5ThanksForHelpingText:
	text "Morphea: "
	line "Oh, thank you."

	para "Here, rest your"
	line "hand on my head"
	cont "as I drift"
	cont "off..."
	done


KimonoCabinShijiNotebook1:
	text "Shiji's Journal: "
	line "Only a few months"
	cont "with access to"
	cont "#balls, and I"

	para "haven't seen a"
	line "single apricorn "
	cont "being crafted by"
	cont "anyone outside the"
	cont "Dance Theatre."

	para "Something must be"
	line "done to preserve"
	cont "this knowledge, in"
	cont "case we ever need"
	cont "it again!"
	done
	
KimonoCabinSamariaNotebook1:
	text "Samaria's Jour-"
	line "nal: I had forgot-"
	cont "ten just how hard"
	cont "manual labor is,"
	
	para "prior to the new"
	line "comforts he emp-"
	cont "eror delivered."
	
	para "Perhaps Shiji has"
	line "made a mistake in"
	cont "leaving the Cap-"
	cont "ital..."
	done
	

KimonoCabinPiperNotebook1:
	text "Piper's Journal:"
	line "Ugh! That Meiji,"
	cont "I was just about"
	cont "to be promoted!"
	
	para "He tries to build"
	line "up the city, but"
	cont "his methods make"
	cont "everyone reliant"
	cont "on him."
	
	para "My Amos and I, we"
	line "will not grow old"
	cont "without learning"
	cont "how to thrive in-"
	cont "depently of his"
	cont "exploitation."
	done


KimonoCabinVeraNotebook1:
	text "Vera's Journal:"
	line "At the cabin, ev-"
	cont "eryone but mom"
	cont "smells bad."
	
	para "And no one ever"
	line "dances anymore."
	
	para "And there isn't"
	line "any candy."
	
	para "Oh, the other day"
	line "I saw a cute Cyn-"
	cont "daquil in the"
	cont "forest."
	done

	
KimonoCabinMorpheaNotebook1:
	text "Morphea's Journ-"
	line "al: My daughter"
	cont "is so headstrong."
	
	para "Did she overreact,"
	line "were things really"
	cont "so bad there?"
	
	para "Did I raise her "
	line "properly to adapt"
	cont "to the world?"

	para "Is she adrift in"
	line "the world, or is"
	cont "she navigating it"
	cont "adeptly?"
	
	para "And now, this hum-"
	line "ble holt seems to"
	cont "be afflicted by "
	cont "the same tyranny"
	cont "as the capital."
	done

KimonoCabinBookshelfText:
	text "There's a lot"
	line "of books..."
	
	para "Sewing with silk,"
	line "Apricorn craft,"
	
	para "Dancing apart"
	line "from time..."
	done
