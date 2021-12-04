PROGRAM ejercicio9;
VAR
	opcion:char;
	numero: real;
	numero1,numero2: integer;
PROCEDURE mostrarAutor;
BEGIN {mostrarAutor}
   writeln ('***************************************************');
   writeln ('   AUTOR: Juan Martinez-Aedo Gomez  ' );
   writeln ('***************************************************');
END; {mostrarAutor}

PROCEDURE mostrarMenu;
BEGIN {mostrarMenu}
   writeln('*************************  MENU *************************');
   writeln('P. Calcular la potencia de un numero real ');
   writeln('C. Calcular la cifra i-esima de un numero entero');
   writeln('M. Halla el maximo comun divisor entre dos numeros enteros');
   writeln('T. Terminar');
   write('Introduzca la opcion que quiera realizar: ');
END; {mostrarMenu}

FUNCTION potencia (base:real;exponente:integer) :real;
BEGIN{potencia}
	IF exponente=0 THEN
		potencia:=1
	ELSE IF (exponente>0) AND (exponente MOD 2 = 0) THEN
		potencia:= potencia (base*base,exponente DIV 2)
	ELSE
		potencia:= base*potencia(base,exponente-1);
END;{potencia}
FUNCTION nCifras (numero:integer) : integer;
BEGIN{nCifras}
	IF (numero<10) THEN
		nCifras:=1
	ELSE
		nCifras := nCifras(numero DIV 10) + 1;
END;{comprobacionCifra}
FUNCTION cifraIesima (n,posicion:integer) :integer;
BEGIN {cifraIesima}
	IF (posicion=0) THEN
		cifraIesima:= (n MOD 10)
	ELSE
		cifraIesima:= cifraIesima((n DIV 10),(posicion-1));
END; {cifraIesima}
FUNCTION maximoComunDivisor(a,b : integer) : integer;

BEGIN{maximoComunDivisor}
	IF ( a=b ) THEN
		maximoComunDivisor:=a
	ELSE IF ( a>b ) THEN
		maximoComunDivisor:= maximoComunDivisor((a-b),b)
	ELSE IF ( a<b ) THEN
		maximoComunDivisor:= maximoComunDivisor(a,(b-a));
END;{maximoComunDivisor}

BEGIN{Programa Pricipal}
	mostrarAutor;
	REPEAT
		writeln;
		mostrarMenu;
		readln(opcion);
		CASE opcion OF
			'p','P':BEGIN{Calculo de potencia}
						writeln('***************** POTENCIA *****************');
						write('Introduzca una base que sea un numero real: ');
						readln(numero);
						REPEAT
							write('Introduzca el exponente entero: ');
							readln(numero2);
						UNTIL (numero2>0);
						writeln('El valor de la potencia es: ', potencia(numero,numero2):0:0);
					END;{Fin del calculo de potencia}
			'c','C':BEGIN{Calculo de la cifra I-esima}
						writeln('***************** CIFRAIESIMA *****************');
						write('Introduzca un numero entero: ');
						readln(numero1);
						REPEAT
							write('Introduzca la cifra que quiere hallar del numero : ');
							readln(numero2);
						UNTIL (((numero2>0) OR (numero2=0)) AND ((nCifras(numero1)> numero2 )));
						writeln('el valor de la cifra deseada es: ',cifraIesima(numero1,numero2));
					END;{Fin del calculo de la cifra I-esima}
			'm','M':BEGIN{Calculo del MCD de 2 numeros}
						writeln ('***************** MAXIMO COMUN DIVISOR *****************');
						REPEAT
						write('Introduzca un numero entero positivo: ');
						readln(numero1);
						UNTIL (numero1>0);
						REPEAT
						write('Introduzca otro numero entero: ');
						readln(numero2);
						UNTIL (numero2>0);
						writeln('El maximo comun divisor de ',numero1,' y ',numero2,' es: ',maximoComunDivisor(numero1,numero2));
					END;{Fin del calculo del MCD de 2 numeros}


			't','T':writeln('Fin del programa');
		ELSE
			writeln('Opcion no valida,introduzca una nueva opcion');
		END;{CASE}
	UNTIL (opcion='t') OR (opcion='T');
	readln;
END.{Programa Pricipal}
