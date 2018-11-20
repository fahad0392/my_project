*** Settings ***
Documentation    Suite description

Resource        ../resources/amd/common.robot   # necessary for Setup & Teardown
Resource        ../resources/amd/rtalSutterRx.robot    # necessary for lower level keywords in test cases


Library         SeleniumLibrary

Test Setup       Begin Test
Test Teardown    End Test


*** Test Cases ***

1__As a user Login to application and navigate Sutter Rx Board Real-Time Action Lists (RTAL) Dashboard

    [Tags]  regression-test  rtal  daily-smoketest

    Login to application and navigate to Sutter Rx RTAL dashboard

2__As a user Login to application and navigate Sutter Rx RTAL dashboard and verify page

    [Tags]  regression-test  rtal  daily-smoketest

    Login to application and navigate to Sutter Rx RTAL dashboard and verify page

3__As a user Login to application and navigate Sutter Rx RTAL dashboard and verify page in full screen mode

    [Tags]  regression-test  rtal

    Login to application and navigate Sutter Rx RTAL dashboard and verify page in full screen mode

4__As a user Login to application and navigate Sutter Rx RTAL dashboard and verify print option

    [Tags]  regression-test1  rtal

    Login to application and navigate Sutter Rx RTAL dashboard and verify print option

5__As a user Login to application and navigate Sutter Rx RTAL dashboard and verify status drop down list

    [Tags]  regression-test  rtal

    Login to application and navigate Sutter Rx RTAL dashboard and verify status drop down list

6__As a user Login to application and navigate Sutter Rx RTAL dashboard and verify able to select values from drop down list

    [Tags]  regression-test  rtal

    Login to application and navigate Sutter Rx RTAL dashboard and verify able to select values from drop down list

7__As a user Login to application and navigate Sutter Rx RTAL dashboard and verify Search option available

    [Tags]  regression-test  rtal

    Login to application and navigate Sutter Rx RTAL dashboard and verify Search option available

8__As a user Login to application and navigate Sutter Rx RTAL dashboard and verify able to Search option available

    [Tags]  regression-test  rtal

    Login to application and navigate Sutter Rx RTAL dashboard and verify able to search table content

9__As a user Login to application and navigate Sutter Rx RTAL dashboard and verify No results found message when keyword is not available

    [Tags]  regression-test  rtal

    Login to application and navigate Sutter Rx RTAL dashboard and verify No results found message when keyword is not available

10__As a user Login to application and navigate Sutter Rx RTAL dashboard and verify note text field available under Follow-Up column

    [Tags]  regression-test  rtal

    Login to application and navigate Sutter Rx RTAL dashboard and verify notes text field available under Follow-Up column

11__As a user Login to application and navigate Sutter Rx RTAL dashboard and verify able to Add Note under Follow-Up column

    [Tags]  regression-test  rtal

    Login to application and navigate Sutter Rx RTAL dashboard and verify able to Add Note under Follow-Up column

12__As a user Login to application and navigate Sutter Rx RTAL dashboard and verify able to delete Note under Follow-Up column

    [Tags]  regression-test  rtal

    Login to application and navigate Sutter Rx RTAL dashboard and verify able to delete Note under Follow-Up column

13__As a user Login to application and navigate Sutter Rx RTAL dashboard and verify Candidates and Reviewed filter options

    [Tags]  regression-test  rtal

    Login to application and navigate Sutter Rx RTAL dashboard and verify Candidates and Reviewed filter options

14__As a user Login to application and navigate Sutter Rx RTAL dashboard and verify #row of rows dashboard is equal count of Candidates plus count of Reviewed

    [Tags]  regression-test  rtal

    Login to application and navigate Sutter Rx RTAL dashboard and verify # of rows present is equal count of Candidates plus count of Reviewed

15__As a user Login to application and navigate Sutter Rx RTAL dashboard and verify Reviewed dashboard by using reviewed filter

    [Tags]  regression-test  rtal

    Login to application and navigate Sutter Rx RTAL dashboard and verify Reviewed dashboard by using reviewed filter

16__As a user Login to application and navigate Sutter Rx RTAL dashboard and verify Candidates dashboard by using Candidates filter

    [Tags]  regression-test  rtal

    Login to application and navigate Sutter Rx RTAL dashboard and verify Candidates dashboard by using Candidates filter

5__As a user Login to application and navigate Sutter Rx RTAL dashboard and verify able to reveiw under Candidates filter list

    [Tags]  regression-test  rtal

    Login to application and navigate Sutter Rx RTAL dashboard and verify able to reveiw under Candidates filter list