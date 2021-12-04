UNIT TADTarea;

INTERFACE
	USES TADPrioridad;
	
	TYPE
		TipoTarea = RECORD
			nombre: string;
			prioridad: TipoPrioridad;
		END;

	PROCEDURE CrearTarea(nombre: string; prioridad: TipoPrioridad; VAR tarea: TipoTarea);
	PROCEDURE CopiarTarea(origen: TipoTarea; VAR destino: TipoTarea);
	FUNCTION SonTareasIguales(tarea1: TipoTarea; tarea2: TipoTarea): boolean;
	FUNCTION Prioridad(tarea: TipoTarea): TipoPrioridad;
	PROCEDURE MostrarTarea(tarea: TipoTarea);
IMPLEMENTATION
	PROCEDURE CrearTarea(nombre: string; prioridad: TipoPrioridad; VAR tarea: TipoTarea);
	BEGIN
		tarea.nombre := nombre;
		CopiarPrioridad(prioridad, tarea.prioridad);
	END;
	
	PROCEDURE CopiarTarea(origen: TipoTarea; VAR destino: TipoTarea);
	BEGIN
		destino.nombre := origen.nombre;
		CopiarPrioridad(origen.prioridad, destino.prioridad);
	END;

	FUNCTION SonTareasIguales(tarea1: TipoTarea; tarea2: TipoTarea): boolean;
	BEGIN
		SonTareasIguales := tarea1.nombre = tarea2.nombre; {La prioridad es indiferente}
	END;
	
	FUNCTION Prioridad(tarea: TipoTarea): TipoPrioridad;
	BEGIN
		Prioridad := tarea.prioridad;
	END;

	PROCEDURE MostrarTarea(tarea: TipoTarea);
	BEGIN
		Write(tarea.nombre);
	END;
END.
