PROGRAM Principal;
USES TADElemento, TADLista, TADGrafoDP;

VAR
	g: TipoGrafo;
	adyacentes: TipoLista;
BEGIN
	CrearGrafoVacio(g);
	InsertarDestino(g, 1, 2, 1);
	InsertarDestino(g, 1, 3, 5);
	InsertarDestino(g, 1, 4, 7);
	InsertarDestino(g, 4, 5, 10);
	InsertarDestino(g, 5, 6, 1);
	MostrarGrafo(g);
	
	ListaAdyacencia(g, 1, adyacentes);
	MostrarLista(adyacentes);
	
	Write('El nodo 1 ');
	IF (PerteneceAOrigenes(g, 1)) THEN
		WriteLn('PERTENECE')
	ELSE
		WriteLn('NO PERTENECE');
	
	Write('El arco 1 -> 4 ');
	IF (PerteneceADestinos(g, 1, 4)) THEN
		WriteLn('PERTENECE')
	ELSE
		WriteLn('NO PERTENECE');
		
	BorrarOrigen(g, 5);
	MostrarGrafo(g);
	
	BorrarDestino(g, 1, 2);
	MostrarGrafo(g);
END.
