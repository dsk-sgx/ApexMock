public class MockMethod {

    private String methodName;

    private List<Object> args;

    private Object returnValue;

    private Exception e;

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

    public void thenThrow(Exception e) {
      this.e = e;  
    }

    public Object getReturnValue() {
      if (e != null) {
        throw e;
      }
      return this.returnValue;
    }

    public void doNothing() {
    }
}
