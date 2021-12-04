###################################################################
# ESTRUCTURA DE COMPUTADORES
# Contador de Número de Apariciones
# Autor: Juan Martínez-Aedo Gómez
###################################################################
# Declaracion de variables y tiras de caracteres
###################################################################
		.data
Par:		.space		4		# Espacio de memoria para almacenar el total de pares #
Impar:		.space		4  		# Espacoio de memoria para almacenar el total de impares #
tira1:		.asciiz		"Introduzca un numero natural mayor que 0: "
tira2:		.asciiz		"El número de pares es: "
tira3:		.asciiz		"\nEl número de impares es: "
tira4:		.asciiz		"Error, el valor no es mayor que 0\n"
###################################################################
# Implementacion del programa
###################################################################
		.text
		li 	$v0,4
		la 	$a0,tira1		# Imprimo la tira1 #
		syscall
		
		li	 $v0,5
		syscall
		move 	$s0,$v0 		# Guardo el valor del numero tope al cual llegaré #
		
IF1:		bltz 	$s0, ERROR 		# Compruebo q ue el valor es positivo y por lo tanto si es válido para el bucle que voy a realizar #
		li 	$s1,1			# El registro $s1 lo voy a usar de contador del bucle FOR, inicializándolo en 1, ya que el 0 no está incluido según enunciado #
		li	$s2,0			# Inicializo en s2 el contador de numeros pares #
		li	$s3,0			# Inicializo en s3 el contador de numeros impares #
		li	$s4,2			# Constante que usaré para comprobar si es par/impar con la división #
		j	FOR
		
INC:		addi	$s1,$s1,1		# El tope(i) se incrementa en 1 y vuelve a realizarse el FOR #
	
FOR:		beq 	$s0,$s1,END
		div	$s1,$s4			# Hago la división entre el contador y el tope #
		mfhi	$t0			# El resto nos ayuda a saber si es par/impar -> i MOD 2 = 0, indica numero par; si es dintitno de 0, es numero impar) #
		bgtz	$t0,ELSE2		# En caso de que no sea par salto al ELSE2 #
		
IF2:		addi	$s2,$s2,1		# Sumo al registro qque uso de contador de numeros pares, 1 #	
		j	INC
		
ELSE2:		addi	$s3,$s3,1		# Sumo al registro temporal que uso de contador de numeros impares, 1 #	
		j	INC	
				
ERROR:		li 	$v0,4
		la 	$a0,tira4		# El numero introducido es < 0, por lo que no podrá entrar en el FOR e imprimo un aviso y finalizo programa #
		syscall	
		j	FINPROG	
		
END:		la	$t1,Par			# Cargo la direccion de Par en el registro t1 #
		sw	$s2,0($t1)		# Almaceno en la direccion guardada en el registro t1(que contiene la direccion de Par) la informacion de s2(total de numeros pares) #
		
		la	$t2,Impar		# Cargo la direccion de Impar en el registro t1 #
		sw	$s3,0($t2)		# Almaceno en la direccion guardada en el registro t2(que contiene la direccion de Impar) la informacion de s3(total de numeros impares) #
		
		li 	$v0,4
		la 	$a0,tira2		# Imprimo la tira2 #
		syscall
		
		li 	$v0,1
		move 	$a0,$s2			# Imprimo por pantalla el total de numeros pares que hay #
		syscall
		
		li 	$v0,4
		la 	$a0,tira3		# Imprimo la tira3 #
		syscall
		
		li 	$v0,1
		move 	$a0,$s3			# Imprimo por pantalla el total de numeros impares que hay #
		syscall
		
FINPROG:	li 	$v0,10			# Hago la llamada a la instruccion que finaliza el programa #
		syscall				
