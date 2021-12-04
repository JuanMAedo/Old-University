UNIT TADCola;

INTERFACE
	USES TADElemento;

	TYPE
		TipoPuntero = ^TipoNodo;
		TipoNodo = RECORD
			elemento: TipoElemento;
			siguiente: TipoPuntero;
		END;
		TipoCola = RECORD
			principio: TipoPuntero;
			fin: TipoPuntero;
		END;

	PROCEDURE CrearVacia(VAR cola: TipoCola);
	PROCEDURE Insertar(VAR cola: TipoCola; elemento: TipoElemento);
	PROCEDURE Primero(cola: TipoCola; VAR elemento: TipoElemento);
	FUNCTION EsVacia(cola: TipoCola): boolean;
	PROCEDURE Eliminar(VAR cola: TipoCola);
	
	PROCEDURE Copiar(origen: TipoCola; VAR destino: TipoCola);
	FUNCTION Iguales(cola1: TipoCola; cola2: TipoCola): boolean;
	PROCEDURE MostrarCola(cola: TipoCola);
IMPLEMENTATION
	PROCEDURE CrearVacia(VAR cola: TipoCola);
	BEGIN
		cola.principio := NIL;
		cola.fin := NIL;
	END;

	PROCEDURE Insertar(VAR cola: TipoCola; elemento: TipoElemento);
	VAR
		pNuevo: TipoPuntero;
	BEGIN
		new(pNuevo);
		CopiarElemento(elemento, pNuevo^.elemento);
		pNuevo^.siguiente := NIL;

		IF (EsVacia(cola)) THEN
			cola.principio := pNuevo
		ELSE
			cola.fin^.siguiente := pNuevo;

		cola.fin := pNuevo;
	END;

	PROCEDURE Primero(cola: TipoCola; VAR elemento: TipoElemento);
	BEGIN
		IF (NOT EsVacia(cola)) THEN
			CopiarElemento(cola.principio^.elemento, elemento);
	END;

	FUNCTION EsVacia(cola: TipoCola): boolean;
	BEGIN
		EsVacia := (cola.principio = NIL) AND (cola.fin = NIL);
	END;

	PROCEDURE Eliminar(VAR cola: TipoCola);
	VAR
		pAux: TipoPuntero;
	BEGIN
		IF (NOT EsVacia(cola)) THEN
		BEGIN
			pAux := cola.principio;
			cola.principio := cola.principio^.siguiente;
			IF (cola.principio = NIL) THEN
				cola.fin := NIL;
			dispose(pAux);
		END;
	END;
	
	PROCEDURE Copiar(origen: TipoCola; VAR destino: TipoCola);
	VAR
		pAux: TipoPuntero;
	BEGIN
		CrearVacia(destino);
		
		pAux := origen.principio;
		WHILE (pAux <> NIL) DO
		BEGIN
			Insertar(destino, pAux^.elemento);
			
			pAux := pAux^.siguiente;
		END;
	END;
	
	FUNCTION Iguales(cola1: TipoCola; cola2: TipoCola): boolean;
	VAR
		sonIguales: boolean;
		pCola1, pCola2: TipoPuntero;
	BEGIN
		sonIguales := TRUE;
		pCola1 := cola1.principio;
		pCola2 := cola2.principio;
		WHILE ((sonIguales) AND (pCola1 <> NIL) AND (pCola2 <> NIL)) DO
		BEGIN
			sonIguales := SonElementosIguales(pCola1^.elemento, pCola2^.elemento);
			
			pCola1 := pCola1^.siguiente;
			pCola2 := pCola2^.siguiente;
		END;
		
		Iguales := (sonIguales) AND (pCola1 = NIL) AND (pCola2 = NIL);
	END;
	
	PROCEDURE MostrarCola(cola: TipoCola);
	VAR
		pAux: TipoPuntero;
	BEGIN
		Write('P[');
		IF (NOT EsVacia(cola)) THEN
		BEGIN
			pAux := cola.principio;
			WHILE (pAux^.siguiente <> NIL) DO
			BEGIN
				MostrarElemento(pAux^.elemento);
				Write(', ');
				
				pAux := pAux^.siguiente;
			END;
			MostrarElemento(pAux^.elemento);
		END;
		Writeln(']U');
	END;
END.
