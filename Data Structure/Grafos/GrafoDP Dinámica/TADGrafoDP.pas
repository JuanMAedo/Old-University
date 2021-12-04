UNIT TADGrafoDP;
{Grafo Dirigido y No Ponderado - Implementación Dinámica}

INTERFACE
	USES TADElemento, TADLista;
	
	TYPE
		TipoListaDestino = ^TipoNodoDestino;
		TipoNodoDestino = RECORD
			destino: TipoElemento;
			coste: integer;
			siguiente: TipoListaDestino;
		END;
		
		TipoListaOrigen = ^TipoNodoOrigen;
		TipoNodoOrigen = RECORD
			origen: TipoElemento;
			adyacentes: TipoListaDestino;
			siguiente: TipoListaOrigen;
		END;
		
		TipoGrafo = TipoListaOrigen;
	
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
	{Auxiliares}
	PROCEDURE CrearListaDestinoVacia(VAR listaDestino: TipoListaDestino);
	BEGIN
		listaDestino := NIL;
	END;
	
	PROCEDURE ConstruirListaOrigen(VAR listaOrigen: TipoListaOrigen; origen: TipoElemento);
	VAR
		pNuevo: TipoListaOrigen;
	BEGIN
		New(pNuevo);
		AsignarElemento(origen, pNuevo^.origen);
		CrearListaDestinoVacia(pNuevo^.adyacentes);
		pNuevo^.siguiente := listaOrigen;
		listaOrigen := pNuevo;
	END;
	
	FUNCTION ReferenciaAOrigenes(g: TipoGrafo; origen: TipoElemento): TipoListaOrigen;
	VAR
		encontrado: boolean;
		pOrigen: TipoListaOrigen;
	BEGIN
		encontrado := FALSE;
		pOrigen := g;
		WHILE ((NOT encontrado) AND (pOrigen <> NIL)) DO
		BEGIN
			encontrado := SonElementosIguales(origen, pOrigen^.origen);
			IF (NOT encontrado) THEN
				pOrigen := pOrigen^.siguiente;
		END;
		
		ReferenciaAOrigenes := pOrigen;
	END;
	
	PROCEDURE ConstruirListaDestino(VAR listaDestino: TipoListaDestino; destino: TipoElemento; coste: integer);
	VAR
		pNuevo: TipoListaDestino;
	BEGIN
		New(pNuevo);
		AsignarElemento(destino, pNuevo^.destino);
		pNuevo^.coste := coste;
		pNuevo^.siguiente := listaDestino;
		listaDestino := pNuevo;
	END;
	
	FUNCTION PerteneceAListaDestino(listaDestino: TipoListaDestino; destino: TipoElemento): boolean;
	VAR
		encontrado: boolean;
		pDestino: TipoListaDestino;
	BEGIN
		encontrado := FALSE;
		pDestino := listaDestino;
		WHILE ((NOT encontrado) AND (pDestino <> NIL)) DO
		BEGIN
			encontrado := SonElementosIguales(destino, pDestino^.destino);
			pDestino := pDestino^.siguiente;
		END;
		
		PerteneceAListaDestino := encontrado;
	END;
	
	PROCEDURE BorrarEnListaDestino(VAR listaDestino: TipoListaDestino; destino: TipoElemento);
	VAR
		encontrado: boolean;
		pAnterior, pExplorador: TipoListaDestino;
	BEGIN
		encontrado := FALSE;
		pAnterior := NIL;
		pExplorador := listaDestino;
		WHILE ((NOT encontrado) AND (pExplorador <> NIL)) DO
		BEGIN
			encontrado := SonElementosIguales(destino, pExplorador^.destino);
			IF (NOT encontrado) THEN
			BEGIN
				pAnterior := pExplorador;
				pExplorador := pExplorador^.siguiente;
			END;
		END;
		
		IF (encontrado) THEN
		BEGIN
			IF (pAnterior = NIL) THEN
				listaDestino := listaDestino^.siguiente
			ELSE
				pAnterior^.siguiente := pExplorador^.siguiente;
			Dispose(pExplorador);
		END;
	END;
	
	FUNCTION EsListaDestinoVacia(listaDestino: TipoListaDestino): boolean;
	BEGIN
		EsListaDestinoVacia := listaDestino = NIL;
	END;
	
	PROCEDURE DestruirListaDestino(VAR listaDestino: TipoListaDestino);
	VAR
		pAux: TipoListaDestino;
	BEGIN
		WHILE (NOT EsListaDestinoVacia(listaDestino)) DO
		BEGIN
			pAux := listaDestino;
			listaDestino := listaDestino^.siguiente;
			
			Dispose(pAux);
		END;
	END;
	{Auxiliares}
	
	PROCEDURE CrearGrafoVacio(VAR g: TipoGrafo);
	BEGIN
		g := NIL;
	END;
	
	PROCEDURE InsertarOrigen(VAR g: TipoGrafo; origen: TipoElemento);
	BEGIN
		IF (NOT PerteneceAOrigenes(g, origen)) THEN
			ConstruirListaOrigen(g, origen);
	END;
	
	PROCEDURE InsertarDestino(VAR g: TipoGrafo; origen, destino: TipoElemento; coste: integer);
	VAR
		pOrigen: TipoListaOrigen;
	BEGIN
		InsertarOrigen(g, origen);
		InsertarOrigen(g, destino);
		
		pOrigen := ReferenciaAOrigenes(g, origen);
		IF (NOT PerteneceAListaDestino(pOrigen^.adyacentes, destino)) THEN
			ConstruirListaDestino(pOrigen^.adyacentes, destino, coste);
	END;
	
	FUNCTION EsGrafoVacio(g: TipoGrafo): boolean;
	BEGIN
		EsGrafoVacio := g = NIL;
	END;
	
	FUNCTION PerteneceAOrigenes(g: TipoGrafo; origen: TipoElemento): boolean;
	VAR
		encontrado: boolean;
		pOrigen: TipoListaOrigen;
	BEGIN
		encontrado := FALSE;
		pOrigen := g;
		WHILE ((NOT encontrado) AND (pOrigen <> NIL)) DO
		BEGIN
			encontrado := SonElementosIguales(origen, pOrigen^.origen);
			pOrigen := pOrigen^.siguiente;
		END;
		
		PerteneceAOrigenes := encontrado;
	END;
	
	FUNCTION PerteneceADestinos(g: TipoGrafo; origen, destino: TipoElemento): boolean;
	VAR
		encontrado: boolean;
		pOrigen: TipoListaOrigen;
		pDestino: TipoListaDestino;
	BEGIN
		encontrado := FALSE;
		
		pOrigen := ReferenciaAOrigenes(g, origen);
		IF (pOrigen <> NIL) THEN
		BEGIN
			pDestino := pOrigen^.adyacentes;
			WHILE ((NOT encontrado) AND (pDestino <> NIL)) DO
			BEGIN
				encontrado := SonElementosIguales(destino, pDestino^.destino);
				pDestino := pDestino^.siguiente;
			END;
		END;
		
		PerteneceADestinos := encontrado;
	END;
	
	PROCEDURE ListaAdyacencia(g: TipoGrafo; origen: TipoElemento; VAR lista: TipoLista);
	VAR
		pOrigen: TipoListaOrigen;
		pDestino: TipoListaDestino;
	BEGIN
		CrearVacia(lista);
		
		pOrigen := ReferenciaAOrigenes(g, origen);
		IF (pOrigen <> NIL) THEN
		BEGIN
			pDestino := pOrigen^.adyacentes;
			WHILE (pDestino <> NIL) DO
			BEGIN
				Construir(lista, pDestino^.destino);
				pDestino := pDestino^.siguiente;
			END;
		END;
	END;
	
	PROCEDURE BorrarOrigen(VAR g: TipoGrafo; origen: TipoElemento);
	VAR
		encontrado: boolean;
		pAnterior, pExplorador: TipoListaOrigen;
	BEGIN
		encontrado := FALSE;
		pAnterior := NIL;
		pExplorador := g;
		WHILE ((NOT encontrado) AND (pExplorador <> NIL)) DO
		BEGIN
			encontrado := SonElementosIguales(origen, pExplorador^.origen);
			IF (NOT encontrado) THEN
			BEGIN
				pAnterior := pExplorador;
				pExplorador := pExplorador^.siguiente;
			END;
		END;
		
		IF (encontrado) THEN
		BEGIN
			DestruirListaDestino(pExplorador^.adyacentes);
			
			IF (pAnterior = NIL) THEN
				g := g^.siguiente
			ELSE
				pAnterior^.siguiente := pExplorador^.siguiente;
			Dispose(pExplorador);
			
			pExplorador := g;
			WHILE (pExplorador <> NIL) DO
			BEGIN
				BorrarDestino(g, pExplorador^.origen, origen);
				pExplorador := pExplorador^.siguiente;
			END;
		END;
	END;
	
	PROCEDURE BorrarDestino(VAR g: TipoGrafo; origen, destino: TipoElemento);
	VAR
		pOrigen: TipoListaOrigen;
	BEGIN
		pOrigen := ReferenciaAOrigenes(g, origen);
		IF (pOrigen <> NIL) THEN
			BorrarEnListaDestino(pOrigen^.adyacentes, destino);
	END;
	
	PROCEDURE MostrarGrafo(g: TipoGrafo);
	VAR
		pOrigen: TipoListaOrigen;
		pDestino: TipoListaDestino;
	BEGIN
		pOrigen := g;
		WHILE (pOrigen <> NIL) DO
		BEGIN
			Write('[');
			MostrarElemento(pOrigen^.origen);
			Write(']: ');
			
			pDestino := pOrigen^.adyacentes;
			IF (pDestino <> NIL) THEN
			BEGIN
				WHILE (pDestino^.siguiente <> NIL) DO
				BEGIN
					Write('(');
					MostrarElemento(pDestino^.destino);
					Write(' | ', pDestino^.coste, ') -> ');
					
					pDestino := pDestino^.siguiente;
				END;
				Write('(');
				MostrarElemento(pDestino^.destino);
				Write(' | ', pDestino^.coste, ')');
			END;
			Writeln;
			
			pOrigen := pOrigen^.siguiente;
		END;
	END;
END.
