public with sharing class MockMethodSpecs {

    private List<MockMethodSpec> specs = new List<MockMethodSpec>();

    /**
     * Add the specification of method.
     * @param spec
     */
    public void add(MockMethodSpec spec) {
        specs.add(spec);
    }

    /**
     * Return the specification of the method that match a condition.
     * @param condition
     * @return a specification of method
     *         if condition doesn't match return null.
     */
    public MockMethodSpec get(MockMethodSpec.Condition condition) {
        for (MockMethodSpec spec : specs) {
            if (spec.getCondition().equals(condition)) {
               return spec;
            }
        }
        return null;
      }
}
