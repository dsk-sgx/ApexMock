/**
 * 
 */
public class MockMethod {

    private String methodName;

    List<MockMethodSpec> specs = new List<MockMethodSpec>();

    ExecutionState executionState;
    
    public MockMethod(String methodName) {
      this.methodName = methodName;
      this.executionState = new ExecutionState();
    }

    public MockMethodSpec whenCalled() {
      MockMethodSpec spec = new MockMethodSpec();
      specs.add(spec);
      return spec;
    }

    public Object getMockedValue(List<Type> argTypes, List<Object> args) {
      MockMethodSpec.Key specKey = new MockMethodSpec.Key(executionState.getExecutionCount());
      for (MockMethodSpec spec : specs) {
        if (spec.key.equals(specKey)) {
          executionState.execute(args);
          return spec.getReturnValue();
        }
      }
      throw new MockException('MockMethodSpec not found');
    }

    public ExecutionState getexecutionState() {
      return executionState;
    }
}
