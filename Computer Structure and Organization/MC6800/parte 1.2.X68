; Zona de datos
	ORG	$400
VZ	DS.W	1
VA	DC.W	3
VB	DC.W	25
VC  DC.W    5
VD  DC.W    4
; Zona de programa
START	ORG	$1000
	MOVE.W	VA,D0
	MULU.W	#5,D0
	ADD.W   VB,D0
    MOVE.W  VA,D1
    MULU.W  #2,D1
    ADD.W   #32,D1
    MOVE.W  VC,D2
    MOVE.W  VD,D3
    SUB.W   D3,D2
    SUB.W   D2,D1
    SUB.W   D1,D0  
	MOVE.W	D0,VA
; Secuencia de terminación del programa
	MOVE.B	#9,D0
	TRAP	#15
	END	START


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
