# Definicion del tipo estructurado
#	TYPE Contacto = RECORD
#		Nombre: ARRAY[0..28]	#29 + 3vacio para completar tipo palabra
#		TLF: INTEGER;		#4
#		Dir: ARRAY[0..20]	#21 + 3 completar en palabra
#	tipo record = .space 60 --> 60 * 20 contactos =  .space 1200
		.data
# Reserva de memoria #
agenda:		.space	1200
tira1:		.asciiz	"\n ¿Qué operación desea realizar?\nConsultar = 0\nInsertar = 1 : "
tira2:		.asciiz "\nIntroduzca el índice del contacto : "
tira3:		.asciiz "\nIntroduzca el nombre: "
tira4:		.asciiz	"\nIntroduzca el telefono: "
tira5:		.asciiz	"\nIntroduzca la dirección: "
tira6:		.asciiz "\nEl nombre del contacto es: "
tira7:		.asciiz "\nSu numero de telefono es: "
tira8:		.asciiz	"\n\nSu direccion es: "
imprError:	.asciiz	"\nLa agenda ya tiene 20 contactos, por lo que no se pueden introducir más "		
		
		
#########################################################################################################
		.text
		li 	$s0,0			# Inicializar contador de contactos en 0 #
		li	$s1,20			# Inicializamos el tope de 20 contactos #
menu:		
# Imprimir menu inicial
		li 	$v0,4
		la 	$a0,tira1
		syscall
# Pedir entero por pantalla
		li 	$v0,5
		syscall
		move 	$t0,$v0			# Guardo el resultado en t0 #
		bnez  	$t0,case1 		# En caso de que se elija la opcion distinta a 0 se hará un salto, sino se continuará entendiendo que se ha elejido un 0 #

case0:		
		addi	$sp,$sp,-4		# Creo la pila, 60 por contacto, 4 dirección agenda, 4 numero de contactos que se tienen		
		li 	$v0,4
		la 	$a0,tira2		# Imprimo por pantalla la tira2 #
		syscall

		li 	$v0,5
		syscall
		move 	$a0,$v0			# Guardo en el registro a0 el índice del contacto que quiero consultar #
		
		la   	$t1,agenda		# Cargo la direccion de agenda en t1 #
		sw	$t1,0($sp)		# Guardo en la pila la direccion de la agenda, ya que para la subrutina esta limitada la entrada solo entra el indice en a0#
		jal  	consulta		# Llamo a la subrutina consulta #
		
		la	$t2,0($sp)		# Cargo la direccion del inicio de la pila en t2 para imprimir el nombre por pantalla #
		lw	$t3,32($sp)		# Guardo la palabra (el telefono) en t3 #
		la	$t4,36($sp)		# Cargo la direccion del inicio de la pila en t4 para imprimir la direccion por pantalla #

		li 	$v0,4
		la 	$a0,tira6		# Imprimo la tira6 por pantalla #
		syscall 
		
		li 	$v0,4
		move	$a0,$t2			# Imprimo lo almacenado en la direccion guardad en t2 #
		syscall
		
		li 	$v0,4
		la 	$a0,tira7		# Imprimo por pantalla la tira7 #
		syscall
		
		li 	$v0,1
		la	$a0,0($t3)		# Imprimo lo almacenado en la direccion guardad en t3 #
		syscall
		
		li 	$v0,4
		la 	$a0,tira8		# Imprimo por pantalla la tira8 #
		syscall
		
		li 	$v0,4
		move	$a0,$t4			# Imprimo lo almacenado en la direccion guardad en t4 #
		syscall
		
		addi	$sp,$sp,60		# Devuelvo el puntero al inicio de la pila
		b   menu			# Salto de vuelta al menú #
		
