/**
 * This class makes the method name unique and manages how the method was executed.
 */
public with sharing class MockMethodStates {

    private Type type;

    private String methodName; // Does not supported overload.

    @TestVisible
    private Integer executionCount = 0;

    @TestVisible
    private Map<Integer, List<Object>> states = new Map<Integer, List<Object>>();

    /**
     * Store args and execution count.
     * @param args
     */
    public void store(List<Object> args) {
        this.executionCount++;
        this.states.put(executionCount, args);
    }

    /**
     * Get the total number of method executions.
     * @return execution count
     */
    public Integer getExecutionCount() {
        return executionCount;
    }

    /**
     * Get the total number of method executions for each argument type.
     * @return execution count
     */
    // TODO Implement it when it becomes necessary.
    // public Integer getExecutionCount(List<Type> argTypes) {
    //     return 0;
    // }

    /**
     * Return arguments subject to execution count.
     * @param executionCount
     * @return arguments
     */
    public List<Object> getExecutedArgs(Integer executionCount) {
        if (!states.containsKey(executionCount)) {
            throw new MockException('Invalid executionCount:' + executionCount);
        }
        return states.get(executionCount);
    }

    /**
     * Return the all argments executed.
     * @return arguments
     */
    public List<List<Object>> getAllExecutedArgs() {
        return states.values();
    }
}
