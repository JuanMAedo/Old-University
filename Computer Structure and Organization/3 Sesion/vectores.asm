	.data
# Vector de 16 elementos de tamaño palabra sin valor inicial determinado
v1:	.space	64		# Reserva
# Vector de 16 datos de 32 bits en complemento a 2 con valor inicial
v2:	.word	10,3300,-2342,90,0,3333333,-27688,0xB2001234,4,-21,-5,22,665,772,-45,3333

	.text
##############################################################################
#                                                                            #
# ACCESO A UN ELEMENTO DE UN VECTOR CON ÍNDICE CONSTANTE CONOCIDO            #
#                                                                            #
##############################################################################
#
# CÓDIGO EN PASCAL
#
##########################################
#
# VAR v2: ARRAY [0..15] OF INTEGER;
#    elem: INTEGER;
# BEGIN
#    elem := v2[5];
# END.
#
##########################################
# Tamaño de un entero: 4
# elem: mantenemos una copia en el registro $s0, no lo vamos a almacenar en memoria
# temporales: $t0
##########################################
# Poner un puntero al inicio del vector
	la	$t0,v2
# Distancia del elemento al inicio del vector:
#    5*tamaño de un entero = 20
# Se accede al elemento con direccionamiento indirecto al puntero $t0
# con la distancia al comienzo del vector como desplazamiento
	lw	$s0,20($t0)


##############################################################################
#                                                                            #
# ACCESO A UN ELEMENTO DE UN VECTOR CON ÍNDICE GENÉRICO DESCONOCIDO          #
#                                                                            #
##############################################################################
#
# CÓDIGO EN PASCAL
#
##########################################
#
# VAR v2: ARRAY [0..15] OF INTEGER;
#     elem: INTEGER;
#     i: INTEGER;
# BEGIN
#    elem := v2[i];
# END.
#
##########################################
# Tamaño de un entero: 4
# elem: mantenemos una copia en el registro $s0, no lo vamos a almacenar en memoria
# i:	registro $s1
# temporales: $t0 y $t1
##########################################
# Ponemos un valor a i, se puede cambiar
	li	$s1,7
# Poner un puntero al inicio del vector
	la	$t0,v2
# Distancia del elemento al inicio del vector: i * 4: hay que calcularla
	mul	$t1,$s1,4
# Sumando la distancia al puntero tenemos un puntero al elemento buscado
	addu	$t1,$t0,$t1
	lw	$s0,0($t1)


##############################################################################
#                                                                            #
# SUMA DE LOS ELEMENTOS DE UN VECTOR                                         #
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
#    FOR i:= 0 TO 9 DO
#       suma := suma+v[i];
# END.
#
##########################################
# Tamaño de un entero: 4
# suma: registro $s0
# i:    registro $t0
# temporales: $t0 ... $t5
##########################################
#    suma := 0;
	move	$s0,$zero
#    FOR i:= 0 TO 9 DO
for:
#     Cargar índice inicial en $t0
	move	$t0,$zero
#     Cargar índice tope en $t1
	li	$t1,9
#     Si el índice inicial supera el tope, salir
	bgt	$t0,$t1,end
#         Poner puntero al comienzo del vector
	la	$t2,v2
#     Ir al cuerpo del bucle
	b	body
#     Incrementar índice
inc:	addiu	$t0,$t0,1
#     Cuerpo del bucle
body:				# Cargamos la dirreción del vector fuera del bucle ahorrandonos 15 instrucciones
#       suma := suma+v[i];
#         Calcular distancia hasta el elemento i-ésimo
	mul	$t3,$t0,4
#         Poner puntero al elemento i-ésimo
	addu	$t4,$t2,$t3
#         Leer elemento i-ésimo
	lw	$t5,0($t4)
#         Acumular suma sobre $s0
	addu	$s0,$s0,$t5
#         Si el índice iguala el valor tope, salir
	bne	$t0,$t1,inc
end:


# Fin del programa
	li	$v0,10
	syscall
