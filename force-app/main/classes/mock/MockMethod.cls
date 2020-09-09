/**
 * 
 */
public class MockMethod {

    private String methodName;

    List<MockMethodSpec> specs = new List<MockMethodSpec>();

    public MockMethod(String methodName) {
      this.methodName = methodName;
    }

    public MockMethodSpec whenCalled() {
      MockMethodSpec spec = new MockMethodSpec();
      specs.add(spec);
      return spec;
    }

    public Object getMockedValue(List<Type> argTypes, List<Object> args) {
      MockMethodSpec.Key specKey = new MockMethodSpec.Key(0); // 
      for (MockMethodSpec spec : specs) {
        if (spec.key.equals(specKey)) {
          return spec.getReturnValue();
        }
      }
      throw new MockException('MockMethodSpec is not found');
    }
}
