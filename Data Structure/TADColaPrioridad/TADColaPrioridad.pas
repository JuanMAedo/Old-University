UNIT TADColaPrioridad;
{Máximos: Menor a Mayor (1º los elementos más prioritarios)}

INTERFACE
	USES TADTarea, TADPrioridad; {Es exactamente igual que incluir TADElemento}
	
	TYPE
		TipoPuntero = ^TipoNodo;
		TipoNodo = RECORD
			tarea: TipoTarea; {Es exactamente igual que usar TipoElemento}
			siguiente: TipoPuntero;
		END;
		
		TipoColaPrioridad = TipoPuntero;
		
	PROCEDURE CrearColaVacia(VAR cola: TipoColaPrioridad);
	PROCEDURE InsertarCola(VAR cola: TipoColaPrioridad; tarea: TipoTarea);
	FUNCTION EsColaVacia(cola: TipoColaPrioridad): boolean;
	PROCEDURE PrimeroCola(cola: TipoColaPrioridad; VAR tarea: TipoTarea);
	PROCEDURE EliminarCola(VAR cola: TipoColaPrioridad);
	PROCEDURE MostrarCola(cola: TipoColaPrioridad);
IMPLEMENTATION
	PROCEDURE CrearColaVacia(VAR cola: TipoColaPrioridad);
	BEGIN
		cola := NIL;
	END;
	
	PROCEDURE InsertarCola(VAR cola: TipoColaPrioridad; tarea: TipoTarea);
	VAR
		pAnterior, pExplorador: TipoPuntero;
		pNuevo: TipoPuntero;
	BEGIN
		new(pNuevo);
		CopiarTarea(tarea, pNuevo^.tarea);
		
		IF (EsColaVacia(cola)) THEN
		BEGIN
			pNuevo^.siguiente := NIL;
			cola := pNuevo;
		END
		ELSE
		BEGIN
			pAnterior := NIL;
			pExplorador := cola;
			WHILE ((pExplorador <> NIL) AND (EsMenorOIgualPrioridad(Prioridad(tarea), Prioridad(pExplorador^.tarea)))) DO
			BEGIN
				pAnterior := pExplorador;
				pExplorador := pExplorador^.siguiente;
			END;
			
			pNuevo^.siguiente := pExplorador;
			IF (pAnterior = NIL) THEN
				cola := pNuevo
			ELSE
				pAnterior^.siguiente := pNuevo;
		END;
	END;
	
	FUNCTION EsColaVacia(cola: TipoColaPrioridad): boolean;
	BEGIN
		EsColaVacia := cola = NIL;
	END;
	
	PROCEDURE PrimeroCola(cola: TipoColaPrioridad; VAR tarea: TipoTarea);
	BEGIN
		IF (NOT EsColaVacia(cola)) THEN
			CopiarTarea(cola^.tarea, tarea);
	END;
	
	PROCEDURE EliminarCola(VAR cola: TipoColaPrioridad);
	VAR
		pAux: TipoPuntero;
	BEGIN
		IF (NOT EsColaVacia(cola)) THEN
		BEGIN
			pAux := cola;
			cola := cola^.siguiente;
			dispose(pAux);
		END;
	END;
	
	PROCEDURE MostrarCola(cola: TipoColaPrioridad);
	VAR
		pAux: TipoPuntero;
	BEGIN
		Write('[');
		IF (NOT EsColaVacia(cola)) THEN
		BEGIN
			pAux := cola;
			WHILE (pAux^.siguiente <> NIL) DO
			BEGIN
				MostrarTarea(pAux^.tarea);
				Write(', ');
				
				pAux := pAux^.siguiente;
			END;
			MostrarTarea(pAux^.tarea);
		END;
		Writeln(']');
	END;
END.
