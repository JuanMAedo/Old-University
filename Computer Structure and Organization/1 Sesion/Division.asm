###################################################################
# ESTRUCTURA DE COMPUTADORES
# División
# Autor: Juan Martínez-Aedo Gómez
###################################################################
# Declaracion de variables y tiras de caracteres
###################################################################
		.data
dividendo:	.space		4
divisor:	.space		4
resto:		.space		4
cociente:	.space		4
tira1:		.asciiz		"Introduzca un numero entero que sea dividendo para la division: "
tira2:		.asciiz		"Introduzca el numero entero, distinto de 0, que sea el divisor de la division: "
tira3:		.asciiz		"El valor del cociente es: "
tira4:		.asciiz		"\nEl valor del resto es: "
###################################################################
# Implementacion del programa
###################################################################
		.text
		li $v0,4
		la $a0,tira1		# Imprimimos por pantalla la pregunta de introducir el dividendo #
		syscall
		
		li $v0,5
		syscall 
		sw $v0,dividendo	# Guardo el dividendo en el espacio reservado a la etiqueta dividendo #
		
		li $v0,4
		la $a0,tira2		# Imprimimos por pantalla la pregunta de introducir el divisor #
		syscall
		
		li $v0,5
		syscall
		sw $v0,divisor          # Guardo el divisor en un y(espacio de memoria reservado)#
										
		lw $s0,dividendo	# Para operar en funciones pasamos los datos almacenados a registros temporales #
		lw $s1,divisor		# Para operar en funciones pasamos los datos almacenados a registros temporales #
		
		div $s0,$s1		# Realizo la division #
		
		mfhi $t0		# Guardo el resto que se ha almacenado en el hi de la memoria, en un registro temporal #
		mflo $t1		# Guardo el cociento que se ha almacenado en el lo de la memoria, en un registro temporal #
		
		sw $t0,resto		# Guardo el resto en el espacio reservado con la etiqueta de 'resto' #
		sw $t1,cociente		# Guardo el cociente en el espacio reservado con la etiqueta de 'cociente' #
		
		li $v0,4
		la $a0,tira3		# Imprimimos por pantalla la etiqueta tira3 #
		syscall
		
		li $v0,1
		lw $a0,cociente		# Mostramos a través de $a0 el cociente de la division #
		syscall
		
		li $v0,4
		la $a0,tira4		# Imprimimos por pantalla la etiquera tira4 #
		syscall
		
		li $v0,1
		lw $a0,resto		# Mostramos a través de $a0 el resto de la division #
		syscall
		
		li $v0,10		# Realizo la instrucción 10 para finalizar la ejecución del programa #
		syscall
