public class MockMethod {

    private String methodName;

    private List<Object> args;

    private Object returnValue;

    public MockMethod(String methodName) {
      this.methodName = methodName;
    }

   /**
    * Set the return value when the mocked method is executed.
    * @param returnValue
    */
    public void thenReturn(Object returnValue) {
      this.returnValue = returnValue;
    }

    public Object getReturnValue() {
      return this.returnValue;
    }
}
