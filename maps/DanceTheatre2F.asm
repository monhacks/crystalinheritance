DanceTheatre_MapScriptHeader:
	def_scene_scripts

	def_callbacks


	def_warp_events


	def_coord_events

	def_bg_events


	def_object_events
	object_event  0,  3, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TheatreElderScript, EVENT_BEAT_RIVAL_ROUTE_42
	object_event  2,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerKimono_girlNaoko, EVENT_BEAT_RIVAL_ROUTE_42 ; LEAFEON, kimono girl 3 -- DONE 
	object_event  3,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerKimono_girlSayo, EVENT_BEAT_RIVAL_ROUTE_42 ; FLAREON, kimono girl 1 -- DONE 
	object_event  4,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerKimono_girlZuki, EVENT_BEAT_RIVAL_ROUTE_42 ; ESPEON, kimono girl 2 -- DONE 
	object_event  6,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerKimono_girlIzumi, EVENT_BEAT_RIVAL_ROUTE_42 ; VAPOREON, kimono girl 4  -- DONE
	object_event  7,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerKimono_girlKuni, EVENT_BEAT_RIVAL_ROUTE_42 ; GLACEON, kimono girl 4 -- DONE
	object_event  8,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerKimono_gir1Miki, EVENT_BEAT_RIVAL_ROUTE_42 ; UMBREON kimono girl 5 -- DONE 
	object_event 10,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerKimono_girlAkari, EVENT_BEAT_RIVAL_ROUTE_42 ; JOLTEON  kimono girl 1 -- DONE 
	


	object_const_def

TheatreElderScript:
	faceplayer
	opentext
	writetext DanceTheatre2F_EndShowText
	waitbutton
	yesorno
	iffalse_jumpopenedtext DanceTheatre2F_BreakALeg
	writetext DanceTheatre2F_TryAgainLaterText
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp DANCE_THEATRE, 0, 4
	end

DanceTheatre2F_EndShowText:
	text "Finished with"
	line "the show?"
	done

DanceTheatre2F_BreakALeg:
	text "Break a leg!"
	done

DanceTheatre2F_TryAgainLaterText:
	text "Come back soon!"
	done

GenericTrainerKimono_girlNaoko: ; leafeon 
	generictrainer KIMONO_GIRL_3, NAOKO, EVENT_BEAT_KIMONO_GIRL_NAOKO, Kimono_girl_1NaokoSeenText, Kimono_girl_1NaokoBeatenText

	text "The hero of old"
	line "hailed from"
	cont "Azalea town."
	para "The hero united"
	line "the town during"
	cont "a time when the"
	cont "forest was"
	cont "threatened."
	para "Say… you are"
	line "from Azalea,"
	cont "no?"
	done
Kimono_girl_1NaokoSeenText:
	text "Our story starts"
	line "deep in the"
	cont "forest, long"
	cont "ago!"
	done

Kimono_girl_1NaokoBeatenText:
	text "The hero of old"
	line "hailed from"
	cont "Azalea town."
	para "The hero united"
	line "the town during"
	cont "a time when the"
	cont "forest was"
	cont "threatened."
	para "Say… you are"
	line "from Azalea,"
	cont "no?"
	done

GenericTrainerKimono_girlSayo:
	generictrainer KIMONO_GIRL_1, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, Kimono_girl_1SayoSeenText, Kimono_girl_1SayoBeatenText

	text "When the nearby"
	line "town of Gauld-"
	cont "enrod was cast"
	cont "into pieces by"
	cont "the power-"
	cont "hungry emperor,"

	para "the hero showed"
	line "them their"
	cont "similar needs."
	done

Kimono_girl_1SayoSeenText:
	text "Trial by fire!"
	done

Kimono_girl_1SayoBeatenText:
	text "When the nearby"
	line "town of Gauld-"
	cont "enrod was cast"
	cont "into pieces by"
	cont "the power-"
	cont "hungry emperor,"

	para "the hero showed"
	line "them their"
	cont "similar needs."
	done

GenericTrainerKimono_girlZuki:
	generictrainer KIMONO_GIRL_2, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, Kimono_girl_1ZukiSeenText, Kimono_girl_1ZukiBeatenText

	text "The hero slipped"
	line "into the Western"
	cont "Capital, and"
	para "learned of the"
	line "emperor's plans"
	cont "without his"
	cont "knowing."
	para "At that time,"
	line "the towers were"
	cont "still home to"
	para "Lugia and Ho-Oh,"
	line "but Ho-Oh was"
	cont "growing restless"
	para "from the emper-"
	line "or's drumbeat"
	cont "of war."
	done

Kimono_girl_1ZukiSeenText:
	text "Stay one step"
	line "ahead!"
	done

Kimono_girl_1ZukiBeatenText:
	text "The hero slipped"
	line "into the Western"
	cont "Capital, and"
	para "learned of the"
	line "emperor's plans"
	cont "without his"
	cont "knowing."
	para "At that time,"
	line "the towers were"
	cont "still home to"
	para "Lugia and Ho-Oh,"
	line "but Ho-Oh was"
	cont "growing restless"
	para "from the emper-"
	line "or's drumbeat"
	cont "of war."
	done