case1:		bne  	$t0,1,fin		# Comprobación de que se elige una opción válida, si no se entenderá que ha elegido una incorrecta y se finalizará la sesión #
		beq  	$s0,$s1,error		# Comprueba de que no se hayan creado ya 20 contactos #
		addi	$sp,$sp,-60		# Creo la pila, 60 por contacto, 4 dirección agenda, 4 numero de contactos que se tienen
		la	$t0,0($sp)		# Cargo la direccion de la pila donde voy a guardar temporalmente el nombre que quiero meter a #
		la	$t1,32($sp)		# Cargo la direccion de la pila donde voy a guardar temporalmente el numero de telefono que voy a meter en la agenda #
		la	$t2,36($sp)		# Cargo la direccion de la pila donde voy a guardar temporalmente la direccion que voy a meter en la agenda #
		
		li	$v0,4
		la 	$a0,tira3		# Imprimimos la tira3 #
		syscall
		
		li 	$v0, 8
		move 	$a0, $t0		# Se lee la cadena introducida con un maxímo de 29 caracteres + 1 nulo temporalmente en la pila #
		li 	$a1, 30
		syscall  
		   
		li 	$v0,4
		la 	$a0,tira4		# Imprimimos la tira4 #
		syscall
	
		li 	$v0,5
		syscall
		move	$t1,$v0			# Guardo temporalmente en la pila el numero #
		
		li 	$v0,4
		la	$a0,tira5		# Imprimimos la tira5 #
		syscall
		
		li	$v0, 8
		move 	$a0, $t2		# Se guarda la cadena introducida con un maxímo de 21 caracteres + 1 nulo temporalmente en la pila #
		li 	$a1, 22
		syscall
		
		lw	$a0,0($t0)		# Introduzco en a0 el nombre del contacto #
		move	$a1,$t1			# Introduzco en a1 el numero del contacto #
		lw	$a2,0($t2)		# Introduzco en a2 la direccion del contacto #
		addi	$sp,$sp,52		# Devuelvo la pila excepto 2 palabras, ya que las voy a usar a continuación #
		la   	$t1,agenda		# Cargo la direccion de agenda en t1 # 
		sw	$t1,0($sp)		# Guardo la direccion de la agenda en la pila (ya que no puede entrar por registros a)#	
		sw	$s0,4($sp)	 	# Guardo el indicador de cuantos contactos llevo en la pila (ya que no puede etrar por registros a)# 
		
		jal    insertar	
		addi 	$s0,$s0,1		#Actualizamos el número de contactos que tenemos, que nos servirá también para saber dónde introducirlo #

		b 	menu
error:		
		li 	$v0,4
		la 	$a0,imprError
		syscall
fin:
# Fin de programa
		li 	$v0,10
		syscall
		

###################################
# Subrutina que consulta los datos de un contacto
# Parametros: $a0 indice
##################################
consulta:
		move 	$t0,$a0			# Cargo el índice
		lw	$t1,0($sp)		# Cargo la direccion de la agenda #
		li   	$t2,60			# Cargo la distancia de 1 tipo contacto
		addi	$sp,$sp,4
		addi	$sp,$sp,-60		# Añado el espacio a la pila necesario para guardar el contacto reutilizando los 4 anteriores de la direccion de agenda#
		mul  	$t0,$t0,$t2		# Calculo la posición de inicio del contacto que se quiere consultar
		add  	$t2,$t1,$t0		# Obtengo en $t2 el inicio de agenda[i]	
		lw	$t3,0($t2)		# guardo en t3 la palabra de t2 #	
		sw  	$t3,0($sp)		# Guardo agenda[i].nombre en la pila
		addiu	$t2,$t2,32		# Obtengo en t2 el inicio de agenda[i].numero #
		lw	$t3,0($t2)		# guardo en t3 la palabra de t2 #
		sw	$t3,32($sp)		# Guardo agenda[i].telefono en la pila
		addiu	$t2,$t2,4		# Obtengo en t2 el inicio de agenda[i].direccion #
		lw	$t3,0($t2)   		# guardo en t3 la palabra de t2 #
		sw	$t3,36($sp)		# Guardo agenda[i].direccion en la pila		
		la	$v0,0($sp)		# Devuelvo la direccion del inicio de la pila donde he guardado los datos que quiero consultar #
		jr	$ra
###################################
# Subrutina que inserta un elemento nuevo en la agenda
# Parametros: $a0 Nombre, $a1 Dirección, $a2 tlf 
###################################
insertar:		
		lw	$t1,0($sp)		# Cargo inicio dirección de la agenda
		lw	$t2,4($sp)		# Cargo la posicion que se tiene que introducir #
		mul	$t2,$t2,60		# Obtengo el inicio de la posicion * por el espacio de tipo contacto
		addu	$t2,$t2,$t1		# Obtengo la direccion agenda[i] en t2 #
		sw	$a0,0($t2)		# Guardo en t2 la palabra a0(inserto el nombre del contacto) #
		addiu	$t2,$t2,32		# Obtengo la direccion agenda[i].numero en t2 #
		sw	$a1,($t2)		# Guardo en t2 la palabra a1(inserto el telefono del contacto) #
		addiu	$t2,$t2,4		# Obtengo la direccion agenda[i].direccion en t2 #
		sw	$a2,0($t2)		# Guardo en t2 la palabra a2(inserto la direccion del contacto) #
		addi	$sp,$sp,8		# Creo la pila, 60 por contacto, 4 dirección agenda, 4 numero de contactos que se tienen
		jr	$ra
