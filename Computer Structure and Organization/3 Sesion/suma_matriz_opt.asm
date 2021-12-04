	.data

# Matriz de 3x4 elementos de tamaño palabra con valor inicial
m2:	.word		3,-1,0xC4301234,32	# Fila 1
	.word		0,3451,90831,-333	# Fila 2
	.word		-23,99,4,55		# Fila 3

	.text
##############################################################################
#                                                                            #
# SUMA DE LOS ELEMENTOS DE UNA MATRIZ                                        #
#                                                                            #
##############################################################################
#
# CÓDIGO EN PASCAL
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
# Tamaño de un entero: 4
# suma: registro $s0
# i:    registro $s1
# j:	registro $s2
# temporales: $t0 ... $t3
##########################################
#    suma := 0;
	move	$s0,$zero
#    FOR i:= 0 TO 2 DO
fori:
#     Cargar índice tope en $t1
	li	$t1,2	
#     Cargar índice inicial en $s1
	move	$s1,$zero
#     Si el índice inicial supera el tope, salir
	bgt	$s1,$t1,fini
#	Cargo el tope después de saber que se va a ejecutar el primer for, 
#	ya que si lo hago fuera puede que sea una carga innecesaria, y dentro del bucle eran cargas innecesarias 	
#        Cargar índice tope en $t2
	li	$t2,3
#           Poner puntero al comienzo del vector
	la	$t0,m2	
#     Ir al cuerpo del bucle
	b	bloquei
#     Incrementar índice i
inci:	addiu	$s1,$s1,1
#     Cuerpo del bucle
bloquei:
#       FOR j := 0 TO 3 DO
forj:
#        Cargar índice inicial en $s2
	move	$s2,$zero
#        Si el índice inicial supera el tope, salir
	bgt	$s2,$t2,finj
#        Ir al cuerpo del bucle
	b	bloquej
#        Incrementar índice j
incj:	addiu	$s2,$s2,1
#        Cuerpo del bucle
bloquej:	
#          suma := suma+m[i,j];

#           Calcular distancia hasta el elemento i-ésimo
	mul	$t3,$s1,4	# Mul 4 por el numero de columnas
	addu	$t3,$t3,$s2
	mul	$t3,$t3,4	# Mul 4 por el tipo de dato, palabra en este caso
#           Poner puntero al elemento i-ésimo
	addu	$t4,$t0,$t3
#           Leer elemento i-ésimo
	lw	$t3,0($t4)
#           Acumular suma sobre $s0
	addu	$s0,$s0,$t3
#        Si el índice iguala el valor tope, salir
	bne	$s2,$t2,incj
finj:
#     Si el índice iguala el valor tope, salir
	bne	$s1,$t1,inci
fini:


# Fin del programa
	li	$v0,10
	syscall
