; Zona de datos
	ORG	$400
VA	DS.W	1
VB	DC.W	8
VC	DC.W	1
VD  DC.W    3
; Zona de programa
START	ORG	$1000
	MOVE.W	VB,D0
	DIVS.W 	#2,D0
	MOVE.W  VD,D1
	MULU.W  #5,D1
	SUB.W   VC,D0
	ADD.W   D1,D0
	MOVE.W  D0,VA
; Secuencia de terminación del programa
	MOVE.B	#9,D0
	TRAP	#15
	END	START





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
