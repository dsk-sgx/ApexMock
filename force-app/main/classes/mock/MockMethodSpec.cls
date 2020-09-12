/**
 * This class defines the method execution conditions and return values.
 */
public with sharing class MockMethodSpec {

    /**
     * The condition of the return value of the mock method.
     */
    public class Condition {
      private Integer times;

      public Condition() {
      }

      public Condition(Integer times) {
        this.times = times;
      }

      public Boolean equals(Object obj) {
        if (obj == null || !(obj instanceOf Condition)) {
          return false;
        }

        Condition compare = (Condition)obj;
        // If times is null, the condition is considered unspecified.
        if (this.times == null || compare.times == null) {
          return true;
        }

        return this.times == compare.times;
      }
    }

    private final Condition condition = new Condition();

    private Object returnValue;

    private Boolean isSetReturnValue = false;

    private Exception throwException;

    /**
     * Determine how many times the specification is executed.
     * @param times
     */
    public MockMethodSpec times(Integer times) {
      this.condition.times = times;
      return this;
    }

    /**
     * Set the return value when the mocked method is executed.
     * @param returnValue
     */
    public void thenReturn(Object returnValue) {
      this.returnValue = returnValue;
      this.isSetReturnValue = true;
    }

    /**
     * Set the thrown exception when the mocked method is executed.
     * @param e thrown exception
     */
    public void thenThrow(Exception e) {
      this.throwException = e;
    }

    /**
     * Returns the set return value.
     * @throw Exception When an exception is set to throw.
     * @throw MockExcpetion When return value is not set.
     */
    public Object getReturnValue() {
      if (throwException != null) {
        throw throwException;
      }
      if (!isSetReturnValue) {
        throw new MockException('Return value is not set.');
      }
      return returnValue;
    }

    /**
     * Define no return value.
     */
    public void doNothing() {
      isSetReturnValue = true;
    }

    /**
     * Return the clone of condition.
     * @return conditon.
     */
    public Condition getCondition() {
      return new Condition(condition.times);
    }
}
