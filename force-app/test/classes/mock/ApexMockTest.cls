@isTest
private class ApexMockTest {

    @isTest
    static void returnMockedValue() {
        SomeClass mocked = (SomeClass)ApexMock.create(SomeClass.class);
        ApexMock.whenCalled(mocked, 'getString').times(1).thenReturn('Mocked Value');

        System.assertEquals('Mocked Value', mocked.getString('first', 1));
        ApexMock.verify(mocked, 'getString').times(1).calledWith('first', 1);
    }

    @isTest
    static void returnMockedValueMultipleExecutions() {
        SomeClass mocked = (SomeClass)ApexMock.create(SomeClass.class);
        ApexMock.whenCalled(mocked, 'getString').times(1).thenReturn('Mocked Value1');
        ApexMock.whenCalled(mocked, 'getString').times(2).thenReturn('Mocked Value2');

        System.assertEquals('Mocked Value1', mocked.getString('first', 1));
        System.assertEquals('Mocked Value2', mocked.getString('second', 2));
        ApexMock.verify(mocked, 'getString')
                .times(2)
                .nthCalledWith(1, 'first', 1)
                .nthCalledWith(2, 'second', 2);
    }

    @isTest
    static void returnMockedValueMulutipleStubClasses() {
        SomeClass mocked1 = (SomeClass)ApexMock.create(SomeClass.class);
        ApexMock.whenCalled(mocked1, 'getString').thenReturn('Mocked Value1');

        SomeClass mocked2 = (SomeClass)ApexMock.create(SomeClass.class);
        ApexMock.whenCalled(mocked2, 'getString').thenReturn('Mocked Value2');

        System.assertEquals('Mocked Value1', mocked1.getString('first', 1));
        System.assertEquals('Mocked Value2', mocked2.getString('second', 2));
        ApexMock.verify(mocked1, 'getString').times(1).calledWith('first', 1);
        ApexMock.verify(mocked2, 'getString').times(1).calledWith('second', 2);
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
}
