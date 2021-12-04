PROGRAM practica10;
CONST
	INDICEMIN=1;
	INDICEMAX=5;
	NUMELEMENTOS=INDICEMAX-INDICEMIN+1;
	NOTAMIN=0;
	APROBADO=5;
	NOTABLE=7;
	SOBRESALIENTE=9;
	MATRICULA=9.6;
	NOTAMAX=10;
TYPE
	tIndice=INDICEMIN..INDICEMAX;
	tElemento=real;
	tNotas= ARRAY [tIndice] OF tElemento;
VAR
	opcion:char;
	notas:tNotas;
	elemBuscado,numMatricula:integer;

	porcentajeSobresaliente:real;
PROCEDURE mostrarAutor;
BEGIN {mostrarAutor}
   writeln ('***************************************************');
   writeln ('   AUTOR: Juan Martinez-Aedo Gomez  ' );
   writeln ('***************************************************');
END; {mostrarAutor}
PROCEDURE mostrarMenu;
BEGIN {mostrarMenu}
   writeln('¿Que desea hacer?');
   writeln('a. Introducir notas  ');
   writeln('b. Mostrar notas');
   writeln('c. Calcular la media');
   writeln('d. Calcular el numero de aprobados');
   writeln('e. Calcular el numero de notables ');
   writeln('f. Calcular el porcentaje de sobresalientes ');
   writeln('g. Calcular el numero de alumnos que han obtenido una nota por encima de la media ');
   writeln('h. Mostrar la nota maxima y el numero de matricula del alumno que la ha obtenido');
   writeln('i. Modificar la nota de un alumno concreto ');
   writeln('j. Mostrar la nota escrita ');
   writeln('k. Finalizar');
   write('Introduzca la opcion deseada: ');
END; {mostrarMenu}
PROCEDURE inicializarAzar(VAR notas:tNotas);
VAR
	i:integer;
BEGIN {inicializarAzar}
	randomize;
	FOR i:=INDICEMIN TO INDICEMAX DO
		notas[i]:=random()*10;
END; {inicializarAzar}
PROCEDURE introducirNotas (VAR notas:tNotas);
VAR
	i:integer;
BEGIN{introducirNotas}
	FOR i:=INDICEMIN TO INDICEMAX DO
	BEGIN
	REPEAT
		write('Alumno ',i,': ');
		readln(notas[i]);
	UNTIL ((notas[i]>0)OR(notas[i]=0)) AND ((notas[i]=NOTAMAX) OR (notas[i]<NOTAMAX));
	END;
END;{introducirNotas}

PROCEDURE MostrarNotas(entrada:tNotas);
VAR
	i:integer;
BEGIN{MostrarNotas}
	FOR i:= INDICEMIN TO INDICEMAX DO
		writeln(i,'. - ',entrada[i]:0:2);
END;{MostrarNotas}

FUNCTION calcularMedia(notas:tNotas) : real;
VAR
	sumatorio:real;
	i:integer;
BEGIN{calcularMedia}
	sumatorio:=0;
	FOR i:=INDICEMIN TO INDICEMAX DO
		sumatorio:=sumatorio + notas[i];
	calcularMedia:=(sumatorio/ INDICEMAX);
END;{calcularMedia}

FUNCTION calcularNotas (notas:tNotas;notaMinima:integer;notaMaxima:real) : integer;
VAR
	total,i:integer;
BEGIN{calcularNotas}
	total:=0;
	FOR i:=INDICEMIN TO INDICEMAX DO
		IF ((notas[i]>notaMinima) OR (notas[i]=notaMinima)) AND ((notas[i]<notaMaxima)) THEN
			total:=total+1;
	calcularNotas:=total;
END;{calcularNotas}

FUNCTION notaEncimaMedia (notas:tNotas;calcularMedia:real) : integer;
VAR
	numAlumnos,i:integer;
BEGIN{notaEncimaMedia}
	numAlumnos:=0;
	FOR i:=INDICEMIN TO INDICEMAX DO
	BEGIN
		IF ((notas[i]>calcularMedia)) THEN
			numAlumnos:=numAlumnos+1;
		notaEncimaMedia:=numAlumnos;
	END;
END;{notaEncimaMedia}
FUNCTION notaMaxima(notas:tNotas): tElemento;
VAR
	i:integer;
	maximo:tElemento;
BEGIN{notaMaxima}
	maximo:= notas [INDICEMIN];
	FOR i:= (succ(INDICEMIN)) TO INDICEMAX DO
		IF notas[i]> maximo THEN
			maximo:=notas[i];
		notaMaxima:=maximo;
