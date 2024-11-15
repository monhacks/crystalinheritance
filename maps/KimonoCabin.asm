KimonoCabin_MapScriptHeader: ; these people have all fled Capital for fear of losing their knowledge
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event  3, 9, HOLLYS_HOLT, 5
	warp_event  4, 9, HOLLYS_HOLT, 6

	def_coord_events



	def_bg_events



	def_object_events ; sprites: cute_girl, lass, ace_trainer_f, matron, granny
	object_event  5,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, KimonoCabin1Script, -1 ; "Vera" , revise dialogue to be a scared little girl
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

	object_event  7,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptext, KimonoCabinShijiNotebook1, -1
	object_event  8,  4, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptext, KimonoCabinSamariaNotebook1, -1

	object_event  3,  5, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptext, KimonoCabinPiperNotebook1, -1
	object_event  7,  3, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptext, KimonoCabinVeraNotebook1, -1

	object_event  4,  2, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_COMMAND, jumptext, KimonoCabinMorpheaNotebook1, -1

	object_const_def


KimonoCabin1Script:
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
	text "Vera: Hey cool trainer! Thanks for your help. My grandma Shiji is proud that I can rock smash now. 
	done
	
Kimono1AskHelpText:
	text "Vera: Hi! My name is Vera Mecti but you can call me Vera. Um, are you from Anarres? Can you tell me if it gets more fun here? My great-grandma Shiji made us move here, and now I have chores. 
	For instance I have to go down to fuh-reezing cellar to clear rocks. And there's a big scary worm just writhing around. Would you help me? Pleeease?"
	
	
	done

Kimono1DeclinedText:
	text "Vera: Oh brother...  I'm never gonna make it here.
	done
	
Kimono1ThanksForHelpingText:
	text "Vera: Thanks! Here, I'll show you the way. 
	
	done
	
KimonoCabin2Script:
	opentext
	checkevent EVENT_KIMONO_CABIN_LARVITAR
	iftrue_jumpopenedtext Kimono2HelpedText
	checkevent EVENT_BEAT_HOLLIS
	ifflase_jumpopenedtext Kimono2NotStrongEnoughText
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

Kimono2HelpedText: ; piper
	text "Piper: Thanks for your help out there. I wasn't sure about that natural method grandma Shiji told me about. Maybe people can learn, after all.
	done


	; trying to use a natural method to coax the hedgehog out
	; had just about to be promoted into the clan, now she needs to prove herself again 
	; cynical, wants to let the world burn and live in this perfect harmony 

Kimono2NotStrongEnoughText:
	text "Piper: It's so unfair. My dancing was about to get me promoted, but now I'm here thanks to that dumb emperor and his supporters. Why does grandma Shiji even bother with her notes? 
	Hey, tell you what. I'm setting up a garden, but have to coax this weird hedgehog out of the ground. 
	I would show you how, but you don't look like you could handle it. 
	
	done
	

Kimono2AskHelpText:
	text "Piper: It's so unfair. My dancing was about to get me promoted, but now I'm here thanks to that dumb emperor and his supporters. Why does grandma Shiji even bother with her notes? 
	Hey, tell you what. I'm setting up a garden, but have to coax this weird hedgehog out of the ground. 
	If I can teach you, an outsider, how to use Shiji's natural method, then maybe there will be hope for others.
	
	done

Kimono2DeclinedText:
	text "No? Figures, enjoy living under the emperor's boots. We'll still be here, living off the land. 
	
	done

Kimono2ThanksForHelpingText:
	text "OK, Great! I'll show you the way to the garden. 
	Don't screw this up, OK?
	done


	
KimonoCabin3Script: ; samaria 
	opentext
	checkevent EVENT_KIMONO_CABIN_SNEASEL
	iftrue_jumpopenedtext Kimono3HelpedText
	checkevent EVENT_BEAT_BOBESH_STADIUM
	ifflase_jumpopenedtext Kimono3NotStrongEnoughText
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
	text "Samaria: Oh, Player! Good to see you. Thanks again for your help in the attic. 
	done

