PROGRAM ExtArbolBinario;

USES TADElemento, TADArbolBinario;

FUNCTION NumNodos(ab: TipoArbolBinario): integer;
VAR
	hizq, hder: TipoArbolBinario;
BEGIN
	IF (EsArbolBinarioVacio(ab)) THEN
		NumNodos := 0
	ELSE
	BEGIN
		HijoIzquierdo(ab, hizq);
		HijoDerecho(ab, hder);
		NumNodos := 1 + NumNodos(hizq) + NumNodos(hder);
	END;
END;

FUNCTION NumHojas(ab: TipoArbolBinario): integer;
VAR
	hizq, hder: TipoArbolBinario;
BEGIN
	IF (EsArbolBinarioVacio(ab)) THEN
		NumHojas := 0
	ELSE
	BEGIN
		HijoIzquierdo(ab, hizq);
		HijoDerecho(ab, hder);
		IF ((EsArbolBinarioVacio(hizq)) AND (EsArbolBinarioVacio(hder))) THEN
			NumHojas := 1
		ELSE
			NumHojas := NumHojas(hizq) + NumHojas(hder);
	END;
END;

FUNCTION Max(n1: integer; n2: integer): integer;
BEGIN
	IF (n1 > n2) THEN
		Max := n1
	ELSE
		Max := n2;
END;

FUNCTION Profundidad(ab: TipoArbolBinario): integer;
VAR
	hizq, hder: TipoArbolBinario;
BEGIN
	IF (EsArbolBinarioVacio(ab)) THEN
		Profundidad := 0
	ELSE
	BEGIN
		HijoIzquierdo(ab, hizq);
		HijoDerecho(ab, hder);
		Profundidad := 1 + Max(Profundidad(hizq), Profundidad(hder));
	END;
END;

FUNCTION Compensado(ab: TipoArbolBinario): boolean;
VAR
	hizq, hder: TipoArbolBinario;
BEGIN
	IF (EsArbolBinarioVacio(ab)) THEN
		Compensado := TRUE
	ELSE
	BEGIN
		HijoIzquierdo(ab, hizq);
		HijoDerecho(ab, hder);
		Compensado := NumNodos(hizq) = NumNodos(hder);
	END;
END;

FUNCTION NivelElemento(ab: TipoArbolBinario; elemento: TipoElemento): integer;
	FUNCTION Min(n1: integer; n2: integer): integer;
	BEGIN
		IF (n1 < n2) THEN
			Min := n1
		ELSE
			Min := n2;
	END;
VAR
	r: TipoElemento;
	hizq, hder: TipoArbolBinario;
	nhizq, nhder: integer;
BEGIN
	IF (EsArbolBinarioVacio(ab)) THEN
		NivelElemento := 0
	ELSE
	BEGIN
		Raiz(ab, r);
		IF (SonElementosIguales(elemento, r)) THEN
			NivelElemento := 1
		ELSE
		BEGIN
			HijoIzquierdo(ab, hizq);
			HijoDerecho(ab, hder);
			
			nhizq := NivelElemento(hizq, elemento);
			nhder := NivelElemento(hder, elemento);
			IF ((nhizq > 0) AND (nhder > 0)) THEN
				NivelElemento := 1 + Min(nhizq, nhder)
			ELSE IF ((nhizq = 0) AND (nhder = 0)) THEN
				NivelElemento := 0
			ELSE
				NivelElemento := 1 + Max(nhizq, nhder);
		END;
	END;
END;

PROCEDURE Espejo(ab: TipoArbolBinario; VAR abEspejo: TipoArbolBinario);
VAR
	r: TipoElemento;
	hizq, hder: TipoArbolBinario;
	hizqEspejo, hderEspejo: TipoArbolBinario;
BEGIN
	IF (EsArbolBinarioVacio(ab)) THEN
		CrearArbolBinarioVacio(abEspejo)
	ELSE
	BEGIN
		Raiz(ab, r);
		HijoIzquierdo(ab, hizq);
		HijoDerecho(ab, hder);
		
		Espejo(hizq, hizqEspejo);
		Espejo(hder, hderEspejo);
		CrearArbolBinarioVacio(abEspejo);
		ConstruirArbolBinario(abEspejo, hderEspejo, r, hizqEspejo);
	END;
END;

VAR
	abVacio: TipoArbolBinario;
	hizq, hder, hderIzq, hderDer: TipoArbolBinario;
	abEspejo, ab: TipoArbolBinario;
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
	Writeln('NumNodos: ', NumNodos(ab));
	Writeln('NumHojas: ', NumHojas(ab));
	Writeln('Profundidad: ', Profundidad(ab));
	Write('Compensado: ');
	IF (Compensado(ab)) THEN
		Writeln('SÍ')
	ELSE
		Writeln('NO');
	Writeln('NivelElemento (2): ', NivelElemento(ab, 2));
	Writeln('NivelElemento (7): ', NivelElemento(ab, 7));
	
	Espejo(ab, abEspejo);
	writeln('Espejo:');
	MostrarArbolBinario(abEspejo);
END.
