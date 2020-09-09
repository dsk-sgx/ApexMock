public class MockMethod {

    private String methodName;

    List<MockMethodSpec> specs = new List<MockMethodSpec>();

    private Integer calledCount = 0; //TODO change to CallState class

    List<Object> callState = new List<Object>();

    public MockMethod(String methodName) {
      this.methodName = methodName;
    }

    public MockMethodSpec whenCalled() {
      MockMethodSpec spec = new MockMethodSpec();
      specs.add(spec);
      return spec;
    }

    public Object getReturnValue(List<Type> argTypes, List<Object> args) {
      calledCount++; //  change to CallState class
      
      MockMethodSpec.Key specKey = new MockMethodSpec.Key(calledCount);

      for (MockMethodSpec spec : specs) {
        if (spec.key.equals(specKey)) {
          return spec.getReturnValue();
        }
      }
      
      throw new MockException('MockMethodSpec not found');
    }
}
