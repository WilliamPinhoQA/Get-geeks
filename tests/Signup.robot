
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
    ${expected_alert}      Set Variable     O email está estranho
    ${field}               Set Variable     email   

    
    Go To Signup Form

    Fill Signup Form                      ${user_data}
    Submit Signup Form

    Alert Span in Signup Page       ${expected_alert}  ${field}


Mandatory Fields
    [Tags]                 attempt_signup
    ${user_data}                            Factory Wrong Email
    ${expected_alerts}    Set Variable     Cadê o seu nome?    E o sobrenome?
    ...           O email é importante também!    Agora só falta a senha!
    ${field}             Set Variable     name    lastname    email   password   

    
    Go To Signup Form

    Submit Signup Form

    Alert Spans in Signup Page       ${expected_alerts}   ${field}


Short Password
    [Tags]                 attempt_signup2
   
    [Template]             Signup With Short Pass
    
    homu
    1
    -1
    www 
    2
    kyosa
    333w
    )¨&*)
    666

*Keywords*
Signup With Short Pass
    [Arguments]            ${short_pass}

    ${user_data}           Create Dictionary
    ...                    name=Madoka                  lastname=Kaname
    ...                    email=madoka32@gmail.com     password=${short_pass}
    
    ${expected_alert}      Set Variable     Informe uma senha com pelo menos 6 caracteres
    ${field}               Set Variable     password 
    
    Go To Signup Form
    Fill Signup Form                      ${user_data}
    Submit Signup Form

    Alert Span in Signup Page       ${expected_alert}  ${field}

    End Session
    Close Browser
    Start Session

