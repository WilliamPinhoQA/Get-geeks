
#   PascalCase
#   snake_case

**Settings**
Documentation           Signup Test Suite
Test Setup              Start Session
Test Teardown           End Session

Resource                ${EXECDIR}/resources/Base.robot
Resource                ${EXECDIR}/resources/Helpers.robot

**Test Cases**

Register a new user
    ${user_data}        Factory Fake User

    Go To Signup Form
    Fill Signup Form        ${user_data}
    Submit Signup Form
    Check Signup Sucess

Duplicate user
    [Tags]                 attempt_signup
    ${user_data}                                  Factory Fake User
    ${expected_title}           Set Variable      Oops...
    ${expected_text}            Set Variable      Já temos um usuário com o e-mail informado.

    Add User From Database                        ${user_data} 
    Go To Signup Form

    Fill Signup Form                              ${user_data}
    Submit Signup Form

    Modal Content Should Be                       ${expected_title}   ${expected_text}    

Wrong E-mail
    [Tags]                 attempt_signup
    ${user_data}                            Factory Wrong Email
    ${expected_message}    Set Variable     O email está estranho
    ${field}               Set Variable     email   

    
    Go To Signup Form

    Fill Signup Form                      ${user_data}
    Submit Signup Form

    Field Notification in Signup Page       ${expected_message}   ${field}


Mandatory Fields
    [Tags]                 attempt_signup
    ${user_data}                            Factory Wrong Email
    ${expected_message}    Set Variable     Cadê o seu nome?    E o sobrenome?
    ...           O email é importante também!    Agora só falta a senha!
    ${field}               Set Variable     name    lastname    email   password   

    
    Go To Signup Form

    Submit Signup Form

    Field Notifications in Signup Page       ${expected_message}   ${field}

