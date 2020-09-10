/**
 * 
 */
public class MockMethod {

    private String methodName;

    private List<MockMethodSpec> specs = new List<MockMethodSpec>();

    private MockMethodStates states = new MockMethodStates();

    public MockMethod(String methodName) {
      this.methodName = methodName;
    }

    public MockMethodStates getExecutionStates() {
      return states;
    }

    public MockMethodSpec whenCalled() {
      MockMethodSpec spec = new MockMethodSpec();
      specs.add(spec);
      return spec;
    }

    public Object getMockedValue(List<Type> argTypes, List<Object> args) {
      states.store(args);

      MockMethodSpec.Condition condition = new MockMethodSpec.Condition(states.getExecutionCount());
      for (MockMethodSpec spec : specs) {
        if (spec.condition.equals(condition)) {
          return spec.getReturnValue();
        }
      }
      throw new MockException('Execution condition is not set. Name:' + methodName + ' ' + condition);
    }
}
