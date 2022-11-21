"""
Un sistema operativo mantiene 5 instancias de un recurso almacenadas en una cola.
Además, existen P procesos que necesitan usar una instancia del recurso.
Para eso, deben sacar la instancia de la cola antes de usarla. Una vez usada,
la instancia debe ser encolada nuevamente.

"""

Program ejercicio3{

sem semrecursos = 5
sem mutex = 1
Cola recursos #esta cola tiene los id de los recursos
process procesos [1..P] {
    int rr = -1
    P(semrecursos)
    P(mutex)
    pop( recursos, rr)
    V(mutex)
    #uso el recurso
    UsarRecurso(rr)
    P(mutex)
    push( recursos, rr)
    V(mutex)
    V(semrecursos)
 
 }
}