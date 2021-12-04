UNIT TADArbolBinario;

INTERFACE
	USES TADElemento;

	TYPE
		TipoArbolBinario = ^TipoNodo;
		TipoNodo = RECORD
			r: TipoElemento;
			hizq: TipoArbolBinario;
			hder: TipoArbolBinario;
		END;
	
	PROCEDURE CrearArbolBinarioVacio(VAR ab: TipoArbolBinario);
	PROCEDURE ConstruirArbolBinario(VAR ab: TipoArbolBinario; hizq: TipoArbolBinario; r: TipoElemento; hder: TipoArbolBinario);
	PROCEDURE Raiz(ab: TipoArbolBinario; VAR r: TipoElemento);
	PROCEDURE HijoIzquierdo(ab: TipoArbolBinario; VAR hizq: TipoArbolBinario);
	PROCEDURE HijoDerecho(ab: TipoArbolBinario; VAR hder: TipoArbolBinario);
	FUNCTION EsArbolBinarioVacio(ab: TipoArbolBinario): boolean;
	PROCEDURE MostrarArbolBinario(ab: TipoArbolBinario);
	
	{ EXTRA }
	PROCEDURE CopiarArbol(origen: TipoArbolBinario; VAR destino: TipoArbolBinario);
	FUNCTION SonArbolesIguales(ab1: TipoArbolBinario; ab2: TipoArbolBinario): boolean;
IMPLEMENTATION
	PROCEDURE CrearArbolBinarioVacio(VAR ab: TipoArbolBinario);
	BEGIN
		ab := NIL;
	END;
	
	PROCEDURE ConstruirArbolBinario(VAR ab: TipoArbolBinario; hizq: TipoArbolBinario; r: TipoElemento; hder: TipoArbolBinario);
	BEGIN
		new(ab);
		ab^.hizq := hizq;
		CopiarElemento(r, ab^.r);
		ab^.hder := hder;
	END;
	
	PROCEDURE Raiz(ab: TipoArbolBinario; VAR r: TipoElemento);
	BEGIN
		IF (NOT EsArbolBinarioVacio(ab)) THEN
			CopiarElemento(ab^.r, r);
	END;
	
	PROCEDURE HijoIzquierdo(ab: TipoArbolBinario; VAR hizq: TipoArbolBinario);
	BEGIN
		IF (NOT EsArbolBinarioVacio(ab)) THEN
			hizq := ab^.hizq;
	END;
	
	PROCEDURE HijoDerecho(ab: TipoArbolBinario; VAR hder: TipoArbolBinario);
	BEGIN
		IF (NOT EsArbolBinarioVacio(ab)) THEN
			hder := ab^.hder;
	END;
	
	FUNCTION EsArbolBinarioVacio(ab: TipoArbolBinario): boolean;
	BEGIN
		EsArbolBinarioVacio := ab = NIL;
	END;
	
	PROCEDURE MostrarArbolBinario(ab: TipoArbolBinario);
	VAR
		r: TipoElemento;
		hizq, hder: TipoArbolBinario;
	BEGIN
		IF (NOT EsArbolBinarioVacio(ab)) THEN
		BEGIN
			Write('(R = ');
			Raiz(ab, r);
			MostrarElemento(r);

			Write(', Hizq = ');
			HijoIzquierdo(ab, hizq);
			MostrarArbolBinario(hizq);

			Write(', Hder = ');
			HijoDerecho(ab, hder);
			MostrarArbolBinario(hder);

			Write(')');
		END
		ELSE
		BEGIN
			Write('_');
		END;
	END;
	
	{ EXTRA }
	PROCEDURE CopiarArbol(origen: TipoArbolBinario; VAR destino: TipoArbolBinario);
	VAR
		r: TipoElemento;
		hizq, hder: TipoArbolBinario;
		copiaHizq, copiaHder: TipoArbolBinario;
	BEGIN
		CrearArbolBinarioVacio(destino);
		IF (NOT EsArbolBinarioVacio(origen)) THEN
		BEGIN
			Raiz(origen, r);
			HijoIzquierdo(origen, hizq);
			HijoDerecho(origen, hder);
			
			CopiarArbol(hizq, copiaHizq);
			CopiarArbol(hder, copiaHder);
			ConstruirArbolBinario(destino, copiaHizq, r, copiaHder);
		END;
	END;
	
	FUNCTION SonArbolesIguales(ab1: TipoArbolBinario; ab2: TipoArbolBinario): boolean;
	VAR
		r1, r2: TipoElemento;
		hizq1, hder1, hizq2, hder2: TipoArbolBinario;
	BEGIN
		IF ((EsArbolBinarioVacio(ab1)) AND (EsArbolBinarioVacio(ab2))) THEN
			SonArbolesIguales := TRUE
		ELSE IF ((NOT EsArbolBinarioVacio(ab1)) AND (NOT EsArbolBinarioVacio(ab2))) THEN
		BEGIN
			Raiz(ab1, r1);
			HijoIzquierdo(ab1, hizq1);
			HijoDerecho(ab1, hder1);
			
			Raiz(ab2, r2);
			HijoIzquierdo(ab2, hizq2);
			HijoDerecho(ab2, hder2);
			
			SonArbolesIguales := (SonElementosIguales(r1, r2)) AND (SonArbolesIguales(hizq1, hizq2)) AND (SonArbolesIguales(hder1, hder2));
		END
		ELSE
			SonArbolesIguales := FALSE;
	END;
END.
