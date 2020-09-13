@isTest
public  class MockMethodVerifierTest {

    @isTest
    static void timesMatchedCalled1th() {
        MockMethodStates states = new MockMethodStates();
        states.executionCount = 1;

        MockMethodVerifier verifier = new MockMethodVerifier(states);
        verifier.times(1);
    }

    @isTest
    static void timesMatchedCalled3th() {
        MockMethodStates states = new MockMethodStates();
        states.executionCount = 3;

        MockMethodVerifier verifier = new MockMethodVerifier(states);
        verifier.times(3);
    }

    @isTest
    static void timesMatchedNotCalled() {
        MockMethodStates states = new MockMethodStates();
        states.executionCount = 0;

        MockMethodVerifier verifier = new MockMethodVerifier(states);
        verifier.times(0);
    }

    @isTest
    static void timesNotMatchedCalledLess() {
        MockMethodStates states = new MockMethodStates();
        states.executionCount = 1;

        MockMethodVerifier verifier = new MockMethodVerifier(states);
        try {
            verifier.times(0);
            System.assert(false, 'Exception was not thrown.');
        } catch (Exception e) {
            System.assert(e.getMessage().startsWith('Called count does not matched'));
        }
    }

    @isTest
    static void timesNotMatchedCalledOver() {
        MockMethodStates states = new MockMethodStates();
        states.executionCount = 1;

        MockMethodVerifier verifier = new MockMethodVerifier(states);
        try {
            verifier.times(2);
            System.assert(false, 'Exception was not thrown.');
        } catch (Exception e) {
            System.assert(e.getMessage().startsWith('Called count does not matched'));
        }
    }

    @isTest
    static void timesNotMatchedNotCalled() {
        MockMethodStates states = new MockMethodStates();
        states.executionCount = 0;

        MockMethodVerifier verifier = new MockMethodVerifier(states);
        try {
            verifier.times(1);
            System.assert(false, 'Exception was not thrown.');
        } catch (Exception e) {
            System.assert(e.getMessage().startsWith('Called count does not matched'));
        }
    }
}
