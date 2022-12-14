"""
6. Existen N personas que deben imprimir un trabajo cada una. Resolver cada ítem usando
semáforos:
a) Implemente una solución suponiendo que existe una única impresora compartida por
todas las personas, y las mismas la deben usar de a una persona a la vez, sin importar
el orden. Existe una función Imprimir(documento) llamada por la persona que simula el
uso de la impresora. Sólo se deben usar los procesos que representan a las Personas.
b) Modifique la solución de (a) para el caso en que se deba respetar el orden de llegada.
c) Modifique la solución de (a) para el caso en que se deba respetar estrictamente el
orden dado por el identificador del proceso (la persona X no puede usar la impresora
hasta que no haya terminado de usarla la persona X-1).
d) Modifique la solución de (b) para el caso en que además hay un proceso Coordinador
que le indica a cada persona que es su turno de usar la impresora.
e) Modificar la solución (d) para el caso en que sean 5 impresoras. El coordinador le
indica a la persona cuando puede usar una impresora, y cual debe usar.

"""