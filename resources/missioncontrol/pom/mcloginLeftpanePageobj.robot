*** Settings ***
Library         SeleniumLibrary
Resource        ../mccommon.robot

*** Keywords ***

mcLoad login page

    Open Browser  about:blank   ${BROWSER}
    Maximize Browser Window
    delete all cookies
    go to   ${URL}

Load login page

    go to   ${URL}

verify login Page Loaded

    wait until page contains element  css=.btn.btn-block.btn-large.btn-success.login-submit  5s
    title should be  Qventus
    wait until page contains  Qventus

verify login page contains

    #wait until page contains  Username or email
    page should contain element  css=.btn.btn-block.btn-large.btn-success.login-submit
    page should contain button  Sign in to Qventus
    #page should contain link  Forgot your password? Reset it here
    page should contain link  Forgot your password?

Fill Login page and submit

    [Arguments]      ${USERNAME}  ${PASSWORD}
    Fill username  ${USERNAME}
    Fill password  ${PASSWORD}
    click on Sign button

Fill username
    [Arguments]      ${USERNAME}
    input text  name=username  ${USERNAME}

Fill password
    [Arguments]     ${PASSWORD}
    input text  name=password  ${PASSWORD}


verify signinbutton

   page should contain element   css=.btn.btn-block.btn-large.btn-success.login-submit

click on Sign button

   click element   css=.btn.btn-block.btn-large.btn-success.login-submit


##################Home page and leftpane object#############

Verify home button in leftpane

    wait until page contains element  css=.icon-home  timeout=30
    page should contain element  css=.icon-home

click on MC icon

    click element  css=.icon-plane

click on signout

    click element  css=.icon-user
    #click link  Sign out ===try
    click element  css=a[href='/logout']


login as non staff user

     close browser
     open Browser  about:blank   ${BROWSER}
     Maximize Browser Window
     delete all cookies
     go to   ${URL}
     wait until page contains  Qventus
     page should contain element  css=.btn.btn-block.btn-large.btn-success.login-submit
     input text  name=username   ${NON_USERNAME}
     log  ${NON_USERNAME}
     input text  name=password  ${NON_PASSWORD}
     log  ${NON_PASSWORD}
     click element   css=.btn.btn-block.btn-large.btn-success.login-submit
     mcloginLeftpanePageobj.click on MC icon

login as staff user

     close browser
     open Browser  about:blank   ${BROWSER}
     Maximize Browser Window
     delete all cookies
     go to   ${URL}
     wait until page contains  Qventus
     page should contain element  css=.btn.btn-block.btn-large.btn-success.login-submit
     input text  name=username   ${USERNAME}
     log  ${USERNAME}
     input text  name=password  ${PASSWORD}
     log  ${PASSWORD}
     click element   css=.btn.btn-block.btn-large.btn-success.login-submit
     mcloginLeftpanePageobj.click on MC icon