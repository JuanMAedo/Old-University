###################################################################
# ESTRUCTURA DE COMPUTADORES
# Expresión booleana Cortocircuito
# Autor: Juan Martínez-Aedo Gómez
###################################################################
# Declaracion de variables y tiras de caracteres
###################################################################
		.data
A:		.space		4
B:		.space		4
C:		.space		1 		# Al ser un booleano guardaremos 1=TRUE, 0= FALSE #		
tira1:		.asciiz		"La expresión booleana que se va a resolver es: C = (A < 15 && A >= 5) || (B > A && A >= 6) "	
resultadoTrue:	.asciiz		"\nEl resultado de la expresión booleana es TRUE"
resultadoFalse:	.asciiz		"\nEl resultado de la expresión booleana es FALSE"	
###################################################################
# Implementacion del programa
###################################################################
		.text
		
		li	$v0,4
		la	$a0,tira1	# Imprimimos por pantalla la tira1 #
		syscall
		
# Instrucciones correspondientes a la primera parte de la expresión booleana #
		
		lw	$s0,A
		li	$s2,15		# Guardo en el registro s2 el valor 15 constante en el programa #
		bge	$s0,$s2,PARTE2	# Si A >= 15, la primera parte del boolean automáticamente es FALSE #
		li	$s3,5		# Guardo en el registro s3 el valor 5 constante en el programa #
		blt	$s0,$s3,PARTE2	# Si A < 5, la primera parte del boolean automáticamente es FALSE #
		b	FINT		# Si no ha saltado a la etiqueta PARTE2 --> la primera parte del boolean es TRUE, haciendo que C = TRUE, independientemente del resultado de la PARTE2 #

# Instrucciones correspondientes a la segunda parte de la expresión booleana #		

PARTE2:		lw	$s1,B
		bge	$s0,$s1,FINF	# Si A >= B, la segunda parte del boolean automáticamente es FALSE #
		li	$s4,6		# Guardo en el registro s4 el valor 6 constante en el programa #
		blt	$s0,$s4,FINF	# Si A < 6, la segunda parte del boolean automáticamente es FALSE #			
		b	FINT		# Si no ha saltado a la etiqueta FINF --> la primera parte del boolean es TRUE, haciendo que C = TRUE#	

# Instrucciones correspondientes al caso en el que la expresión booleana sea FALSE #

FINF:		li	$t0,0
		sb	$t0,C			# Guardo en la espacio de memoria C el resultado = 0 (FALSE) #
		li	$v0,4
		la	$a0,resultadoFalse	# Imprimimos por pantalla resultadoFalse #
		syscall
		b	FINPROG
		
# Instrucciones correspondientes al caso en el que la expresión booleana sea TRUE #
		
FINT:		li	$t0,1			
		sb	$t0,C			# Guardo en la espacio de memoria C el resultado = 1 (TRUE) #
		li	$v0,4
		la	$a0,resultadoTrue	# Imprimimos por pantalla resultadoTrue #
		syscall
		
FINPROG:	li	$v0,10
		syscall				
