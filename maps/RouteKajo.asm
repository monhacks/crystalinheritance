RouteKajo_MapScriptHeader: ; trainer parties, check warps
    def_scene_scripts

    def_callbacks
	callback MAPCALLBACK_OBJECTS, RouteKajoCallback_GirlAppears

    def_warp_events ; DONE
    warp_event 6, 32, GOLDENROD_MAGNET_TRAIN_STATION, 4
    warp_event 6, 33, GOLDENROD_MAGNET_TRAIN_STATION, 5
    warp_event 41, 5, KAJO_ACQUIFER, 1
    warp_event 48, 13, KAJO_ACQUIFER, 1 
	warp_event 55, 30, MAGNET_TRAIN_TUNNEL, 1
	warp_event 55, 31, MAGNET_TRAIN_TUNNEL, 2
    warp_event 23, 19, KAJO_CABIN, 1
    warp_event 55, 18, RUINS_OF_ALPH_OUTSIDE, 11
    warp_event 55, 19, RUINS_OF_ALPH_OUTSIDE, 12

    def_coord_events ; done

    def_bg_events
    bg_event 26, 28, BGEVENT_ITEM + HYPER_POTION, EVENT_ROUTE_KAJO_HIDDEN_HYPER_POTION
    bg_event  3,  5, BGEVENT_ITEM + FULL_RESTORE, EVENT_ROUTE_KAJO_HIDDEN_FULL_RESTORE
    bg_event 46, 12, BGEVENT_ITEM + REVIVE, EVENT_ROUTE_KAJO_HIDDEN_REVIVE
    bg_event 56, 28, BGEVENT_ITEM + NUGGET, EVENT_ROUTE_KAJO_HIDDEN_NUGGET
    bg_event 16, 29, BGEVENT_JUMPTEXT, RouteKajoPetroglyph1
    bg_event 24, 27, BGEVENT_JUMPTEXT, RouteKajoPetroglyph2
    bg_event 36, 17, BGEVENT_JUMPTEXT, RouteKajoPetroglyph3
    bg_event  8, 21, BGEVENT_JUMPTEXT, RouteKajoPetroglyph4
    bg_event  8, 32, BGEVENT_JUMPTEXT, RouteKajoSignpost
    bg_event 21, 21, BGEVENT_JUMPTEXT, RouteKajoCabinSign

    
	def_object_events
    object_event 48, 15, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, LostKajoGirlScript, EVENT_TALKED_TO_LOST_KAJO_GIRL ; 	
    object_event 10, 23, SPRITE_CAMPER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, TrainerCamperBarryScript, -1;
    object_event 12, 17, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, TrainerPicnickerTiffanyScript, -1;
    object_event 19, 27, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, TrainerHikerBenjaminScript, -1;
    object_event 35, 18, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, TrainerHikerErikScript, -1;
    object_event 27, 13, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, TrainerHikerMichaelScript, -1;
    object_event  7, 8, SPRITE_VETERAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 0, TrainerVeteran_MMatthewScript, -1;
	pokemon_event  6, 8, CROCONAW, -1, -1, PAL_NPC_BLUE, KajoFeraligatrText, -1	;
    object_event 42, 15, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, TrainerBreederJodyScript, -1;
    object_event 57,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, TrainerPokefan_MRobertScript, -1;
    object_event 54, 17, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, TrainerSchoolgirlFaithScript, -1;
	; NEED TO PLACE THESE?
	itemball_event  7, 27, REVIVE, 1, EVENT_KAJO_REVIVE2 ;ok
	itemball_event 41, 24, SUPER_POTION, 1, EVENT_KAJO_POTION2 ;ok
	itemball_event 32,  6, ETHER, 1, EVENT_KAJO_ETHER ;ok
	itemball_event 33, 15, ELIXIR, 1, EVENT_KAJO_ELIXIR ;ok
	tmhmball_event 50,  1, TM_STEEL_WING, EVENT_GOT_TM47_STEEL_WING ; ok 
    object_event 16, 30, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RouteKajoHollowRockScript, -1

	object_const_def
	const KAJO_SCHOOLGIRL

