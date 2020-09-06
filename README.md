# ApexMock
Mock library for Apex unit test.

## Deployment
`sfdx force:source:push -u [alias for scratch org]`

## How to use
see the [test class](force-app/test/classes/mock/ApexMockTest.cls).

## Roadmap
1. Implement the function to verify whether the mocked method was executed correctly.
1. Implement the function to control the result by the argument of mock method.
1. Implement the ability to execute the original method if it is not mocked.
