###################################################################################
# ESTRUCTURA DE COMPUTADORES
# Suma
# Autor: Juan Martínez-Aedo Gómez
###################################################################################
# Declaracion de variables y tiras de caracteres
###################################################################################
		.data
a:		.space		4
b:		.space		4
resultado:	.space		4		
tira1:		.asciiz		"Introduzca el primer numero para la suma: "
tira2:		.asciiz		"Introduzca el segundo numero para la suma: "
tira3:		.asciiz		"El resultado de la suma es: "
###################################################################################
# Implementacion del programa
###################################################################################
		.text
		li $v0, 4
		la $a0, tira1		# Imprimo por pantalla la etiqueta tira1 #
		syscall
		
		li $v0,5
		syscall
		
		sw $v0,a		# Guardo el primer valor en el espacio reservado por memoria 'a' #
		
		li $v0, 4
		la $a0, tira2 		# Imprimo por pantalla la etiqueta tira2 #
		syscall
		
		li $v0,5
		syscall
		
		sw $v0,b		# Guardo el segundo valor en el espacio reservado por memoria 'b' #
		
		lw $t0,a		# Cargo en el registro $t0 el valor de 'a' para poder operar con ello #
		lw $t1,b		# Cargo en el registro $t1 el valor de 'b' para poder operar con ello #
		
		add $t2, $t0, $t1	# Realizo la suma de los registros temporales y lo almaceno en $t2 #
				
		li $v0, 4
		la $a0, tira3		# Imprimo por pantalla la etiqueta tira3 #		
		syscall
		
		sw $t2,resultado	# Cargo en el resultado el resultado almacenado en el registro temporal $t2 #
		
		li $v0,1
		lw $a0,resultado	# Muestro el resultado de la operacion #
		syscall
		
		li $v0,10		# Realizo la instrucción 10 para finalizar la ejecución del programa #
		syscall
