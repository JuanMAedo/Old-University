		.text
main:
# Excepci�n 4 (ADEL): se intenta leer un dato de tama�o palabra
# situado en una direcci�n no alineada
e1:
		li	$t0,0x400000
		lw	$3,1($t0)
# Excepci�n 5 (ADES): se intenta escribir sobre un dato de tama�o palabra
# situado en una direcci�n no alineada
e2:
		sw	$3,1($t0)
# Excepci�n 9 (BKPT)
e3:
		break	0
# Excepci�n 12 (overflow): se realiza una suma que produce desbordamiento
e4:
		li	$t0,0x7fffffff
		add	$t0,$t0,$t0
# Excepci�n 13 (TRAP): se genera una excepci�n por trap
e5:
		teq	$0,$0
# Invocar el servicio para terminar el programa con valor de retorno 0
fin:
		li	$v0,17
		li	$a0,0
		syscall
