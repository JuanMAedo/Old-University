UNIT TADListaOrdenada;

INTERFACE
	USES TADElemento;
	
	TYPE
		TipoListaOrdenada = ^TipoNodo;
		TipoNodo = RECORD
			elemento: TipoElemento;
			siguiente: TipoListaOrdenada;
		END;
		
	PROCEDURE CrearVacia(VAR lista: TipoListaOrdenada);
	PROCEDURE Primero(lista: TipoListaOrdenada; VAR elemento: TipoElemento);
	PROCEDURE Resto(lista: TipoListaOrdenada; VAR restante: TipoListaOrdenada);
	FUNCTION EsVacia(lista: TipoListaOrdenada): boolean;
	FUNCTION Longitud(lista: TipoListaOrdenada): integer;
	PROCEDURE Ultimo(lista: TipoListaOrdenada; VAR elemento: TipoElemento);	
	FUNCTION Pertenece(lista: TipoListaOrdenada; elemento: TipoElemento): boolean;
	PROCEDURE BorrarElemento(VAR lista: TipoListaOrdenada; elemento: TipoElemento);
	PROCEDURE Copiar(origen: TipoListaOrdenada; VAR destino: TipoListaOrdenada);
	
	PROCEDURE Insertar(VAR lista: TipoListaOrdenada; elemento: TipoElemento);
	PROCEDURE Mezclar(lista1: TipoListaOrdenada; lista2: TipoListaOrdenada; VAR resultado: TipoListaOrdenada);

	PROCEDURE MostrarLista(lista: TipoListaOrdenada);
IMPLEMENTATION
	PROCEDURE CrearVacia(VAR lista: TipoListaOrdenada);
	BEGIN
		lista := NIL;
	END;

	PROCEDURE Construir(VAR lista: TipoListaOrdenada; elemento: TipoElemento);
	VAR
		pNuevo: TipoListaOrdenada;
	BEGIN
		new(pNuevo);
		CopiarElemento(elemento, pNuevo^.elemento);
		pNuevo^.siguiente := lista;
		lista := pNuevo;
	END;

	PROCEDURE Primero(lista: TipoListaOrdenada; VAR elemento: TipoElemento);
	BEGIN
		IF (NOT EsVacia(lista)) THEN
		BEGIN
			CopiarElemento(lista^.elemento, elemento);
		END;
	END;

	PROCEDURE Copiar(origen: TipoListaOrdenada; VAR destino: TipoListaOrdenada);
	VAR
		pOrigen, pDestino: TipoListaOrdenada;
		pNuevo: TipoListaOrdenada;
	BEGIN
		CrearVacia(destino);
		pOrigen := origen;
		WHILE (pOrigen <> NIL) DO
		BEGIN
			new(pNuevo);
			CopiarElemento(pOrigen^.elemento, pNuevo^.elemento);
			pNuevo^.siguiente := NIL;
			IF (EsVacia(destino)) THEN
			BEGIN
				destino := pNuevo;
				pDestino := destino;
			END
			ELSE
			BEGIN
				pDestino^.siguiente := pNuevo;
				pDestino := pNuevo;
			END;

			pOrigen := pOrigen^.siguiente;
		END;
	END;

	PROCEDURE Resto(lista: TipoListaOrdenada; VAR restante: TipoListaOrdenada);
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

	FUNCTION EsVacia(lista: TipoListaOrdenada): boolean;
	BEGIN
		EsVacia := lista = NIL;
	END;


	FUNCTION Longitud(lista: TipoListaOrdenada): integer;
	VAR
		contador: integer;
		pAux: TipoListaOrdenada;
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

	PROCEDURE Ultimo(lista: TipoListaOrdenada; VAR elemento: TipoElemento);
	VAR
		pAux: TipoListaOrdenada;
	BEGIN
		IF (NOT EsVacia(lista)) THEN
		BEGIN
			pAux := lista;
			WHILE (pAux^.siguiente <> NIL) DO
			BEGIN
				pAux := pAux^.siguiente;
			END;

			CopiarElemento(pAux^.elemento, elemento);
		END;
	END;

	FUNCTION Pertenece(lista: TipoListaOrdenada; elemento: TipoElemento): boolean;
	VAR
		encontrado: boolean;
		pAux: TipoListaOrdenada;
	BEGIN
		encontrado := FALSE;
		pAux := lista;
		WHILE ((NOT encontrado) AND (pAux <> NIL)) DO
		BEGIN
			encontrado := SonElementosIguales(elemento, pAux^.elemento);
			IF (NOT encontrado) THEN
			BEGIN
				pAux := pAux^.siguiente;
			END;
		END;

		Pertenece := encontrado;
	END;

	PROCEDURE BorrarElemento(VAR lista: TipoListaOrdenada; elemento: TipoElemento);
	VAR
		encontrado: boolean;
		pAnterior, pExplorador: TipoListaOrdenada;
	BEGIN
		encontrado := FALSE;
		pAnterior := NIL;
		pExplorador := lista;
		WHILE ((NOT encontrado) AND (pExplorador <> NIL)) DO
		BEGIN
			encontrado := SonElementosIguales(elemento, pExplorador^.elemento);
			IF (NOT encontrado) THEN
			BEGIN
				pAnterior := pExplorador;
				pExplorador := pExplorador^.siguiente;
			END;
		END;

		IF (encontrado) THEN
		BEGIN
			IF (pAnterior = NIL) THEN
			BEGIN
				lista := lista^.siguiente;
			END
			ELSE
			BEGIN
				pAnterior^.siguiente := pExplorador^.siguiente;
			END;

			dispose(pExplorador);
		END;
	END;

	PROCEDURE Insertar(VAR lista: TipoListaOrdenada; elemento: TipoElemento);
	VAR
		pAnterior, pExplorador: TipoListaOrdenada;
		pNuevo: TipoListaOrdenada;
	BEGIN
		IF (EsVacia(lista)) THEN
			Construir(lista, elemento)
		ELSE
		BEGIN
			new(pNuevo);
			CopiarElemento(elemento, pNuevo^.elemento);
			
			pAnterior := NIL;
			pExplorador := lista;
			WHILE ((pExplorador <> NIL) AND (EsMenorElemento(pExplorador^.elemento, elemento))) DO
			BEGIN
				pAnterior := pExplorador;
				pExplorador := pExplorador^.siguiente;
			END;
			
			pNuevo^.siguiente := pExplorador;
			IF (pAnterior = NIL) THEN
				lista := pNuevo
			ELSE
				pAnterior^.siguiente := pNuevo;
		END;
	END;
	
	PROCEDURE Mezclar(lista1: TipoListaOrdenada; lista2: TipoListaOrdenada; VAR resultado: TipoListaOrdenada);
	VAR
		pAux: TipoListaOrdenada;
	BEGIN
		CrearVacia(resultado);
		
		Copiar(lista1, resultado);
		
		pAux := lista2;
		WHILE (pAux <> NIL) DO
		BEGIN
			Insertar(resultado, pAux^.elemento);
			
			pAux := pAux^.siguiente;
		END;
	END;

	PROCEDURE MostrarLista(lista: TipoListaOrdenada);
	VAR
		pAux: TipoListaOrdenada;
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
			
