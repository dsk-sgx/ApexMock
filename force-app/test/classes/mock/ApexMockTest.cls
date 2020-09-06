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
        // ApexMock.verify(mocked).called('getString').times(1).with(new List<Object>{'1', 2});
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
}
