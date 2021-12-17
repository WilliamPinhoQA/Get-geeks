*Settings*
Documentation   System Actions

Resource            Database.robot
Resource            Helpers.robot

*Variables*

*Keywords*
Go To Signup Form
    Get Title       ==      Getgeeks - Encontre um Geek
    #Go To                   https://getgeeks-william.herokuapp.com/signup
    Click           text=Cadastre-se
    Wait For Elements State         css=.signup-form    visible     15

Fill Signup Form
    [Arguments]         ${user_data}

    Fill text           id=name             ${user_data}[name]
    Fill text           id=lastname         ${user_data}[lastname]
    Fill text           id=email            ${user_data}[email]
    Fill text           id=password         ${user_data}[password]

Submit Signup Form
    Click               text=Cadastrar

Check Signup Sucess
    ${expected_message}     Set Variable    Agora você faz parte da Getgeeks. Tenha uma ótima experiência.
    Wait For Elements State                 css=p >> text=${expected_message} 
    ...                 visible     15
    Get Url             ==          ${BASE_URL}/signup-success

Go to Home Page
    Click       xpath=//a >> text=Voltar
    Get text    css=.login-form

Modal Content Should Be 
    [Arguments]     ${expected_title}       ${expected_text}
    Wait for Elements State                 css=.swal2-x-mark     visible     5

    Get text    id=swal2-title              ==     ${expected_title}
    Get text    id=swal2-html-container     ==     ${expected_text}

    #Get Style   css=.swal2-error also works
    Get Style   css=.swal2-error   display      contains    flex  

Field Notifications in Signup Page
    [Arguments]         ${expected_message}     ${fields}

    ${i}    Set Variable    0

        FOR     ${field}  IN  ${fields}

            ${i} =       Evaluate        ${i} + 1

            Log     ${i}
            Log      ${field}[${i}]
            
            ${message}=         Get text        xpath=//label[@for="${field}[${i}]"]/..//span[@class="error"]
            Should Be Equal     ${expected_message}[${i}]     ${message}

        END


Field Notification in Signup Page
    [Arguments]         ${expected_message}     ${field}

    ${message}=         Get text        xpath=//label[@for="${field}"]/..//span[@class="error"]
    Should Be Equal     ${expected_message}    ${message}

             



