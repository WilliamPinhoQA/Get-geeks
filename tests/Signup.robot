
#   PascalCase
#   snake_case

**Settings**
Documentation           Signup Test Suite
Test Setup              Start Session
Test Teardown           End Session

Resource                ${EXECDIR}/resources/Base.robot

**Test Cases**

Register a new user
    ${user_data}        Factory Fake User

    Go To Signup Form
    Fill Signup Form        ${user_data}
    Submit Signup Form
    Check Signup Sucess
   
