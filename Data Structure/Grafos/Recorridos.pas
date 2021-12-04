
PROCEDURE Anchura(g: TGrafo; e: TElemento; VAR recorrido: TLista);
VAR
	orden: TCola;
	eAux: TElemento;
	adyacentes: TLista;
BEGIN
	CrearListaVacia(recorrido);
	
	CrearColaVacia(orden);
	InsertarCola(orden, e);
	
	WHILE (NOT EsColaVacia(orden)) DO
	BEGIN
		PrimeroCola(eAux, orden);
		EliminarCola(orden);
		
		IF (NOT PerteneceLista(recorrido, eAux)) THEN
			InsertarFinalLista(recorrido, eAux);
		
		ListaAdyacencia(adyacentes, g, eAux);
		WHILE (NOT EsListaVacia(adyacentes)) DO
		BEGIN
			PrimeroLista(eAux, adyacentes);
			BorrarElementoLista(adyacentes, eAux);
			
			IF (NOT PerteneceLista(recorrido, eAux)) THEN
				InsertarCola(orden, eAux);
		END;
	END;
END;


PROCEDURE Profundidad(g: TGrafo; e: TElemento; VAR recorrido: TLista);
VAR
	orden: TPila;
	eAux: TElemento;
	adyacentes: TLista;
BEGIN
	CrearListaVacia(recorrido);
	
	CrearPilaVacia(orden);
	Apilar(orden, e);
	
	WHILE (NOT EsPilaVacia(orden)) DO
	BEGIN
		Cima(eAux, orden);
		Desapilar(orden);
		
		IF (NOT PerteneceLista(recorrido, eAux)) THEN
			InsertarFinalLista(recorrido, eAux);
		
		ListaAdyacencia(adyacentes, g, eAux);
		WHILE (NOT EsListaVacia(adyacentes)) DO
		BEGIN
			PrimeroLista(eAux, adyacentes);
			BorrarElementoLista(adyacentes, eAux);
			
			IF (NOT PerteneceLista(recorrido, eAux)) THEN
				Apilar(orden, eAux);
		END;
	END;
END;