GenericTrainerKimono_girlIzumi:
	generictrainer KIMONO_GIRL_4, IZUMI, EVENT_BEAT_KIMONO_GIRL_IZUMI, Kimono_girl_1IzumiSeenText, Kimono_girl_1IzumiBeatenText
	text "At that time, a"
	line "harsh storm kept"
	cont "boats out of"
	cont "the harbor."
	para "Now, the emperor"
	line "could only"
	cont "expand to the"
	cont "east."
	done

Kimono_girl_1IzumiSeenText:
	text "Strike like a"
	line "hurricane!"
	done

Kimono_girl_1IzumiBeatenText:
	text "At that time, a"
	line "harsh storm kept"
	cont "boats out of"
	cont "the harbor."
	para "Now, the emperor"
	line "could only"
	cont "expand to the"
	cont "east."
	done

GenericTrainerKimono_girlKuni:
	generictrainer KIMONO_GIRL_4, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, Kimono_girl_1KuniSeenText, Kimono_girl_1KuniBeatenText

	text "The hero made"
	line "a coalition"
	para "north of the"
	line "Lake of Rage to"
	cont "organize"
	cont "against the"
	cont "emperor."
	done

Kimono_girl_1KuniSeenText:
	text "Crystallize the"
	line "plan!"
	done

Kimono_girl_1KuniBeatenText:
	text "The hero made"
	line "a coalition"
	para "north of the"
	line "Lake of Rage to"
	cont "organize"
	cont "against the"
	cont "emperor."
	done
	
GenericTrainerKimono_gir1Miki:
	generictrainer KIMONO_GIRL_5, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, Kimono_girl_1MikiSeenText, Kimono_girl_1MikiBeatenText
	text "Back then, Mount"
	line "Mortar's volcan-"
	cont "ic activity was"

	para "a lightningrod"
	line "for the emper-"
	cont "or's self-"
	cont "aggrandizing."

	para "So the emperor's"
	line "reach was cut"
	cont "off from the"

	para "south, the west,"
	line "and the east."
	done

Kimono_girl_1MikiSeenText:
	text "Strike in the"
	line "dark!"
	done

Kimono_girl_1MikiBeatenText:
	text "Back then, Mount"
	line "Mortar's volcan-"
	cont "ic activity was"

	para "a lightningrod"
	line "for the emper-"
	cont "or's self-"
	cont "aggrandizing."

	para "So the emperor's"
	line "reach was cut"
	cont "off from the"

	para "south, the west,"
	line "and the east."
	done

GenericTrainerKimono_girlAkari:
	generictrainer KIMONO_GIRL_1, AKARI, EVENT_BEAT_KIMONO_GIRL_AKARI, Kimono_girl_1AkariSeenText, Kimono_girl_1AkariBeatenText

	text "Flames filled"
	line "the tower,"
	cont "undoing the"
	cont "emperor's work."
	para "The legendary"
	line "#mon refuse"
	cont "to put it out."
	para "Your #mon are"
	line "so strong, you"
	cont "should visit"
	para "the bell tower"
	line "to find out"
	cont "why…"
	done

Kimono_girl_1AkariSeenText:
	text "Impressive to"
	line "have made it"
	cont "this far. Do"
	cont "you know the"
	cont "ending of the"
	cont "story?"
	done

Kimono_girl_1AkariBeatenText:
	text "Flames filled"
	line "the tower,"
	cont "undoing the"
	cont "emperor's work."
	para "The legendary"
	line "#mon refuse"
	cont "to put it out."
	para "Your #mon are"
	line "so strong, you"
	cont "should visit"
	para "the bell tower"
	line "to find out"
	cont "why…"
	done

TheatreElderScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KIMONO_GIRL_AKARI
	iftrue_jumpopenedtext TheatreElderThanksYou
	writetext TheatreElderExplainsText
	clearevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	clearevent EVENT_BEAT_KIMONO_GIRL_SAYO
	clearevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	clearevent EVENT_BEAT_KIMONO_GIRL_IZUMI
	clearevent EVENT_BEAT_KIMONO_GIRL_KUNI
	clearevent EVENT_BEAT_KIMONO_GIRL_MIKI
	closetext
	applymovement THEATRE_ELDER, TheatreElderMovesBackMovement
	disappear THEATRE_ELDER
	end


TheatreElderThanksYou:
	text "Congratulations!"
	
	para "The final Kimono"
	line "girl will see you"
	cont "at the Bellchime"
	cont "Trail."
	done
	
TheatreElderExplainsText:
	text "We have a very"
	line "immersive dance"
	cont "these days."
	
	para "The Kimono Girls"
	line "battle you back"
	cont "to back, "
	
	para "delivering the "
	line "story of how a"
	cont "young child kept"
	cont "Johto from being"
	cont "ruled by an evil"
	cont "emperor!"
	done

TheatreElderMovesBackMovement:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
