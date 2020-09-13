public class SomeClass {
    
    public String stringField;

    public Date dateField;

    public List<Object> listField;

    public Map<String, Object> mapField;

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
