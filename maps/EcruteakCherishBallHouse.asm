EcruteakCherishBallHouse_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 16
	warp_event  4,  7, ECRUTEAK_CITY, 16

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_JUMPSTD, radio2

	def_object_events
	object_event  2,  3, SPRITE_MATRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, GoldLeafMotherText, -1
	object_event  5,  4, SPRITE_RICH_BOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakBlueMailScript, -1

EcruteakBlueMailScript: 
	checkevent EVENT_GOT_GOLD_LEAF ;;TO ADD
	iftrue_jumptextfaceplayer GiveGoldLeafText
	checkevent EVENT_GAVE_LITEBLUEMAIL
	iftrue_jumptextfaceplayer GiveGoldLeafText
	faceplayer
	opentext	
	writetext NeedALiteBlueMailText
	waitbutton
	checkitem LITEBLUEMAIL
	iffalse NoLiteBlueMail
	writetext Text_LiteBlueMailQuestion ;;
	yesorno
	iffalse LiteBlueMailRefused
	takeitem LITEBLUEMAIL
	jumpopenedtext TextHeresTheGoldLeaf
	verbosegiveitem GOLD_LEAF
	iffalse_endtext
	setevent EVENT_GOT_GOLD_LEAF 
	jumpopenedtext GiveGoldLeafText 


GoldLeafMotherText: 
	text "Why does my son"
	line "insist on being"
	cont "so... pedestrian"
	cont "about our status?"

	para "That charming girl"
	line "of his could be"
	cont "summering in"
	cont "Kalos instead of"
	cont "withering in"
	cont "Olivine."
	done


NeedALiteBlueMailText:
	text "I simply cannot"
	line "express my love on"
	cont "Gold Leaf!"

	para "How is my beloved"
	line "to know I'm more"
	cont "than my trust fund"
	cont "when my letters"
	cont "look like they're"
	cont "written on golden"
	cont "nuggets?"
	done

NoLiteBlueMail:
	text "Would you consider"
	line "a trade? A sheet"
	cont "of gold leaf for"
	cont "plain stationary."
	done


Text_LiteBlueMailQuestion:
	text "Willickers! Is"
	line "that LiteBlue-"
	cont "Mail? How"
	cont "ordinary! I simply"
	cont "must have it."
	done

LiteBlueMailRefused:
	text "You refuse? How"
	line "peculiar..."
	cont "It's 24-Karat"
	cont "Gold Leaf."
	done

TextHeresTheGoldLeaf:
	text "Splendid! Do take"
	line "this - careful!"
	cont "It would be an"
	cont "heirloom in YOUR"
	cont "family!"
	done

GiveGoldLeafText:
	text "Perfect! Now to"
	line "write a properly"
	cont "common letter."
	para "I hope she makes"
	line "haste in reply!"
	done
