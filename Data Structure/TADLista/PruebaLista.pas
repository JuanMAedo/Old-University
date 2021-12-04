PROGRAM PruebaLista;
USES TADElemento, TADLista;

VAR
	lista, restoLista, listaConcatenada: TipoLista;
	elemento: TipoElemento;
BEGIN
	CrearVacia(lista);

	Construir(lista, 1);
	InsertarFinal(lista, -5);
	Construir(lista, 10);
	InsertarFinal(lista, 8);

	MostrarLista(lista);

	IF (NOT EsVacia(lista)) THEN
	BEGIN
		Primero(lista, elemento);
		Writeln('Primero:');
		MostrarElemento(elemento);
		Writeln;

		Resto(lista, restoLista);
		Writeln('Resto:');
		MostrarLista(restoLista);

		Ultimo(lista, elemento);
		Writeln('Último:');
		MostrarElemento(elemento);
		Writeln;
	END;

	Writeln('Longitud: ', Longitud(lista));

	IF (Pertenece(lista, 8)) THEN
		Writeln('Pertenece: SÍ')
	ELSE
		Writeln('Pertenece: NO');

	Concatenar(lista, restoLista, listaConcatenada);
	MostrarLista(listaConcatenada);

	WHILE (lista<>NIL) DO
	BEGIN
		Primero(lista, elemento);
		BorrarElemento(lista, elemento);
	END;
	MostrarLista(lista);

	Construir(lista, 1);
	InsertarFinal(lista, 2);
	MostrarLista(lista);
END.
