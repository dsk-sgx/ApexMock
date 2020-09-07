public class SomeClass {
    
    public void voidMethod() {
        throw new SomeException('Called original method.');
    }

    public String getString() {
        return 'Not Mocked Value';
    }

    public String getString(String str, Integer num) {
        return 'Not Mocked Overload Value';
    }
}
