NAMESPACE Simatic.Ax.Control

    CLASS D_Controller EXTENDS ControllerAbstract

        METHOD PROTECTED OVERRIDE _calculate : LREAL
            VAR
                error : LREAL;
            END_VAR
            IF (TimeBase = NULL) THEN 
                RETURN;
            END_IF;
            error := SetpointValue - ActualValue^;
            _errorSum := _errorSum + error;
            _calculate := Kp * Td / TimeBase.GetTime() * (error - _errorPre);
            _errorPre := error;
        END_METHOD
    END_CLASS

    CLASS PI_Controller EXTENDS ControllerAbstract

        METHOD PROTECTED OVERRIDE _calculate : LREAL
            VAR
                error : LREAL;
            END_VAR
            IF (TimeBase = NULL) THEN 
                RETURN;
            END_IF;
            error := SetpointValue - ActualValue^;
            _errorSum := _errorSum + error;
            _calculate := Kp * error + Kp * TimeBase.GetTime() / Tn * _errorSum;
            _errorPre := error;
        END_METHOD
    END_CLASS

    CLASS PIDController EXTENDS ControllerAbstract

        METHOD PROTECTED OVERRIDE _calculate : LREAL
            VAR
                error : LREAL;
            END_VAR
            VAR_TEMP
                _timebase : LREAL;
            END_VAR
            IF (TimeBase = NULL) THEN 
                RETURN;
            END_IF;
            _timebase := TimeBase.GetTime();
            error := SetpointValue - ActualValue^;
            _errorSum := _errorSum + error;
            _calculate := Kp * error + Kp * _timebase / Tn * _errorSum + Kp * Td / _timebase * (error - _errorPre);
            _errorPre := error;
        END_METHOD

    END_CLASS

END_NAMESPACE
