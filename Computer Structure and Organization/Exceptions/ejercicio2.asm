		.data
str_pedir:	.asciiz	"Introduzca un dato num�rico (0 <= dato <= 255): "

		.text
main:
# Pedir el dato de entrada
pedir_dato:
		li	$v0,4		# Escribir tira de caracteres
		la	$a0,str_pedir
		syscall
		li	$v0,5		# Leer entero
		syscall
		blt	$v0,$zero,pedir_dato
		bgt	$v0,255,pedir_dato
# Copiar dato en $s0
		move	$s0,$v0
# Seleccionar los 4 bits menos significativos del dato
		andi	$a0,$s0,0x0f
# Convertir la cifra hexadecimal a la codificaci�n de 7 segmentos
		jal	cod7seg
# Escribir la cifra en el visualizador derecho
escribir_derecho:
##### EL ALUMNO SUSTITUIR� ESTE COMENTARIO POR C�DIGO ENSAMBLADOR QUE ESCRIBE EL DATO EN EL VISUALIZADOR DERECHO
		la $t0, 0XFFFF0010
		sb $v0, 0($t0)
# Seleccionar los 4 bits m�s significativos del dato y ponerlos a la derecha
		andi	$a0,$s0,0xf0
		srl	$a0,$a0,4
# Convertir la cifra hexadecimal a la codificaci�n de 7 segmentos
		jal	cod7seg
# Escribir la cifra en el visualizador izquierdo
escribir_izquierdo:
##### EL ALUMNO SUSTITUIR� ESTE COMENTARIO POR C�DIGO ENSAMBLADOR QUE ESCRIBE EL DATO EN EL VISUALIZADOR IZQUIERDO
		la $t0, 0XFFFF0011
		sb $v0, 0($t0)
# Invocar el servicio para terminar el programa con valor de retorno 0
fin:
		li	$v0,17
		li	$a0,0
		syscall


###############################################################
# SUBRUTINA QUE CONVIERTE UN N�MERO HEXADECIMAL A 7 SEGMENTOS
#    Argumento de entrada: $a0
#    Resultado: $v0
###############################################################
		.text
		.globl	cod7seg
cod7seg:
		andi	$t0,$a0,0x000F
		la	$t1,cod7seg_tabla
		add	$t1,$t1,$t0
		lbu	$v0,0($t1)
		jr	$ra
		.data
cod7seg_tabla:
		.byte	0x3f, 0x06, 0x5b, 0x4f
		.byte	0x66, 0x6d, 0x7d, 0x07
		.byte	0x7f, 0x67, 0x77, 0x7c
		.byte	0x39, 0x5e, 0x79, 0x71
		
