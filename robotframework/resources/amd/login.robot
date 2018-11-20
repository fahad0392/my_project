*** Settings ***
Documentation    Suite description


Resource    ../../resources/amd/pom/signinobj.robot
Resource    ../../resources/amd/pom/leftpaneobj.robot
Resource    ../../resources/amd/pom/homepageobj.robot
Resource    ../../resources/amd/pom/profilepageobj.robot
Resource    ../../resources/db/databasemysql.robot

*** Keywords ***

Login with valid user and password
    signinobj.load login page
    signinobj.login page loaded
    signinobj.Enter username
    signinobj.Enter password
    signinobj.click on Sign button
    homepageobj.verify AMD home page loaded

Login to application

    signinobj.load login page
    signinobj.Enter username
    signinobj.Enter password
    signinobj.click on Sign button
    homepageobj.verify AMD home page loaded

signout AMD

     leftpaneobj.click on signout

Navigate home page
    login.verify AMD home page leftpane
    leftpaneobj.click on home button

Navigate Dashboards page

    homepageobj.verify AMD home page loaded
    leftpaneobj.click on Dashboards icon
    homepageobj.verify Dashboards page loaded

Navigate Metrics page

    homepageobj.verify AMD home page loaded
    leftpaneobj.click on Metrics icon
    homepageobj.verify Metrics page loaded

Navigate Alerts page

    homepageobj.verify AMD home page loaded
    leftpaneobj.click on Alerts icon
    homepageobj.verfiy Alert page loaded

Navigate Staffing page

    homepageobj.verify AMD home page loaded
    leftpaneobj.click on Staffing icon
    homepageobj.verfiy Staffing page loaded

Navigate litmos page

    leftpaneobj.click on litmos icon
    homepageobj.verfiy litmos page loaded

Navigate missionControl page

    leftpaneobj.click on MC icon
    homepageobj.verfiy missionControl page loaded

verify AMD home page leftpane

    leftpaneobj.Verify home button in leftpane

logout AMD
     leftpaneobj.click on signout

login parameter testing

    #go to  ${type}://${HOSTNAME}:${PORT}/metro#decisions
    ${newurl1}=  Replace String  ${URL}  login  metro#decisions
    log   ${newurl1}
    go to  ${newurl1}
    #go to  ${type}://${HOSTNAME}/metro#decisions
    login Page Loaded

login parameter testing after logedin

    Login to application
    #go to  ${type}://${HOSTNAME}:${PORT}/metro#decisions
    ${newurl}=  Replace String  ${URL}  login  metro#decisions
    log   ${newurl}
    #go to  ${type}://${HOSTNAME}/metro#decisions
    go to  ${newurl}
    Set Browser Implicit Wait	10 seconds
    homepageobj.verify AMD home page loaded

Bad domain ‘next’ parameter

    Set Browser Implicit Wait	30 seconds
    #go to  ${URL}/login?next=www.google.com
    go to   ${URL}?next=www.google.com
    #go to  ${type}://${HOSTNAME}/login?next=www.google.com
    signinobj.Enter username
    signinobj.Enter password
    signinobj.click on Sign button
    page should not contain link  Sign in
    page should not contain link  Gmail

users are able to authenticate and get redirected to homepage

    Login to application
    Navigate home page
    signout AMD

users are able to authenticate and get navigated to Dashboards page

    Login to application
    Navigate Dashboards page
    signout AMD

users are able to authenticate and get navigated to Metrics page

    Login to application
    Navigate Metrics page
    signout AMD

users are able to authenticate and get navigated to Alerts page

    Login to application
    Navigate Alerts page
    signout AMD

users are able to authenticate and get navigated to Staffing page

    Login to application
    Navigate Staffing page
    signout AMD

users are able to authenticate and get navigated to missionControl page

    Login to application
    Navigate missionControl page

users are able to authenticate and get navigated to litmos page

    Login to application
    Navigate litmos page

Invalid username + Invalid password
    signinobj.Load login page
    log  ${USERNAME}
    log  ${PASSWORD}
    ${my_new_invalidusername} =  set variable  ${USERNAME}1
    log  ${my_new_invalidusername}
    ${my_new_invalidpassword} =  set variable  ${PASSWORD}1
    log  ${my_new_invalidpassword}
    input text  name=username  ${my_new_invalidusername}
    input text  name=password  ${my_new_invalidpassword}
    signinobj.click on Sign button
    signinobj.Invalid login error

Invalid username + valid password
    signinobj.Load login page
    log  ${USERNAME}
    log  ${PASSWORD}
    ${my_new_invalidusername} =  set variable  ${USERNAME}1
    log  ${my_new_invalidusername}
    input text  name=username  ${my_new_invalidusername}
    input text  name=password  ${PASSWORD}
    signinobj.click on Sign button
    signinobj.Invalid login error

valid username + invalid password
    signinobj.Load login page
    log  ${USERNAME}
    log  ${PASSWORD}
    ${my_new_invalidpassword} =  set variable  ${PASSWORD}1
    log  ${my_new_invalidpassword}
    input text  name=username  ${USERNAME}
    input text  name=password  ${my_new_invalidpassword}
    signinobj.click on Sign button
    signinobj.Invalid login error

Reset password page
    signinobj.Load login page
    signinobj.verify login page Reset password link
    signinobj.click on Forgot your password link
    signinobj.verify Reset password page

Request for Password reset
    login.Reset password page
    signinobj.Enter E-mail address
    signinobj.click on Reset my password button
    signinobj.verify password reset successful

email required field in Password reset page
    login.Reset password page
    signinobj.click on Reset my password button
    signinobj.verify Password reset required field

