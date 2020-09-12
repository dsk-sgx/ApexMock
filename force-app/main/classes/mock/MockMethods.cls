/**
 * This class is managed by multiple mockmethods.
 * Provides an accessor to one method.
 */
public class MockMethods {

    private Type type;

    private Map<String, MockMethod> mockMethods = new Map<String, MockMethod>();

    public MockMethods(Type type) {
        this.type = type;
    }

    /**
     * Returns a mock method that matches the name.
     * @param methodName
     * @return a instance of MockMethod
     */
    public MockMethod getMethod(String methodName) {
        MockMethod method = mockMethods.get(methodName);
        if (method == null) {
            method = new MockMethod(methodName);
            mockMethods.put(methodName, method);
        }
        return method;
    }
}
