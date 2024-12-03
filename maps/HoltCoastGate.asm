HoltCoastGate_MapScriptHeader:
	def_scene_scripts
	scene_script HoltCoastGateWarpScene

	def_callbacks

	def_warp_events
	warp_event 2, 7, HOLLYS_HOLT, 3
	warp_event 3, 7, HOLLYS_HOLT, 4
	warp_event 2, 0, CALM_COAST, 1
	warp_event 3, 0, CALM_COAST, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 3, 4, SPRITE_VETERAN_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, HoltCoastGateNPCScript, -1


AnarresHoltGateHollisScene: ; C.F. bellchimetrail.asm on polished crystal clean
	playsound SFX_EXIT_BUILDING
	applyonemovement PLAYER, hide_object
	waitsfx
	disappear PLAYER
	pause 10
	special Special_FadeOutMusic
	special FadeOutPalettes
	pause 15
	disappear PLAYER
	waitsfx
	setscene $1
	warp WESTERN_CAPITAL, 10, 23
	end


HoltCoastGateNPCScript:
	jumptextfaceplayer HoltCoastGateNPCText

HoltCoastGateNPCText:
	text "I've heard stories"
	line "about the emperor's"
	cont "brigaders."
	
	para "Especially the"
	line "General Bobesh."

	para "They say they're"
	line "keeping order in"
	cont "other towns."

	para "I wonder when"
	line "they'll come to"
	cont "Anarres Town?"
	done
