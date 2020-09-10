/**
 * This is a class that provides functions for using Mock in Apex.
 * All the functions for using Mock are executed through this class.
 */
public class ApexMock {

    private static Map<Object, MockMethods> mockMethods = new Map<Object, MockMethods>();
    
    private ApexMock() {
    }

    /**
     * Create the instance of mocked class.
     * @param typeToMock
     * @return Mocked object
     */
    @TestVisible
    private static Object create(Type typeToMock) {
        Object stubClass = Test.createStub(typeToMock, stubProviderImpl);
        mockMethods.put(stubClass, new MockMethods(typeToMock));
        return stubClass;
    }

    /**
     * Use to set the behavior when the Mock method is called.
     * @param stubbedClass An Object created by `ApexMock.create`
     * @param stubbedMethod
     * @return Specification of mock method
     */
    @TestVisible
    private static MockMethodSpec whenCalled(Object stubbedClass, String stubbedMethod) {
        return mockMethods.get(stubbedClass).getMethod(stubbedMethod).whenCalled();
    }

    /**
     * Use to verify when the Mock method after called.
     * @param stubbedClass An Object created by `ApexMock.create`
     * @param stubbedMethod
     * @return Verifier of mock method
     */
    @TestVisible
    private static MockMethodVerifier verify(Object stubbedClass, String stubbedMethod) {
        ExecutionStates states = mockMethods.get(stubbedClass).getMethod(stubbedMethod).getExecutionStates();
        return new MockMethodVerifier(states);
    } 

    private static StubProviderImpl stubProviderImpl = new StubProviderImpl();
    private class StubProviderImpl implements StubProvider {
       /**
        * The method called when the method of the mocked class is executed.
        * @param stubbedObject
        * @param stubbedMethodName
        * @param returnType
        * @param paramTypes
        * @param paramNames
        * @param args
        * @return stubbedValue
        */
        public Object handleMethodCall(Object stubbedObject, String stubbedMethodName, 
                Type returnType, List<Type> paramTypes, List<String> paramNames, List<Object> args) {
            return mockMethods.get(stubbedObject)
                    .getMethod(stubbedMethodName)
                    .getMockedValue(paramTypes, args);
        }
    }
}