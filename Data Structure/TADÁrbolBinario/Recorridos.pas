PROGRAM Recorridos;

USES TADElemento, TADLista, TADColaEnteros, TADColaCaracteres, TADArbolBinario;

PROCEDURE Preorden(ab: TipoArbolBinario; VAR recorrido: TipoLista);
VAR
	r: TipoElemento;
	hizq, hder: TipoArbolBinario;
	recorridoHizq, recorridoHder: TipoLista;
BEGIN
	TADLista.CrearVacia(recorrido);
	IF (NOT EsArbolBinarioVacio(ab)) THEN
	BEGIN
		Raiz(ab, r);
		HijoIzquierdo(ab, hizq);
		HijoDerecho(ab, hder);
		
		Preorden(hizq, recorridoHizq);
		Preorden(hder, recorridoHder);
		
		Concatenar(recorridoHizq, recorridoHder, recorrido);
		Construir(recorrido, r);
	END;
END;

PROCEDURE Inorden(ab: TipoArbolBinario; VAR recorrido: TipoLista);
VAR
	r: TipoElemento;
	hizq, hder: TipoArbolBinario;
	recorridoHizq, recorridoHder: TipoLista;
BEGIN
	TADLista.CrearVacia(recorrido);
	IF (NOT EsArbolBinarioVacio(ab)) THEN
	BEGIN
		Raiz(ab, r);
		HijoIzquierdo(ab, hizq);
		HijoDerecho(ab, hder);
		
		Inorden(hizq, recorridoHizq);
		Inorden(hder, recorridoHder);
		
		Construir(recorridoHder, r);
		Concatenar(recorridoHizq, recorridoHder, recorrido);
	END;
END;

PROCEDURE Postorden(ab: TipoArbolBinario; VAR recorrido: TipoLista);
VAR
	r: TipoElemento;
	hizq, hder: TipoArbolBinario;
	recorridoHizq, recorridoHder: TipoLista;
BEGIN
	TADLista.CrearVacia(recorrido);
	IF (NOT EsArbolBinarioVacio(ab)) THEN
	BEGIN
		Raiz(ab, r);
		HijoIzquierdo(ab, hizq);
		HijoDerecho(ab, hder);
		
		Postorden(hizq, recorridoHizq);
		Postorden(hder, recorridoHder);
		
		Concatenar(recorridoHizq, recorridoHder, recorrido);
		InsertarFinal(recorrido, r);
	END;
END;

PROCEDURE Frontera(ab: TipoArbolBinario; VAR recorrido: TipoLista);
VAR
	r: TipoElemento;
	hizq, hder: TipoArbolBinario;
	recorridoHizq, recorridoHder: TipoLista;
BEGIN
	TADLista.CrearVacia(recorrido);
	IF (NOT EsArbolBinarioVacio(ab)) THEN
	BEGIN
		Raiz(ab, r);
		HijoIzquierdo(ab, hizq);
		HijoDerecho(ab, hder);
		
		IF ((EsArbolBinarioVacio(hizq)) AND (EsArbolBinarioVacio(hder))) THEN
			Construir(recorrido, r)
		ELSE
		BEGIN
			Frontera(hizq, recorridoHizq);
			Frontera(hder, recorridoHder);
			Concatenar(recorridoHizq, recorridoHder, recorrido);
		END;
	END;
END;

PROCEDURE Anchura(ab: TipoArbolBinario; VAR recorrido: TipoLista);
VAR
	subarboles: TipoCola;
	abActual: TipoArbolBinario;
	r: TipoElemento;
	hizq, hder: TipoArbolBinario;
BEGIN
	TADLista.CrearVacia(recorrido);
	IF (NOT EsArbolBinarioVacio(ab)) THEN
	BEGIN
		TADCola.CrearVacia(subarboles);
		TADCola.Insertar(subarboles, ab);
		WHILE (NOT TADCola.EsVacia(subarboles)) DO
		BEGIN
			TADCola.Primero(subarboles, abActual);
			TADCola.Eliminar(subarboles);
			
			Raiz(abActual, r);
			HijoIzquierdo(abActual, hizq);
			HijoDerecho(abActual, hder);
			InsertarFinal(recorrido, r);
			
			IF (NOT EsArbolBinarioVacio(hizq)) THEN
				TADCola.Insertar(subarboles, hizq);
			
			IF (NOT EsArbolBinarioVacio(hder)) THEN
				TADCola.Insertar(subarboles, hder);
		END;
	END;
END;

VAR
	abVacio: TipoArbolBinario;
	hizq, hder, hderIzq, hderDer: TipoArbolBinario;
	ab: TipoArbolBinario;
	recorrido: TipoLista;
	{
				(7)
			   /   \
			(1)		(3)
		   /       /   \
		(8)		(2)		(1)
	}
BEGIN
	CrearArbolBinarioVacio(abVacio);
		
	CrearArbolBinarioVacio(hizq);
	ConstruirArbolBinario(hizq, abVacio, 8, abVacio);
	ConstruirArbolBinario(hizq, hizq, 1, abVacio);
	
	CrearArbolBinarioVacio(hderIzq);
	ConstruirArbolBinario(hderIzq, abVacio, 2, abVacio);
	CrearArbolBinarioVacio(hderDer);
	ConstruirArbolBinario(hderDer, abVacio, 1, abVacio);
	
	CrearArbolBinarioVacio(hder);
	ConstruirArbolBinario(hder, hderIzq, 3, hderDer);
	
	CrearArbolBinarioVacio(ab);
	ConstruirArbolBinario(ab, hizq, 7, hder);

	MostrarArbolBinario(ab);
	
	Writeln;
	Preorden(ab, recorrido);
	Write('Preorden: ');
	MostrarLista(recorrido);
	
	Inorden(ab, recorrido);
	Write('Inorden: ');
	MostrarLista(recorrido);
	
	Postorden(ab, recorrido);
	Write('Postorden: ');
	MostrarLista(recorrido);
	
	Frontera(ab, recorrido);
	Write('Frontera: ');
	MostrarLista(recorrido);
	
	Anchura(ab, recorrido);
	Write('Anchura: ');
	MostrarLista(recorrido);
END.
