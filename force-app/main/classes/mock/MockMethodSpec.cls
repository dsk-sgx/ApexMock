/**
 * This class defines the method execution conditions and return values.
 */
public with sharing class MockMethodSpec {

    public class Key {
      private Integer times;

      public Key() {
      }

      public Key(Integer times) {
        this.times = times;
      }

      public Boolean equals(Object compare) {
        if (compare == null) {
          return false;
        }
        if (! (compare instanceOf Key)) {
          return false;
        }

        if (this.times == null || ((Key)compare).times == null) {
          return true;
        }

        return this.times == ((Key)compare).times;
      }
    }

    public final Key key = new Key();

    private Object returnValue;

    private Exception throwException;

    public MockMethodSpec times(Integer times) {
      this.key.times = times;
      return this;
    }

    /**
     * Set the return value when the mocked method is executed.
     * @param returnValue
     */
    public void thenReturn(Object returnValue) {
      this.returnValue = returnValue;
    }

    /**
     * Set the thrown exception when the mocked method is executed.
     * @param e thrown exception
     */
    public void thenThrow(Exception e) {
      this.throwException = e;
    }

    public Object getReturnValue() {
      if (throwException != null) {
        throw throwException;
      }
      return returnValue;
    }

    public void doNothing() {
    }
}
