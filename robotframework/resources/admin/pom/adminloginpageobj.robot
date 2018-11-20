*** Settings ***
Library         SeleniumLibrary
Resource        ../../admin/admincommon.robot



*** Keywords ***

load adminlogin page

    go to   ${ADMIN_URL}
    #sleep  5m


verify adminloginPage Loaded

    ##page should contain element   xpath=//input[@type='submit']
    page should contain element  css=input[type='submit']
    #Wait Until Page Contains  Log in
    #get title  Log in | QVENTUS
    title should be  Log in | QVENTUS

verify adminloginpage contain

    ##page should contain element  xpath=//input[@type='submit']
    page should contain element  css=input[type='submit']
    page should contain element  css=.submit-row>input

Enter admin username
    #[Arguments]      ${username}
    input text  name=username   ${ADMIN_USERNAME}
    log  ${ADMIN_USERNAME}

Enter admin password
    #[Arguments]       ${password}
    input text  name=password  ${ADMIN_PASSWORD}
    log  ${ADMIN_PASSWORD}


Enter invalidadmin username
    #[Arguments]      ${username}
    #input text  name=username   ${ADMIN_USERNAME}1
    log  ${ADMIN_USERNAME}
    ${my_new_invalidusername} =  set variable  ${ADMIN_USERNAME}1
    log  ${my_new_invalidusername}
    input text  name=username  ${my_new_invalidusername}

Enter invalidadmin password
    #[Arguments]       ${password}

    log  ${ADMIN_USERNAME}
    ${my_new_invalidpassword} =  set variable  ${ADMIN_PASSWORD}1
    log  ${my_new_invalidpassword}
    input text  name=password  ${my_new_invalidpassword}

#TODO
Fill Login page and submit

    [Arguments]      ${USERNAME}  ${PASSWORD}
    Fill username  ${USERNAME}
    Fill password  ${PASSWORD}
    click on adminlogin button

#TODO
Fill username
    [Arguments]      ${USERNAME}
    input text  name=username  ${USERNAME}
#TODO
Fill password
    [Arguments]     ${PASSWORD}
    input text  name=password  ${PASSWORD}


verify adminloginbutton

   page should contain element  css=.submit-row>input

click on adminlogin button

   click element  css=.submit-row>input

Invalid login error

    page should contain  Invalid username or password

#verify login page Reset password link

    #page should contain element  xpath=html/body/div[1]/form/a
    #page should contain   Forgot your password? Reset it here.

verify adminuser loged in
    
    wait until page contains element  css=.reset-dashboard-link-icon.icon-reset  10s
    title should be  Site administration | QVENTUS
    page should contain element  css=.button.add-dashboard-link


verify invalid login

    page should contain element  css=.submit-row>input
    Location Should Contain  /atc/login/?next=/atc/
    wait until page contains element  css=.errornote  10s
    page should contain  Please enter the correct username and password for a staff account. Note that both fields may be case-sensitive.

verify Username required field

    page should contain element  css=.submit-row>input
    Location Should Contain  /atc/login/?next=/atc/

verify password required field

    page should contain element  css=.submit-row>input
    Location Should Contain  /atc/login/?next=/atc/

click on logout link

    click element  css=.top-user-tools-welcome-msg
    click element   xpath=//a[text()='Log out']


verify adminlogout page

    title should be     Logged out | QVENTUS
    page should contain     Thanks for spending some quality time with the Web site today.
    page should contain link  Log in again


verify staffuser should not have access to admin modules

    page should not contain element  xpath=//span[text()='Applications']
    page should not contain link  main
    page should not contain link  Authentication and Authorization
    page should not contain link  missioncontrol
    page should not contain element  css=.sidebar-menu-item-list-item-link.popup-item-link.hovered
