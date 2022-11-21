PROGRAM ejercicio4
MIN=60
TASK Medico is
ENTRY SolicitudAtencion(OUT resultados text)
ENTRY SolicitudEnfermera(IN solicitud text)
END Medico 


TASK type Enfermera is 


TASK type Persona is

TASK type Escritorio


TASK body Medico 
nota text =''
solic text =''
BEGIN
LOOP
    SELECT 
        Accept SolicitudAtencion(OUT resultados) is
                resultados= AtenderPaciente() #asumo que existe esa funcion 
        End SolicitudAtencion

    OR When SolicitudAtencion´count() ==0; Accept SolicitudEnfermera(IN solicitud)is 
                solic =solicitud
            End SolicitudEnfermera
            AtenderSolicitud(solic) #asumo que existe esta funcion
                
    
    ELSE 
        Escritorio.GetNotas(notas)
            if nota != 'null'then
                for nota in notas do
                    ProcesarNota(nota)  #asumo que existe esta funcion
                end for
            end if

    End  Select

End LOOP

END


TASK Body Enfermera 

BEGIN
loop
    solicitud =GenerarSolicitud()
    SELECT
        Medico.SolicitudEnfermera(solicitud)
    else 
        nota = generarNota(solicitud) # está bien poner estoa acá??
        Escritorio.DejarNota(nota)
    End SELECT
end loop



TASK Body Persona
BEGIN
seguir = true
cant=1
resultados text =''
while seguir loop
    
    select 
        Medico.SolicitarAtencion(resultados)
        seguir =false
    or delay 5*MIN
    else
        if (cant ==3 ) then 
            seguir=false
        else  
            delay 10
            cant++;
    end select

End 



TASK Body Escritorio
BEGIN
loop 
    
    SELECT Accept DejarNota(in text nota)do
            push(notas,nota)
            End DejarNota
    OR Accept GetNotas(out misnotas)do 
        if(notas is empty)then
            misnotas='null'
        else 
             misnotas=notas
        END GetNotas
        notas =[]
    END SELECT

end loop



        



