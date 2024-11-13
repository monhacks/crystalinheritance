KimonoCabin_MapScriptHeader: ; should be like  "BurnedTowerB1F_MapScriptHeader"
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event  3, 9, HOLLYS_HOLT, 5
	warp_event  4, 9, HOLLYS_HOLT, 6

	def_coord_events



	def_bg_events



	def_object_events
	object_event  3,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE,  OBJECTTYPE_SCRIPT, 0, KimonoCabin5Script, -1

	object_event  5,  6, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE,  OBJECTTYPE_SCRIPT, 0, KimonoCabin1Script, -1
	object_event  9,  4, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN,  OBJECTTYPE_SCRIPT, 0, KimonoCabin3Script, -1
	object_event  2,  5, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN,  OBJECTTYPE_SCRIPT, 0, KimonoCabin2Script, -1
	object_event  6,  3, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED,  OBJECTTYPE_SCRIPT, 0, KimonoCabin4Script, -1


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
	text "Oh Darling!"
	
	para "Thanks again for"
	line "clearing out my"
	cont "cellar."
	done
	
Kimono1AskHelpText:
	text "Oh Darling!"
	
	para "You seem like a"
	line "young person that"
	cont "is dependable."
	
	para "I built a cellar"
	line "deep below ground"
	cont "to store food for"
	cont "the winter."
	
	para "But I think a"
	line "little worm is"
	cont "in there, I hear"
	cont "it writhing."
	
	para "I would go, but"
	line "I'm too squeamish."
	
	para "Could you go to"
	line "clear it for me?"
	done

Kimono1DeclinedText:
	text "No? It might be"
	line "worth your while."
	done
	
Kimono1ThanksForHelpingText:
	text "Thank you! I'll"
	line "escort you down"
	cont "to the cellar."
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

Kimono2HelpedText:
	text "Oh Darling!"
	
	para "Thanks again for"
	line "your help in the"
	cont "woods."
	done

Kimono2NotStrongEnoughText:
	text "Oh Darling!"
	
	para "When I was out in"
	line "the forest, I saw"
	cont "a little hedgehog."
	
	para "If you were a bit"
	line "stronger, you"
	cont "could help me."
	done
	

Kimono2AskHelpText:
	text "Oh Darling!"
	
	para "When I was in the"
	line "forest, I heard"
	cont "a little creature"
	cont "burrowing."
	
	para "If I don't take"
	line "care of it now,"
	cont "it'll wreck the"
	cont "garden."
	
	para "Will you help me"
	line "root it out?"
	done

Kimono2DeclinedText:
	text "No? Let me know"
	line "if you change"
	cont "your mind."
	done

Kimono2ThanksForHelpingText:
	text "Thank you! Let's"
	line "go, I'll show you"
	cont "where I found it."
	done

DumpThoseRepelsText:
	text "Oh Darling."
	
	para "The forest is so"
	line "sensitive, you"
	cont "should get rid of"
	cont "all your repels"
	cont "before we go."
	done
	
KimonoCabin3Script:
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

Kimono3HelpedText:
	text "Oh Darling!"
	
	para "Thanks again for"
	line "your help in the"
	cont "attic."
	done

Kimono3NotStrongEnoughText:
	text "Oh Darling!"

	para "Some creature has"
	line "climbed into the"
	cont "attic."
	
	
	para "If you were a bit"
	line "stronger, you"
	cont "could help me."
	done
	

Kimono3AskHelpText:
	text "Oh Darling!"
	
	para "Some creature has"
	line "climbed into the"
	cont "attic."
	
	para "It drove out the"
	line "resident pidgeys"
	cont "who were living"
	cont "in the rafters!"
	
	para "Will you help me"
	line "get it out?"
	
	done

Kimono3DeclinedText:
	text "No? Let me know"
	line "if you change"
	cont "your mind."
	done

Kimono3ThanksForHelpingText:
	text "Thank you! Let's"
	line "go, I'll take"
	cont "you up there."
	done



KimonoCabin4Script:
	opentext
	checkevent EVENT_KIMONO_CABIN_LAPRAS
	iftrue_jumpopenedtext Kimono4HelpedText
	checkevent EVENT_BEAT_REI
	ifflase_jumpopenedtext Kimono4NotStrongEnoughText
	writetext Kimono4AskHelpText
	yesorno
	iffalse_jumpopenedtext Kimono4DeclinedText
	writetext Kimono4ThanksForHelpingText
	waitbutton
	closetext
	; clearevents for the switches
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp KIMONO_CABIN_4,  6, 8
	end


Kimono4HelpedText:
	text "Oh Darling!"
	
	para "Thanks again for"
	line "your help in the"
	cont "garden."
	done

Kimono4NotStrongEnoughText:
	text "Oh Darling!"

	para "I'm working on a"
	line "landscaping in"
	cont "the garden,"
	
	para "but I need an"
	line "extra set of"
	cont "hands."
	
	para "If you were a bit"
	line "stronger, you"
	cont "could help me."
	done
	

Kimono4AskHelpText:
	text "Oh Darling!"
	
	para "I'm working on a"
	line "landscaping in"
	cont "the garden,"
	
	para "but I need an"
	line "extra set of"
	cont "hands."
	
	para "Could you help"
	line "me arrange a bea-"
	cont "utiful garden"
	cont "to attract some"
	cont "rare #mon?"
	done

Kimono4DeclinedText:
	text "No? Let me know"
	line "if you change"
	cont "your mind."
	done

Kimono4ThanksForHelpingText:
	text "Thank you! Let's"
	line "go, I'll show"
	cont "you the way."
	done


KimonoCabin5Script:
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


Kimono5HelpedText:
	text "Oh Darling!"
	
	para "Thanks again for"
	line "your help in the"
	cont "garden."
	done

Kimono5NotStrongEnoughText:
	text "Oh Darling!"
	
	para "I keep having the"
	line "same dream."
	
	para "I'm in a bright"
	line "room, but can't"
	cont "seem to find my"
	cont "way."
	
	para "Come back when"
	line "you're a bit"
	cont "wiser, and you"
	cont "can help me to"
	cont "interpet it."
	done
	

Kimono5AskHelpText:
	text "Oh Darling!"
	
	para "I keep having the"
	line "same dream."
	
	para "I'm in a bright"
	line "room, but can't"
	cont "seem to find my"
	cont "way."
	
	para "Can you help me"
	line "interpret this"
	cont "dream?"
	done

Kimono5DeclinedText:
	text "No? Let me know"
	line "if you change"
	cont "your mind."
	done

Kimono5ThanksForHelpingText:
	text "Thank you!"
	
	para "I first fall as-"
	line "leep, and then..."
	done
