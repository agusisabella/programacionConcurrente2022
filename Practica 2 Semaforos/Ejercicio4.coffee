"""
Suponga que existe una BD que puede ser accedida por 6 usuarios como máximo al
mismo tiempo. Además, los usuarios se clasifican como usuarios de prioridad alta y
usuarios de prioridad baja. Por último, la BD tiene la siguiente restricción:
• no puede haber más de 4 usuarios con prioridad alta al mismo tiempo usando la BD.
• no puede haber más de 5 usuarios con prioridad baja al mismo tiempo usando la BD.
Indique si la solución presentada es la más adecuada. Justifique la respuesta. 

"""

Var
sem: semaphoro = 6;
alta: semaphoro = 4;
baja: semaphoro = 5;

Process Usuario-Alta [I:1..L]::
 { P (sem);
 P (alta);
 //usa la BD
 V(sem);
 V(alta);
 }


Process Usuario-Baja [I:1..K]::
 { P (sem);
 P (baja);
//usa la BD
 V(sem);
 V(baja);
 }


"""no es correcto, porque se podría producir un cuello de botella en
 el P(baja) o p(alta), dejando a la bd sin poder alcanzar su maximo rendimiento
ya  que  no liberan el semaforo para que otro proceso pueda intentar entrar
"""


Var
sem: semaphoro = 6;
alta: semaphoro = 4;
baja: semaphoro = 5;

Process Usuario-Alta [I:1..L]::
 { 
    P (alta);
    P (sem);
    //usa la BD
    V(sem);
    V(alta);
 }


Process Usuario-Baja [I:1..K]::{
    P (baja);
    P (sem);

    //usa la BD
    V(sem);
    V(baja);
 }
