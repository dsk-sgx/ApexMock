/**
 * Class that verifies the execution of the mock method.
 */
public class MockMethodVerifier {

    private final ExecutionStates executionStates;

    private Integer verifyArgsCount = 0;

    /**
     * @param executionStates
     */
    public MockMethodVerifier(ExecutionStates executionStates) {
        this.executionStates = executionStates;
    }

    /**
     * Verify the total execution count of mocked method.
     * @param expect 
     */
    public MockMethodVerifier times(Integer expectCount) {
        System.assertEquals(expectCount, executionStates.getExecutionCount());
        return this;
    }

    /**
     * Verify the arguments when the mock method is executed.
     * @param arg expect arg
     * @throw System.assertException When args doesn't match.
     */
    public MockMethodVerifier with(Object expectArg) {
        return with(new List<Object>{expectArg});
    }
    public MockMethodVerifier with(Object expectArg1, Object arg2) {
        return with(new List<Object>{arg1, arg2});
    }
    public MockMethodVerifier with(Object arg1, Object arg2, Object arg3) {
        return with(new List<Object>{arg1, arg2, arg3});
    }
    public MockMethodVerifier with(Object arg1, Object arg2, Object arg3, Object arg4) {
        return with(new List<Object>{arg1, arg2, arg3, arg4});
    }
    public MockMethodVerifier with(List<Object> expectArgs) {
        List<Object> actual = executionStates.getExecutedArgs(++verifyArgsCount);
        System.assertEquals(expectArgs, actual);
        return this;
    }
}
