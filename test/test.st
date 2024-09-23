USING AxUnit;
USING MotorClass;

NAMESPACE MotorTests

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

            result := testInstance.Start(TRUE);

            Assert.Equal(actual := result, expected := TRUE);
        
        END_METHOD
        
        {Test} //PRAGMAS - etichette nel codice
        METHOD PUBLIC StopBehaviorTest
            VAR_TEMP
                result : BOOL;
            END_VAR

            result := testInstance.Stop(TRUE);

            Assert.Equal(actual := result, expected := TRUE);
        
        END_METHOD
        
        {Test} //PRAGMAS - etichette nel codice
        METHOD PUBLIC InvertBehaviorTest
            VAR_TEMP
                result : BOOL;
                org : BOOL;
            END_VAR

            org:=testInstance.isRunning;
            result := testInstance.Invert(TRUE);

            Assert.Equal(actual := result, expected := NOT org);
            result := testInstance.Invert(TRUE);
            Assert.Equal(actual := result, expected := org);
        
        END_METHOD
    END_CLASS

END_NAMESPACE
