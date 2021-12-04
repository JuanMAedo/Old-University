PROGRAM Prueba;

USES TADElemento, TADABB;

VAR
	abb: TipoABB;
	{
				(7)
			   /   \
			(4)		(9)
		   /       /   \
		(2)		(8)		(10)
	}
BEGIN
	CrearABBVacio(abb);
	
	Insertar(abb, 7);
	Insertar(abb, 4);
	Insertar(abb, 2);
	Insertar(abb, 9);
	Insertar(abb, 8);
	Insertar(abb, 10);

	MostrarABB(abb);
	Writeln;
	
	Eliminar(abb, 9);
	{
				(7)
			   /   \
			(4)		(8)
		   /           \
		(2)		    	(10)
	}
	MostrarABB(abb);
	Writeln;
	
	Write('Pertenece (9): ');
	IF (Pertenece(abb, 9)) THEN
		Writeln('SÍ')
	ELSE
		Writeln('NO');
END.
