def lee_lista(n):
    a = []
    if n > 0:
        cadenaEntrada = input()
        for i in range(0, n):
            elemento = int(cadenaEntrada.split(" ")[i])
            a.append(elemento)
    return a

def optimizar_mezcla(num_listas, long_listas):
    if num_listas<1:
        return -1
        exit(-1)
    elif num_listas == 1:
        return 0
    else:
        optimo = [None] * (num_listas-1)
        for n in range (0, num_listas-1):
            x1 = min(long_listas)
            long_listas.remove(x1)
            x2 = min(long_listas)
            long_listas.remove(x2)
            optimo[n] = (x1 + x2)
            long_listas.append(optimo[n])
        suma = 0
        for n in range (0,len(optimo)):
            suma += optimo[n]
        return(suma)
listas = int(input())
lon_listas = lee_lista(listas)
print(optimizar_mezcla(listas,lon_listas))