/**
 * Class that verifies the execution of the mock method.
 */
public class MockMethodVerifier {

    private final MockMethodStates mockMethodStates;

    /**
     * @param MockMethodStates
     */
    public MockMethodVerifier(MockMethodStates mockMethodStates) {
        this.MockMethodStates = mockMethodStates;
    }

    /**
     * Verify the total execution count of mocked method.
     * @param expect 
     */
    public MockMethodVerifier times(Integer expectCount) {
        System.assertEquals(expectCount, mockMethodStates.getExecutionCount());
        return this;
    }

    /**
     * Verify the arguments when the mock method is executed.
     * If the method is executed multiple times, this method verifies that it matches one of them.
     * 
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
        List<List<Object>> actual = mockMethodStates.getAllExecutedArgs();
        System.assert(actual.contains(expectArgs));
        return this;
    }

    /**
     * Validate the arguments for the mock method execution by specifying the number of times to execute it.
     * @param calledCount number of executions
     * @param arg expect argument
     * @throw System.assertException When args doesn't match.
     */
    public MockMethodVerifier nthCalledWith(Integer calledCount, Object arg) {
        return nthCalledWith(calledCount, new List<Object>{arg});
    }
    public MockMethodVerifier nthCalledWith(Integer calledCount, Object arg1, Object arg2) {
        return nthCalledWith(calledCount, new List<Object>{arg1, arg2});
    }
    public MockMethodVerifier nthCalledWith(Integer calledCount, Object arg1, Object arg2, Object arg3) {
        return nthCalledWith(calledCount, new List<Object>{arg1, arg2, arg3});
    }
    public MockMethodVerifier nthCalledWith(Integer calledCount, Object arg1, Object arg2, Object arg3, Object arg4) {
        return nthCalledWith(calledCount, new List<Object>{arg1, arg2, arg3, arg4});
    }
    public MockMethodVerifier nthCalledWith(Integer calledCount, List<Object> expectArgs) {
        List<Object> actual = mockMethodStates.getExecutedArgs(calledCount);
        System.assertEquals(expectArgs, actual);
        return this;
    }
}
