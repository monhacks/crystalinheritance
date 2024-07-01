TreeMons:
; entries correspond to TREEMON_SET_* constants
	table_width 2, TreeMons
	dw TreeMonSet_City
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	dw TreeMonSet_Ice
	assert_table_length NUM_TREEMON_SETS
	dw TreeMonSet_City 

; Two tables each (normal, rare).
; Structure:
;	db  %, species, level

TreeMonSet_City:
TreeMonSet_Canyon:
	db 50, PIDGEY,     10
	db 15, PIDGEY,     10
	db 15, PIDGEY,     10
	db 10, PIDGEY,     10
	db  5, MEOWTH,     10
	db  5, MEOWTH,     10
	db -1
	; rare
	db 50, PIDGEY,     10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, PIDGEY,     10
	db  5, MEOWTH,     10
	db  5, MEOWTH,     10
	db -1

TreeMonSet_Town:
	db 50, PIDGEY,     10
	db 15, EKANS,      10
	db 15, EKANS,      10
	db 10, PIDGEY,     10
	db  5, MEOWTH,     10
	db  5, MEOWTH,     10
	db -1
	; rare
	db 50, PIDGEY,     10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, PIDGEY,     10
	db  5, MEOWTH,     10
	db  5, MEOWTH,     10
	db -1

TreeMonSet_Route:
	db 50, ARIADOS,   10
	db 15, ARIADOS,   10
	db 15, LEDIAN,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1
	; rare
	db 40, MURKROW,    10
	db 20, PINECO,     10
	db 20, PINECO,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMonSet_Kanto:
	db 50, ARIADOS,   10
	db 15, EKANS,      10
	db 15, ARIADOS,   10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1
	; rare
	db 40, MURKROW,    10
	db 20, PINECO,     10
	db 20, PINECO,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMonSet_Lake:
	db 50, ARIADOS,   10
	db 15, VENONAT,    10
	db 15, ARIADOS,   10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1
	; rare
	db 50, ARIADOS,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMonSet_Forest:;only for ilex forest and hollys holt
	db 50, PINECO,     10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, PINECO,     10
	db  5, PINECO,     10
	db  5, PINECO,     10
	db -1
	; rare
	db 50, PINECO,     10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, PINECO,     10
	db  5, PINECO,     10
	db  5, PINECO,     10
	db -1

TreeMonSet_Rock:
	db 70, GEODUDE,    15
	db 25, SHUCKLE,    15
	db  5, SHUCKLE,    15
	db -1
	
TreeMonSet_Ice: ;used for boulders near the glaciers
	db 50, H__AVALUGG, 40
	db 50, H__AVALUGG, 45
	db -1
