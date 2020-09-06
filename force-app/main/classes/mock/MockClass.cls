public class MockClass {

    private Type type;

    private Map<String, MockMethod> mockMethods = new Map<String, MockMethod>();

    public MockClass(Type type) {
        this.type = type;
    }

    public Object getMockedValue(String methodName, List<Type> paramTypes, List<Object> args) {
        MockMethod method = mockMethods.get(methodName);
        if (method == null) {
            throw new MockException('Return value is not set for ' + methodName);
        }
        return method.getReturnValue();
    }

    public MockMethod whenCalled(String methodName) {
        MockMethod method = new MockMethod(methodName);
        mockMethods.put(methodName, method);
        return method;
    }
}
