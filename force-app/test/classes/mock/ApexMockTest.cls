@isTest
private class ApexMockTest {

    @isTest
    static void returnMockedStringValue() {
        SomeClass mocked = (SomeClass)ApexMock.create(SomeClass.class);
        ApexMock.whenCalled(mocked, 'getString').thenReturn('Mocked Value');

        System.assertEquals('Mocked Value', mocked.getString());
        // ApexMock.verify(mocked, 'getString').times(1); 
    }

    @isTest
    static void returnMockedStringValueWithArgs() {
        SomeClass mocked = (SomeClass)ApexMock.create(SomeClass.class);
        ApexMock.whenCalled(mocked, 'getString').thenReturn('Mocked Value');

        System.assertEquals('Mocked Value', mocked.getString('1', 2));
        // ApexMock.verify(mocked, 'getString').times(1).with('1', 2);
    }

    @isTest
    static void returnMockedValueMulutipleStubClasses() {
        SomeClass mocked1 = (SomeClass)ApexMock.create(SomeClass.class);
        ApexMock.whenCalled(mocked1, 'getString').thenReturn('Mocked Value1');

        SomeClass mocked2 = (SomeClass)ApexMock.create(SomeClass.class);
        ApexMock.whenCalled(mocked2, 'getString').thenReturn('Mocked Value2');

        System.assertEquals('Mocked Value1', mocked1.getString());
        System.assertEquals('Mocked Value2', mocked2.getString());
    }

    @isTest
    static void returnMockedValueWithExecutionCount() {
        SomeClass mocked = (SomeClass)ApexMock.create(SomeClass.class);
        ApexMock.whenCalled(mocked, 'getString').times(1).thenReturn('Mocked Value1');
        ApexMock.whenCalled(mocked, 'getString').times(2).thenReturn('Mocked Value2');

        System.assertEquals('Mocked Value1', mocked.getString());
        System.assertEquals('Mocked Value2', mocked.getString());
    }

    @isTest
    static void callCountExceedsConditionCount() {
        SomeClass mocked = (SomeClass)ApexMock.create(SomeClass.class);
        ApexMock.whenCalled(mocked, 'getString').times(1).thenReturn('Mocked Value1');
        ApexMock.whenCalled(mocked, 'getString').times(2).thenReturn('Mocked Value2');

        System.assertEquals('Mocked Value1', mocked.getString());
        System.assertEquals('Mocked Value2', mocked.getString());
        try {
             mocked.getString();
             System.assert(false);
        } catch (MockException e) {
            System.assert(e.getMessage().startsWith('Execution condition is not set'));
        }
    }

    @isTest   
    static void doNothingTest() {
        SomeClass mocked = (SomeClass)ApexMock.create(SomeClass.class);
        ApexMock.whenCalled(mocked, 'voidMethod').doNothing();

        mocked.voidMethod();
    }

    @isTest
    static void throwExceptionTest() {
        SomeClass mocked = (SomeClass)ApexMock.create(SomeClass.class);
        ApexMock.whenCalled(mocked, 'getString').thenThrow(new SomeException('Mocked exception'));

        try {
            mocked.getString();
            System.assert(false, 'No exception was thrown.');
        } catch (SomeException e) {
            System.assertEquals('Mocked exception', e.getMessage());
        }
    }

    @isTest
    static void throwExceptionWhenNotSetReturnValue() {
        SomeClass mocked = (SomeClass)ApexMock.create(SomeClass.class);
        ApexMock.whenCalled(mocked, 'getString');

        try {
            mocked.getString();
            System.assert(false, 'No exception was thrown.');
        } catch (MockException e) {
            System.assertEquals('Return value is not set.', e.getMessage());
        }
    }
}
