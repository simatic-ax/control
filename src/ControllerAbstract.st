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
            error_pre : LREAL;
            error_sum : LREAL;
        END_VAR
        METHOD PUBLIC ABSTRACT Calculate : LREAL
        END_METHOD
    END_CLASS

END_NAMESPACE
