"""2. Se quiere modelar el funcionamiento de un banco, al cual llegan clientes que deben realizar
un pago y retirar un comprobante. Existe un único empleado en el banco, el cual atiende de
acuerdo con el orden de llegada. Los clientes llegan y si esperan más de 10 minutos se
retiran sin realizar el pago.
"""

PROGRAM banco

CANT_CLI = 524524

TASK TYPE CLIENTE

TASK EMPLEADO IS
ENTRY solicitud(IN int ; OUT comprobante)

Clientes = array [0.. CANT_CLI] of CLIENTE

TASK BODY EMPLEADO IS
BEGIN
LOOP
    ACCEPT solicitud(IN int dinero, out text comprobante)do
        #deposita el dinero
        comprobante = GenerarComprobante(dinero)
    END solicitud
END LOOP
END


TASK BODY CLIENTE IS
int comprobante
BEGIN
    SELECT
        EMPLEADO.solicitud(dinero , comprobante)
    OR DELAY (600.0)do
        NULL
    END SELECT

END





