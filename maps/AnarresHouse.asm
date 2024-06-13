AnarresHouse_MapScriptHeader:
	def_scene_scripts
	scene_script AnarresHouseTinyMushroomTrigger 

	def_callbacks


	def_warp_events
	warp_event  2,  7, ANARRES_TOWN, 3
	warp_event  3,  7, ANARRES_TOWN, 3

	def_coord_events


	def_bg_events ;todo add a journal or something
;	bg_event 22, 12, BGEVENT_JUMPTEXT, TinTowerSignText

	def_object_events
	object_event  4,  6, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AnarresHouseMushroomScript, -1 

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
	iffalse .NoMintLeaf
	writetext Text_Route33TutorQuestion ;;
	yesorno
	iffalse .MintLeafRefused
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
	cont "ets of mushrooms!"
	
	para "Do you have any"
	line "item that might"
	cont "make my breath"
	cont "smell better?"	

	para "I'll give you a"
	line "savory mushroom"
	cont "if you do."
	done

	
GiveTinyMushroomText: 
	text "Give that tiny-"
	line "mushroom to"
	cont "someone who"
	cont "needs to make"
	cont "a great dish."
	done
		
.NoMintLeaf:
	jumpopenedtext Text_NoMintLeaf

.MintLeafRefused:
	jumpopenedtext Text_NoMintLeaf

Text_NoMintLeaf:
	text "You don't?"
	line "That's sad."
	done
