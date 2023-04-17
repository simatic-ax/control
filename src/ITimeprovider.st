NAMESPACE Simatic.Ax.Control

    INTERFACE ITimeProvider
        /// Returns the time base in ms
        METHOD GetTime : LREAL
        END_METHOD
    END_INTERFACE

    CLASS TimeProviderFixedTimeBase
        IMPLEMENTS ITimeProvider
        VAR PUBLIC
            TimeBase : LREAL := 10;
        END_VAR

        METHOD PUBLIC GetTime : LREAL
            GetTime := TimeBase;
        END_METHOD
    END_CLASS

END_NAMESPACE
