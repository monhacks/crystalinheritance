CalmCoastCottage_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 2, 7, CALM_COAST, 3
	warp_event 3, 7, CALM_COAST, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 2, 4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CalmCoastCottageDayCareManScript, -1
	object_event 5, 5, SPRITE_CHILD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CalmCoastCottageChildScript, -1
	object_event 5, 2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CalmCoastCottageDayCareWomanScript, -1

CalmCoastCottageDayCareManScript:
	jumptextfaceplayer CalmCoastCottageDayCareManText

CalmCoastCottageDayCareManText:
	text "A Hisuian left me"
	line "a Dartrix. It is"
	cont "interested in my"
	cont "wife's Pidgeotto."
	done

CalmCoastCottageChildScript:
	jumptextfaceplayer CalmCoastCottageChildText

CalmCoastCottageChildText:
	text "Pidgey kept eating"
	line "our berries. So my"
	cont "parents hired a"
	cont "boy from the city"
	cont "to guard our"
	cont "garden."
	done

CalmCoastCottageDayCareWomanScript:
	faceplayer
	opentext
	writetext CalmCoastCottageDayCareWomanText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	end

CalmCoastCottageDayCareWomanText:
	text "Do you need a"
	line "heal? Rest up."
	done