Kimono3NotStrongEnoughText:
	text "Samaria: Oh, hello. Welcome to our cabin. Sorry if we smell, my daughter Piper keeps taking all the hot water. Say, I stashed some soaps in the attic, but I hear something scratching around up there. Oh, you look pretty green... I doubt you could help.
	

Kimono3AskHelpText:
	text "Samaria: Oh, hello. Welcome to our cabin. Sorry if we smell, my daughter Piper keeps taking all the hot water. Say, I stashed some soaps in the attic, but I hear something scratching around up there. You look brave - would you help me see what's up there?

Kimono3DeclinedText:
	text "Samaria: No? Well, I suppose we can always 

Kimono3ThanksForHelpingText:
	text "Samari: Thanks! I'll take you up there now. 
	done



KimonoCabin4Script: ; shiji 
	opentext
	checkevent EVENT_KIMONO_CABIN_LAPRAS
	iftrue_jumpopenedtext Kimono4HelpedText
	checkevent EVENT_BEAT_REI
	ifflase_jumpopenedtext Kimono4NotStrongEnoughText
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
	text "Oh Darling!"
	
	para "Thanks again for"
	line "your help in the"
	cont "garden."

	para "When you get old and grey like me, make sure you teach someone else, hear?

	done

Kimono4NotStrongEnoughText:
	Shiji: Oh Darling! A visitor! I knew we would have some soon enough. 
	Have you come to learn how to work with nature? 
	I'm setting up a garden, but I'm not strong enough to move the landscaping around. 
	Oh, but you don't look strong enough... maybe this whole move was a bad idea. 

	

Kimono4AskHelpText:
	Shiji: Oh Darling! A visitor! I knew we would have some soon enough. 
	Have you come to learn how to work with nature? 
	I'm setting up a garden, but I'm not strong enough to move the landscaping around. 
	I can teach you some landscaping to attract rare pokemon. 
	
	
	done

Kimono4DeclinedText:
	Shiji: really? That is quite sad... maybe the last garden in Johto has already been tilled. 


Kimono4ThanksForHelpingText:
	Shiji: wonderful! You won't regret it. Please come with me!



KimonoCabin5Script: ; todo check that all others have been done
	opentext
	checkevent EVENT_KIMONO_CABIN_EEVEE
	iftrue_jumpopenedtext Kimono5HelpedText
	checkevent EVENT_BEAT_KENSEY_DOCKS
	ifflase_jumpopenedtext Kimono5NotStrongEnoughText
	writetext Kimono5AskHelpText
	yesorno
	iffalse_jumpopenedtext Kimono5DeclinedText
	writetext Kimono5ThanksForHelpingText
	waitbutton
	closetext
	; clear events for the warps
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp KIMONO_CABIN_5,  8, 16
	end

	; "Morphea", a granny who is aware of her limitations and unsure of how the future will be for her progeny, feels that she is suddenly adrift in time, and realizes that she can only help her children adapt rather than forcing them to take a certain path.
	; when she sees herself as a young girl again, she is able to see the actions of her parents for what they were, good and bad. 
	; she finds herself as a young child and with her own great-great-grandmother, learning how to make her own path

Kimono5HelpedText:
Morphea: Oh, child. Thank you again for your help. We will be leaving this cabin very soon... my great-grandson Amos tells me that the time is nigh to inscribe our knowledge across Johto. Others like us are already started. 

Kimono5NotStrongEnoughText:
Morphea: 
Oh, child... stay still, my eyes are so bad. The only time I see clearly is in my dreams. Every night, I dream that I am adrift in the winds of fate... 
But who has time for dreams when my family still has such strife?
	

Kimono5AskHelpText:
Oh, child... stay still, my eyes are so bad. The only time I see clearly is in my dreams. Every night, I dream that I am adrift in the winds of fate... Do you think you can help me interpret it? 

Kimono5DeclinedText:
Who can blame you... we can't force anyone to choose any path, I suppose. 


Kimono5ThanksForHelpingText:
Oh, thank you... Here, rest your hand on my head as I drift off...


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

	