PROGRAM Prueba;
USES TADElemento, TADListaOrdenada;

VAR
	lista, restoLista, listaMezclada: TipoListaOrdenada;
	elemento: TipoElemento;
BEGIN
	CrearVacia(lista);

	Insertar(lista, 1);
	Insertar(lista, -5);
	Insertar(lista, 10);
	Insertar(lista, 8);

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

	Mezclar(lista, restoLista, listaMezclada);
	MostrarLista(listaMezclada);

	WHILE (NOT EsVacia(lista)) DO
	BEGIN
		Primero(lista, elemento);
		BorrarElemento(lista, elemento);
	END;
	MostrarLista(lista);

	Insertar(lista, 1);
	Insertar(lista, 2);
	MostrarLista(lista);
END.
