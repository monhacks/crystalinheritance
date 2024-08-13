GROUP_N_A  EQU -1
MAP_N_A    EQU -1
GROUP_NONE EQU 0
MAP_NONE   EQU 0

; map struct members (see data/maps/maps.asm)
rsreset
MAP_MAPATTRIBUTES_BANK rb ; 0
MAP_TILESET            rb ; 1
MAP_ENVIRONMENT        rb ; 2
MAP_MAPATTRIBUTES      rw ; 3
MAP_LOCATION           rb ; 5
MAP_MUSIC              rb ; 6
MAP_PALETTE            rb ; 7
MAP_FISHGROUP          rb ; 8
MAP_LENGTH EQU _RS

; map environments (wEnvironment)
; EnvironmentColorsPointers indexes (see data/maps/environment_colors.asm)
	const_def 1
	const TOWN
	const ROUTE
	const INDOOR
	const CAVE
	const ISOLATED
	const GATE
	const DUNGEON
NUM_ENVIRONMENTS EQU const_value - 1

; map palettes (wEnvironment)
	const_def
	const PALETTE_AUTO
	const PALETTE_DAY
	const PALETTE_NITE
	const PALETTE_MORN
	const PALETTE_EVE
NUM_MAP_PALETTES EQU const_value

IN_DARKNESS EQU %1000
DARKNESS_PALSET EQU %00011011 ; brightlevel 0, 1, 2, 3

; FishGroup indexes (see data/wild/fish.asm)
	const_def
	const FISHGROUP_NONE
	const FISHGROUP_SHORE
	const FISHGROUP_OCEAN
	const FISHGROUP_LAKE
	const FISHGROUP_POND
	const FISHGROUP_DRATINI
	const FISHGROUP_QWILFISH_SWARM
	const FISHGROUP_REMORAID_SWARM
	const FISHGROUP_GYARADOS
	const FISHGROUP_DRATINI_2
	const FISHGROUP_WHIRL_ISLANDS
	const FISHGROUP_QWILFISH
	const FISHGROUP_REMORAID
	const FISHGROUP_QWILFISH_NO_SWARM
NUM_FISHGROUPS EQU const_value - 1

; wMapConnections
; connection directions (see data/maps/data.asm)
	const_def
	shift_const EAST
	shift_const WEST
	shift_const SOUTH
	shift_const NORTH

; GetOvercastIndex return values (see home/map.asm)
	const_def
	const NOT_OVERCAST
	const AZALEA_OVERCAST
	const LAKE_OF_RAGE_OVERCAST
	const STORMY_BEACH_OVERCAST

; SpawnPoints indexes (see data/maps/spawn_points.asm)
	const_def
	const SPAWN_KURTS_HOUSE
; kanto
	const SPAWN_ANARRES_SP
	const SPAWN_GAULDENROD_SP
	const SPAWN_WESTERN_CAPITAL_SP
	const SPAWN_TRADERS_LANDING_SP
	const SPAWN_SHELTERED_SHORES_SP
	const SPAWN_CIANWOOD_COVE_SP
	const SPAWN_TRANQUIL_TARN_SP
	const SPAWN_EERIE_HAMLET_SP
	const SPAWN_SULFUR_STY_SP
	const SPAWN_TIMELESS_TAPESTRY_SP
; johto
	const SPAWN_VIOLET
	const SPAWN_UNION_CAVE
	const SPAWN_AZALEA
	const SPAWN_CIANWOOD
	const SPAWN_GOLDENROD
	const SPAWN_OLIVINE
	const SPAWN_ECRUTEAK
	const SPAWN_MAHOGANY
	const SPAWN_LAKE_OF_RAGE
NUM_SPAWNS EQU const_value

SPAWN_N_A EQU -1

; Flypoints indexes (see data/maps/flypoints.asm)
	const_def
; johto
JOHTO_FLYPOINT EQU const_value
	const FLY_VIOLET
	const FLY_UNION_CAVE
	const FLY_AZALEA
	const FLY_GOLDENROD
	const FLY_ECRUTEAK
	const FLY_OLIVINE
	const FLY_CIANWOOD
	const FLY_MAHOGANY
	const FLY_LAKE_OF_RAGE
; kanto
KANTO_FLYPOINT EQU const_value
	const FLY_ANARRES_SP 
	const FLY_GAULDENROD_SP
	const FLY_WESTERN_CAPITAL_SP
	const FLY_TRADERS_LANDING_SP
	const FLY_SHELTERED_SHORES_SP
	const FLY_CIANWOOD_COVE_SP
	const FLY_TRANQUIL_TARN_SP
	const FLY_EERIE_HAMLET_SP
	const FLY_SULFUR_STY_SP
	const FLY_TIMELESS_TAPESTRY_SP
NUM_FLYPOINTS EQU const_value
