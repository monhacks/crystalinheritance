AnarresHouse_MapScriptHeader:
	def_scene_scripts
	scene_script AnarresHouseTinyMushroomTrigger 

	def_callbacks


	def_warp_events
	warp_event  3,  7, ANARRES_TOWN, 3
	warp_event  4,  7, ANARRES_TOWN, 3

	def_coord_events


	def_bg_events ;todo add a journal or something
;	bg_event 22, 12, BGEVENT_JUMPTEXT, TinTowerSignText

	def_object_events
	object_event  5,  4, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AnarresHouseMushroomScript, -1 
	object_event  2,  4, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AnarresHouseHexManiacScript, -1 ; show spell tag, twistedspoon, blackglasses

	object_const_def
	const ANARRES_HOUSE_CHEF

AnarresHouseTinyMushroomTrigger:
	sdefer .TinyMushroomScript
	end
	
.TinyMushroomScript:
	showemote EMOTE_FISH, ANARRES_HOUSE_CHEF, 30
	setscene $1
	end
	

AnarresHouseMushroomScript: 
	checkevent EVENT_GOT_TINYMUSHROOM ;;TO ADD
	iftrue_jumptextfaceplayer GiveTinyMushroomText
	checkevent EVENT_GAVE_MINT_LEAF
	iftrue_jumptextfaceplayer GiveTinyMushroomText
	faceplayer
	opentext	
	writetext NeedAMintLeafText
	waitbutton
	checkitem MINT_LEAF
	iffalse NoMintLeaf
	writetext Text_MintLeafQuestion ;;
	yesorno
	iffalse MintLeafRefused
	takeitem SILVER_LEAF
	verbosegiveitem TINYMUSHROOM
	iffalse_endtext
	setevent EVENT_GOT_TINYMUSHROOM 
	jumpopenedtext GiveTinyMushroomText 

NeedAMintLeafText: 
	text "I moved here"
	line "from the landing."
	
	para "I tried to get"
	line "these people to"
	cont "appreciate the"
	cont "taste of fish,"
	cont "but they all say"
	cont "my breath smells."
	
	para "No one wants to"
	line "come over to"
	cont "eat. I picked"
	cont "two buckets"
	cont "of mushrooms!"
	
	para "Do you have any"
	line "item that might"
	cont "make my breath"
	cont "smell better?"	

	para "I'll give you a"
	line "savory mushroom"
	cont "if you do."
	done

Text_MintLeafQuestion:
	text "Oh! I smell it!"
	
	para "Would you please"
	line "trade me that"
	cont "Mint Leaf?"
	done

	
GiveTinyMushroomText: 
	text "Give that tiny-"
	line "mushroom to"
	cont "someone who"
	cont "needs to make"
	cont "a great dish."
	done
		
NoMintLeaf:
	jumpopenedtext Text_NoMintLeaf

MintLeafRefused:
	jumpopenedtext Text_NoMintLeaf

Text_NoMintLeaf:
	text "You don't?"
	line "That's sad."
	done

AnarresHouseHexManiacScript:
    faceplayer
    opentext
    checkevent EVENT_INTRODUCED_HEX_MANIAC
    iftrue .CheckPokemon
    writetext HexManiacIntroText
    setevent EVENT_INTRODUCED_HEX_MANIAC
    promptbutton
.CheckPokemon
    checkevent EVENT_GAVE_SPELL_TAG_ANARRES
    iftrue .CheckNatu
    writetext HexManiacAskGastlyText
    promptbutton
    checkpoke GASTLY
    iftrue .GiveSpellTag
    writetext HexManiacNoGastlyText
    waitbutton
    closetext
    end

.GiveSpellTag
    writetext HexManiacGiveSpellTagText
    promptbutton
    verbosegiveitem SPELL_TAG
    iffalse .BagFull
    setevent EVENT_GAVE_SPELL_TAG_ANARRES

.CheckNatu
    checkevent EVENT_GAVE_TWISTEDSPOON_ANARRES
    iftrue .CheckMurkrow
    writetext HexManiacAskNatuText
    promptbutton
    checkpoke NATU
    iftrue .GiveTwistedSpoon
    writetext HexManiacNoNatuText
    waitbutton
    closetext
    end

.GiveTwistedSpoon
    writetext HexManiacGiveTwistedSpoonText
    promptbutton
    verbosegiveitem TWISTEDSPOON
    iffalse .BagFull
    setevent EVENT_GAVE_TWISTEDSPOON_ANARRES

.CheckMurkrow
    checkevent EVENT_GAVE_BLACKGLASSES_ANARRES
    iftrue .AllDone
    writetext HexManiacAskMurkrowText
    promptbutton
    checkpoke MURKROW
    iftrue .GiveBlackGlasses
    writetext HexManiacNoMurkrowText
    waitbutton
    closetext
    end

.GiveBlackGlasses
    writetext HexManiacGiveBlackGlassesText
    promptbutton
    verbosegiveitem BLACKGLASSES
    iffalse .BagFull
    setevent EVENT_GAVE_BLACKGLASSES_ANARRES

.AllDone
    writetext HexManiacThankYouText
    waitbutton
    closetext
    end

.BagFull
    writetext HexManiacBagFullText
    waitbutton
    closetext
    end

HexManiacIntroText:
    text "I once guided"
    line "others through"
	cont "perilous waters"
	cont "using the stars"
	cont "and my third"
	cont "eye."
		
    para "But I left that"
	line "all behind when"
	cont "the Emperor took"
	cont "over our beach."
		
    para "Oh, how I miss"
	line "seeing into the"
	cont "spirit world."	
    done

HexManiacAskGastlyText:
    text "I long to see the"
    line "ghost type #-"
    cont "mon that avoids"
    cont "the wind."
	
	para "It would bring"
	line "me so much joy"
	cont "to see it just"
	cont "one more time."
    done

HexManiacNoGastlyText:
    text "Oh, the spirits"
    line "are silent. I"
    cont "cannot see that"
    cont "#mon yet."
    done

HexManiacGiveSpellTagText:
    text "Ah, Gastly! A"
    line "true specter."
    para "This Spell Tag"
    line "is now yours."
    done

HexManiacAskNatuText:
    text "I long to see the"
    line "psychic #mon"
    cont "that hops and"
    cont "stares."
    done

HexManiacNoNatuText:
    text "The future is"
    line "clouded. I cannot"
    cont "see that #mon"
    cont "yet."
    done

HexManiacGiveTwistedSpoonText:
    text "Natu! It sees"
    line "past and future."
    para "This TwistedSpoon"
    line "is yours now."
    done

HexManiacAskMurkrowText:
    text "I long to see the"
    line "dark #mon that"
    cont "stashes shiny"
    cont "objects."
    done

HexManiacNoMurkrowText:
    text "The darkness"
    line "doesn't reveal"
    cont "that #mon to"
    cont "me yet."
    done

HexManiacGiveBlackGlassesText:
    text "Murkrow! Ornery"
	line "familiar that"
	cont "led me down many"
	cont "unfamiliar paths."
	
	para "Ah, such memories."
	line "Thank you."
	
    para "These BlackGlass-"
    line "es are for you."
    done

HexManiacThankYouText:
    text "Thank you. I feel"
    line "more at home now."
    para "The spirits are"
    line "with us always."
    done

HexManiacBagFullText:
    text "Your Bag is full."
    line "The spirits can-"
    cont "not bless you"
    cont "right now."
    done
	