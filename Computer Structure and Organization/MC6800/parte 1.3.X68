; Zona de datos
	ORG	$400
VA	DC.W	5
VB	DC.W	3
VC	DS.W	1
; Zona de programa
START	ORG	$1000
    
BUCLE   EQU *    
    
    MOVE.W  VB,D0
    CMPI    #0,D0
    BEQ     FIN
    MOVE.W  VA,D0
    CMPI    #0,D0
    BEQ     FIN
    MOVE    VB,D1 
MAIN    EQU *
    
    ADD.W   D0,D0
    SUBI.W  #1,D1   
    MOVE.W  D1,VB   
    CMPI    #1,D1
    BNE MAIN
    
    MOVE.W  D2,VC
FIN    
; Secuencia de terminación del programa
	MOVE.B	#9,D0
	TRAP	#15
	END	START




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
