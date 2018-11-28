*** Settings ***
Documentation    Suite description

Resource        ../resources/amd/common.robot   # necessary for Setup & Teardown
Resource        ../resources/amd/rtalNYP.robot    # necessary for lower level keywords in test cases


Library         SeleniumLibrary

Test Setup       Begin Test
Test Teardown    End Test


*** Test Cases ***

1__As a user Login to application and navigate NYP RTAL Board Real-Time Action Lists (RTAL) Dashboard

    [Tags]  regression-test  rtal  daily-smoketest

    Login to application and navigate to NYP RTAL dashboard

2__As a user Login to application and navigate NYP RTAL dashboard and verify page

    [Tags]  regression-test  rtal  daily-smoketest

    Login to application and navigate to NYP RTAL dashboard and verify page

3__As a user Login to application and navigate NYP RTAL dashboard and verify page in full screen mode

    [Tags]  regression-test  rtal

    Login to application and navigate NYP RTAL dashboard and verify page in full screen mode

4__As a user Login to application and navigate NYP RTAL dashboard and verify print option

    [Tags]  regression-test1  rtal

    Login to application and navigate NYP RTAL dashboard and verify print option

5__As a user Login to application and navigate NYP RTAL dashboard and verify Sort by

    [Tags]  regression-test  rtal

    Login to application and navigate NYP RTAL dashboard and verify Sort by

6__As a user Login to application and navigate NYP RTAL dashboard and verify Sort by different options available from drop down list

    [Tags]  regression-test  rtal  daily-smoketest

    Login to application and navigate NYP RTAL dashboard and verify Sort by different options available from drop down list

7__As a user Login to application and navigate NYP RTAL dashboard and verify Search option available

    [Tags]  regression-test  rtal

    Login to application and navigate NYP RTAL dashboard and verify Search option available

8__As a user Login to application and navigate NYP RTAL dashboard and verify able to Search option available

    [Tags]  regression-test  rtal

    Login to application and navigate NYP RTAL dashboard and verify able to search table content

9__As a user Login to application and navigate NYP RTAL dashboard and verify No results found message when keyword is not available

    [Tags]  regression-test  rtal

    Login to application and navigate NYP RTAL dashboard and verify No results found message when keyword is not available

10__As a user Login to application and navigate NYP RTAL dashboard and verify calender option available under EDD column

    [Tags]  regression-test  rtal

    Login to application and navigate NYP RTAL dashboard and verify calender option available under EDD column

11__As a user Login to application and navigate NYP RTAL dashboard and verify able to select date from calender option available under EDD column

    [Tags]  regression-test  rtal

    Login to application and navigate NYP RTAL dashboard and verify able to select date from calender option available under EDD column

12__As a user Login to application and navigate NYP RTAL dashboard and verify Add Barrier text field available under Possible Barriers column

    [Tags]  regression-test  rtal

    Login to application and navigate NYP RTAL dashboard and verify Add Barrier text field available under Possible Barriers column

13__As a user Login to application and navigate NYP RTAL dashboard and verify able to Add Barrier under Possible Barriers column

    [Tags]  regression-test  rtal

    Login to application and navigate NYP RTAL dashboard and verify able to Add Barrier under Possible Barriers column

14__As a user Login to application and navigate NYP RTAL dashboard and verify able to delete Barrier under Possible Barriers column

    [Tags]  regression-test  rtal

    Login to application and navigate NYP RTAL dashboard and verify able to delete Barrier under Possible Barriers column

15__As a user Login to application and navigate NYP RTAL dashboard and verify note text field available under Follow-Up column

    [Tags]  regression-test  rtal

    Login to application and navigate NYP RTAL dashboard and verify notes text field available under Follow-Up column

16__As a user Login to application and navigate NYP RTAL dashboard and verify able to Add Note under Follow-Up column

    [Tags]  regression-test  rtal

    Login to application and navigate NYP RTAL dashboard and verify able to Add Note under Follow-Up column

17__As a user Login to application and navigate NYP RTAL dashboard and verify able to delete Note under Follow-Up column

    [Tags]  regression-test  rtal

    Login to application and navigate NYP RTAL dashboard and verify able to delete Note under Follow-Up column


