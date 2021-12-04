*-----------------------------------------------------------
* Program    : holamundo.x68
* Written by : Ángel Serrano Sánchez de León (URJC)
* Date       : Curso 2018/2019
* Description: Hola Mundo
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    LEA 	MENSAJE,A1	* A1 = Puntero a MENSAJE
    MOVE.L	#13,D0		* Mandamos imprimir el MENSAJE
    TRAP	#15


    SIMHALT             ; halt simulator

* Put variables and constants here

VARIAB	ORG	$30000
MENSAJE	DC.B	'Hola Mundo!',0	

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
