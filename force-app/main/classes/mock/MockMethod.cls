/**
 * 
 */
public class MockMethod {

    private String methodName;

    private MockMethodSpecs specs = new MockMethodSpecs();

    private MockMethodStates states = new MockMethodStates();

    public MockMethod(String methodName) {
      this.methodName = methodName;
    }

    public MockMethodStates getExecutionStates() {
      return states;
    }

    /**
     * Return the instance of MockMethodSpec.
     * This method to execute if specify a method to mock.
     * @return a instance of MockMethodSpec
     */
    public MockMethodSpec whenCalled() {
      MockMethodSpec spec = new MockMethodSpec();
      specs.add(spec);
      return spec;
    }

    /**
     * Return the mocked value.
     * @param argTypes 
     * @param args
     * @return mocked value
     */
    public Object getMockedValue(List<Type> argTypes, List<Object> args) {
      states.store(args);
      MockMethodSpec.Condition condition = new MockMethodSpec.Condition(states.getExecutionCount());
      MockMethodSpec spec = specs.get(condition);
      if (spec == null) {
        throw new MockException('Execution condition is not set. Name:' + methodName + ' ' + condition);
      }
      return spec.getReturnValue();
    }
}
