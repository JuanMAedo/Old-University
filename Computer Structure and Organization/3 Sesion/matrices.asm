	.data
# Matriz de 8x8 elementos de tama�o palabra
m1:	.space		256			# Reserva

# Matriz de 3x4 elementos de tama�o palabra con valor inicial
m2:	.word		3,-1,0xC4301234,32	# Fila 1
	.word		0,3451,90831,-333	# Fila 2
	.word		-23,99,4,55		# Fila 3

	.text
##############################################################################
#                                                                            #
# ACCESO A UN ELEMENTO DE UNA MATRIZ CON �NDICES CONSTANTES CONOCIDOS        #
#                                                                            #
##############################################################################
#
# C�DIGO EN PASCAL
#
##########################################
#
# VAR m2: ARRAY [0..2,0..3] OF INTEGER;
#    elem: INTEGER;
# BEGIN
#    elem := m2[2,3];
# END.
#
##########################################
# Tama�o de un entero: 4
# elem: mantenemos una copia en el registro $s0, no lo vamos a almacenar en memoria
# temporales: $t0
##########################################
# Poner un puntero al inicio de la matriz
	la	$t0,m2
# Distancia del elemento al inicio de la matriz:
#    [fila (2) * columnas (4) + columna (3) ] tama�o_elemento (4) = 44
# Se accede al elemento con direccionamiento indirecto al puntero $t0
# con la distancia al comienzo del vector como desplazamiento
	lw	$s0,44($t0)


##############################################################################
#                                                                            #
# ACCESO A UN ELEMENTO DE UNA MATRIZ CON �NDICES GEN�RICOS DESCONOCIDOS      #
#                                                                            #
##############################################################################
#
# C�DIGO EN PASCAL
#
##########################################
#
# VAR m2: ARRAY [0..2,0..3] OF INTEGER;
#     elem: INTEGER;
#     i, j: INTEGER;
# BEGIN
#    elem := m2[i,j];
# END.
#
##########################################
# Tama�o de un entero: 4
# elem: mantenemos una copia en el registro $s0, no lo vamos a almacenar en memoria
# i:	registro $s1
# j:	registro $s2
# temporales: $t0 y $t1
##########################################
# Ponemos valores a i y j, se puede cambiar
	li	$s1,1
	li	$s2,2
# Poner un puntero al inicio de la matriz
	la	$t0,m2
# Distancia del elemento al inicio de la matriz: hay que calcularla
#    [fila (i) * columnas (4) + columna (j) ] tama�o_elemento (4)
	mul	$t1,$s1,4
	addu	$t1,$t1,$s2
	mul	$t1,$t1,4
# Sumando la distancia al puntero tenemos un puntero al elemento buscado
	addu	$t1,$t0,$t1
	lw	$s0,0($t1)


##############################################################################
#                                                                            #
# SUMA DE LOS ELEMENTOS DE UNA MATRIZ                                        #
#                                                                            #
##############################################################################
#
# C�DIGO EN PASCAL
#
##########################################
#
# VAR v: ARRAY [0..15] OF INTEGER;
#     suma: INTEGER;
#     i: INTEGER;
# BEGIN
#    suma := 0;
#    FOR i:= 0 TO 2 DO
#       FOR j := 0 TO 3 DO
#          suma := suma+m[i,j];
# END.
#
##########################################
# Tama�o de un entero: 4
# suma: registro $s0
# i:    registro $s1
# j:	registro $s2
# temporales: $t0 ... $t3
##########################################
#    suma := 0;
	move	$s0,$zero
#    FOR i:= 0 TO 2 DO
fori:
#     Cargar �ndice inicial en $s1
	move	$s1,$zero
#     Cargar �ndice tope en $t1
	li	$t1,2
#     Si el �ndice inicial supera el tope, salir
	bgt	$s1,$t1,fini
#     Ir al cuerpo del bucle
	b	bloquei
#     Incrementar �ndice i
inci:	addiu	$s1,$s1,1
#     Cuerpo del bucle
bloquei:
#       FOR j := 0 TO 3 DO
forj:
#        Cargar �ndice inicial en $s2
	move	$s2,$zero
#        Cargar �ndice tope en $t2
	li	$t2,3
#        Si el �ndice inicial supera el tope, salir
	bgt	$s2,$t2,finj
#        Ir al cuerpo del bucle
	b	bloquej
#        Incrementar �ndice j
incj:	addiu	$s2,$s2,1
#        Cuerpo del bucle
bloquej:	
#          suma := suma+m[i,j];
#           Poner puntero al comienzo del vector
	la	$t0,m2
#           Calcular distancia hasta el elemento i-�simo
	mul	$t3,$s1,4
	addu	$t3,$t3,$s2
	mul	$t3,$t3,4
#           Poner puntero al elemento i-�simo
	addu	$t0,$t0,$t3
#           Leer elemento i-�simo
	lw	$t3,0($t0)
#           Acumular suma sobre $s0
	addu	$s0,$s0,$t3
#        Si el �ndice iguala el valor tope, salir
	bne	$s2,$t2,incj
finj:
#     Si el �ndice iguala el valor tope, salir
	bne	$s1,$t1,inci
fini:


# Fin del programa
	li	$v0,10
	syscall
