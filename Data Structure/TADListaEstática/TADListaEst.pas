UNIT TADListaEst;

INTERFACE
	USES TADElemento;

	CONST
		INI = 1;
		FIN = 10;

	TYPE
		TipoRangoAlmacen = INI..FIN;
		TipoAlmacen = array [TipoRangoAlmacen] of TipoElemento;
		TipoRangoUltimo = 0..FIN;
		TipoLista = RECORD
			almacen: TipoAlmacen;
			ultimo: TipoRangoUltimo;
		END;
		
	(* OPERACIONES CONSTRUCTORAS GENERADORAS *)

	PROCEDURE CrearVacia(VAR lista: TipoLista);
	{PRE: Cierto}
	{POST: La lista esta vacia}

	PROCEDURE Construir(VAR lista: TipoLista; elemento: TipoElemento);
	{PRE: Hay espacio para almacenar elemento en la lista}
	{POST: "elemento" queda almacenado al principio de "lista"}
	
	(* OPERACIONES OBSERVADORAS SELECTORAS *)

	PROCEDURE Primero(lista: TipoLista; VAR elemento: TipoElemento);
	{PRE: "lista" no esta vac¡a}
	{POST: Devuelve el primer elemento que contiene "lista"}
	
	PROCEDURE Resto(lista: TipoLista; VAR restante: TipoLista);
	{PRE: "lista" no esta vacia y queda suficiente memoria para crear "restante"}
	{POST: Devuelve en "restante" una copia de "lista" excepto el primer nodo}
	
	(* OPERACIONES OBSERVADORAS NO SELECTORAS *)

	FUNCTION EsVacia(lista: TipoLista): boolean;
	{PRE: Cierto}
	{POST: Devuelve TRUE si "lista" es vac¡a}

	FUNCTION Longitud(lista: TipoLista): integer;
	{PRE: Cierto}
	{POST: Devuelve el numero de elementos de la lista}

	PROCEDURE Ultimo(lista: TipoLista; VAR elemento: TipoElemento);
	{PRE: "lista" no esta vacia}
	{POST: Devuelve el ultimo elemento que contiene "lista"}
	
	FUNCTION Pertenece(lista: TipoLista; elemento: TipoElemento): boolean;
	{PRE: Cierto}
	{POST: Devuelve TRUE si "lista" contiene a "elemento"}

	PROCEDURE Concatenar(l1, l2: TipoLista; VAR listaResultado: TipoLista);
	{PRE: Queda suficiente memoria para crear "listaResultado"}
	{POST: Devuelve en "listaResultado" la concatenacion de "l1" y "l2"}
	
	PROCEDURE BorrarElemento(VAR lista: TipoLista; elemento: TipoElemento);
	{PRE: Cierto}
	{POST: Elimina la primera aparicion de "elemento" en "lista"}

	PROCEDURE InsertarFinal(VAR lista: TipoLista; elemento: TipoElemento);
	{PRE: Queda suficiente memoria para insertar "elemento" en "lista"}
	{POST: El ultimo elemento de "lista" es "elemento"}

	PROCEDURE Copiar(lista1: TipoLista; VAR lista2: TipoLista);
	{PRE: Queda suficiente memoria para realizar la copia}
	{POST: Lista2 contiene todos los nodos de lista1}

	PROCEDURE MostrarLista(lista: TipoLista);
	{PRE: Cierto}
	{POST: Muestra por pantalla la lista}
