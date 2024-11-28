def lee_lista(n):
    a = []
    if n > 0:
        cadenaEntrada = input()
        for i in range(0, n):
            elemento = int(cadenaEntrada.split(" ")[i])
            a.append(elemento)
    return a


def mochila(n ,pesos, capacidad_mochila):
    sol_optima = [None] * n
    sol_parcial = [None] * n
    return  buscar_poda(n , pesos , capacidad_mochila[0] , capacidad_mochila[1], sol_optima, sol_parcial , 0 , 0 , -1)

def buscar_poda(long_arbol ,pesos ,capacidad_mochila1 , capacidad_mochila2 ,  sol_optima ,sol_parcial , i , suma_parcial , suma_optima):
    for k in range (0,3):
        if (((k == 1) and ((pesos[i]) <= capacidad_mochila1)) or ((k == 2) and ((pesos[i]) <= capacidad_mochila2)) or (k == 0)):
            sol_parcial[i] = k
            if k == 1:
                capacidad_mochila1 -= pesos[i]
            elif k == 2:
                capacidad_mochila2 -= pesos[i]
            if ( i == long_arbol-1):
                suma_parcial = 0
                for j in range(0, long_arbol):
                    if (sol_parcial[j] == 1 or sol_parcial[j] == 2):
                        suma_parcial += pesos[j]
                if suma_parcial > suma_optima:
                    sol_optima = sol_parcial
                    suma_optima = suma_parcial
            else:
                suma_optima = buscar_poda(long_arbol,pesos,capacidad_mochila1, capacidad_mochila2, sol_optima,sol_parcial,i+1,suma_parcial,suma_optima)
                if k == 1:
                    capacidad_mochila1 += pesos[i]
                if k == 2:
                    capacidad_mochila2 += pesos[i]
    return suma_optima
n = int(input())
pesos = lee_lista(n)
capacidades = lee_lista(2)

sol = mochila(n,pesos,capacidades)

print(sol)
