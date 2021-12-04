UNIT TADPrioridad;

INTERFACE

	CONST
		MAX_PRIORIDAD = 1;
		MIN_PRIORIDAD = 5;

	TYPE
		TipoPrioridad = MAX_PRIORIDAD..MIN_PRIORIDAD;
	
	PROCEDURE CopiarPrioridad(origen: TipoPrioridad; VAR destino: TipoPrioridad);
	FUNCTION EsMenorOIgualPrioridad(prioridad1: TipoPrioridad; prioridad2: TipoPrioridad): boolean;
	FUNCTION EsIgualPrioridad(prioridad1: TipoPrioridad; prioridad2: TipoPrioridad): boolean;
	FUNCTION EsMayorPrioridad(prioridad1: TipoPrioridad; prioridad2: TipoPrioridad): boolean;
	PROCEDURE MostrarPrioridad(prioridad: TipoPrioridad);
IMPLEMENTATION
	PROCEDURE CopiarPrioridad(origen: TipoPrioridad; VAR destino: TipoPrioridad);
	BEGIN
		destino := origen;
	END;

	FUNCTION EsMenorOIgualPrioridad(prioridad1: TipoPrioridad; prioridad2: TipoPrioridad): boolean;
	BEGIN
		EsMenorOIgualPrioridad := prioridad1 >= prioridad2;
	END;
	
	FUNCTION EsIgualPrioridad(prioridad1: TipoPrioridad; prioridad2: TipoPrioridad): boolean;
	BEGIN
		EsIgualPrioridad := prioridad1 = prioridad2;
	END;
	
	FUNCTION EsMayorPrioridad(prioridad1: TipoPrioridad; prioridad2: TipoPrioridad): boolean;
	BEGIN
		EsMayorPrioridad := prioridad1 < prioridad2;
	END;
	
	PROCEDURE MostrarPrioridad(prioridad: TipoPrioridad);
	BEGIN
		Write(prioridad);
	END;
END.