RouteKajoCallback_GirlAppears: ; shouldn't appear until you talk to the dad in the cabin
	checkevent EVENT_TALKED_TO_CABIN_DAD
	iftrue .Skip
	disappear KAJO_SCHOOLGIRL
	endcallback

.Skip:
	endcallback

TrainerCamperBarryScript:
    generictrainer CAMPER, BARRY, EVENT_BEAT_CAMPER_BARRY, CamperBarrySeenText, CamperBarryBeatenText

    text "Now I'm even more"
    line "lost."
    done

TrainerPicnickerTiffanyScript:
    generictrainer PICNICKER, TIFFANY1, EVENT_BEAT_PICNICKER_TIFFANY, PicnickerTiffanySeenText, PicnickerTiffanyBeatenText

    text "My #mon are"
    line "tired. We've been"
    cont "going in circles"
    cont "for hours."
    done

TrainerHikerBenjaminScript:
    generictrainer HIKER, BENJAMIN, EVENT_BEAT_HIKER_BENJAMIN, HikerBenjaminSeenText, HikerBenjaminBeatenText

    text "Watch out for"
    line "sliding rock. It"
    cont "might block your"
    cont "path."
    done

TrainerHikerErikScript:
    generictrainer HIKER, ERIK, EVENT_BEAT_HIKER_ERIK, HikerErikSeenText, HikerErikBeatenText

    text "Make sure you"
    line "bring a liter of"
    cont "water per hour!"
    done

TrainerHikerMichaelScript:
    generictrainer HIKER, MICHAEL, EVENT_BEAT_HIKER_MICHAEL, HikerMichaelSeenText, HikerMichaelBeatenText

    text "I like to camp out"
    line "here. It's easy to"
    cont "get into my own"
    cont "mind."
    done

TrainerVeteran_MMatthewScript:
    generictrainer VETERANM, MATT, EVENT_BEAT_VETERANM_MATT, Veteran_MMatthewSeenText, Veteran_MMatthewBeatenText

    text "I'm just giving"
    line "you a hard time."
    cont "There's no permit"
    cont "required here."
    done

TrainerBreederJodyScript:
    generictrainer BREEDER, JODY, EVENT_BEAT_BREEDER_JODY, BreederJodySeenText, BreederJodyBeatenText

    text "I left when the"
    line "power went out."
    cont "I've never seen"
    cont "the coast from up"
    cont "here before."
    done

TrainerPokefan_MRobertScript:
    generictrainer POKEFANM, ROBERT, EVENT_BEAT_POKEFANM_ROBERT, Pokefan_MRobertSeenText, Pokefan_MRobertBeatenText

    text "I didn't realize"
    line "how out of shape"
    cont "I was. I need to"
    cont "come out here"
    cont "more often."
    done

TrainerSchoolgirlFaithScript:
    generictrainer SCHOOLGIRL, FAITH, EVENT_BEAT_SCHOOLGIRL_FAITH, SchoolgirlFaithSeenText, SchoolgirlFaithBeatenText

    text "The ruins of Alph"
    line "are just below."
    cont "You should check"
    cont "them out."
    done

CamperBarrySeenText:
    text "Can you read a"
    line "compass? If I win,"
    cont "you have to help"
    cont "me out."
    done

CamperBarryBeatenText:
    text "Now I'm even more"
    line "lost."
    done

PicnickerTiffanySeenText:
    text "Hey, you've got"
    line "some fresh"
    cont "#mon!"
    done

PicnickerTiffanyBeatenText:
    text "More fresh than"
    line "mine."
    done

HikerBenjaminSeenText:
    text "Whoa, rock slide!"
    done

HikerBenjaminBeatenText:
    text "Ground to dust."
    done

