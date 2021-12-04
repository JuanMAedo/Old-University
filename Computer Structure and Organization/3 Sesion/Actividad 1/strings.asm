	.data
# Almacena como máximo 16 caracteres, contenido inicial indefinido
# Cuidado, habría que poner un nulo en el primer carácter
T1:	.space	16
# Almacena como máximo 12 caracteres, tira vacía (comienza por nulo)
T2:	.byte	0
	.space	15
# Dos definiciones equivalentes
#    Poniendo explícitamente el nulo al final con la directiva .byte
T3:	.ascii	"Hola"
	.byte	0
#    Con .asciiz, que ya genera el nulo final directamente
T4:	.asciiz	"Hola"

# Tira de 12 caracteres con cuatro ocupados más el carácter nulo
T5:	.asciiz	"Hola"	# Contenido “legible” de la tira
	.space	7	# Hueco de relleno al tamaño máximo

# Elemento
elem:	.space	1

# Longitud de la tira
	.align	2
lon:	.space	4

	.text
##################################################################################
#                                                                                #
# ACCESO A UN ELEMENTO DE UNA TIRA DE CARACTERES CON ÍNDICE CONSTANTE CONOCIDO   #
#                                                                                #
##################################################################################
#
# CÓDIGO EN PASCAL
#
##########################################
#
#   elem := T3[1];
#
##########################################
# elem: mantenemos una copia en el registro $s0, y luego lo copiamos en memoria
##########################################
# Poner un puntero al inicio de la tira
	la	$t0,T3
# Distancia del elemento al inicio del vector: 1
# Se accede al elemento con direccionamiento indirecto al puntero $t0
# con la distancia al comienzo de la tira como desplazamiento
	lbu	$s0,1($t0)
	sb	$s0,elem


##################################################################################
#                                                                                #
# ACCESO A UN ELEMENTO DE UNA TIRA DE CARACTERES CON ÍNDICE GENÉRICO DESCONOCIDO #
#                                                                                #
##################################################################################
#
# CÓDIGO EN PASCAL
#
##########################################
#
#    elem := T4[i];
#
##########################################
# elem: mantenemos una copia en el registro $s0, y luego lo copiamos en memoria
# i:	registro $s1
# temporales: $t0 y $t1
##########################################
# Ponemos un valor a i, se puede cambiar
	li	$s1,2
# Poner un puntero al inicio del vector
	la	$t0,T4

# Sumando la distancia al puntero tenemos un puntero al elemento buscado
	addu	$t1,$t0,$s1
	lbu	$s0,0($t1)
	sb	$s0,elem

##################################################################################
#                                                                                #
# CÁLCULO DE LA LONGITUD DE UNA TIRA DE CARACTERES                               #
#                                                                                #
##################################################################################
#
# CÓDIGO EN PASCAL
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
while:		# Cargar la direccion del puntero fuera del bucle nos ha hecho ahorrar 5 #
#         Poner puntero al elemento i-ésimo
	addu	$t0,$t0,$s0
#         Leer elemento i-ésimo
	lbu	$t1,0($t0)
#         Si el carácter leído es el nulo, salir
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
