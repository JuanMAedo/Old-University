UNIT TADColaEnteros;

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
		TADElementoCola.CopiarElemento(elemento, pNuevo^.elemento);
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
			TADElementoCola.CopiarElemento(cola.principio^.elemento, elemento);
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
END.
