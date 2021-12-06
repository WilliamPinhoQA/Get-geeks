**Settings**
Documentation   Base Hooks
Library         Browser
Library         factories/Users.py

Resource            Actions.robot


**Variables**
${BASE_URL}         https://getgeeks-william.herokuapp.com
${BROWSER}          chromium





**Keywords**
Start Session

    New Browser     ${BROWSER}      headless=False          slowMo=00:00:00.5
    New Page        ${BASE_URL}


End Session
    Take Screenshot