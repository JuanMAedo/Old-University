.data
# Definici�n del tipo estructurado en PASCAL
#   TYPE TipoEmpleado = RECORD
#			   Nombre: ARRAY [0..31] OF CHAR;	/* 32 octetos */
#			   DNI: INTEGER;			/* 4 octetos */
#			   Letra: CHAR;				/* 1 octeto */
#			   Departamento: CHAR;			/* 1 octeto */
# {Hay que dejar un hueco de 2 octetos para alinear el siguiente campo }
#			   Sueldo: INTEGER;			/* 4 octetos */
#		        END;					/* TOTAL: 44 octetos */
# VAR tabla: ARRAY [0..99] OF TipoEmpleado;

# Definici�n de una tabla rellena
# Alineamos cada elemento a posici�n m�ltiplo de 4,
# ya que hay campos con restricci�n de alineamiento
tabla2:
# tabla2[0]
		.align	2
		.asciiz	"Pepito P�rez"	# Nombre
		.space	19		  # Hueco para rellenar el nombre hasta 32 bytes
		.word	12345678	# DNI
		.byte	'Z'		# Letra del DNI
		.byte	'1'		# C�digo del departamento
		.align	2		  # Alineamiento a posici�n m�ltiplo de 4
		.word	1200		# Sueldo mensual
# tabla2[1]
		.asciiz	"Antonia Mu�oz"	# Nombre
		.space	18		  # Hueco para rellenar el nombre hasta 32 bytes
		.word	11111111	# DNI
		.byte	'H'		# Letra del DNI
		.byte	'2'		# C�digo del departamento
		.align	2		  # Alineamiento a posici�n m�ltiplo de 4
		.word	1500		# Sueldo mensual
# tabla2[2]
		.asciiz	"Juan Vald�s"	# Nombre
		.space	20		  # Hueco para rellenar el nombre hasta 32 bytes
		.word	22222222	# DNI
		.byte	'J'		# Letra del DNI
		.byte	'1'		# C�digo del departamento
		.align	2		  # Alineamiento a posici�n m�ltiplo de 4
		.word	1300		# Sueldo mensual
# tabla2[3]
		.asciiz	"Tom�s Mart�n"	# Nombre
		.space	19		  # Hueco para rellenar el nombre hasta 32 bytes
		.word	33333333	# DNI
		.byte	'P'		# Letra del DNI
		.byte	'2'		# C�digo del departamento
		.align	2		  # Alineamiento a posici�n m�ltiplo de 4
		.word	1000		# Sueldo mensual
# tabla2[4]
		.asciiz	"Mar�a S�nchez"	# Nombre
		.space	18		  # Hueco para rellenar el nombre hasta 32 bytes
		.word	44444444	# DNI
		.byte	'A'		# Letra del DNI
		.byte	'1'		# C�digo del departamento
		.align	2		  # Alineamiento a posici�n m�ltiplo de 4
		.word	1700		# Sueldo mensual
# Tira de caracteres auxiliar
eoln:		.byte	'\n'

		.text
##############################################################################
#                                                                            #
# SUMA DE UNO DE LOS CAMPOS DE LA TABLA                                      #
#                                                                            #
##############################################################################
#
# C�DIGO EN PASCAL
#
##########################################
#
# VAR tabla2: ARRAY [0..4] OF TipoEmpleado;
#    s, i: INTEGER;
# BEGIN
#    suma := 0;
#    FOR i:= 0 TO 4 DO
#       suma := suma + tabla2[i].sueldo;
# END.
#
##########################################
# suma: registro $s0
# i:    registro $t0
# temporales: $t0 ... $t5
##########################################
#    suma := 0;
	move	$s0,$zero
#    FOR i:= 0 TO 4 DO
for:
#     Cargar �ndice inicial en $t0
	move	$t0,$zero
#     Cargar �ndice tope en $t1
	li	$t1,4
#     Si el �ndice inicial supera el tope, salir
	bgt	$t0,$t1,end
#         Poner puntero al comienzo de la tabla
	la	$t2,tabla2
#     Ir al cuerpo del bucle
	b	body
#     Incrementar �ndice
inc:	addiu	$t0,$t0,1
#     Cuerpo del bucle
body:
#       suma := suma + tabla2[i].sueldo;
#         Calcular distancia hasta el elemento i-�simo
	mul	$t3,$t0,44
#         Poner puntero al elemento i-�simo
	addu	$t4,$t2,$t3
#         Leer sueldo del elemento i-�simo
	lw	$t5,40($t4)
#         Acumular suma sobre $s0
	addu	$s0,$s0,$t5
#         Si el �ndice iguala el valor tope, salir
	bne	$t0,$t1,inc
end:


# Fin del programa
	li	$v0,10
	syscall
