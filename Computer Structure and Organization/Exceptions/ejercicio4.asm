		.data
str_pedir:	.asciiz	"Introduzca un dato numérico positivo: "
str_indice:	.asciiz	"Indice = "
eoln:		.byte	'\n'
		.text
main:
# Pedir el dato de entrada
pedir_dato:
		li	$v0,4		# Escribir tira de caracteres
		la	$a0,str_pedir
		syscall
		li	$v0,5		# Leer entero
		syscall
		ble	$v0,$zero,pedir_dato
# Iniciar índice de bucle
		move	$t0,$v0
# Habilitar interrupciones del contador
		addi	$a0,$zero,0xFF
		sb	$a0,0xffff0013
# Bucle
bucle:
		li	$v0,4		# Escribir tira de caracteres
		la	$a0,str_indice
		syscall
		li	$v0,1		# Escribir entero
		move	$a0,$t0
		syscall
		li	$v0,11		# Escribir salto de línea
		lbu	$a0,eoln
		syscall
		addi	$t0,$t0,-1	# Decrementar contador
		bne	$t0,$zero,bucle	# Comprobar condición
# Deshabilitar interrupciones del contador
		sb	$zero,0xffff0013
# Invocar el servicio para terminar el programa con valor de retorno 0
		li	$v0,17
		li	$a0,0
		syscall
