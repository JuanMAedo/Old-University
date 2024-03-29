PROGRAM practica8;
VAR
   opcion : char;
   numero1, numero2:integer;

PROCEDURE mostrarAutor;
BEGIN {mostrarAutor}
   writeln ('***************************************************');
   writeln ('   AUTOR: Juan Martinez-Aedo Gomez  ' );
   writeln ('***************************************************');
   writeln;
END; {mostrarAutor}

PROCEDURE mostrarMenu;
BEGIN {mostrarMenu}
   writeln('1. Imprimir los n primeros números naturales  ');
   writeln('2. Imprimir los n números naturales siguientes a un número');
   writeln('3. Imprimir los n primeros naturales en cascada');
   writeln('4. Hallar la suma de los números naturales entre dos número');
   writeln('5. Hallar el número de múltiplos de un número que hay en los n primeros naturales ');
   writeln('S. Salir');
END; {mostrarMenu}

FUNCTION pedirNumeroPositivo:integer;
{Solicita al usuario un número positivo}
VAR
   num:integer;
BEGIN {pedirNumPositivo}
   REPEAT
      write('Introduzca un numero natural: ');
      readln(num);
   UNTIL (num>0);
   pedirNumeroPositivo:= num;
END;  {pedirNumPositivo}

PROCEDURE nPrimerosNumNaturales (numero:integer);
VAR
	i:integer;
BEGIN{nPrimerosNumNaturales}
	FOR i:=1 TO numero DO
		write(i,' ');
END{nPrimerosNumNaturales};

PROCEDURE SucesionNPrimerosNumNaturales (numero1,numero2:integer);
VAR
	i,x:integer;
BEGIN{SucesionNPrimerosNumNaturales}
	x:=numero1+numero2;
	FOR i:=numero2+1 TO x DO
		write(i,' ');
END{SucesionNPrimerosNumNaturales};
PROCEDURE cascadaNumeros (numero:integer);
VAR
	i,vecesCascada,contador:integer;
BEGIN{cascadaNumeros}
	FOR i:=1 TO numero DO
	BEGIN
		writeln(i);
		contador:=1;
		vecesCascada:=0;
			REPEAT
				write(contador,' ');
				contador:=contador + 1;
				vecesCascada:=vecesCascada + 1;
			UNTIL(i=vecesCascada);
			writeln;
	END;
END;{cascadaNumeros}

FUNCTION sumatorioNumeros (num1,num2:integer) :integer;
VAR
	i,suma:integer;
BEGIN{sumatorioNumeros}
	suma:=0;
	FOR i:=num1 TO num2 DO
		suma:=suma+i;
	sumatorioNumeros:=suma;
END;{sumatorioNumeros}
FUNCTION numeroMultiplosEnN (numeroLimite,base:integer) :integer;
VAR
	resto,i,multiplo:integer;
BEGIN{numeroMultiplosEnN}
	resto:=0;
FOR i:=1 TO numeroLimite DO
	IF (i MOD base = 0) THEN
		multiplo:=multiplo+1;
	numeroMultiplosEnN:=multiplo;
END;{numeroMultiplosEnN}

BEGIN{Programa Principal}
	mostrarAutor;
	REPEAT
		mostrarMenu;
		write('Pulse la opcion deseada: ');
		readln(opcion);
		CASE opcion OF
			'1': BEGIN
					writeln('Ejecutando la opcion 1');
					writeln('¿Cuantos numeros quiere mostrar?');
					numero1:= pedirNumeroPositivo;
					nPrimerosNumNaturales(numero1);
				 END;
			'2': BEGIN
				 	writeln('Ejecutando la opcion 2');
					writeln('¿Cuantos numeros quiere mostrar?');
					numero1:= pedirNumeroPositivo;
					writeln('¿A partir de que numero?');
					numero2:= pedirNumeroPositivo;
					SucesionNPrimerosNumNaturales(numero1,numero2);
				 END;
			'3': BEGIN
				 	writeln('Ejecutando la opcion 3');
					writeln('¿Cuantos numeros quiere mostrar?');
					numero1:= pedirNumeroPositivo;
					cascadaNumeros(numero1);

				 END;
			'4': BEGIN
					writeln('Ejecutando la opcion 4');
					writeln('¿Cual es el primer numero?');
					numero1:= pedirNumeroPositivo;
					REPEAT
						writeln('¿Cual es el segundo numero?');
						numero2:= pedirNumeroPositivo;
					UNTIL(numero1<numero2) OR (numero1=numero2);
					writeln('La suma es: ',sumatorioNumeros(numero1,numero2));
				 END;
			'5': BEGIN
				 	writeln('Ejecutando la opcion 5');
				 	writeln('¿Cual es el ultimo numero?');
				 	numero1:= pedirNumeroPositivo;
				 	REPEAT
				 		writeln('¿Cual es el numero base?');
						numero2:= pedirNumeroPositivo;
				 	UNTIL (numero2<10);
				 	writeln('Existen ',numeroMultiplosEnN(numero1,numero2),' multiplos de ',numero2);

				 END;
			's','S': writeln('Salir del programa');
			ELSE
				writeln('Opcion no valida,introduzca una nueva opcion.');
		END;{CASE}
		writeln;
		writeln('Pulse <ENTER> para continuar');
		readln;
	UNTIL (opcion='S') OR (opcion='s');
END.{Programa Principal}
