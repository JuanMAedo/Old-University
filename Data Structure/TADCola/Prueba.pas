PROGRAM Prueba;

USES TADElemento, TADCola;

VAR
	elemento: TipoElemento;
	cola1, cola2: TipoCola;
BEGIN
	CrearVacia(cola1);
	
	Insertar(cola1, 1);
	Insertar(cola1, 2);
	Insertar(cola1, 3);
	
	Write('Cola1 inicial: ');
	MostrarCola(cola1);
	Writeln;
	
	IF (NOT EsVacia(cola1)) THEN
	BEGIN
		Primero(cola1, elemento);
		Write('Primero cola1: ');
		MostrarElemento(elemento);
		Writeln;
	END;
	
	Eliminar(cola1);
	Write('Cola1 después de eliminar: ');
	MostrarCola(cola1);
	Writeln;
	
	Copiar(cola1, cola2);
	Write('Cola 2: ');
	MostrarCola(cola2);
	Writeln;
	
	Write('Son colas iguales: ');
	IF (Iguales(cola1, cola2)) THEN
		Writeln('SI')
	ELSE
		Writeln('NO');

	Eliminar(cola2);
	
	Write('Son colas iguales: ');
	IF (Iguales(cola1, cola2)) THEN
		Writeln('SI')
	ELSE
		Writeln('NO');
END.