END;{notaMaxima}
FUNCTION posicionElemento  (notas:tNotas) : integer;
VAR
posicion,i:integer;
elemMaximo:real;
BEGIN{posicionElemento}
	elemMaximo:=0;
	FOR i:=INDICEMIN TO INDICEMAX DO BEGIN
		IF elemMaximo<notas[i] THEN BEGIN
			elemMaximo:=notas[i];
			posicion:=i;
		END;
	END;
	posicionElemento:=posicion;
END;{posicionElemento}
PROCEDURE cambiarNotas (VAR notas:tNotas;numMatricula:integer);

BEGIN{cambiarNotas}
	REPEAT
		readln(notas[numMatricula]);
	UNTIL ((notas[numMatricula]>0)OR(notas[numMatricula]=0)) AND ((notas[numMatricula]=NOTAMAX) OR (notas[numMatricula]<NOTAMAX));
END;{cambiarNotas}

PROCEDURE notaEscrita (notas:tNotas);
VAR
	i:integer;
BEGIN{notaEscrita}
	FOR i:=INDICEMIN TO INDICEMAX DO
	BEGIN
		IF (notas[i] > 0 ) AND (notas[i] < APROBADO) THEN
			writeln('La nota del alumno con matricula ', i , ' ha tenido un suspenso')
		ELSE IF ((notas[i] > APROBADO) OR (notas[i] = APROBADO)) AND ( notas[i] < NOTABLE) THEN
			writeln('La nota del alumno con matricula ', i , ' ha tenido un aprobado')
		ELSE IF ((notas[i] > NOTABLE) OR (notas[i] = NOTABLE)) AND ( notas[i] < SOBRESALIENTE) THEN
			writeln('La nota del alumno con matricula ', i , ' ha tenido un notable')
		ELSE IF ((notas[i] > SOBRESALIENTE) OR (notas[i] = SOBRESALIENTE)) AND ( notas[i] < MATRICULA) THEN
			writeln('La nota del alumno con matricula ', i , ' ha tenido un sobresaliente')
		ELSE IF ((notas[i] > MATRICULA) OR (notas[i] = MATRICULA)) AND ( notas[i] < NOTAMAX) THEN
			writeln('La nota del alumno con matricula ', i , ' ha tenido un sobresaliente');
	END;
END;{notaEscrita}


BEGIN{Programa Principal}
	mostrarAutor;
	inicializarAzar(notas);
	REPEAT
		writeln;
		mostrarMenu;
		readln(opcion);
		CASE opcion OF
			'a','A':BEGIN
						writeln('Introduzca las notas de los alumnos: ');
						introducirNotas(notas);
				    END;
			'b','B':BEGIN
						writeln('Las notas de los alumnos son :');
						mostrarNotas(notas);
					END;
			'c','C':    write('La media de la clase es de : ',calcularMedia(notas):0:2);
			'd','D':    write('El numero de aprobados en clase es de: ',calcularNotas(notas,APROBADO,NOTAMAX),' sobre ',INDICEMAX );
			'e','E':	write('El numero de notables en clase es de: ',calcularNotas(notas,NOTABLE,SOBRESALIENTE),' sobre ',INDICEMAX );
			'f','F':BEGIN
						 porcentajeSobresaliente:= (calcularNotas(notas,SOBRESALIENTE,MATRICULA) / (INDICEMAX))*100;
						write('El porcentaje de sobresalientes en clase es de: ',porcentajeSobresaliente:0:2,' %' );
					END;
			'g','G':	write('El numero de alumnos que han superado la nota media es de: ', notaEncimaMedia(notas,calcularMedia(notas)));
			'h','H':	write('El alumno con la mejor nota tiene la matricula numero ', posicionElemento(notas) ,' ,que ha obtenido un : ', notaMaxima(notas):0:2);
			'i','I':BEGIN
						write('¿Cual es el numero de matricula a la cual desea cambiar la nota?: ');
						readln(numMatricula);
						write('Introduzca la nueva nota del alumno', numMatricula,' :');
						cambiarNotas(notas,numMatricula);
				    END;
			'j','J':	notaEscrita(notas);
			'k','K':	write('Finalizado.¡Hasta la proxima!');
		ELSE
			writeln('Opcion no valida. Vuelva a elegir  una opcion valida');
		END;{CASE}
	UNTIL(opcion='K') OR (opcion='k');
END. {Programa Principal}
