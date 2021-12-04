UNIT TADListaDoblementeEnlazada;

INTERFACE
	USES TADElemento;

	TYPE
		TipoLista = ^TipoNodo;
		TipoNodo = RECORD
			anterior: TipoLista;
			elemento: TipoElemento;
			siguiente: TipoLista;
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

	PROCEDURE MostrarLista(lista: TipoLista);
	{PRE: Cierto}
	{POST: Muestra por pantalla la lista}
IMPLEMENTATION
	PROCEDURE CrearVacia(VAR lista: TipoLista);
	BEGIN
		lista := NIL;
	END;

	PROCEDURE Construir(VAR lista: TipoLista; elemento: TipoElemento);
	VAR
		pNuevo: TipoLista;
	BEGIN
		new(pNuevo);
		pNuevo^.anterior := NIL;
		CopiarElemento(elemento, pNuevo^.elemento);
		pNuevo^.siguiente := lista;
		IF (NOT EsVacia(lista)) THEN
			lista^.anterior := pNuevo;
		lista := pNuevo;
	END;

	PROCEDURE Primero(lista: TipoLista; VAR elemento: TipoElemento);
	BEGIN
		IF (NOT EsVacia(lista)) THEN
			CopiarElemento(lista^.elemento, elemento);
	END;

	PROCEDURE Copiar(origen: TipoLista; VAR destino: TipoLista);
	VAR
		pAux: TipoLista;
	BEGIN
		CrearVacia(destino);

		pAux := origen;
		WHILE (pAux <> NIL) DO
		BEGIN
			InsertarFinal(destino, pAux^.elemento);

			pAux := pAux^.siguiente;
		END;
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
		EsVacia := lista = NIL;
	END;

	FUNCTION Longitud(lista: TipoLista): integer;
	VAR
		contador: integer;
		pAux: TipoLista;
	BEGIN
		contador := 0;
		pAux := lista;
		WHILE (pAux <> NIL) DO
		BEGIN
			contador := contador + 1;

			pAux := pAux^.siguiente;
		END;

		Longitud := contador;
	END;

	PROCEDURE Ultimo(lista: TipoLista; VAR elemento: TipoElemento);
	VAR
		pAux: TipoLista;
	BEGIN
		IF (NOT EsVacia(lista)) THEN
		BEGIN
			pAux := lista;
			WHILE (pAux^.siguiente <> NIL) DO
				pAux := pAux^.siguiente;

			CopiarElemento(pAux^.elemento, elemento);
		END;
	END;

	FUNCTION Pertenece(lista: TipoLista; elemento: TipoElemento): boolean;
	VAR
		encontrado: boolean;
		pAux: TipoLista;
	BEGIN
		encontrado := FALSE;
		pAux := lista;
		WHILE ((NOT encontrado) AND (pAux <> NIL)) DO
		BEGIN
			encontrado := SonElementosIguales(elemento, pAux^.elemento);

			pAux := pAux^.siguiente;
		END;

		Pertenece := encontrado;
	END;

	PROCEDURE Concatenar(l1, l2: TipoLista; VAR listaResultado: TipoLista);
	VAR
		pAux: TipoLista;
	BEGIN
		CrearVacia(listaResultado);

		Copiar(l1, listaResultado);

		pAux := l2;
		WHILE (pAux <> NIL) DO
		BEGIN
			InsertarFinal(listaResultado, pAux^.elemento);

			pAux := pAux^.siguiente;
		END;
	END;
	
	PROCEDURE BorrarElemento(VAR lista: TipoLista; elemento: TipoElemento);
	VAR
		encontrado: boolean;
		pAnterior, pExplorador: TipoLista;
	BEGIN
		encontrado := FALSE;
		pAnterior := NIL;
		pExplorador := lista;
		WHILE ((NOT encontrado) AND (pExplorador <> NIL)) DO
		BEGIN
			encontrado := SonElementosIguales(elemento, pExplorador^.elemento);
			IF (encontrado) THEN
			BEGIN
				IF (pAnterior = NIL) THEN
				BEGIN
					lista := lista^.siguiente;
					IF (NOT EsVacia(lista)) THEN
						lista^.anterior := NIL;
				END
				ELSE
				BEGIN
					pAnterior^.siguiente := pExplorador^.siguiente;
					IF (pExplorador^.siguiente <> NIL) THEN
						pExplorador^.siguiente^.anterior := pAnterior;
				END;
				dispose(pExplorador);
			END
			ELSE
			BEGIN
				pAnterior := pExplorador;
				pExplorador := pExplorador^.siguiente;
			END;
		END;

	END;

	PROCEDURE InsertarFinal(VAR lista: TipoLista; elemento: TipoElemento);
	VAR
		pAux, pNuevo: TipoLista;
	BEGIN
		IF (EsVacia(lista)) THEN
			Construir(lista, elemento)
		ELSE
		BEGIN
			pAux := lista;
			WHILE (pAux^.siguiente <> NIL) DO
				pAux := pAux^.siguiente;

			new(pNuevo);
			CopiarElemento(elemento, pNuevo^.elemento);
			pNuevo^.siguiente := NIL;
			pNuevo^.anterior := pAux;
			pAux^.siguiente := pNuevo;
		END;
	END;

	PROCEDURE MostrarLista(lista: TipoLista);
	VAR
		pAux: TipoLista;
	BEGIN
		Write('[');
		IF (NOT EsVacia(lista)) THEN
		BEGIN
			pAux := lista;
			WHILE (pAux^.siguiente <> NIL) DO
			BEGIN
				MostrarElemento(pAux^.elemento);
				Write(', ');

				pAux := pAux^.siguiente;
			END;
			MostrarElemento(pAux^.elemento);
		END;
		Writeln(']');
	END;
END.