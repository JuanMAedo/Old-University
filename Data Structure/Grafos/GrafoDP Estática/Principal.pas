PROGRAM Principal;
USES TADElemento, TADLista, TADGrafoDP;

VAR
	g: TipoGrafo;
	adyacentes: TipoLista;
BEGIN
	CrearGrafoVacio(g);	
	InsertarDestino(g, 1, 2, 10);
	InsertarDestino(g, 1, 3, 15);
	InsertarDestino(g, 1, 4, 20);
	InsertarDestino(g, 4, 5, 8);
	InsertarDestino(g, 5, 6, 25);
	MostrarGrafo(g);
	WriteLn;
	
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
	WriteLn;
	
	BorrarDestino(g, 1, 2);
	MostrarGrafo(g);
	WriteLn;
END.
