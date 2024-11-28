import math
import numpy as np
import matplotlib.pyplot as plt

def sierpinsky(p, q,grado):
    if grado == 0:
        plt.plot([p[0, 0], q[0, 0]], [p[1, 0], q[1, 0]], 'k-')
    else:
        #Al ser un triángulo equilátero, los ángulos serán de 60 grados o pi/3 radianes
        R_60 = np.matrix([[math.cos(math.pi / 3),- math.sin(math.pi / 3)],
                          [math.sin(math.pi / 3),math.cos(math.pi / 3)]])
        vector = q - p

        # El primer triángulo tendrá de base el vértice p y la mitad entre el vector p-q
        sierpinsky(p, p + vector/2, grado - 1)
        # El segundo triángulo tendrá de base la mitad entre el vector p-q y el vértice q
        sierpinsky(p + vector/2, p + vector, grado - 1)
        # El tercer triángulo será con los vértices superiores de los 2 triángulos que se crean en la base
        x1 = p + R_60 * vector/2
        x2 =  p + vector/2 + R_60 * vector/2
        sierpinsky(x1, x2, grado - 1)

def sierpinski_triangulo(n):
    p = np.array([[0], [0]])
    q = np.array([[2], [0]])
    r = np.array([[(0+2)/2], [(2-0)*math.sqrt(3) / 2]])
    sierpinsky(r, p, n)
    sierpinsky(q, r, n)
    sierpinsky(p, q, n)

fig = plt.figure()
fig.patch.set_facecolor('white')
sierpinski_triangulo(5)
plt.axis('equal')
plt.axis('off')
plt.show()