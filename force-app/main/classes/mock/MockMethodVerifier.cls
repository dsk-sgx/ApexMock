/**
 * Class that verifies the execution of the mock method.
 */
public class MockMethodVerifier {

    private final MockMethodStates MockMethodStates;

    private Integer verifyArgsCount = 0;

    /**
     * @param MockMethodStates
     */
    public MockMethodVerifier(MockMethodStates MockMethodStates) {
        this.MockMethodStates = MockMethodStates;
    }

    /**
     * Verify the total execution count of mocked method.
     * @param expect 
     */
    public MockMethodVerifier times(Integer expectCount) {
        System.assertEquals(expectCount, MockMethodStates.getExecutionCount());
        return this;
    }

    /**
     * Verify the arguments when the mock method is executed.
     * @param arg expect argument
     * @throw System.assertException When args doesn't match.
     */
    public MockMethodVerifier calledWith(Object arg) {
        return calledWith(new List<Object>{arg});
    }
    public MockMethodVerifier calledWith(Object arg1, Object arg2) {
        return calledWith(new List<Object>{arg1, arg2});
    }
    public MockMethodVerifier calledWith(Object arg1, Object arg2, Object arg3) {
        return calledWith(new List<Object>{arg1, arg2, arg3});
    }
    public MockMethodVerifier calledWith(Object arg1, Object arg2, Object arg3, Object arg4) {
        return calledWith(new List<Object>{arg1, arg2, arg3, arg4});
    }
    public MockMethodVerifier calledWith(List<Object> expectArgs) {
        List<Object> actual = MockMethodStates.getExecutedArgs(++verifyArgsCount);
        System.assertEquals(expectArgs, actual);
        return this;
    }
}
