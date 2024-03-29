PROGRAM prac5;
CONST
	NUMEROMAX=100;
	INTENTOMAX=7;
VAR
	opcionElegida:char;
	semilla:integer;
	x:integer;
	y:integer;
	numerosMostrar:integer;
	max1:integer;
	max2:integer;
	aleatorio:integer;
	contador:integer;
	numeroAleatorio:integer;
	numeroIntroducido:integer;
	numeroIntento:integer;
	primerNum:integer;
	calidad:real;

BEGIN
	writeln('*************************************************');
	writeln(' Autor: Juan Martinez-Aedo Gomez');
	writeln('*************************************************');
	writeln;
	REPEAT
		writeln;
		writeln('********************  MENU  *********************');
		writeln('a.- Generar una secuencia de numeros aleatorios');
		writeln('b.- Calcular la calidad de una secuencia de numeros aleatorios');
		writeln('c.- Jugar al adivino');
		writeln('f.- Finalizar');
		writeln('Introduzca la opcion');
		readln(opcionElegida);
		CASE opcionElegida OF
			'a','A':BEGIN{Inicio de la instruccion de la secuencia de numeros aleatorios}
						REPEAT
							writeln('Semilla(mayor o igual que 0):');
							readln(semilla);
						UNTIL (semilla>0);
						REPEAT
							writeln('x(mayor que 0):');
							readln(x);
						UNTIL (x>0);
						REPEAT
							writeln('y(mayor que 0):');
							readln(y);
						UNTIL (y>0);
						writeln('***********  GENERAR SECUENCIA  ***********');
						writeln('Cantidad de numeros a mostrar(mayor que 0)');
						readln(numerosMostrar);
						writeln('Valor para max(mayor que 0)');
						readln(max1);
						contador:=0;
						WHILE contador<numerosMostrar DO
						BEGIN
							aleatorio:=((x*(semilla)+y)MOD max1);
							semilla:=aleatorio;
							write(aleatorio,' ');
							contador:=contador+1;
						END;{WHILE}
					END;{Fin de la instruccion de la secuencia de numeros aleatorios}
			'b','B':BEGIN{Inicio de la instruccion de la calidad de la secuencia}
						REPEAT
							writeln('Semilla(mayor o igual que 0):');
							readln(semilla);
						UNTIL (semilla>0);
						REPEAT
							writeln('x(mayor que 0):');
							readln(x);
						UNTIL (x>0);
						REPEAT
							writeln('y(mayor que 0):');
							readln(y);
						UNTIL (y>0);
						{writeln('***********  GENERAR SECUENCIA  ***********')}
						writeln('********  CALIDAD DE LA SECUENCIA  ********');
						writeln('Valor para max(mayor que 0)');
						readln(max1);
						contador:=0;
						primerNum:=0;
						calidad:=0;
						WHILE (calidad=0) DO
						BEGIN
							aleatorio:=((x*(semilla)+y)MOD max1);
							IF (contador=0) THEN
								primerNum:=aleatorio
							ELSE IF (contador>0) AND (primerNum=aleatorio) THEN
								calidad:=(contador / max1);
							semilla:=aleatorio;
							contador:=contador+1;
						END;{WHILE}
						writeln('La calidad de esta secuencia es ',calidad:0:4);
					END;{Fin de la instruccion de la calidad de la secuencia}
			'c','C':BEGIN{Inicio de la instrucción del adivino}
						REPEAT
						writeln('Semilla(mayor o igual que 0):');
						readln(semilla);
						UNTIL (semilla>0);
						REPEAT
						writeln('x(mayor que 0):');
						readln(x);
						UNTIL (x>0);
						REPEAT
						writeln('y(mayor que 0):');
						readln(y);
						UNTIL (y>0);
						numeroAleatorio:=((x*(semilla)+y) MOD NUMEROMAX);
						writeln('**************  EL ADIVINO  ***************');
						contador:=0;
						numeroIntento:=1;
						REPEAT
						writeln('Intento ',numeroIntento,'. Introduzca un numero');
						readln(numeroIntroducido);
						IF (numeroIntroducido<numeroAleatorio) THEN
							writeln('El numero a adivinar es mayor')
						ELSE IF (numeroIntroducido>numeroAleatorio) THEN
							writeln('El numero a adivinar es menor')
						ELSE
							writeln('Enhorabuena. Lo has adivinado');
						numeroIntento:=numeroIntento+1;
						UNTIL (numeroIntroducido=numeroAleatorio) OR (numeroIntento>INTENTOMAX);
					END;{Fin de la instrucción del adivino}
			'f','F':writeln('Fin del programa');
			ELSE
				writeln('ERROR, no ha introducido una opcion valida');
		END;{CASE}

	UNTIL (opcionElegida='f') OR (opcionElegida='F');
	readln;
END.
