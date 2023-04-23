USING AxUnit.Assert;

NAMESPACE Simatic.Ax.Control
    {TestFixture}
    CLASS TestTimeBase
        VAR
            tb : TimeProviderFixedTimeBase;
            tb99 : TimeProviderFixedTimeBase := (TimeBase := 99);
        END_VAR
        {Test}
        METHOD PUBLIC NonConfiguredTimebaserReturnsDefaultValue10ms
            Equal(expected := 10, actual := tb.GetTime());
        END_METHOD
        {Test}
        METHOD PUBLIC ConfigureTimebaserWith99Returns99
            Equal(expected := 99, actual := tb99.GetTime());
        END_METHOD
    END_CLASS
END_NAMESPACE