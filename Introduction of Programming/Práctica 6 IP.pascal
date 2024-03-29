PROGRAM practica6;


 VAR
 	OpcionElegida:char;
 	base,limite,cifra,sumatorioSinceros:integer;
 	numero1,numero2,divisor,sumatorio1,sumatorio2:integer;
 	i,cifra1,cifra2,numNuevo:integer;
	totalpar: boolean;
	vecesPiramide:integer;


BEGIN
	writeln('*******************************************************');
    writeln('         Autor: Juan Martinez-Aedo Gomez');
    writeln('*******************************************************');
    REPEAT
    	writeln;
    	writeln('a) Multiplos sinceros');
		writeln('b) Numeros amigos');
		writeln('c) Numeros colegas');
		writeln('d) Numero totalpar');
		writeln('e) Mostrar triangulo');
		writeln('f) Terminar');
		writeln;
		writeln('Elija una opcion: ');
		readln(opcionElegida);
		CASE opcionElegida OF
				'A','a':BEGIN{Inicio de la instrucción de multiplos sinceros}
							writeln('************ Multiplos Sinceros **************');
							REPEAT
								writeln('Introduzca el numero de una cifra: ');
								readln(base);
							UNTIL(base<10);
							REPEAT
								writeln('Introduzca el limite(entero positivo): ');
								readln(limite);
							UNTIL(limite>0);
							writeln('Los multiplos sinceros son:');
							FOR i:=1 TO limite DO
							BEGIN
								numNuevo:=i;
								sumatorioSinceros:=0;
								REPEAT
									cifra:=numNuevo MOD 10;
									numNuevo:=numNuevo DIV 10;
									sumatorioSinceros:=sumatorioSinceros + cifra;
								UNTIL(numNuevo=0);
								IF (i MOD base = 0 ) AND (sumatorioSinceros = base) THEN
									write(i,' ');
							END;
							writeln;
						END;{Final de la instrucción de multiplos sinceros}
				'B','b':BEGIN{Inicio de la instrucción de numeros amigos}
							writeln('************ Numeros Amigos **************');
							REPEAT
								writeln('Introduzca un numero positivo: ');
								readln(numero1);
							UNTIL(numero1>0);
							REPEAT
								writeln('Introduzca un numero positivo: ');
								readln(numero2);
							UNTIL(numero2>0);
							sumatorio1:=0;
							FOR divisor:=1 TO (numero1 DIV 2) DO
							BEGIN
								numNuevo:= numero1 MOD divisor;
								IF numNuevo=0 THEN
									sumatorio1:=sumatorio1+divisor;
							END;
							sumatorio2:=0;
							FOR divisor:=1 TO (numero2 DIV 2) DO
							BEGIN
								numNuevo:= numero2 MOD divisor;
								IF numNuevo=0 THEN
									sumatorio2:=sumatorio2+divisor;
							END;
							IF (sumatorio1=numero2) AND (sumatorio2=numero1) THEN
								writeln('Los numeros son amigos')
							ELSE
								writeln('Los numeros no son amigos');
						END;{Final de la instrucción de numeros amigos}
				'C','c':BEGIN{Inicio de la instrucción de numeros colegas}
							writeln('************ Numeros Colegas **************');
							REPEAT
								writeln('Introduzca un positivo: ');
								readln(numero1);
							UNTIL(numero1>0);
							REPEAT
								writeln('Introduzca el numero de una cifra: ');
								readln(numero2);
							UNTIL(numero2<10);
							cifra2:= numero1 MOD 10;
							REPEAT
								numNuevo:=numero1 DIV 10;
								numero1:=numNuevo;
							UNTIL(numNuevo<10);
							IF (cifra2=numero1) AND (numNuevo=numero2) THEN
								writeln('Son numeros colegas')
							ELSE
								writeln('No son numeros amigos');
						END;{Final de la instrucción de numeros colegas}
				'D','d':BEGIN {Inicio de la instrucción de numero totalpar}
							writeln('************ Numero Totalpar  **************');
							REPEAT
								writeln('Introduzca un numero positivo: ');
								readln(numero1);
							UNTIL (numero1>0);
							totalpar:=TRUE;
							REPEAT
								cifra1:=numero1 MOD 10;
								numero1:=numero1 DIV 10;
								IF ((cifra1 MOD 2)<>0) THEN
									totalpar:=FALSE;
							UNTIL (numero1=0) OR (totalpar=FALSE);
							IF totalpar=TRUE THEN
								writeln('El numero es totalpar')
							ELSE
								writeln('El numero no es totalpar');
						END;{Final de la instrucción de numero totalpar}
				'E','e':BEGIN{Inicio de la instrucción de la piramide}
							writeln('************ Numero Totalpar  **************');
							REPEAT
								writeln('Introduzca un numero positivo: ');
								readln(numero1);
							UNTIL (numero1>0);
								FOR i:=1 TO numero1 DO
								BEGIN
									vecesPiramide:=0;
									REPEAT
										write(i);
										vecesPiramide:=vecesPiramide+1;
									UNTIL(i=vecesPiramide);
									writeln;
								END;
						END;{Final de la instrucción de la piramide}
				'F','f': writeln('Fin de programa.');
			END;{CASE}
	UNTIL(opcionElegida='F') OR (opcionElegida='f');
	readln;
END.

