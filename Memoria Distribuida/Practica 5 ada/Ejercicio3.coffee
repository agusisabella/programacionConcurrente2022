PROGRAM central

TASK Proceso1
TASK Proceso2
TASK Central is
    ENTRY senal1(IN signal)
    ENTRY senal2(IN signal)
    ENTRY parar
END Central
TASK Timer is 
    ENTRY comenzar()
END Timer

TASK BODY Central

BEGIN 

ACCEPT senal1(IN signal)
while true
    SELECT 
        ACCEPT senal1 (IN signal)

    OR 
        ACCEPT senal2(IN signal);
        Timer.comenzar()
        ok= true
        WHILE (ok) loop 
            Select 
                ACCEPT parar(); 
                ok = false;
            OR when (parar´count()== 0 ) => 
                ACCEPT senal2(IN signal)
            END Select
        END WHILE

    END SELECT
END WHILE



TASK BODY Proceso1
BEGIN
While true  
    senal = generarSenal()
    Select 
        Central.Proceso1(senal)
    or delay 120

END

TASK BODY Proceso2
BEGIN
senal = generarSenal()
While true  
  
    Select 
        Central.Proceso1(senal)
        senal = generarSenal()
    or delay 60

END

TASK BODY TIMER
BEGIN
senal = generarSenal()
While (true)  
  
    Accept comenzar()
    
    delay(60)
    Central.Parar()

END



 