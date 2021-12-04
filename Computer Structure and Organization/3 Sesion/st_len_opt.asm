	.data

# Tira de 12 caracteres con cuatro ocupados m�s el car�cter nulo
T5:	.asciiz	"Hola"	# Contenido �legible� de la tira
	.space	7	# Hueco de relleno al tama�o m�ximo

# Elemento
elem:	.space	1

# Longitud de la tira
	.align	2
lon:	.space	4

	.text

##################################################################################
#                                                                                #
# C�LCULO DE LA LONGITUD DE UNA TIRA DE CARACTERES                               #
#                                                                                #
##################################################################################
#
# C�DIGO EN PASCAL
#
##########################################
#
# VAR T5: ARRAY [0..11] OF CHAR;
#    lon: INTEGER;
# BEGIN
#   lon := 0;
#   WHILE t[lon] <> CHR(0) DO
#      lon := lon+1;
# END.
#
##########################################
# lon: mantenemos una copia en el registro $s0, y luego lo copiamos en memoria
# temporales: $t0, $t1
##########################################
#    lon := 0;
	move	$s0,$zero
#    WHILE t[lon] <> CHR(0) DO
#         Poner puntero al comienzo del vector
	la	$t0,T5	

while:		#Cargar la direcci�n fuera del body nos ha hecho ahorrar 8 instrucciones, 4 lui y 4 ori#
#         Poner puntero al elemento i-�simo
	addu	$t2,$t0,$s0
#         Leer elemento i-�simo
	lbu	$t1,0($t2)
#         Si el car�cter le�do es el nulo, salir
	beq	$t1,$zero,fin
#     Cuerpo del bucle
body:
#      lon := lon+1;
	addiu	$s0,$s0,1
# Saltar al comienzo del bucle
	b	while
fin:
	sw	$s0,lon


# Fin del programa
	li	$v0,10
	syscall
