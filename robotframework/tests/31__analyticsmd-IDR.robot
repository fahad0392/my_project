*** Settings ***
Documentation    Suite description

Resource        ../resources/amd/common.robot   # necessary for Setup & Teardown
Resource        ../resources/amd/idr.robot    # necessary for lower level keywords in test cases


Library         SeleniumLibrary

Test Setup       Begin Test
Test Teardown    End Test


*** Test Cases ***

1__As a user Login to application and navigate Inter-Disciplinary Review Dashboard (IDR)

    [Tags]  regression-test  idr  daily-smoketest

    Login to application and navigate to IDR page

2__As a user Login to application and navigate IDR dashboard and verify page

    [Tags]  regression-test  idr  daily-smoketest

    Login to application and navigate to IDR dashboard and verify page

3__As a user Login to application and navigate IDR dashboard and verify SORT BY: list of values

    [Tags]  regression-test  idr

    Login to application and navigate to IDR dashboard and verify SORT BY list of values

4__As a user Login to application and navigate IDR dashboard and verify default value for SORT BY: drop down list

    [Tags]  regression-test  idr

    navigate IDR dashboard and verify default value for SORT BY: drop down list

5__As a user Login and navigate to IDR dashboard page and verify sort by different options available from SORT BY: drop down list

    [Tags]  regression-test  idr

    navigate to IDR dashboard page and verify sort by different options available from SORT BY drop down list

6__As a user Login to application and navigate IDR dashboard and verify Switch units list of values

    [Tags]  regression-test  idr  daily-smoketest

    Login to application and navigate to IDR dashboard and verify Switch units list of values

7__As a user Login to application and navigate IDR dashboard and verify default value for Switch units drop down list

    [Tags]  regression-test  idr  daily-smoketest

    navigate IDR dashboard and verify default value for verify Switch units drop down list

8__As a user Login and navigate to IDR dashboard page and verify sort by different options available from Switch units drop down list

    [Tags]  regression-test  idr  daily-smoketest

    navigate to IDR dashboard page and verify sort by different options available from Switch units drop down list

9__As a user Login to application and navigate IDR dashboard and verify Set dispositions: list of values

    [Tags]  regression-test  idr

   navigate to IDR dashboard and verify dispositions list of values

10__As a user Login and navigate to IDR dashboard page and verify different options available from Disposition drop down list

    [Tags]  regression-test  idr

    navigate to IDR dashboard page and verify different options available from Disposition drop down list

11__As a user Login and navigate to IDR dashboard page and verify able to Select/unselect flags if avaialbe under Possible Barriers

    [Tags]  regression-test  idr

    navigate to IDR dashboard page and verify able to Select/unselect flags if avaialbe under Possible Barriers

12__As a user Login and navigate to IDR dashboard page and verify date picker under EDD column

    [Tags]  regression-test  idr

    navigate to IDR dashboard page and verify date picker under EDD column

13__As a user Login and navigate to IDR dashboard page and Select date from date picker under EDD column

    [Tags]  regression-test  idr

   navigate to IDR dashboard page and Select date from date picker under EDD column

14__As a user Login and navigate to IDR dashboard page and verify date picker has 2 months calender under EDD column

    [Tags]  regression-test  idr

   navigate to IDR dashboard page and verify date picker has 2 months calender under EDD column

15__As a user Login and navigate to IDR dashboard page and verify Patient name format under Patient

    [Tags]  regression-test  idr

   navigate to IDR dashboard page and verify Patient name format under Patient

16__As a user Login and navigate to IDR dashboard page and verify able to enter notes under Notes column

    [Tags]  regression-test  idr

    navigate to IDR dashboard page and verify able to enter notes under Notes column

17__As a user Login and navigate to IDR dashboard page and delete able to enter notes under Notes column

    [Tags]  regression-test  idr

   navigate to IDR dashboard page and delete able to enter notes under Notes column

18__As a user Login and navigate other module available under left pane from IDR Dashboard

    [Tags]  regression-test  idr

   navigate other module available under left pane from IDR Dashboard

19__As a staff user able to access IDR - EDD Export

    [Tags]  regression-test  idr

   verify staff user able to access IDR EDD Export

20__As a non staff user not able to access IDR - EDD Export

    [Tags]  regression-test  idr

   verify non staff user not able to access IDR EDD Export

21__As a staff user login to application and able to access IDR - EDD Export

    [Tags]  regression-test  idr

    staff user login to application and able to access IDR - EDD Export

22__As a staff user login to application and not able to access IDR - EDD Export

    [Tags]  regression-test  idr

    staff user login to application and not able to access IDR - EDD Export

23__As a user login to application and able to access IDR and verify print option in IDR page

    [Tags]  regression-test  idr

    login to application and able to access IDR and verify print option available in IDR page

24__As a user login to application and able to access IDR and verify able to print in IDR page

    [Tags]  regression-test  idr

    login to application and able to access IDR and verify able to print in IDR page