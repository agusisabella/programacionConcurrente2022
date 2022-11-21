"""
Un sistema de control cuenta con 4 procesos que realizan chequeos en forma
colaborativa. Para ello, reciben el historial de fallos del día anterior
(por simplicidad, de tamaño N). De cada fallo, se conoce su número de
identificación (ID) y su nivel de gravedad (0=bajo, 1=intermedio, 2=alto,
3=crítico). Resuelva considerando las siguientes
situaciones:
a) Se debe imprimir en pantalla los ID de todos los errores críticos
 (no importa el orden).
b) Se debe calcular la cantidad de fallos por nivel de gravedad,
debiendo quedar los resultados en un vector global.
c) Ídem b) pero cada proceso debe ocuparse de contar los fallos
de un nivel de gravedad determinado.

"""

Program ejercicio1a{
'''tener en cuenta que dice de forma colaborativa,
 tenemos que partir el historial en 4'''
Procedure procesochequeo [ 0..3 ] {
    porcion = N/4
#ejemplo n =18  id= 0 , i = 0 i<( 1*3);
    for( i= id*porcion; i< (id+1)*porcion ;i++){
        if(historial[i].gravedad==3){
            print(historial[i].id)
  }
 }
}

Program ejercicio1b{
'''tener en cuenta que dice de forma colaborativa,
 tenemos que partir el historial en 4'''

sem scontadorhistorial[4] = (1)
vec contadorhistorial[4]=(0)

Procedure procesochequeo [ 0..3 ] {
    porcion = N/4
#ejemplo n =18  id= 0 , i = 0 i<( 1*3);
    for( i= id*porcion; i< (id+1)*porcion ;i++){
        P(shistorial[historial[i].gravedad])
        contadorhistorial[historial[i].gravedad]++;
        V(shistorial[historial[i].gravedad])

  }
 }
} # o esta version que es mejor porque no está constantemente esperando al sem para sumar: 

Procedure procesochequeo [ 0..3 ] {
    porcion = N/4
    vec contador [4]= (0)
    for( i= id*porcion; i< (id+1)*porcion ;i++){
      
        contador[historial[i].gravedad]++
  }
    for( i= 0; i< 4 ;i++){
      P(shistorial[i])
        contadorhistorial[i]= +contador[i] ;
      V(shistorial[i])
  }

 
}
Program ejercicio1c{
#no es necesario ningun semaforo cuando se realiza una lectura
#tampoco si voy a escribir sobre un arreglo en distintas posiciones y no voy a leer

vec contador[4]=(0)

Procedure procesochequeo [ id: 0..3 ] {
     for( i= 0; i< N ;i++){
    
        if(historial[i].gravedad== id){
            contador[id]++;
        }
     }
 }

}