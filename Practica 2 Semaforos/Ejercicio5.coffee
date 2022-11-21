"""En una empresa de logística de paquetes existe una sala de contenedores
donde se preparan las entregas. Cada contenedor puede almacenar un paquet
y la sala cuenta con capacidad para N contenedores. Resuelva considerando
las siguientes situaciones:
a) La empresa cuenta con 2 empleados: un empleado Preparador que se ocupa de
preparar los paquetes y dejarlos en los contenedores; un empelado Entregador
que se ocupa de tomar los paquetes de los contenedores y realizar la entregas.
Tanto el Preparador como el Entregador trabajan de a un paquete por vez.
b) Modifique la solución a) para el caso en que haya P empleados Preparadores.
c) Modifique la solución a) para el caso en que haya E empleados Entregadores.
d) Modifique la solución a) para el caso en que haya P empleados Preparadores y E
empleadores Entregadores."""
Program ejercicio5a {
sem hayEspacio= N 
sem hayPaquete = 0
pos_libre=0
pos_ocupada=0
array contenedor[N]

Procedure Preparador {
 while ( true ) {
    paquete =prepararpaquete()
    P(hayEspacio)
    contenedores[pos_libre] = paquete
    pos_libre= pos_libre + 1 MOD N
    V(hayPaquete)

 }
}

Procedure Entregador {
    while ( true ) {
    P(hayPaquete)
    pop(contenedor[pos_ocupada])
    pos_ocupada = pos_ocupada + 1 MOD N
    #entrega paquete 
    V (hayEspacio)
 }


}


}

#########################       5b               ###########################

"""b) Modifique la solución a) para el caso en que haya P empleados Preparadores."""
Program ejercicio5b {
sem hayEspacio= N 
sem hayPaquete = 0
sem mutex = 1 
array contenedor[N]
pos_libre=0
pos_ocupada=0

Procedure Preparador [0..P-1 ] {
 while ( true ) {
    paquete =prepararpaquete()
    P(hayEspacio)
    P(mutex)
    contenedores[pos_libre] = paquete
    pos_libre= pos_libre + 1 MOD N
    V(mutex)
    V(hayPaquete)

 }
}

Procedure Entregador {
    while ( true ) {
    P(hayPaquete)
    pop(contenedor[pos_ocupada])
    pos_ocupada = pos_ocupada + 1 MOD N
    #entrega paquete 
    V (hayEspacio)
 }


}


}


#########################       5b               ###########################

"""c) Modifique la solución a) para el caso en que haya E empleados Entregadores."""
Program ejercicio5b {
sem hayEspacio= N 
sem hayPaquete = 0
sem mutex = 1 
array contenedor[N]
pos_libre=0
pos_ocupada=0

Procedure Preparador  {
 while ( true ) {
    paquete =prepararpaquete()
    P(hayEspacio)
    contenedores[pos_libre] = paquete
    pos_libre= pos_libre + 1 MOD N
    V(hayPaquete)

 }
}

Procedure Entregador {
    while ( true ) {
    P(hayPaquete)
    P(mutex)
    pop(contenedor[pos_ocupada])
    pos_ocupada = pos_ocupada + 1 MOD N
    v(mutex)
    #entrega paquete 
    V (hayEspacio)
 }
}
}

########################       5c            ###########################

"""d) Modifique la solución a) para el caso en que haya P empleados Preparadores y E
empleadores Entregadores."""
Program ejercicio5b {
sem hayEspacio= N 
sem hayPaquete = 0
sem mutex = 1 
sem mutexP =1
array contenedor[N]
pos_libre=0
pos_ocupada=0

Procedure Preparador  {
 while ( true ) {
    paquete =prepararpaquete()
    P(hayEspacio)
    P(mutexP)
    contenedores[pos_libre] = paquete
    pos_libre= pos_libre + 1 MOD N
    V(mutexP)
    V(hayPaquete)

 }
}

Procedure Entregador {
    while ( true ) {
    P(hayPaquete)
    P(mutex)
    pop(contenedor[pos_ocupada])
    pos_ocupada = pos_ocupada + 1 MOD N
    v(mutex)
    #entrega paquete 
    V (hayEspacio)
 }
}
}