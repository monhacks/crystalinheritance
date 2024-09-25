GoldenrodPPSpeechHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 7
	warp_event  3,  7, GOLDENROD_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  7,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  1,  4, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPPSpeechHouseFisherText, -1
	object_event  5,  3, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldenrodPPSpeechHouseLassText, -1
	object_event  5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokefanMScript, -1

GoldenrodPPSpeechHouseFisherText:
	text "Once while I was"
	line "battling, my"

	para "#mon couldn't"
	line "make any moves."

	para "The Power Points,"
	line "or PP, of its"

	para "moves were all"
	line "gone."
	done

GoldenrodPPSpeechHouseLassText:
	text "Sometimes, a"
	line "healthy #mon"

	para "may be unable to"
	line "use its moves."

	para "If that happens,"
	line "heal it at a #-"
	cont "mon Center or use"
	cont "an item."
	done

GoldenrodPokefanMScript:
    faceplayer
    opentext
    checkevent EVENT_INTRODUCED_POKEFAN_M
    iftrue .CheckPokemon
    writetext PokefanMIntroText
    setevent EVENT_INTRODUCED_POKEFAN_M
    promptbutton
.CheckPokemon
    checkevent EVENT_GAVE_METAL_COAT_GOLDENROD
    iftrue .CheckPrinplup
    writetext PokefanMAskOnixText
    promptbutton
    checkpoke ONIX
    iftrue .GiveMetalCoat
    writetext PokefanMNoOnixText
    waitbutton
    closetext
    end

.GiveMetalCoat
    writetext PokefanMGiveMetalCoatText
    promptbutton
    verbosegiveitem METAL_COAT
    iffalse .BagFull
    setevent EVENT_GAVE_METAL_COAT_GOLDENROD

.CheckPrinplup
    checkevent EVENT_GAVE_NEVERMELTICE_GOLDENROD
    iftrue .CheckYanma
    writetext PokefanMAskPrinplupText
    promptbutton
    checkpoke PRINPLUP
    iftrue .GiveNevermeltice
    writetext PokefanMNoPrinplupText
    waitbutton
    closetext
    end

.GiveNevermeltice
    writetext PokefanMGiveNevermelticeText
    promptbutton
    verbosegiveitem NEVERMELTICE
    iffalse .BagFull
    setevent EVENT_GAVE_NEVERMELTICE_GOLDENROD

.CheckYanma
    checkevent EVENT_GAVE_DRAGON_FANG_GOLDENROD
    iftrue .AllDone
    writetext PokefanMAskYanmaText
    promptbutton
    checkpoke YANMA
    iftrue .GiveDragonFang
    writetext PokefanMNoYanmaText
    waitbutton
    closetext
    end

.GiveDragonFang
    writetext PokefanMGiveDragonFangText
    promptbutton
    verbosegiveitem DRAGON_FANG
    iffalse .BagFull
    setevent EVENT_GAVE_DRAGON_FANG_GOLDENROD

.AllDone
    writetext PokefanMThankYouText
    waitbutton
    closetext
    end

.BagFull
    writetext PokefanMBagFullText
    waitbutton
    closetext
    end

PokefanMIntroText:
    text "You have a #-"
    line "dex? How cool!"
    para "I am trying to"
    line "fill mine out."
    para "I have a few"
    line "items to share,"
    cont "if you do."
    done

PokefanMAskOnixText:
    text "Do you have the"
    line "rock snake #-"
    cont "mon that evolves"
    cont "with a metal"
    cont "coat?"
    done

PokefanMNoOnixText:
    text "Oh darn! I really"
    line "wanted to see"
    cont "that #mon."
    done

PokefanMGiveMetalCoatText:
    text "Oh, an Onix!"
    line "Here, take this."
    done

PokefanMAskPrinplupText:
    text "Do you have any"
    line "#mon that look"
    cont "like they're"
    cont "dressed for a"
    cont "formal dance on"
    cont "an iceberg?"
    done

PokefanMNoPrinplupText:
    text "Oh darn! I really"
    line "wanted to see"
    cont "that #mon."
    done

PokefanMGiveNevermelticeText:
    text "A Prinplup! How"
    line "elegant! Here's"
    cont "a gift for you."
    done

PokefanMAskYanmaText:
    text "Do you have the"
    line "bug #mon that"
    cont "buzzes like a"
    cont "dragon?"
    done

PokefanMNoYanmaText:
    text "Oh darn! I really"
    line "wanted to see"
    cont "that #mon."
    done

PokefanMGiveDragonFangText:
    text "Ah, a Yanma!"
    line "Take this, it"
    cont "might be useful."
    done

PokefanMThankYouText:
    text "Thank you for"
    line "helping me fill"
    cont "out my #dex!"
    done

PokefanMBagFullText:
    text "Oh, your Bag is"
    line "full. Make some"
    cont "space and come"
    cont "back!"
    done