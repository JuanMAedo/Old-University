UNIT TADElemento;

INTERFACE
	TYPE
		TipoElemento = integer;

	PROCEDURE CopiarElemento(origen: TipoElemento; VAR destino: TipoElemento);
	FUNCTION EsMenorElemento(elemento1: TipoElemento; elemento2: TipoElemento): boolean;
	FUNCTION SonElementosIguales(elemento1: TipoElemento; elemento2: TipoElemento): boolean;
	FUNCTION EsMayorElemento(elemento1: TipoElemento; elemento2: TipoElemento): boolean;
	PROCEDURE MostrarElemento(elemento: TipoElemento);
IMPLEMENTATION
	PROCEDURE CopiarElemento(origen: TipoElemento; VAR destino: TipoElemento);
	BEGIN
		destino := origen;
	END;

	FUNCTION EsMenorElemento(elemento1: TipoElemento; elemento2: TipoElemento): boolean;
	BEGIN
		EsMenorElemento := elemento1 < elemento2;
	END;

	FUNCTION SonElementosIguales(elemento1: TipoElemento; elemento2: TipoElemento): boolean;
	BEGIN
		SonElementosIguales := elemento1 = elemento2;
	END;
	
	FUNCTION EsMayorElemento(elemento1: TipoElemento; elemento2: TipoElemento): boolean;
	BEGIN
		EsMayorElemento := elemento1 > elemento2;
	END;

	PROCEDURE MostrarElemento(elemento: TipoElemento);
	BEGIN
		Write(elemento);
	END;
END.
