"""
Existen N personas que deben ser chequeadas por un detector de metales antes de poder
ingresar al avión.
a. Analice el problema y defina qué procesos, recursos y semáforos serán
necesarios/convenientes, además de las posibles sincronizaciones requeridas para
resolver el problema.
b. Implemente una solución que modele el acceso de las personas a un detector (es decir,
si el detector está libre la persona lo puede utilizar; en caso contrario, 
debe esperar).
c. Modifique su solución para el caso que haya tres detectores.
"""

Program ejercicio1b
const personas =N;
sem mutex=1 #los semaforos siempre tienen que estar inicializados


Process Persona[1..personas]{
P(mutex)
//usar detector
V(mutex)
}

Program ejercicio1c{
sem detectores =3
sem mutex =1
Cola coladetectores = new Cola ([3,id]) # ES CORRECTO????!

Process Personas[1..personas]
int d =-1

P(detectores) #espero a que haya un detector
P(mutex) #acceso a la cola
d = pop(coladetectores)
V(mutex)
UsarDetector(d)
V(detectores)

}