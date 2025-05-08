RusalkaRuinsCaptain_MapScriptHeader: 
	def_scene_scripts


	def_callbacks


	def_warp_events
	warp_event  3, 10, RUSALKA_RUINS_1F, 3


	def_coord_events



	def_bg_events



	def_object_events
	object_event  4,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SLOWBRO, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CaptainSpiritomb, EVENT_RUSALKA_SPIRITOMB
	object_event  5,  5, SPRITE_BOOK_PAPER_POKEDEX, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_COMMAND, jumptext, CaptainsLog10, -1
	object_event 3, 3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_COMMAND, jumptext, DeadCaptainText, -1

	object_const_def
	const CAPTAIN_SPIRITOMB

CaptainSpiritomb:
	faceplayer
	cry SPIRITOMB
	pause 15
	loadwildmon SPIRITOMB, 35
	startbattle
	disappear CAPTAIN_SPIRITOMB
	setevent EVENT_RUSALKA_SPIRITOMB
	reloadmapafterbattle
	end

DeadCaptainText:
	text "It's the captain."
	line "He looks as cold"
	cont "as ice..."
	done


CaptainsLog10:
	text "Captain's Log 10"
	line "My Final Entry"
	
	para "The stone glows"
	line "brighter with"
	cont "each breath -"
	cont "the last light"
	cont "in this trophy-"
	cont "lined tomb."
	
	para "The bats screech"
	line "a eulogy for"
	cont "the crew I"
	cont "sacrificed in"
	cont "these cursed"
	cont "islands."
	
	para "How fitting to"
	line "die surrounded"
	cont "by my precious"
	cont "trophies, each"
	cont "one a moment I"
	cont "chose wrong."
	
	para "Eleanor's last"
	line "letter sits"
	cont "before me."
	
	para "A child."
	line "A child I'll"
	cont "never meet."
	
	para "But let me give"
	line "a last"
	cont "confession:"
	
	para "I would have"
	line "barely known you"
	cont "anyway."
	
	para "I'd be hunting"
	line "for my own"
	cont "gemstones and"
	cont "missing your"
	cont "milestones just"
	cont "like I did to"
	cont "your mother."
	
	para "Perhaps it's"
	line "better for you"
	cont "this way."
	done
	