*Settings*
Documentation   System Actions


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
    Wait For Elements State     css=p >> text=${expected_message} 
    ...                 visible     15
    Get Url             ==      ${BASE_URL}/signup-success
