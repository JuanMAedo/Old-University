def function(a, xn):
    return xn**2 - a


def derivada(xn):
    return 2 * xn

def newton_raphson(a, xn):
    if abs(function(a,xn)) < 10 ** -6:
        return xn
    else:
        return newton_raphson(a, (xn - function(a,xn) / derivada(xn)))
a = float(input())
print('%.4f' %newton_raphson(a,a))