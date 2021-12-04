PROGRAM PruebaArboles;
USES TADArbolNario, TADElemento;

VAR
	arbol: TipoArbolNario;
	h1,h2,h3,h11,h21,h22,h211: TipoArbolNario;
BEGIN
	CrearArbolNarioVacio (arbol);
	AgregarRaiz (arbol, 1);
	
	AgregarHijo (arbol, 2, h1);
	AgregarHijo (arbol, 3, h2);
	AgregarHijo (arbol, 4, h3);
	
	AgregarHijo (h1, 5, h11);
	AgregarHijo (h2, 6, h21);
	AgregarHijo (h2, 7, h22);
	
	AgregarHijo (h21, 8, h211);
	
	
	Mostrar (arbol);
	writeln;

END.
