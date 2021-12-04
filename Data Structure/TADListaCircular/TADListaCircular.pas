UNIT TADListaCircular;

INTERFACE
	USES TADElemento;

	TYPE
		TipoLista = ^TipoNodo;
		TipoNodo = RECORD
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
		CopiarElemento(elemento, pNuevo^.elemento);
		IF (EsVacia(lista)) THEN
			lista := pNuevo
		ELSE
			pNuevo^.siguiente := lista^.siguiente;
		lista^.siguiente := pNuevo;
	END;
	
	PROCEDURE Primero(lista: TipoLista; VAR elemento: TipoElemento);
	BEGIN
		IF (NOT EsVacia(lista)) THEN
			CopiarElemento(lista^.siguiente^.elemento, elemento);
	END;

	PROCEDURE Copiar(origen: TipoLista; VAR destino: TipoLista);
	VAR
		pAnteriorOrigen, pExploradorOrigen, pDestino: TipoLista;
		pNuevo: TipoLista;
	BEGIN
		CrearVacia(destino);
		IF (NOT EsVacia(origen)) THEN
		BEGIN
			pAnteriorOrigen := NIL;
			pExploradorOrigen := origen^.siguiente;
			WHILE (pAnteriorOrigen <> origen) DO
			BEGIN
				IF (EsVacia(destino)) THEN
				BEGIN
					Construir(destino, pExploradorOrigen^.elemento);
					pDestino := destino^.siguiente;
				END
				ELSE
				BEGIN
					new(pNuevo);
					CopiarElemento(pExploradorOrigen^.elemento, pNuevo^.elemento);
					pNuevo^.siguiente := destino^.siguiente;
					pDestino^.siguiente := pNuevo;
					destino := pNuevo;
					pDestino := pDestino^.siguiente;
				END;

				pAnteriorOrigen := pExploradorOrigen;
				pExploradorOrigen := pExploradorOrigen^.siguiente;
			END;
		END;
	END;
	
	PROCEDURE Resto(lista: TipoLista; VAR restante: TipoLista);
	VAR
		pAux: TipoLista;
	BEGIN
		IF (NOT EsVacia(lista)) THEN
		BEGIN
			Copiar(lista, restante);

			pAux := restante^.siguiente;
			IF (pAux = restante) THEN
				restante := NIL
			ELSE
				restante^.siguiente := pAux^.siguiente;
			dispose(pAux);
		END;
	END;

	FUNCTION EsVacia(lista: TipoLista): boolean;
	BEGIN
		EsVacia := lista = NIL;
	END;

	FUNCTION Longitud(lista: TipoLista): integer;
	VAR
		contador: integer;
		pAnterior, pExplorador: TipoLista;
	BEGIN
		contador := 0;
		IF (NOT EsVacia(lista)) THEN
		BEGIN
			pAnterior := NIL;
			pExplorador := lista^.siguiente;
			WHILE (pAnterior <> lista) DO
			BEGIN
				contador := contador + 1;

				pAnterior := pExplorador;
				pExplorador := pExplorador^.siguiente;
			END;
		END;

		Longitud := contador;
	END;

	PROCEDURE Ultimo(lista: TipoLista; VAR elemento: TipoElemento);
	BEGIN
		IF (NOT EsVacia(lista)) THEN
			CopiarElemento(lista^.elemento, elemento);
	END;
	
	FUNCTION Pertenece(lista: TipoLista; elemento: TipoElemento): boolean;
	VAR
		encontrado: boolean;
		pAnterior, pExplorador: TipoLista;
	BEGIN
		encontrado := FALSE;
		IF (NOT EsVacia(lista)) THEN
		BEGIN
			pAnterior := NIL;
			pExplorador := lista^.siguiente;
			WHILE ((NOT encontrado) AND (pAnterior <> lista)) DO
			BEGIN
				encontrado := SonElementosIguales(elemento, pExplorador^.elemento);
				IF (NOT encontrado) THEN
				BEGIN
					pAnterior := pExplorador;
					pExplorador := pExplorador^.siguiente;
				END;
			END;
		END;

		Pertenece := encontrado;
	END;

	PROCEDURE Concatenar(l1, l2: TipoLista; VAR listaResultado: TipoLista);
	VAR
		pAnterior, pExplorador: TipoLista;
	BEGIN
		CrearVacia(listaResultado);

		Copiar(l1, listaResultado); {Llama a "CrearVacia" pero por si acaso}
		IF (NOT EsVacia(l2)) THEN
		BEGIN
			pAnterior := NIL;
			pExplorador := l2^.siguiente;
			WHILE (pAnterior <> l2) DO
			BEGIN
				InsertarFinal(listaResultado, pExplorador^.elemento);

				pAnterior := pExplorador;
				pExplorador := pExplorador^.siguiente;
			END;
		END;
	END;
	
	PROCEDURE BorrarElemento(VAR lista: TipoLista; elemento: TipoElemento);
	VAR
		encontrado: boolean;
		pAnterior, pExplorador: TipoLista;
	BEGIN
		encontrado := FALSE;
		IF (NOT EsVacia(lista)) THEN
		BEGIN
			pAnterior := NIL;
			pExplorador := lista^.siguiente;
			WHILE ((NOT encontrado) AND (pAnterior <> lista)) DO
			BEGIN
				encontrado := SonElementosIguales(elemento, pExplorador^.elemento);
				IF (NOT encontrado) THEN
				BEGIN
					pAnterior := pExplorador;
					pExplorador := pExplorador^.siguiente;
				END;
			END;
		END;

		IF (encontrado) THEN
		BEGIN
			IF (pAnterior = NIL) THEN
			BEGIN
				IF (pExplorador = lista) THEN
					lista := NIL
				ELSE
					lista^.siguiente := pExplorador^.siguiente;
			END
			ELSE
			BEGIN
				pAnterior^.siguiente := pExplorador^.siguiente;
				IF (pExplorador = lista) THEN
					lista := pAnterior;
			END;

			dispose(pExplorador);
		END;
	END;

	PROCEDURE InsertarFinal(VAR lista: TipoLista; elemento: TipoElemento);
	VAR
		pNuevo: TipoLista;
	BEGIN
		IF (EsVacia(lista)) THEN
			Construir(lista, elemento)
		ELSE
		BEGIN
			new(pNuevo);
			CopiarElemento(elemento, pNuevo^.elemento);
			pNuevo^.siguiente := lista^.siguiente;
			lista^.siguiente := pNuevo;
			lista := pNuevo;
		END;
	END;

	PROCEDURE MostrarLista(lista: TipoLista);
	VAR
		pExplorador: TipoLista;
	BEGIN
		Write('[');
		IF (NOT EsVacia(lista)) THEN
		BEGIN
			pExplorador := lista^.siguiente;
			WHILE (pExplorador <> lista) DO
			BEGIN
				MostrarElemento(pExplorador^.elemento);
				Write(', ');

				pExplorador := pExplorador^.siguiente;
			END;
			MostrarElemento(pExplorador^.elemento);
		END;
		Writeln(']');
	END;
END.