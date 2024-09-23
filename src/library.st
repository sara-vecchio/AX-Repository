//USING AxUnit;
NAMESPACE MotorClass

    CLASS PUBLIC Motor
        VAR PRIVATE
            _started : BOOL;
            _ended : BOOL;
        END_VAR

        VAR PUBLIC
            isRunning : BOOL;
        END_VAR

        METHOD PUBLIC Start : BOOL
            VAR_INPUT
                _proceed: BOOL;
            END_VAR
            IF _proceed AND NOT isRunning THEN
                _started:= TRUE;
                _ended := NOT _started;
                isRunning := _started;
                Start := _started;
            END_IF;
        END_METHOD

        
        METHOD PUBLIC Stop : BOOL
            VAR_INPUT
            _proceed: BOOL;
            END_VAR
            IF _proceed AND isRunning THEN
                _started:= FALSE;
                _ended := NOT _started;
                isRunning:=_started;
                Stop := _ended;
            END_IF;
        END_METHOD

        
        METHOD PUBLIC Invert : BOOL
            VAR_INPUT
                _proceed: BOOL;
            END_VAR
            IF _proceed THEN                
             isRunning := NOT isRunning;
            END_IF;
            Invert := isRunning; //Invert vale come ouptup bool, devo togliere :BOOL per ottenere una void
        END_METHOD
    END_CLASS
/*
    {TestFixture}
    CLASS MotorBehaviorTests

        VAR PROTECTED
            testInstance : Motor;
        END_VAR

        {Test} //PRAGMAS - etichette nel codice
        METHOD PUBLIC StartBehaviorTest
            VAR_TEMP
                result : BOOL;
            END_VAR

            result := testInstance.Start();

            Assert.Equal(actual := result, expected := FALSE);
        
        END_METHOD
    END_CLASS
    */
END_NAMESPACE
