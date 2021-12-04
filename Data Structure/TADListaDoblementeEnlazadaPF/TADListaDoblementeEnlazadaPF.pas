UNIT TADListaDoblementeEnlazadaPF;

INTERFACE
	USES TADElemento;

	TYPE
		TipoPuntero = ^TipoNodo;
		TipoNodo = RECORD
			anterior: TipoPuntero;
			elemento: TipoElemento;
			siguiente: TipoPuntero;
		END;
		TipoLista = RECORD
			principio: TipoPuntero;
			fin: TipoPuntero;
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
		lista.principio := NIL;
		lista.fin := NIL;
	END;

	PROCEDURE Construir(VAR lista: TipoLista; elemento: TipoElemento);
	VAR
		pNuevo: TipoPuntero;
	BEGIN
		new(pNuevo);
		pNuevo^.anterior := NIL;
		CopiarElemento(elemento, pNuevo^.elemento);
		pNuevo^.siguiente := lista.principio;

		IF (EsVacia(lista)) THEN
			lista.fin := pNuevo
		ELSE
			lista.principio^.anterior := pNuevo;
		lista.principio := pNuevo;
	END;

	PROCEDURE Primero(lista: TipoLista; VAR elemento: TipoElemento);
	BEGIN
		IF (NOT EsVacia(lista)) THEN
			CopiarElemento(lista.principio^.elemento, elemento);
	END;

	PROCEDURE Copiar(origen: TipoLista; VAR destino: TipoLista);
	VAR
		pAux: TipoPuntero;
	BEGIN
		CrearVacia(destino);

		pAux := origen.principio;
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
		EsVacia := (lista.principio = NIL) AND (lista.fin = NIL);
	END;

	FUNCTION Longitud(lista: TipoLista): integer;
	VAR
		contador: integer;
		pAux: TipoPuntero;
	BEGIN
		contador := 0;
		pAux := lista.principio;
		WHILE (pAux <> NIL) DO
		BEGIN
			contador := contador + 1;

			pAux := pAux^.siguiente;
		END;

		Longitud := contador;
	END;

	PROCEDURE Ultimo(lista: TipoLista; VAR elemento: TipoElemento);
	BEGIN
		IF (NOT EsVacia(lista)) THEN
		BEGIN
			CopiarElemento(lista.fin^.elemento, elemento);
		END;
	END;

	FUNCTION Pertenece(lista: TipoLista; elemento: TipoElemento): boolean;
	VAR
		encontrado: boolean;
		pAux: TipoPuntero;
	BEGIN
		encontrado := FALSE;
		pAux := lista.principio;
		WHILE ((NOT encontrado) AND (pAux <> NIL)) DO
		BEGIN
			encontrado := SonElementosIguales(elemento, pAux^.elemento);

			pAux := pAux^.siguiente;
		END;

		Pertenece := encontrado;
	END;

	PROCEDURE Concatenar(l1, l2: TipoLista; VAR listaResultado: TipoLista);
	VAR
		pAux: TipoPuntero;
	BEGIN
		CrearVacia(listaResultado);

		Copiar(l1, listaResultado);

		pAux := l2.principio;
		WHILE (pAux <> NIL) DO
		BEGIN
			InsertarFinal(listaResultado, pAux^.elemento);

			pAux := pAux^.siguiente;
		END;
	END;
	
	PROCEDURE BorrarElemento(VAR lista: TipoLista; elemento: TipoElemento);
	VAR
		encontrado: boolean;
		pAnterior, pExplorador: TipoPuntero;
	BEGIN
		encontrado := FALSE;
		pAnterior := NIL;
		pExplorador := lista.principio;
		WHILE ((NOT encontrado) AND (pExplorador <> NIL)) DO
		BEGIN
			encontrado := SonElementosIguales(elemento, pExplorador^.elemento);
			IF (encontrado) THEN
			BEGIN
				IF (pAnterior = NIL) THEN
				BEGIN
					lista.principio := lista.principio^.siguiente;
					IF (lista.principio = NIL) THEN
						lista.fin := NIL
					ELSE
						lista.principio^.anterior := NIL;
				END
				ELSE
				BEGIN
					pAnterior^.siguiente := pExplorador^.siguiente;
					IF (pExplorador = lista.fin) THEN
						lista.fin := pAnterior
					ELSE
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
		pNuevo: TipoPuntero;
	BEGIN
		IF (EsVacia(lista)) THEN
			Construir(lista, elemento)
		ELSE
		BEGIN
			new(pNuevo);
			CopiarElemento(elemento, pNuevo^.elemento);
			pNuevo^.siguiente := NIL;
			pNuevo^.anterior := lista.fin;

			lista.fin^.siguiente := pNuevo;
			lista.fin := pNuevo;
		END;
	END;

	PROCEDURE MostrarLista(lista: TipoLista);
	VAR
		pAux: TipoPuntero;
	BEGIN
		Write('[');
		IF (NOT EsVacia(lista)) THEN
		BEGIN
			pAux := lista.principio;
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