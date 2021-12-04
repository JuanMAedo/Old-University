############################################################################
# ESTRUCTURA DE COMPUTADORES
# Expresion Booleana
# Autor: Juan Martínez-Aedo Gómez
############################################################################
# Declaracion de variables y tiras de caracteres
############################################################################
		.data
C:		.space		4
A:		.word		8
B:		.word		12
Const15:	.word		15
Const5:		.word		5
tira1:		.asciiz		"El programa va a realizar la siguiente operación booleana: C = (A < 15 && A >= 5) || (B > A && A >= 5) \n"
tira2:		.asciiz		"El resultado de la operacion booleana es: "
############################################################################
# Implementacion del programa
############################################################################
		.text
		
		li $v0, 4
		la $a0, tira1		# Imprimo por pantalla la etiqueta tira1 #
		syscall
		
		lw $s0,A		# Tomo las variables de la memoria en registros para poder operar con ellos #
		lw $s1,B		# Tomo las variables de la memoria en registros para poder operar con ellos #
		lw $s2,Const15		# Tomo las variables de la memoria en registros para poder operar con ellos #
		lw $s3,Const5		# Tomo las variables de la memoria en registros para poder operar con ellos #
		
		
					# Empiezo a hacer las operaciones de dentro a fuera #
		slt $t0,$s0,$s2 	# Hago la operación de A<15 #			
		sge $t1,$s0,$s3		# Hago la operación de A>=5 #
		sgt $t2,$s1,$s0		# Hago la operación de B>A #
		
		and $t3,$t0,$t1		# Hago unión del primer paréntesis #
		and $t4,$t2,$t1		# Hago la unión del segundo paréntesis #
		
		 or $t5,$t3,$t4		# Hago la intersección entre las dos partes de la expresion #
		 
		 sw $t5,C		# Guardo el resultado en el espacio de memoria 'C' #
		 
		 li $v0, 4
		 la $a0, tira2		# Imprimo por pantalla la etiqueta tira2 #
		 syscall
		
		 li $v0,1
		 lw, $a0,C		# Mostramos a través de $a0 el resultado de la expresion booleana #
		 syscall  
		 
		 li $v0,10		# Realizo la instrucción 10 para finalizar la ejecución del programa #
		 syscall