IMPLEMENTATION
	PROCEDURE CrearVacia(VAR lista: TipoLista);
	BEGIN
		lista.ultimo := 0;
	END;

	FUNCTION EsLlena(lista: TipoLista): boolean;
	BEGIN
		EsLlena := lista.ultimo = FIN;
	END;

	PROCEDURE Construir(VAR lista: TipoLista; elemento: TipoElemento);
	VAR
		i: integer;
	BEGIN
		IF (NOT EsLlena(lista)) THEN
		BEGIN
			FOR i := lista.ultimo DOWNTO INI DO
				CopiarElemento(lista.almacen[i], lista.almacen[i + 1]);
			CopiarElemento(elemento, lista.almacen[INI]);
			lista.ultimo := lista.ultimo + 1;
		END;
	END;

	PROCEDURE Primero(lista: TipoLista; VAR elemento: TipoElemento);
	BEGIN
		IF (NOT EsVacia(lista)) THEN
			CopiarElemento(lista.almacen[INI], elemento);
	END;

	PROCEDURE Copiar(lista1: TipoLista; VAR lista2: TipoLista);
	VAR
		i: integer;
	BEGIN
		CrearVacia(lista2);

		FOR i := INI TO lista1.ultimo DO
			CopiarElemento(lista1.almacen[i], lista2.almacen[i]);
		lista2.ultimo := lista1.ultimo;
	END;

	PROCEDURE Resto(lista: TipoLista; VAR restante: TipoLista);
	VAR
		elemento: TipoElemento;
	BEGIN
		IF (NOT EsVacia(lista)) THEN
		BEGIN
			Copiar(lista, restante);
			Primero(restante, elemento);
			BorrarElemento(restante, elemento);
		END;
	END;

	FUNCTION EsVacia(lista: TipoLista): boolean;
	BEGIN
		EsVacia := lista.ultimo = 0;
	END;

	FUNCTION Longitud(lista: TipoLista): integer;
	BEGIN
		Longitud := lista.ultimo;
	END;

	PROCEDURE Ultimo(lista: TipoLista; VAR elemento: TipoElemento);
	BEGIN
		IF (NOT EsVacia(lista)) THEN
			CopiarElemento(lista.almacen[lista.ultimo], elemento);
	END;

	FUNCTION Pertenece(lista: TipoLista; elemento: TipoElemento): boolean;
	VAR
		encontrado: boolean;
		i: integer;
	BEGIN
		encontrado := FALSE;
		i := INI;
		WHILE ((NOT encontrado) AND (i <= lista.ultimo)) DO
		BEGIN
			encontrado := SonElementosIguales(elemento, lista.almacen[i]);
			IF (NOT encontrado) THEN
				i := i + 1;
		END;

		Pertenece := encontrado;
	END;

	PROCEDURE Concatenar(l1, l2: TipoLista; VAR listaResultado: TipoLista);
	VAR
		i, j: integer;
	BEGIN
		IF ((Longitud(l1) + Longitud(l2)) <= FIN) THEN
		BEGIN
			CrearVacia(listaResultado);

			Copiar(l1, listaResultado);

			i := listaResultado.ultimo + 1; {Posición en la lista "listaResultado"}
			FOR j := INI TO l2.ultimo DO
			BEGIN
				CopiarElemento(l2.almacen[j], listaResultado.almacen[i]);
				listaResultado.ultimo := listaResultado.ultimo + 1;

				i := i + 1;
			END;
		END;
	END;

	PROCEDURE BorrarElemento(VAR lista: TipoLista; elemento: TipoElemento);
	VAR
		encontrado: boolean;
		i, iExplorador: integer; {Índice Explorador}
	BEGIN
		encontrado := FALSE;
		iExplorador := INI;
		WHILE ((NOT encontrado) AND (iExplorador <= lista.ultimo)) DO
		BEGIN
			encontrado := SonElementosIguales(elemento, lista.almacen[iExplorador]);
			IF (NOT encontrado) THEN
				iExplorador := iExplorador + 1;
		END;

		IF (encontrado) THEN
		BEGIN
			FOR i := iExplorador TO lista.ultimo - 1 DO
				CopiarElemento(lista.almacen[i + 1], lista.almacen[i]);
			lista.ultimo := lista.ultimo - 1;
		END;
	END;

	PROCEDURE InsertarFinal(VAR lista: TipoLista; elemento: TipoElemento);
	BEGIN
		IF (NOT EsLlena(lista)) THEN
		BEGIN
			lista.ultimo := lista.ultimo + 1;
			CopiarElemento(elemento, lista.almacen[lista.ultimo]);
		END;
	END;

	PROCEDURE MostrarLista(lista: TipoLista);
	VAR
		i: integer;
	BEGIN
		Write('[');
		IF (NOT EsVacia(lista)) THEN
		BEGIN
			FOR i := INI TO lista.ultimo - 1 DO
			BEGIN
				MostrarElemento(lista.almacen[i]);
				Write(', ');
			END;
			MostrarElemento(lista.almacen[lista.ultimo]);
		END;
		Writeln(']');
	END;
END.
			
