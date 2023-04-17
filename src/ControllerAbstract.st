NAMESPACE Simatic.Ax.Control

    CLASS ABSTRACT ControllerAbstract
        IMPLEMENTS IController
        VAR PUBLIC
            Kp : LREAL;
            Tn : LREAL;
            Td : LREAL;
            TimeBase : ITimeProvider;
            SetpointValue : LREAL;
            ActualValue : REF_TO LREAL;
        END_VAR
        VAR PROTECTED
            _errorPre : LREAL;
            _errorSum : LREAL;
            _statusError : BOOL;
        END_VAR

        /// method which has to be called cyclically 
        METHOD PUBLIC Calculate : LREAL
            _statusError := NOT (THIS.Check());
            IF (_statusError) THEN
                RETURN;
            ELSE
                Calculate := THIS._calculate();
            END_IF;
        END_METHOD

        /// Abstract method: must be implemented in the concrete controller type
        METHOD PROTECTED ABSTRACT _calculate : LREAL
        END_METHOD

        METHOD PROTECTED Check : BOOL
            Check := (TimeBase <> NULL) AND (ActualValue <> NULL);
        END_METHOD
    END_CLASS

END_NAMESPACE
