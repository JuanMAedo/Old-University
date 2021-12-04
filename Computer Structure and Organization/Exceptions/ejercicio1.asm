		.text
main:
# Excepción 4 (ADEL): se intenta leer un dato de tamaño palabra
# situado en una dirección no alineada
e1:
		li	$t0,0x400000
		lw	$3,1($t0)
# Excepción 5 (ADES): se intenta escribir sobre un dato de tamaño palabra
# situado en una dirección no alineada
e2:
		sw	$3,1($t0)
# Excepción 9 (BKPT)
e3:
		break	0
# Excepción 12 (overflow): se realiza una suma que produce desbordamiento
e4:
		li	$t0,0x7fffffff
		add	$t0,$t0,$t0
# Excepción 13 (TRAP): se genera una excepción por trap
e5:
		teq	$0,$0
# Invocar el servicio para terminar el programa con valor de retorno 0
fin:
		li	$v0,17
		li	$a0,0
		syscall
