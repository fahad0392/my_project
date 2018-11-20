*** Settings ***
Documentation    Suite description

Resource        ../resources/amd/common.robot   # necessary for Setup & Teardown
Resource        ../resources/amd/alerts.robot    # necessary for lower level keywords in test cases


Library         SeleniumLibrary

Test Setup       Begin Test
Test Teardown    End Test


*** Test Cases ***

###### Metrics ##############

1__As a user Login and navigate to Alert page

    [Tags]  regression-test  alerts  daily-smoketest

    Login and navigate to Alert page

2__As a user Login and navigate to Alert page and verify

    [Tags]  regression-test  alerts  daily-smoketest

    login and verify Alert page

3__As a user Login and navigate to Alert page and verify Add an alert option

    [Tags]  regression-test  alerts  daily-smoketest

    Login and navigate to Alert page and verify Add an alert option

4__As a user Login and navigate to Alert page and verify Add Alert popup screen

    [Tags]  regression-test  alerts  daily-smoketest

    Login and navigate to Alert page and verify Add Alert popup screen displayed

5__As a user Login and navigate to Alert page and verify Add Alert popup screen fields

    [Tags]  regression-test  alerts

    Login and navigate to Alert page and verify Add Alert popup screen fields

6__As a user Login and navigate to Alert page and verify Advanced option under Add Alert popup screen

    [Tags]  regression-test  alerts

    Login and navigate to Alert page and verify Advanced option under Add Alert popup screen


7__As a user Login and navigate to Alert page and verify Basic Alerts under Add Alert popup screen

    [Tags]  regression-test  alerts

    Login and navigate to Alert page and verify Basic Alerts under Add Alert popup screen


8__As a user Login and navigate to Alert page and create a Smart Alert

    [Tags]  regression-test  alerts

    Login and navigate to Alert page and create a Smart Alert

9__As a user Login and navigate to Alert page and create a Smart Alert and edit the newly created alert

    [Tags]  regression-test  alerts

   Login and navigate to Alert page and create a Smart Alert and edit the newly created alert

10__As a user Login and navigate to Alert page and create a Smart Alert by selecting advanced option

    [Tags]  regression-test  alerts  daily-smoketest

    Login and navigate to Alert page and create a Smart Alert by selecting advanced option

11__As a user Login and navigate to Alert page and create a Basic Alert

    [Tags]  regression-test  alerts  daily-smoketest

    Login and navigate to Alert page and create a Basic Alert