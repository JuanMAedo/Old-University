def lee_lista(n):
    a = []
    if n > 0:
        cadenaEntrada = input()
        for i in range(0, n):
            elemento = int(cadenaEntrada.split(" ")[i])
            a.append(elemento)
    return a

def imprime_lista(a):
    n = len(a)
    if n == 0:
        pass
    elif n == 1:
        print(a[0])
    else:
        for i in range(0, n):
            print(a[i], end='')
            print(' ', end='')


def sort_par_impar(lista):
    if len(lista) < 2:
        return lista
    else:
        middle = len(lista) // 2
        return merge(sort_par_impar(lista[:middle]),sort_par_impar(lista[middle:]))


def merge(lista1,lista2):
    if lista1 == [] and lista2 == []:
        return []
    if lista1 == []:
        return sort_par_impar(lista2)
    elif lista2 == []:
        return sort_par_impar(lista1)
    resultado = []
    while (len(lista1) or len(lista2)) != 0:
        if len(lista1) == 0:
            resultado.append(lista2[0])
            lista2 = lista2[1:]
        elif len(lista2) == 0:
            resultado.append(lista1[0])
            lista1 = lista1[1:]
        elif lista1[0] < lista2[0]:
            if lista1[0] % 2 != 0 or (lista1[0] % 2 == 0 and lista2[0] % 2 == 0):
                resultado.append(lista1[0])
                lista1 = lista1[1:]
            else:
                resultado.append(lista2[0])
                lista2 = lista2[1:]
        else:
            if lista2[0] % 2 != 0 or lista1[0] % 2 == 0:
                resultado.append(lista2[0])
                lista2 = lista2[1:]
            else:
                resultado.append(lista1[0])
                lista1 = lista1[1:]
    return resultado

# Prueba del algoritmo
long = int(input())
lista = lee_lista(long)
imprime_lista(sort_par_impar(lista))

