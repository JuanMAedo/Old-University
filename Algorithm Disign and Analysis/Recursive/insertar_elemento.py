def lee_lista_enteros():
    linea = input()
    lista_cadenas = linea.split(' ')
    return [int(x) for x in lista_cadenas]


def imprime_lista(a):
    n = len(a)
    if n == 0:
        pass
    elif n == 1:
        print(a[0])
    else:
        print(a[0], end='')
        print(' ', end='')
        imprime_lista(a[1:])


def introducir_valor(lista, valor):
    if len(lista) == 0:
        return [valor]
    elif lista[0] > valor:
         return ([valor] + lista)
    else:
        return ([lista[0]] + introducir_valor(lista[1:], valor))


long = int(input())
lista = lee_lista_enteros()
parametro = int(input())
lista.sort()
imprime_lista(introducir_valor(lista, parametro))
