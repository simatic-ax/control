NAMESPACE Simatic.Ax.Control

    CLASS D_Controller
        EXTENDS ControllerAbstract

        METHOD PUBLIC OVERRIDE Calculate : LREAL
            VAR
                error : LREAL;
            END_VAR
            error := SetpointValue - ActualValue^;
            error_sum := error_sum + error;
            Calculate := Kp * Td / TimeBase.GetTime() * (error - error_pre);
            error_pre := error;
        END_METHOD
    END_CLASS

    CLASS PI_Controller
        EXTENDS ControllerAbstract

        METHOD PUBLIC OVERRIDE Calculate : LREAL
            VAR
                error : LREAL;
            END_VAR
            error := SetpointValue - ActualValue^;
            error_sum := error_sum + error;
            Calculate := Kp * error + Kp * TimeBase.GetTime() / Tn * error_sum;
            error_pre := error;
        END_METHOD
    END_CLASS

    CLASS PIDController
        EXTENDS ControllerAbstract

        METHOD PUBLIC OVERRIDE Calculate : LREAL
            VAR
                error : LREAL;
            END_VAR
            VAR_TEMP
                _timebase : LREAL;
            END_VAR
            _timebase := TimeBase.GetTime();
            error := SetpointValue - ActualValue^;
            error_sum := error_sum + error;
            Calculate := Kp * error + Kp * _timebase / Tn * error_sum + Kp * Td / _timebase * (error - error_pre);
            error_pre := error;
        END_METHOD
    END_CLASS

END_NAMESPACE
