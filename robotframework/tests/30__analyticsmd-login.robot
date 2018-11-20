*** Settings ***
Documentation    Suite description

Resource        ../resources/amd/common.robot   # necessary for Setup & Teardown
Resource        ../resources/amd/login.robot    # necessary for lower level keywords in test cases


Library         SeleniumLibrary

Test Setup       Begin Test
Test Teardown    End Test


# Copy/paste the below command to Terminal to execute:
# pybot -d results/login --reporttitle "analyticsMD Funcational Automation Test Summary Report"  --logtitle "analyticsMD Funcational Automation Test Detailed LOG" --variable URL:<Enter url undertest> --variable ADMIN_URL:<Enter url undertest>  tests/30__analyticsmd-login.robot

*** Test Cases ***

1__Login with valid user and valid password

    [Tags]  regression-test  login  daily-smoketest

    Login with valid user and password

2__Bad login - Invalid username + Invalid password check the response from the server on the login page

    [Tags]  regression-test  login  daily-smoketest

    Invalid username + Invalid password

3__Bad login - Invalid username + valid password check the response from the server on the login page

    [Tags]  login  regression-test  login

    Invalid username + valid password

4__Bad login - valid username + Invalid password check the response from the server on the login page

    [Tags]  regression-test  login

    valid username + Invalid password

5__Ensure users are able to authenticate and get redirected to homepage

    [Tags]  regression-test  login  daily-smoketest

    users are able to authenticate and get redirected to homepage

6__Ensure users are able to authenticate and get navigated to Dashboards page

    [Tags]  regression-test  login  daily-smoketest

    users are able to authenticate and get navigated to Dashboards page

7__Ensure users are able to authenticate and get navigated to Metrics page

    [Tags]  regression-test  login  daily-smoketest

    users are able to authenticate and get navigated to Metrics page

8__Ensure users are able to authenticate and get navigated to Alerts page

    [Tags]  regression-test  login  daily-smoketest

    users are able to authenticate and get navigated to Alerts page

9__Ensure users are able to authenticate and get navigated to Staffing page

    [Tags]  regression-test  login  daily-smoketest

    users are able to authenticate and get navigated to Staffing page

10__Ensure users are able to authenticate and get navigated to missionControl page

    [Tags]  regression-test  login  daily-smoketest

    users are able to authenticate and get navigated to missionControl page

11__Ensure users are able to authenticate and get navigated to litmos page

    [Tags]  regression-test  login  daily-smoketest

    users are able to authenticate and get navigated to litmos page

12__Basic ‘next=’ parameter testing (not logged in)

    [Tags]  regression-test  login

    login parameter testing

13__Basic ‘next=’ parameter testing (already logged in)

    [Tags]  regression-test  login

    login parameter testing after logedin

14__Bad domain ‘next’ parameter

    [Tags]  regression-test  login

    Bad domain ‘next’ parameter

15__Reset password page

    [Tags]  regression-test  login  daily-smoketest

    Reset password page

16__request for Password reset with valid email id

    [Tags]  regression-test  login  daily-smoketest

     request for Password reset

17__email required Password reset page

    [Tags]  regression-test  login

     email required field in Password reset page

18__Invalid email page reset page

     [Tags]  regression-test  login

     Invalid email address

19__user is able to authenticate Profile Manager

    [Tags]  regression-test  login

    Navigate to user Profile Manager

20__user is able to authenticate Profile Manager password

    [Tags]  regression-test  login

    Navigate to Profile Manager password

21__user old password in Profile Manager password populated

    [Tags]  regression-test  login

    verify old password in Profile Manager

22__user validation old password field Profile Manager

    [Tags]  regression-test  login

    verify old password in mandatory in Profile Manager

23__user validation in correct old password field Profile Manager

    [Tags]  regression-test  login

    verify in correct old password in Profile Manager

24__user validation new password feild Profile Manager

    [Tags]  regression-test  login

    verify new password in mandatory in Profile Manager

25__user validation New password cannot be same as old password

    [Tags]  regression-test  login

    verify New password cannot be same as old password

26__user able to change the password changed

    [Tags]

    verify password changed

27__Ten bad login - Account lockout

     [Tags]

    Invalid 10 bad attempts

28__User should not be able to login until cool down(IP address + username)

     [Tags]

     login until cool down



