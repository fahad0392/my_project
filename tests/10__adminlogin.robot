*** Settings ***
Documentation    Suite description

Resource        ../resources/admin/admincommon.robot   # necessary for Setup & Teardown
Resource        ../resources/admin/adminlogin.robot    # necessary for lower level keywords in test cases
Library         SeleniumLibrary


Test Setup       Begin Test
Test Teardown    End Test


# Copy/paste the below command to Terminal to execute:
# pybot -d results/admin -i admin tests/admin.robot

*** Test Cases ***

1__As admin Login with valid user and valid password

    [Tags]  regression-test  admin-login  daily-smoketest

    Login with valid adminuser and adminpassword

2__Bad login - Invalid username + Invalid password

    [Tags]  regression-test  admin-login  daily-smoketest

    Invalid username + Invalid password

3__Bad login - Invalid username + valid password

    [Tags]  regression-test  admin-login

    Invalid username + valid password

4__Bad login - valid username + Invalid password

    [Tags]  regression-test  admin-login

    valid username + Invalid password

5__As admin verify username field is required field

    [Tags]  regression-test  admin-login  daily-smoketest

    verify adminusername field validation

6__As admin verify password field is required field

    [Tags]  regression-test  admin-login

    verify adminpassword field validation

7__As staffuser verify should not have access to admin

    [Tags]  regression-test  admin-login

    verify staffuser should not have access to admin

8__As Non staffuser verify should not have access to admin

    [Tags]  regression-test  admin-login

    verify Non staffuser should not have access to admin

9__Verify admin signout

    [Tags]  regression-test  admin-login

    Verify admin signout


