UNIT TADElemento;

INTERFACE
	CONST
		MIN_ELEMENTO = 1;
		MAX_ELEMENTO = 10;
	TYPE
		TipoElemento = MIN_ELEMENTO..MAX_ELEMENTO;

	PROCEDURE AsignarElemento(origen: TipoElemento; VAR destino: TipoElemento);
	FUNCTION SonElementosIguales(elemento1: TipoElemento; elemento2: TipoElemento): boolean;
	PROCEDURE MostrarElemento(elemento: TipoElemento);
IMPLEMENTATION
	PROCEDURE AsignarElemento(origen: TipoElemento; VAR destino: TipoElemento);
	BEGIN
		destino := origen;
	END;

	FUNCTION SonElementosIguales(elemento1: TipoElemento; elemento2: TipoElemento): boolean;
	BEGIN
		SonElementosIguales := elemento1 = elemento2;
	END;

	PROCEDURE MostrarElemento(elemento: TipoElemento);
	BEGIN
		Write(elemento);
	END;
END.
