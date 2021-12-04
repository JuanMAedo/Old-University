UNIT TADABB;

INTERFACE
	USES TADElemento;

	TYPE
		TipoABB = ^TipoNodo;
		TipoNodo = RECORD
			r: TipoElemento;
			hizq: TipoABB;
			hder: TipoABB;
		END;
	
	PROCEDURE CrearABBVacio(VAR abb: TipoABB);
	PROCEDURE ConstruirABB(VAR abb: TipoABB; hizq: TipoABB; r: TipoElemento; hder: TipoABB);
	PROCEDURE Raiz(abb: TipoABB; VAR r: TipoElemento);
	PROCEDURE HijoIzquierdo(abb: TipoABB; VAR hizq: TipoABB);
	PROCEDURE HijoDerecho(abb: TipoABB; VAR hder: TipoABB);
	FUNCTION EsABBVacio(abb: TipoABB): boolean;
	PROCEDURE MostrarABB(abb: TipoABB);
	FUNCTION Pertenece(abb: TipoABB; elemento: TipoElemento): boolean;
	PROCEDURE Insertar(VAR abb: TipoABB; elemento: TipoElemento);
	PROCEDURE Eliminar(VAR abb: TipoABB; elemento: TipoElemento);
IMPLEMENTATION
	PROCEDURE CrearABBVacio(VAR abb: TipoABB);
	BEGIN
		abb := NIL;
	END;
	
	PROCEDURE ConstruirABB(VAR abb: TipoABB; hizq: TipoABB; r: TipoElemento; hder: TipoABB);
	BEGIN
		new(abb);
		abb^.hizq := hizq;
		CopiarElemento(r, abb^.r);
		abb^.hder := hder;
	END;
	
	PROCEDURE Raiz(abb: TipoABB; VAR r: TipoElemento);
	BEGIN
		IF (NOT EsABBVacio(abb)) THEN
			CopiarElemento(abb^.r, r);
	END;
	
	PROCEDURE HijoIzquierdo(abb: TipoABB; VAR hizq: TipoABB);
	BEGIN
		IF (NOT EsABBVacio(abb)) THEN
			hizq := abb^.hizq;
	END;
	
	PROCEDURE HijoDerecho(abb: TipoABB; VAR hder: TipoABB);
	BEGIN
		IF (NOT EsABBVacio(abb)) THEN
			hder := abb^.hder;
	END;
	
	FUNCTION EsABBVacio(abb: TipoABB): boolean;
	BEGIN
		EsABBVacio := abb = NIL;
	END;
	
	PROCEDURE MostrarABB(abb: TipoABB);
	VAR
		r: TipoElemento;
		hizq, hder: TipoABB;
	BEGIN
		IF (NOT EsABBVacio(abb)) THEN
		BEGIN
			Write('(R = ');
			Raiz(abb, r);
			MostrarElemento(r);

			Write(', Hizq = ');
			HijoIzquierdo(abb, hizq);
			MostrarABB(hizq);

			Write(', Hder = ');
			HijoDerecho(abb, hder);
			MostrarABB(hder);

			Write(')');
		END
		ELSE
		BEGIN
			Write('_');
		END;
	END;
	
	FUNCTION Pertenece(abb: TipoABB; elemento: TipoElemento): boolean;
	VAR
		r: TipoElemento;
		hizq, hder: TipoABB;
	BEGIN
		IF (EsABBVacio(abb)) THEN
			Pertenece := FALSE
		ELSE
		BEGIN
			Raiz(abb, r);
			IF (EsMenorElemento(elemento, r)) THEN
			BEGIN
				HijoIzquierdo(abb, hizq);
				Pertenece := Pertenece(hizq, elemento);
			END
			ELSE IF (EsMayorElemento(elemento, r)) THEN
			BEGIN
				HijoDerecho(abb, hder);
				Pertenece := Pertenece(hder, elemento);
			END
			ELSE
				Pertenece := TRUE;
		END;
	END;
	
	PROCEDURE Insertar(VAR abb: TipoABB; elemento: TipoElemento);
	VAR
		abbVacio: TipoABB;
		r: TipoElemento;
	BEGIN
		IF (EsABBVacio(abb)) THEN
		BEGIN
			CrearABBVacio(abbVacio);
			ConstruirABB(abb, abbVacio, elemento, abbVacio);
		END
		ELSE
		BEGIN
			Raiz(abb, r);
			IF (EsMenorElemento(elemento, r)) THEN
				Insertar(abb^.hizq, elemento)
			ELSE IF (EsMayorElemento(elemento, r)) THEN
				Insertar(abb^.hder, elemento);
		END;
	END;
	
	PROCEDURE Eliminar(VAR abb: TipoABB; elemento: TipoElemento);
		PROCEDURE MEMA(abb: TipoABB; VAR elemento: TipoElemento);
		VAR
			hizq: TipoABB;
		BEGIN
			IF (NOT EsABBVacio(abb)) THEN
			BEGIN
				HijoIzquierdo(abb, hizq);
				IF (NOT EsABBVacio(hizq)) THEN
					MEMA(hizq, elemento)
				ELSE
					Raiz(abb, elemento);
			END;
		END;
		
		PROCEDURE MAME(abb: TipoABB; VAR elemento: TipoElemento);
		VAR
			hder: TipoABB;
		BEGIN
			IF (NOT EsABBVacio(abb)) THEN
			BEGIN
				HijoDerecho(abb, hder);
				IF (NOT EsABBVacio(hder)) THEN
					MAME(hder, elemento)
				ELSE
					Raiz(abb, elemento);
			END;
		END;
	VAR
		r, nuevaR: TipoElemento;
		hizq, hder: TipoABB;
	BEGIN
		IF (NOT EsABBVacio(abb)) THEN
		BEGIN
			Raiz(abb, r);
			HijoIzquierdo(abb, hizq);
			HijoDerecho(abb, hder);
			
			IF (SonElementosIguales(elemento, r)) THEN
				IF (EsABBVacio(hizq)) THEN
				BEGIN
					dispose(abb);
					abb := hder;
				END
				ELSE IF (EsABBVacio(hder)) THEN
				BEGIN
					dispose(abb);
					abb := hizq;
				END
				ELSE
				BEGIN
					MAME(abb^.hizq, nuevaR);
					CopiarElemento(nuevaR, abb^.r);
					Eliminar(abb^.hizq, nuevaR);
				END
			ELSE IF (EsMenorElemento(elemento, r)) THEN
				Eliminar(abb^.hizq, elemento)
			ELSE
				Eliminar(abb^.hder, elemento);
					
		END;
	END;
END.