HikerErikSeenText:
    text "Do you have"
    line "enough water?"
    done

HikerErikBeatenText:
    text "You're doing"
    line "great!"
    done

HikerMichaelSeenText:
    text "You're a light"
    line "traveler!"
    done

HikerMichaelBeatenText:
    text "Not weighed down"
    line "by anything."
    done

Veteran_MMatthewSeenText:
    text "Do you have a"
    line "trail pass?"
    done

Veteran_MMatthewBeatenText:
    text "You look more"
    line "than capable."
    done

BreederJodySeenText:
    text "Did you also come"
    line "from Goldenrod?"
    done

BreederJodyBeatenText:
    text "Lots of people"
	line "are hiking. I"
	cont "even saw a"
	cont "little girl"
	cont "headed up to"
	cont "the peak."
    done

Pokefan_MRobertSeenText:
    text "Huff… puff… I"
    line "challenge… you!"
    done

Pokefan_MRobertBeatenText:
    text "I need to do more"
    line "cardio."
    done

SchoolgirlFaithSeenText:
    text "Into the unown!"
    done

SchoolgirlFaithBeatenText:
    text "The ruins of Alph"
    line "are just below."
    cont "You should check"
    cont "them out."
    done

RouteKajoPetroglyph1:
RouteKajoPetroglyph2:
RouteKajoPetroglyph3:
RouteKajoPetroglyph4:
    text "It's a petroglyph"
    line "worn into the"
    cont "rock. It looks"
    cont "like an Unown."
    done

RouteKajoSignpost:
    text "Danger: Stay off"
    line "of magnet train"
    cont "tracks!"
    done
	
LostKajoGirlScript:
	faceplayer
	opentext
	writetext LostKajoGirlText
	promptbutton
	closetext
	setevent EVENT_TALKED_TO_LOST_KAJO_GIRL
	end
	
LostKajoGirlText:
	text "It is so fun"
	line "to play here!"
	
	para "Oh? My dad is"
	line "worried about"
	cont "me? I probably"
	cont "should get back."
	done

KajoFeraligatrText:
	text "Feraligatr:"
	line "Snarl..."
	done

RouteKajoCabinSign:
    text "Cozy Cabin"
	para "Weary travelers"
	line "welcome"	
    done

RouteKajoHollowRockScript:
	faceplayer
	opentext
	writetext PearlForHollowRockText ;;
	waitbutton
	checkitem BIG_PEARL
	iffalse .NoBigPearl
	writetext PearlForHollowRockQuestionText ;;
	yesorno
	iffalse .NoBigPearl
	takeitem BIG_PEARL
	giveapricorn GEODE, 5 ; ez mode
	jumpopenedtext PearlForHollowRockEndText ;;

.NoBigPearl
	jumpopenedtext NoPearlForHollowRockText ;;

PearlForHollowRockText:
	text "Not many people"
	line "know, but Johto"
	cont "used to be very"
	para "active, volcanic-"
	line "ally speaking."
	
	para "The igneous rocks"
	line "uncovered by the"
	cont "railroad tunnel"
	para "are irrefutable"
	line "proof!"
	
	para "Take this Hollow"
	line "Rock. It's proof"
	cont "that geologic"
	para "soup bubbled to"
	line "the surface, and"
	para "its dissolved gas"
	line "made a perfect"
	para "spherical cavity"
	line "when it cooled."

	done

PearlForHollowRockQuestionText:
	text "If I was a rock"
	line "type #mon, I"
	cont "would love to"
	para "live in these."
	line "I'll trade you"
	cont "some of mine for"
	cont "a BIG PEARL."	
	done

PearlForHollowRockEndText:
	text "<PLAYER> got 5"
	line "HOLLOW ROCK."
	
	para "The story of the"
	line "Earth's past is"
	cont "written in stone!"
	done

NoPearlForHollowRockText:
	text "You can find big"
	line "pearls just by "
	cont "fishing anywhere."
	done
