//USING MotorClass;
USING Siemens.Simatic.S71500.Clocks;

NAMESPACE MotorLibrary

    FUNCTION_BLOCK MotorWrapper
        VAR_INPUT
            abilita : BOOL;
        END_VAR
        VAR_OUTPUT
            risultato : BOOL;
        END_VAR
        VAR
            m : MotorClass.Motor;
        END_VAR

            risultato := m.Invert(_proceed:=abilita);

    END_FUNCTION_BLOCK

   /* FUNCTION_BLOCK FunzioneCounter
        VAR_INPUT
            a : INT;
            b : INT;
            aumenta : BOOL;
            diminuisci : BOOL;
            resetta : BOOL;
        END_VAR
        VAR
            s : INT;
            myCounter : Counter;
        END_VAR
        VAR_OUTPUT
            outadd : INT;
            outcount : LINT;
            resCount : LINT;
        END_VAR
        myCounter(up := aumenta, down := diminuisci, reset:= resetta, value => outcount);
        outadd := a + b;
    END_FUNCTION_BLOCK
    */

    FUNCTION_BLOCK FunzioneClock
        VAR
            measurement : RuntimeMeasurement;
            inSeconds : LREAL;
            started : BOOL;
        END_VAR
        VAR_INPUT
            a : INT;
            b : INT;
            aumenta : BOOL;
            diminuisci : BOOL;
        END_VAR
        VAR_OUTPUT
            outadd : INT;
        END_VAR 
        IF aumenta AND NOT started THEN 
            measurement.Start();      
            
            started:= TRUE;  
        ELSIF aumenta THEN
            inSeconds:=measurement.GetElapsedSeconds();
        ELSE
            measurement.Stop();
            started:=FALSE;
        END_IF;
        IF inSeconds>5 AND inSeconds<30 THEN
            outadd := a + outadd;
        ELSIF inSeconds>30 THEN
            measurement.Stop();
            started:=FALSE;
        END_IF;
    END_FUNCTION_BLOCK

END_NAMESPACE