Invalid email address

    login.Reset password page
    @{ITEMS}    Create List    balajianantharam    @analyticsmd.com    \#@$%^&*().com      @analyticsmd.com   balaji.anantharam<@analyticsmd.com>   balaji.anantharam.analyticsmd   balaji@anantharam@analyticsmd.com   .balaji.anantharam@analyticsmd   balaji.anantharam.@analyticsmd   balaji.anantharam   balaji.anantharam(@analyticsmd.com)
    :FOR    ${invalid_email}    IN    @{ITEMS}
    \   Log    ${invalid_email}
    \   input text  name=email  ${invalid_email}
    \   signinobj.click on Reset my password button
    \   mouse over   xpath=//*[@id='id_email']
    \   #get alert message  xpath=//*[@id='id_email']
    \   signinobj.verify password valid email message

Navigate to user Profile Manager

    login.Login to application
    homepageobj.verify AMD home page loaded
    leftpaneobj.click on user Icons
    leftpaneobj.click Profile link
    profilepageobj.Verify Profile Manager page

Navigate to Profile Manager password

    login.Navigate to user Profile Manager
    profilepageobj.click on user-profile-password
    profilepageobj.verify profile user-profile-password page

load Profile Manager
    login.Login to application
    leftpaneobj.click on user Icons
    leftpaneobj.click Profile link

verify old password in Profile Manager

   login.load Profile Manager
   profilepageobj.click on user-profile-password
   Enter old password for all field under password tab
   click save changes(profile) button
   page should contain  New password cannot be same as old password

verify old password in mandatory in Profile Manager

   login.load Profile Manager
   profilepageobj.click on user-profile-password
   input Text  name=old-password  ${empty}
   profilepageobj.click save changes(profile) button
   Alert Should Be Present  Please fill out the old password field!

verify in correct old password in Profile Manager

   login.load Profile Manager
   profilepageobj.click on user-profile-password
   Enter incorrect old password
   profilepageobj.click save changes(profile) button
   page should contain  Old password is incorrect

verify new password in mandatory in Profile Manager
    login.load Profile Manager
    profilepageobj.click on user-profile-password
    profilepageobj.Enter old-password
    profilepageobj.click save changes(profile) button
    page should contain  This field is required.

verify password changed

verify New password cannot be same as old password
    login.load Profile Manager
    profilepageobj.click on user-profile-password
    profilepageobj.Enter old-password
    profilepageobj.Enter New Password
    profilepageobj.Enter Confirm Password
    profilepageobj.click save changes(profile) button
    page should contain  New password cannot be same as old password

Invalid 10 bad attempts

    signinobj.load login page
    @{pwdlist}  create list  password1   password2   password3   password4   password5   password6   password7   password8   password9   password10
    :FOR      ${Item}     IN      @{pwdlist}
    \  signinobj.Load login page
    \  input text  name=username  ${USERNAME1}
    \  log  ${USERNAME1}
    \  input text  name=password  ${Item}
    \  log  ${Item}
    \  click on Sign button
    \  Run Keyword If  '${Item}' == 'password10'  Exit For Loop
    \  Invalid login error
    \  sleep  10s
       sleep  10s
       signinobj.verify Account locked page
       page should contain  Your account has been temporarily locked since you have failed at least 10 login attempts!
       page should contain  support@analyticsmd.com

login until cool down
    signinobj.Load login page
    signinobj.verify Account locked page
    sleep  ${LOGIN_COOL_DOWN_TIME}
    reload page
    signinobj.login page contains
    signinobj.Enter username1
    signinobj.Enter password1
    signinobj.click on Sign button

verify auth_user table present in database

    Connect to mysql database
    verify Table Must Exist 'auth_user'
    Disconnect mysql database

verify records from auth_user table

     Connect to mysql database
     Retrieve records from auth_user table
     Retrieve Row Count from auth_user table
     #Verify Row Count is Equal to X
     Verify Row Count is Less Than X
     Verify Row Count is Greater Than X
     Disconnect mysql database

verify database present after passing a query drop database in username field

    signinobj.Load login page
    signinobj.Fill username  ; drop database;
    signinobj.click on Sign button
    signinobj.verify for validation message when user username or password is empty
    databasemysql.Connect to mysql database
    databasemysql.verify Table Must Exist 'auth_user'
    databasemysql.Disconnect mysql database

verify login validation message while injecting sql

    signinobj.Load login page
    signinobj.Fill username  ‘${USERNAME1}’ or ‘x’=’x’
    signinobj.fill password  ‘${USERNAME1}’ or ‘x’=’x’
    click on Sign button
    sleep  30s
    #Invalid login error
    verify for validation message when user username or password is empty
    Connect to mysql database
    verify Table Must Exist 'auth_user'
    Disconnect mysql database

verify auth_user present after passing a query drop auth_user in username field

    signinobj.Load login page
    Fill username  ${USERNAME1}’; DROP table auth_user;’—
    fill password  ‘anything’;
    click on Sign button
    verify for validation message when user username or password is empty
    #Invalid login error
    Connect to mysql database
    verify Table Must Exist 'auth_user'
    Disconnect mysql database

verify user with valid credentials able to login

    signinobj.load login page
    signinobj.login page loaded
    Fill Login page and submit  ${USERNAME1}  ${PASSWORD1}
    homepageobj.verify AMD home page loaded

bypass-login-using-sql-injection

    signinobj.load login page
    @{userlist}  create list  "testauto1' OR 1 = 1--"   'test' or 1 = 1   testauto1' --   admin' #   admin'/*
    :FOR      ${Item}     IN      @{userlist}
    \  signinobj.Load login page
    \  input text  name=username  ${Item}
    \  log  ${Item}
    \  input text  name=password  ${PASSWORD1}
    \  log  ${PASSWORD1}
    \  click on Sign button
    \  Invalid login error
    \  sleep  1s