EarlsPokemonAcademy_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  5, 15, VIOLET_CITY, 3
	warp_event  4, 15, VIOLET_CITY, 3
	warp_event  2,  0, VIOLET_CITY, 8
	warp_event  3,  0, VIOLET_CITY, 9

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5, 12, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AcademyNPC1Text, -1
	object_event  1, 10, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSageEdmond, -1
	object_event  6,  8, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerSageTroy, -1
	object_event  1,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSageNeal, -1
	object_event  4,  3, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerElderLi, -1
	object_event  6,  14, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, AcademyKurtText, EVENT_BEAT_FALKNER

	object_const_def

AcademyNPC1Text:
	text "Young Falkner saw"
	line "the drought when"
	cont "others' eyes"
	cont "were clouded."

	para "But wisdom, like"
	line "water, can become"
	cont "stagnant if not"
	cont "flowing freely."

	para "Now his tower"
	line "stands tall, yet"
	cont "casts a long"
	cont "shadow."

	para "May he remember:"
	line "the highest trees"
	cont "have the deepest"
	cont "roots."
	done


GenericTrainerSageEdmond:
    generictrainer SAGE, EDMOND, EVENT_BEAT_SAGE_EDMOND, SageEdmondSeenText, SageEdmondBeatenText

    text "Most don't realize"
    line "Bellsprout roots"
    cont "are good for the"
    cont "ground."
    para "The drought was"
    line "an excuse to push"
    cont "us out."
    done

GenericTrainerSageTroy:
    generictrainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText

    text "The rain clouds"
    line "Falkner gathers…"
    para "They are misappro-"
    line "priated when he"
    cont "pushes them all"
    cont "to us in vain."
    done

GenericTrainerSageNeal:
    generictrainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText

    text "Our grass types"
    line "couldn't stand up"
    cont "to Falkner."
    para "But still we take"
    line "our job to honor"
    cont "#mon seriously."
    done

SageEdmondSeenText:
    text "Can you work"
    line "together with"
    cont "your #mon?"
    done

SageEdmondBeatenText:
    text "Yes, they are"
    line "working together."
    done

SageTroySeenText:
    text "Can you find a"
    line "silver lining?"
    done

SageTroyBeatenText:
    text "Your heart is"
    line "untarnished."
    done

SageNealSeenText:
    text "Our roots run"
    line "deep!"
    done

SageNealBeatenText:
    text "Bottomed out…"
    done

GenericTrainerElderLi:
    generictrainer ELDER, LI, EVENT_BEAT_ELDER_LI, ElderLiSeenText, ElderLiBeatenText

    text "Our grass types"
    line "couldn't stand up"
    cont "to Falkner."
    para "But still we take"
    line "our job to honor"
    cont "#mon seriously."
    done

ElderLiSeenText: 
	text "Seek Falkner? His"
	line "heart has strayed,"
	cont "chasing heights,"
	cont "forgetting roots."

	para "We guard his tower"
	line "not by choice, but"
	cont "duty. Yet I see a"
	cont "chance to shape"
	cont "his legacy."

	para "Can you be the"
	line "mirror Falkner"
	cont "needs? Show me,"
	cont "trainer!"
	done

ElderLiBeatenText:
	text "Your spirit speaks"
	line "volumes. You may"
	cont "pass. "

	para "Show him that true"
	line "power elevates"
	cont "all, not just self."
	done
	
AcademyKurtText: ; need to ask the player if htey want to hear a story
	text "This was your"
	line "dad's school."
	
	para "After class, we"
	line "walked around the"
	cont "ponds, your dad"
	cont "walking side by"
	cont "side with his"
	cont "partner, holding"
	cont "his apricorn."
	
	para "#seals were"
	line "pretty new back"
	cont "then, so we dec-"
	cont "orated it with"
	
	para "vibrant colors."
	line "Each scrape and"
	cont "chip in the coat"
	cont "was a memory of"
	cont "an adventure."
	
	para "At nights, I'd"
	line "find him under"
	cont "the covers, the"
	cont "glow of his ap-"
	cont "ricorn giving"
	cont "him away."
	done

