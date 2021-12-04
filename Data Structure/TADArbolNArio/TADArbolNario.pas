UNIT TADArbolNario;

INTERFACE
	USES TADElemento;

	TYPE
		TipoArbolNario = ^TipoNodo;
		TipoNodo = RECORD
			r: TipoElemento;
			primerhijo: TipoArbolNario;
			hermano: TipoArbolNario;
		END;
	
	PROCEDURE CrearArbolNarioVacio(VAR ab: TipoArbolNario);
	PROCEDURE AgregarRaiz (VAR ab: TipoArbolNario; r: TipoElemento);
	PROCEDURE AgregarHijo (VAR ab: TipoArbolNario; e: TipoElemento; VAR nuevo: TipoArbolNario);
	PROCEDURE Raiz (ab: TipoArbolNario; VAR r: TipoElemento);
	PROCEDURE PrimerHijo (ab: TipoArbolNario; VAR hijo: TipoArbolNario);
	PROCEDURE Hermano (ab: TipoArbolNario; VAR hermano: TipoArbolNario);
	FUNCTION EsArbolVacio (ab: TipoArbolNario):Boolean;
	
	PROCEDURE Mostrar (ab: TipoArbolNario);
IMPLEMENTATION
	PROCEDURE CrearArbolNarioVacio(VAR ab: TipoArbolNario);
	BEGIN
		ab := NIL;
	END;
	
	PROCEDURE AgregarRaiz (VAR ab: TipoArbolNario; r: TipoElemento);
	BEGIN
		New (ab);
		CopiarElemento(r,ab^.r);
		ab^.primerhijo:=NIL;
		ab^.hermano:=NIL;
	END;
	
	PROCEDURE AgregarHijo (VAR ab: TipoArbolNario; e: TipoElemento; VAR nuevo: TipoArbolNario);
	VAR
		paux: TipoArbolNario;
	BEGIN
		New (nuevo);
		CopiarElemento(e,nuevo^.r);
		nuevo^.primerhijo:=NIL;
		nuevo^.hermano:=NIL;
		
		IF (ab^.primerhijo=NIL) THEN
			ab^.primerhijo:=nuevo
		ELSE
		BEGIN
			{Tambien se puede agregar por el principio}
			paux:=ab^.primerhijo;
			WHILE (paux^.hermano<>NIL) DO
				paux:=paux^.hermano;
			paux^.hermano:=nuevo;
		END;
	END;
	
	PROCEDURE Raiz (ab: TipoArbolNario; VAR r: TipoElemento);
	BEGIN
		IF (ab<>NIL) THEN
			CopiarElemento(ab^.r,r);
	END;
	
	PROCEDURE PrimerHijo (ab: TipoArbolNario; VAR hijo: TipoArbolNario);
	BEGIN
		IF (ab<>NIL) THEN
			hijo:=ab^.primerhijo;
	END;
	
	PROCEDURE Hermano (ab: TipoArbolNario; VAR hermano: TipoArbolNario);
	BEGIN
		IF (ab<>NIL) THEN
			hermano:=ab^.hermano;
	END;
	
	FUNCTION EsArbolVacio (ab: TipoArbolNario):Boolean;
	BEGIN
		EsArbolVacio:=(ab=NIL);
	END;
	
	PROCEDURE Mostrar (ab: TipoArbolNario);
	VAR
		hijo, her: TipoArbolNario;
		e: TipoElemento;
	BEGIN
		IF NOT EsArbolVacio(ab) THEN
		BEGIN
			Raiz (ab, e);
			PrimerHijo (ab, hijo);
			Hermano (ab, her);
			MostrarElemento (e);
			write (' ');
			Mostrar (hijo);
			Mostrar (her);
		END;
	END;
END.
