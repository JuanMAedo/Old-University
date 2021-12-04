ROGRAM Ip_Prac7_19_20;

VAR
   opcion : char;
   base, limite, numero, digito: integer;
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
   writeln;
   writeln ('******************* MENU *********************');
   writeln('a.- Multiplos sinceros ');
   writeln('b.- Números amigos');
   writeln('c.- Números colegas');
   writeln('d.- Número totalpar');
   writeln('e.- Mostrar triángulo');
   writeln('f.- Terminar');
END; {mostrarMenu}

FUNCTION leerNumeroSuperiorA (inf:integer) :integer;
VAR
   n :integer;
BEGIN {leerNumeroSuperiorA}
   REPEAT
       writeln ('Introduzca un número mayor que ', inf);
       readln (n);
   UNTIL (n > inf);
   leerNumeroSuperiorA := n;
END; {leerNumeroSuperiorA}

FUNCTION pedirNum1Cifra:integer;
{Solicita al usuario un número de una cifra}
VAR
   digito:integer;
BEGIN {pedirNum1Cifra}
   REPEAT
      writeln('Introduzca el número de una cifra:');
      readln(digito);
   UNTIL (digito<10) AND (digito>0); {Una cifra y positivo}
   pedirNum1Cifra := digito;
END; {pedirNum1Cifra}


FUNCTION pedirNumPositivo:integer;
{Solicita al usuario un número positivo}
VAR
   num:integer;
BEGIN {pedirNumPositivo}
   REPEAT
      writeln('Introduzca un número positivo');
      readln(num);
   UNTIL (num>0);
   pedirNumPositivo:= num;
END;  {pedirNumPositivo}

FUNCTION escribirMultiplosSinceros(base,limite:integer) :integer;
{Escribe los múltiplos sinceros del número 'base' menores del número 'límite'}
   VAR
      multiplo, i:integer;

   FUNCTION sumaCifras(n:integer ):integer;
   {Devuelve la suma de las cifras de n si n es positivo}
   VAR
      suma, num:integer;
   BEGIN {sumaCifras}
      num := n;
      suma := 0;
      WHILE num <> 0 DO
      BEGIN
         suma := suma + num MOD 10;
         num := num DIV 10;
      END;
      sumaCifras := suma;
   END; {sumaCifras}

BEGIN {escribirMultiplosSinceros}
   i :=1 ;
   multiplo := base; {Primer múltiplo}
   WHILE (multiplo <= limite) DO BEGIN
      IF (sumacifras(multiplo) = base) THEN
         write (multiplo, '  ');
      i := i + 1;
      multiplo := i*base; {Siguiente múltiplo}
   END;
   writeln;
END; {escribirMultiplosSinceros}

FUNCTION sonAmigos (n1,n2:integer) :boolean;
{Devuelve true si n1 y n2 son amigos y false en caso contrarios}
   FUNCTION sumaDivisores(n:integer):integer;
   VAR
      suma, i:integer;
   BEGIN {sumaDivisores}
      suma:=0;
      FOR i:=1 TO n DIV 2 DO
         IF n MOD i = 0 THEN
            suma:= suma + i;
      sumaDivisores := suma;
   END; {sumaDivisores}
 BEGIN {sonAmigos}
      sonAmigos := (sumaDivisores(n1)=n2) AND (sumaDivisores(n2)=n1);
 END; {sonAmigos}

FUNCTION esColega (num,cifra :integer) :boolean;
{Devuelve TRUE si el número num es colega del dígito cifra}

   FUNCTION terminaCon (num, cifra:integer):boolean;
   {Devuelve TRUE si el número num termina por el dígito cifra}
   BEGIN {terminaCon}
       terminaCon := num MOD 10 = cifra;
   END; {terminaCon}
   FUNCTION empiezaCon (num, cifra:integer):boolean;
   {Devuelve TRUE si el número num empieza con el dígito cifra}
   VAR
      nuevo:integer;
   BEGIN {empiezaCon}
      nuevo:=num;
      WHILE (nuevo >=  10) DO
         nuevo := nuevo DIV 10;
      empiezaCon := nuevo = cifra;
   END; {empiezaCon}

BEGIN {esColega}
   esColega := empiezaCon(num, cifra) AND terminaCon (num, cifra);
END; {esColega}


FUNCTION esTotalPar (n:integer) :boolean;
{Devuelve TRUE si n tiene todas sus cifras pares}
BEGIN {esTotalPar}
   WHILE (n MOD 2=0) AND (n<>0) DO
      n := n DIV 10;
   esTotalPar := n MOD 2 = 0;
END; {esTotalPar}

PROCEDURE DibujarTriangulo(base:integer);
{Dibuja un triangulo con números con la 'base' dada}
VAR
   i, j: integer;
BEGIN{dibujarTriangulo}
   FOR i:=1 TO base DO BEGIN
      FOR j:=1 TO i DO
         write(i:2);
      writeln;
   END;
END;{dibujarTriangulo}

BEGIN {Programa principal}
   mostrarAutor;
   REPEAT
      mostrarMenu;
      readln(opcion);
      CASE opcion OF
          'a', 'A': BEGIN
                       writeln('*********** Múltiplos sinceros *********************');
                       base:=PedirNum1Cifra;
                       writeln('Introduzca el límite (superior a base):');
                       limite:=leerNumeroSuperiorA(base);
                       writeln(' Los multiplos sinceros son: ');
                       escribirMultiplosSinceros(base,limite);

                   END;
         'b', 'B': BEGIN
                       writeln('************** Números amigos  *********************');
                       numero1:=PedirNumPositivo;
                       numero2:=PedirNumPositivo;
                       IF (sonAmigos(numero1,numero2) = TRUE) THEN
                          writeln('Los números introducidos son amigos')
                       ELSE
                          writeln ('Los números introducidos no son amigos ');
                   END;
         'c', 'C': BEGIN
                       writeln('************** Números colegas  *********************');
                       numero:=PedirNumPositivo;
                       digito:=PedirNum1Cifra;
                       write ('El número = ', numero);
                       IF  (esColega(numero,digito) = FALSE ) THEN
                          write (' NO' );
                       writeln (' es colega de la cifra d = ',digito);
                   END;
         'd', 'D': BEGIN
                       writeln('************** Números totalpar  *******************');
                       numero:=PedirNumPositivo;
                       write ('El número = ', numero);
                       IF (esTotalPar(numero) = FALSE) THEN
                          write (' NO' );
                       writeln (' es totalpar ');
         		   END;

           'E', 'e': BEGIN
                       writeln('************** Triangulo  *******************');
                       writeln('Base del triangulo: ');
                       numero:=PedirNumPositivo;
                       dibujarTriangulo(numero);
                     END;
           'F','f': writeln('Fin del programa');
           ELSE
               writeln('Opcion no valida');
       END;
   UNTIL (opcion='f') OR (opcion = 'F');
   readln;
END. {Programa principal}















