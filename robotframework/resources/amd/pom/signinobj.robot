*** Settings ***
Library         SeleniumLibrary
Resource        ../common.robot



*** Keywords ***

Load login page

    go to   ${URL}

login Page Loaded

    title should be  Qventus
    wait until page contains  Qventus

login page contains

    wait until page contains  Username or email
    page should contain element  xpath=//label[text()='Username or email']
    page should contain element  css=.btn.btn-block.btn-large.btn-success.login-submit
    page should contain button  Sign in to Qventus
    page should contain link  Forgot your password? Reset it here.

Enter username
    #[Arguments]      ${username}
    input text  name=username   ${USERNAME}
    log  ${USERNAME}

Enter password
    #[Arguments]       ${password}
    input text  name=password  ${PASSWORD}
    log  ${PASSWORD}

Enter username1
    #[Arguments]      ${username}
    input text  name=username   ${USERNAME1}
    log  ${USERNAME1}

Enter password1
    #[Arguments]       ${password}
    input text  name=password  ${PASSWORD1}
    log  ${PASSWORD1}


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

Invalid login error

    Wait Until Page Contains  Invalid username or password!  timeout=30s
    #page should contain  Invalid username or password!


verify for validation message when user username or password is empty

     wait until page contains  Please enter username and password!  timeout=10s
     page should contain  Please enter username and password!

verify login page Reset password link

    ##page should contain element  xpath=html/body/div[1]/form/a
    page should contain element  css=.forgotPassword>a
    #page should contain element  css=.form.login.form-login>a
    #page should contain link  Forgot your password? Reset it here.
    page should contain link  Forgot your password?

    #page should contain   Forgot your password? Reset it here.

click on Forgot your password link

    ##click element   xpath=html/body/div[1]/form/a
    #click link  Forgot your password? Reset it here.
    click link  Forgot your password?
    ##click element  css=.form.login.form-login>a


verify Reset password page

    Wait Until Page Contains  Password reset  timeout=30s
    title should be  Password reset
    page should contain    Password reset


Enter E-mail address
    #[Arguments]       ${password}
    input text  name=email  ${EMAIL}
    log  ${EMAIL}

click on Reset my password button

     click element   xpath=html/body/div[1]/form/p/input[2]

verify password reset successful

    title should be     Password reset successful
    page should contain   Password reset successful
    page should contain   We've e-mailed you instructions for setting your password to the e-mail address you submitted
    page should contain   You should be receiving it shortly.

verify Password reset required field

    title should be      Password reset

verify password valid email message

    page should not contain  Password reset successful

verify password invalid email message

verify Account locked page
    page should contain  Your account has been temporarily locked since you have failed at least 10 login attempts!

