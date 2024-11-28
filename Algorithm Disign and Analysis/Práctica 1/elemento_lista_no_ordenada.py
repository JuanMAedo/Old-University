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
def insert_sort_valor(lista, valor):
    if len(lista) == 0:
        return [valor]
    elif lista[0] > valor:
         return ([valor] + lista)
    else:
        return ([lista[0]] + insert_sort_valor(lista[1:], valor))

def ordenar(lista,long,aux):
    if len(lista) == 0:
        return []
    elif long == 1:
        return insert_sort_valor(aux,lista[long-1])
    else:
        return ordenar(lista,long-1,insert_sort_valor(aux,lista[long-1]))

long = int(input())
lista = lee_lista_enteros()
imprime_lista(ordenar(lista,long,[]))