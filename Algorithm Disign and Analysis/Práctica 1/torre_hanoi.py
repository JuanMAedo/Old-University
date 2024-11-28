def torre_hanoi(discos,A,B,C):
    if discos > 0 and discos < 10:
        torre_hanoi(discos - 1, A, B, C)
        print("Mueve disco", discos, "desde torre", A, "a torre", B)
        torre_hanoi(discos - 1, C, B, A)
        print("Mueve disco", discos, "desde torre", B, "a torre", C)
        torre_hanoi(discos - 1, A, B, C)
discos = int(input())
torre_hanoi(discos, 1, 2, 3)