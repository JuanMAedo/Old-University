		.data
# Variables de memoria

cadena:		.space  20	# Como máximo va a guardar 20 caracteres y hay que dejar 1 bit del bit nulo #
		.byte	0	  	
resultado:	.space 1
	
# Tiras para mostrar por pantalla
tira1:		.asciiz		"Introduzca la cadena que se desea analizar(Máximo 20 caracteres): "
tira2:		.asciiz		"\nIntroduzca el caracter que se desea ver cuantas veces se repite:  "
tira3:          .asciiz		"\nEl caracter se repite "
tira4:		.asciiz		" veces en la cadena introducida. "	
		.text
# Programa principal
		li $v0,4
		la $a0,tira1		# Imprimimos por pantalla la pregunta de introducir la cadena de caracteres #
		syscall
		
		li $v0, 8
		la $a0, cadena		# Se lee la cadena introducida con un maxímo de 20 caracteres + 1 nulo #
		li $a1, 21
		syscall 
		
		li $v0,4
		la $a0,tira2		# Imprimimos por pantalla la pregunta de introducir la cadena de caracteres #
		syscall
		
		li $v0, 12
		syscall 
		move  $a1,$v0		# Cargo el caracter que quiero comparar #
		la   $t1,cadena		# Cargo la dirección de la cadena para poer compararlo en la subrutina #
		move $a0,$t1
		

					
		jal count		# Llamo a la subrutina de count #
		
		sb  $v0,resultado
		move $t1,$v0
		
		li $v0,4
		la $a0,tira3		# Imprimimos por pantalla la tira3 #
		syscall
		
		li $v0,1
		move $a0,$t1
		syscall
		
		li $v0,4
		la $a0,tira4		# Imprimimos por pantalla la tira4 #
		syscall
		li $v0,10
		syscall		
		

##################################
# Subrutina cuenta el numero de aparaciones de un caracter
# Paramentros: $a0 cadena, $a1 caracter
# salida numero de apariciones
#################################
count:	
#	  Inicializamos $v0 a 0 para que el resultado de apariciones
		move	$v0,$zero	
		addi	$sp,$sp,-4
#    	  Guardamos dirección de regreso ya que el $ra va a ser modificado al llamar recursivamente a la subrutina compare
		sw 	$ra,0($sp)
#    	  lon := 0;
		move	$t0,$zero
#	  res := 0;
		move 	$t5,$zero		
#         Cargar la direccion de la cadena de caracteres
		move	$t1,$a0	
#    	  WHILE t[lon] <> CHR(0) DO
while:		
#         Poner puntero al caracter i-ésimo
		addu	$t2,$t1,$t0
#         Leer caracter i-ésimo
		lbu	$t3,0($t2)
#         Si el carácter leído es el nulo, salir
		beq	$t3,$zero,fin
#    	  Cuerpo del bucle
body:
#      	  lon := lon+1;
		addiu	$t0,$t0,1
#	  Llamada a la subrutina compare($a1,$t3)
#	  Guardar el caracter en el registro a0, para compararlo con a1
		move  	$a0,$t3
		jal   	compare
		move  	$t4,$v0
		addu  	$t5,$t5,$t4
# 	  Saltar al comienzo del bucle
		b	while
fin:
#	  Tenemos la repetición del caracter en la cadena en 4t8, devolvemos a v0, para que se mantenga
		move   	$v0,$t5
		lw      $ra,0($sp)
		addi	$sp,$sp,4
		jr    	$ra

#####################################
# Subrituna comparar caracteres
# Paramentros $a0 y $a1
# Salida booleano indicando True si son iguales
#####################################
compare:	
		seq	$v0,$a0,$a1   	# Introducir un 1 si a1 y a0 son iguales #
		jr      $ra		# Volver a la siguiente llamada desde la llamada a la subrutina #
