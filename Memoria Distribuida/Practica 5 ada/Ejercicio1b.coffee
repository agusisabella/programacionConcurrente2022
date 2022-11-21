""". Se requiere modelar un puente de un único sentido que soporta hasta 5 unidades de peso.
El peso de los vehículos depende del tipo: cada auto pesa 1 unidad, cada camioneta pesa 2
unidades y cada camión 3 unidades. Suponga que hay una cantidad innumerable de
vehículos (A autos, B camionetas y C camiones). Analice el problema y defina qué tareas,
recursos y sincronizaciones serán necesarios/convenientes para resolver el problema.
a. Realice la solución suponiendo que todos los vehículos tienen la misma prioridad.
b. Modifique la solución para que tengan mayor prioridad los camiones que el resto de los
vehículos."""



Program ejercicio1a

TASK PUENTE IS
ENTRY ECAMION()
ENTRY EAUTO()
ENTRY ECAMIONETA()
END PUENTE


TASK TYPE VEHICULO

Vehiculos = array[1..N] of VEHICULO


TASK BODY VEHICULO IS  # SERIA MEJOR HACER UN  TASK POR TIPO DE VEHICULO?
    TipoVehiculo(tipo)
    case TipoVehiculo IS
        When "auto" => Puente.EAUTO(); cant =1;
        When "camioneta"=> Puente.ECAMIONETA();cant =2
        When "Camion" => Puente.ECAMION(); cant=3
    end case; 

    // cruzar el puente 

    Puente.Salir(cant)

END VEHICULO


TASK BODY PUENTE IS
cantidad int = 0
BEGIN
    LOOP 
        SELECT 
            ACCEPT SALIR (IN iNT cant ) do
                cantidad=cantidad-cant;
        OR 
            WHEN (ECAMION´count()== 0 and CANT +1 < MAX_PUENTE) => ACCEPT EAUTO()do
                cantidad++;
        OR 
            WHEN (ECAMION´count()== 0 and CANT +2 <MAX_PUENTE) =>  ACCEPT ECAMIONETA() do
                cantidad++;

        OR 
            WHEN (CANT +3 <MAX_PUENTE)=>  ACCEPT ECAMION()do
             cantidad++;
        
        END SELECT
    
    END LOOP
END 
