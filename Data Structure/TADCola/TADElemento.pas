UNIT TADElemento;

INTERFACE
	TYPE
		TipoElemento = integer;

	PROCEDURE CopiarElemento(origen: TipoElemento; VAR destino: TipoElemento);
	FUNCTION SonElementosIguales(elemento1: TipoElemento; elemento2: TipoElemento): boolean;
	PROCEDURE MostrarElemento(elemento: TipoElemento);
IMPLEMENTATION
	PROCEDURE CopiarElemento(origen: TipoElemento; VAR destino: TipoElemento);
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