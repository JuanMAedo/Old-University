UNIT TADElementoCola;

INTERFACE
	USES TADArbolBinario;

	TYPE
		TipoElemento = TipoArbolBinario;

	PROCEDURE CopiarElemento(origen: TipoElemento; VAR destino: TipoElemento);
	FUNCTION SonElementosIguales(elemento1: TipoElemento; elemento2: TipoElemento): boolean;
	PROCEDURE MostrarElemento(elemento: TipoElemento);
IMPLEMENTATION
	PROCEDURE CopiarElemento(origen: TipoElemento; VAR destino: TipoElemento);
	BEGIN
		TADArbolBinario.CopiarArbol(origen, destino);
	END;

	FUNCTION SonElementosIguales(elemento1: TipoElemento; elemento2: TipoElemento): boolean;
	BEGIN
		SonElementosIguales := TADArbolBinario.SonArbolesIguales(elemento1, elemento2);
	END;

	PROCEDURE MostrarElemento(elemento: TipoElemento);
	BEGIN
		TADArbolBinario.MostrarArbolBinario(elemento);
	END;
END.
