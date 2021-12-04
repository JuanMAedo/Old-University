PROGRAM Prueba;

USES TADElemento, TADArbolBinario;

VAR
	abVacio: TipoArbolBinario;
	ab: TipoArbolBinario;
	hizq, hder, hderIzq, hderDer: TipoArbolBinario;
	{
				(7)
			   /   \
			(4)		(9)
		   /       /   \
		(2)		(8)		(10)
	}
BEGIN
	CrearArbolBinarioVacio(abVacio);
	
	ConstruirArbolBinario(hizq, abVacio, 2, abVacio);
	ConstruirArbolBinario(hizq, hizq, 4, abVacio);
	
	ConstruirArbolBinario(hderIzq, abVacio, 8, abVacio);
	ConstruirArbolBinario(hderDer, abVacio, 10, abVacio);
	ConstruirArbolBinario(hder, hderIzq, 9, hderDer);
	
	CrearArbolBinarioVacio(ab);
	ConstruirArbolBinario(ab, hizq, 7, hder);
	
	MostrarArbolBinario(ab);
	Writeln;
END.
