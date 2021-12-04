PROGRAM factura;
{Propósito: Crear un programa que calcule la factura de un alquiler de coches}
CONST
   PRECIO1=30;{Precio para todos los recorridos inferiores a 500 kilómetros }
   PRECIO2=0.3;{Precio para recorridos que superen los 500 kilómetros y no superen los 1000 kilómetros}
   PRECIO3=0.1;{Precio para los recorridos que superen los 1000 kilómetros}
   KMBASE=0;
   DISTANCIA1=500;
   DISTANCIA2=1000;

VAR
   diaSemana:char;{Dato que recoge el día de la semana que el cliente realizar el viaje}
   kmRecorridos:integer;{Dato que recoge el número de los kilómetros que se han recorrido}
   precioAlquiler:real;
   kmPrecio2:integer;
   kmPrecio3:integer;
   diferenciaKm:integer;
BEGIN
   writeln('*******************************************************');
   writeln('         Autor: Juan Martinez-Aedo Gomez');
   writeln('*******************************************************');
   writeln;
   write('Escriba la inicial del dia de la semana(L, M, X, J, V, S, D): ');
   readln(diaSemana);
   write('Introduzca los kilometros recorridos: ');
   readln(kmRecorridos);
   WHILE kmRecorridos<KMBASE DO
	   BEGIN
	     write('Introduzca los kilometros recorridos <valor positivo>: ');
	     readln(kmRecorridos);
	   END;{WHILE}
   writeln('***************************************************');
   writeln('Factura');
   CASE diaSemana OF
	   'L','l':writeln('Dia de la semana: Lunes');
	   'M','m':writeln('Dia de la semana: Martes');
	   'X','x':writeln('Dia de la semana: Miercoles');
	   'J','j':writeln('Dia de la semana: Jueves');
	   'V','v':writeln('Dia de la semana: Viernes');
	   'S','s':writeln('Dia de la semana: Sabado');
	   'D','d':writeln('Dia de la semana: Domingo');
	    ELSE
	       writeln('no es un dia valido');
   END;{CASE}
   IF (kmRecorridos<DISTANCIA1) THEN
   	  precioAlquiler:=PRECIO1
   ELSE IF (kmRecorridos<DISTANCIA2) THEN
      BEGIN
          kmPrecio2:=kmRecorridos-DISTANCIA1;
          precioAlquiler:=Precio1+kmPrecio2*PRECIO2;
      END{ELSE IF}
   ELSE
      BEGIN
          kmPrecio3:=kmRecorridos-DISTANCIA2;
          diferenciaKm:=DISTANCIA2-DISTANCIA1;
          precioAlquiler:=Precio1+diferenciaKm*PRECIO2+kmPrecio3*PRECIO3;
      END;{ELSE}
   writeln('El precio del alquiler es : ',precioAlquiler:5:2,' euros.' );
   writeln('Pulse <ENTER> para salir ');
   readln();
END.

