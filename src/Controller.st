NAMESPACE Simatic.Ax.Control
    CLASS D_Controller IMPLEMENTS IController
        VAR PUBLIC
            Kp : LREAL;
            Tn : LREAL;
            Td : LREAL;
            CycleTime : LREAL;
            SetpointValue : LREAL;
            ActualValue : LREAL;
        END_VAR
        METHOD PUBLIC Calculate : LREAL
            VAR
                error : LREAL;
                error_sum : LREAL;
                error_pre : LREAL;
            END_VAR
            error := SetpointValue - ActualValue;
            error_sum := error_sum + error;
            Calculate := Kp * Td / CycleTime * (error - error_pre);
            error_pre := error;
        END_METHOD
    END_CLASS
        
    CLASS PI_Controller IMPLEMENTS IController
        VAR PUBLIC
            Kp : LREAL;
            Tn : LREAL;
            Td : LREAL;
            CycleTime : LREAL;
            SetpointValue : LREAL;
            ActualValue : LREAL;
        END_VAR
        METHOD PUBLIC Calculate : LREAL
            VAR
                error : LREAL;
                error_sum : LREAL;
                error_pre : LREAL;
            END_VAR
            error := SetpointValue - ActualValue;
            error_sum := error_sum + error;
            Calculate := Kp * error + Kp * CycleTime / Tn * error_sum;
            error_pre := error;
        END_METHOD
    END_CLASS
        
    CLASS PIDController IMPLEMENTS IController 
        VAR PUBLIC
            Kp : LREAL;
            Tn : LREAL;
            Td : LREAL;
            CycleTime : LREAL;
            SetpointValue : LREAL;
            ActualValue : LREAL;
        END_VAR
        METHOD PUBLIC Calculate : LREAL
            VAR
                error : LREAL;
                error_sum : LREAL;
                error_pre : LREAL;
            END_VAR
            error := SetpointValue - ActualValue;
            error_sum := error_sum + error;
            Calculate := Kp * error + Kp * CycleTime / Tn * error_sum + Kp * Td / CycleTime * (error - error_pre);
            error_pre := error;
        END_METHOD
    END_CLASS    
END_NAMESPACE