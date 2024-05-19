UnownWalls:
	db $0a, $00, $46, $08, $06, $ff ; F A T E D
	db $44, $46, $2c, $42, $28, $ff ; S T O R M
	db $00, $46, $4a, $2a, $08, $ff ; A T U N E
	db $44, $46, $08, $08, $26, $ff ; S T E E L done

;	db $08, $44, $04, $00, $2e, $08, $ff ; E, S, C, A, P, E
;	db $26, $20, $0c, $0e, $46, $ff ; L, I, G, H, T
;	db $4c, $00, $46, $08, $42, $ff ; W, A, T, E, R
;	db $0a, $00, $20, $42, $60, $ff ; F, A, I, R, Y - 
; =(index-1)*2, _+16 for i->q, _+32 for r-x, _+48 for y and z

MenuHeaders_UnownWalls:
; FATED	
	db $40 ; flags
	db 04, 03 ; start coords
	db 09, 15 ; end coords
; ATUNE	
	db $40 ; flags
	db 04, 03 ; start coords
	db 09, 15 ; end coords
; STORM	
	db $40 ; flags
	db 04, 03 ; start coords
	db 09, 15 ; end coords
; STEEL	
	db $40 ; flags
	db 04, 03 ; start coords
	db 09, 15 ; end coords
; ESCAPE
;	db $40 ; flags
;	db 04, 03 ; start coords
;	db 09, 16 ; end coords
;; LIGHT
;	db $40 ; flags
;	db 04, 04 ; start coords
;	db 09, 15 ; end coords
;; WATER
;	db $40 ; flags
;	db 04, 04 ; start coords
;	db 09, 15 ; end coords
;; FAIRY
;	db $40 ; flags
;	db 04, 04 ; start coords
;	db 09, 15 ; end coords
