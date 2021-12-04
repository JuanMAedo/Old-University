; Zona de datos
	ORG	$400
VA	DC.W	1
VB	DC.W	3
VC	DS.W	1
; Zona de programa
START	ORG	$1000
	MOVE.W	VA,D0
	ADD.W	VB,D0
	MOVE.W	D0,VC
; Secuencia de terminación del programa
	MOVE.B	#9,D0
	TRAP	#15
	END	START

