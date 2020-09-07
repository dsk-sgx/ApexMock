/**
 * This is a class that provides functions for using Mock in Apex.
 * All the functions for using Mock are executed through this class.
 */
public class ApexMock {

    private static Map<Object, MockClass> mockClasses = new Map<Object, MockClass>();
    
    private ApexMock() {
    }

    /**
     * 
     * @param 
     * @return Mocked object
     */
    @TestVisible
    private static Object create(Type typeToMock) {
        Object stubClass = Test.createStub(typeToMock, stubProviderImpl);
        mockClasses.put(stubClass, new MockClass(typeToMock));
        return stubClass;
    }

    /**
     * Used to set the behavior when the Mock method is called.
     * @param stubbedClass an Object created by `ApexMock.create`
     * @param methodName 
     */
    @TestVisible
    private static MockMethod whenCalled(Object stubbedClass, String methodName) {
        return mockClasses.get(stubbedClass).whenCalled(methodName);
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
            
            Object result = mockClasses.get(stubbedObject).getMockedValue(stubbedMethodName, paramTypes, args);
            if (result instanceof Exception && !returnType.equals(Exception.class)) {
                throw (Exception)result;
            }
            return result;
        }
    }
}