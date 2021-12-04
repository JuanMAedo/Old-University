UNIT TADGrafoNDP;
{Grafo No Dirigido y Ponderado - Implementación Estática}

INTERFACE
	USES TADElemento, TADLista;
	
	TYPE
		TipoOrigenes = ARRAY [TipoElemento] OF boolean;
		TipoDestinos = ARRAY [TipoElemento, TipoElemento] of integer;
		TipoGrafo = RECORD
			origenes: TipoOrigenes;
			destinos: TipoDestinos;
		END;
	
	PROCEDURE CrearGrafoVacio(VAR g: TipoGrafo);
	PROCEDURE InsertarOrigen(VAR g: TipoGrafo; origen: TipoElemento);
	PROCEDURE InsertarDestino(VAR g: TipoGrafo; origen, destino: TipoElemento; coste: integer);
	FUNCTION EsGrafoVacio(g: TipoGrafo): boolean;
	FUNCTION PerteneceAOrigenes(g: TipoGrafo; origen: TipoElemento): boolean;
	FUNCTION PerteneceADestinos(g: TipoGrafo; origen, destino: TipoElemento): boolean;
	PROCEDURE ListaAdyacencia(g: TipoGrafo; origen: TipoElemento; VAR lista: TipoLista);
	PROCEDURE BorrarOrigen(VAR g: TipoGrafo; origen: TipoElemento);
	PROCEDURE BorrarDestino(VAR g: TipoGrafo; origen, destino: TipoElemento);
	PROCEDURE MostrarGrafo(g: TipoGrafo);
IMPLEMENTATION
	PROCEDURE CrearGrafoVacio(VAR g: TipoGrafo);
	VAR
		origen, destino: TipoElemento;
	BEGIN
		FOR origen := MIN_ELEMENTO TO MAX_ELEMENTO DO
			g.origenes[origen] := FALSE;
		
		FOR origen := MIN_ELEMENTO TO MAX_ELEMENTO DO
			FOR destino := origen TO MAX_ELEMENTO DO
				g.destinos[origen][destino] := -1;
	END;
	
	PROCEDURE InsertarOrigen(VAR g: TipoGrafo; origen: TipoElemento);
	BEGIN
		g.origenes[origen] := TRUE;
	END;
	
	PROCEDURE InsertarDestino(VAR g: TipoGrafo; origen, destino: TipoElemento; coste: integer);
	BEGIN
		InsertarOrigen(g, origen);
		InsertarOrigen(g, destino);
		
		IF (EsMenorElemento(origen, destino)) THEN
			g.destinos[origen][destino] := coste
		ELSE
			g.destinos[destino][origen] := coste;
	END;
	
	FUNCTION EsGrafoVacio(g: TipoGrafo): boolean;
	VAR
		esVacio: boolean;
		origen: TipoElemento;
	BEGIN
		esVacio := TRUE;
		origen := MIN_ELEMENTO;
		MostrarElemento(MAX_ELEMENTO);
		WriteLn;
		WHILE ((esVacio) AND (origen <= pred(MAX_ELEMENTO))) DO
		BEGIN
			esVacio := NOT g.origenes[origen];
			origen := succ(origen);
		END;
		
		IF (esVacio) THEN
			esVacio := NOT g.origenes[MAX_ELEMENTO];
		
		EsGrafoVacio := esVacio;
	END;
	
	FUNCTION PerteneceAOrigenes(g: TipoGrafo; origen: TipoElemento): boolean;
	BEGIN
		PerteneceAOrigenes := g.origenes[origen];
	END;
	
	FUNCTION PerteneceADestinos(g: TipoGrafo; origen, destino: TipoElemento): boolean;
	BEGIN
		IF (EsMenorElemento(origen, destino)) THEN
			PerteneceADestinos := g.destinos[origen][destino] <> -1
		ELSE
			PerteneceADestinos := g.destinos[destino][origen] <> -1;
	END;
	
	PROCEDURE ListaAdyacencia(g: TipoGrafo; origen: TipoElemento; VAR lista: TipoLista);
	VAR
		destino: TipoElemento;
	BEGIN
		CrearVacia(lista);
		
		FOR destino := origen TO MAX_ELEMENTO DO
			IF (g.destinos[origen][destino] <> -1) THEN
				Construir(lista, destino);
		
		FOR destino := MIN_ELEMENTO TO origen DO
			IF (g.destinos[destino][origen] <> -1) THEN
				Construir(lista, destino);
	END;
	
	PROCEDURE BorrarOrigen(VAR g: TipoGrafo; origen: TipoElemento);
	VAR
		destino: TipoElemento;
	BEGIN
		g.origenes[origen] := FALSE;
		
		FOR destino := origen TO MAX_ELEMENTO DO
			g.destinos[origen][destino] := -1;
		
		FOR destino := MIN_ELEMENTO TO origen DO
			g.destinos[destino][origen] := -1;
	END;
	
	PROCEDURE BorrarDestino(VAR g: TipoGrafo; origen, destino: TipoElemento);
	BEGIN
		IF (EsMenorElemento(origen, destino)) THEN
			g.destinos[origen][destino] := -1
		ELSE
			g.destinos[destino][origen] := -1;
	END;
	
	PROCEDURE MostrarGrafo(g: TipoGrafo);
	VAR
		origen, destino: TipoElemento;
	BEGIN
		FOR origen := MIN_ELEMENTO TO MAX_ELEMENTO DO
		BEGIN
			IF (g.origenes[origen]) THEN
			BEGIN
				Write('[');
				MostrarElemento(origen);
				Write(']: ');
				
				FOR destino := origen TO MAX_ELEMENTO DO
				BEGIN
					IF (g.destinos[origen][destino] <> -1) THEN
					BEGIN
						Write('(');
						MostrarElemento(destino);
						Write('|', g.destinos[origen][destino], ')');
					END;
				END;
				
				FOR destino := MIN_ELEMENTO TO origen DO
				BEGIN
					IF (g.destinos[destino][origen] <> -1) THEN
					BEGIN
						Write('(');
						MostrarElemento(destino);
						Write('|', g.destinos[destino][origen], ')');
					END;
				END;
				
				WriteLn;
			END;
		END;
	END;
END.
