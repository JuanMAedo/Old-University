PROGRAM Prueba;

USES TADPrioridad, TADTarea, TADColaPrioridad;

VAR
	colaPrioridad: TipoColaPrioridad;
	tarea: TipoTarea;
BEGIN
	CrearColaVacia(colaPrioridad);

	CrearTarea('Chrome', 2, tarea);
	InsertarCola(colaPrioridad, tarea);
	
	CrearTarea('Geany', MAX_PRIORIDAD, tarea);
	InsertarCola(colaPrioridad, tarea);

	CrearTarea('WhatsApp', MIN_PRIORIDAD, tarea);
	InsertarCola(colaPrioridad, tarea);
	
	CrearTarea('Sublime Text', MAX_PRIORIDAD, tarea);
	InsertarCola(colaPrioridad, tarea);
	
	CrearTarea('Calendar', 2, tarea);
	InsertarCola(colaPrioridad, tarea);
	
	CrearTarea('Periscope', 4, tarea);
	InsertarCola(colaPrioridad, tarea);
	
	CrearTarea('Reminders', 2, tarea);
	InsertarCola(colaPrioridad, tarea);
	
	Writeln('Tareas pendientes: ');
	MostrarCola(colaPrioridad);
	
	PrimeroCola(colaPrioridad, tarea);
	Write('Tarea a ejectuar por la CPU: ');
	MostrarTarea(tarea);
	Writeln;
	Writeln;
	
	EliminarCola(colaPrioridad);
	Writeln('Tareas después de seleccionar:');
	MostrarCola(colaPrioridad);
END.
