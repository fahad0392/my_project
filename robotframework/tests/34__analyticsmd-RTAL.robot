*** Settings ***
Documentation    Suite description

Resource        ../resources/amd/common.robot   # necessary for Setup & Teardown
Resource        ../resources/amd/rtal.robot    # necessary for lower level keywords in test cases


Library         SeleniumLibrary

Test Setup       Begin Test
Test Teardown    End Test


*** Test Cases ***

1__As a user Login to application and navigate Real-Time Action Lists (RTAL) Dashboard

    [Tags]  regression-test  rtal  daily-smoketest

    Login to application and navigate to RTAL Dashboard

2__As a user Login to application and navigate RTAL dashboard and verify page

    [Tags]  regression-test  rtal  daily-smoketest

    Login to application and navigate to RTAL dashboard and verify page

3__As a user Login to application and navigate RTAL dashboard and verify page in full screen mode

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify page in full screen mode

4__As a user Login to application and navigate RTAL dashboard and verify print option

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify print option

5__As a user Login to application and navigate RTAL dashboard and verify Sort by

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify Sort by

6__As a user Login to application and navigate RTAL dashboard and verify Sort by different options available from drop down list

    [Tags]  regression-test  rtal  daily-smoketest

    Login to application and navigate RTAL dashboard and verify Sort by different options available from drop down list

7__As a user Login to application and navigate RTAL dashboard and verify Search option available

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify Search option available

8__As a user Login to application and navigate RTAL dashboard and verify able to Search option available

    [Tags]  regression-test  rtal  daily-smoketest

    Login to application and navigate RTAL dashboard and verify able to search table content

9__As a user Login to application and navigate RTAL dashboard and verify No results found message when keyword is not available

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify No results found message when keyword is not available

10__As a user Login to application and navigate RTAL dashboard and verify default value for verify Switch units drop down list

    [Tags]  regression-test  rtal  daily-smoketest

    Login to application and navigate RTAL dashboard and verify default value for verify Switch units drop down list

11__As a user Login to application and navigate RTAL dashboard and verify Switch units list of values

    [Tags]  regression-test  rtal  daily-smoketest

   Login to application and navigate to RTAL dashboard and verify Switch units list of values

12__As a user Login to application and navigate RTAL dashboard and verify able to switch units by selecting values from Switch units drop down list

    [Tags]  regression-test  rtal  daily-smoketest

   Login to application and navigate RTAL dashboard and verify able to switch units by selecting values from Switch units drop down list

13__As a user Login to application and navigate RTAL dashboard and verify units Search option available

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify units Search option available

14__As a user Login to application and navigate RTAL dashboard and verify able to Search available units

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify able to Search units

15__As a user Login to application and navigate RTAL dashboard and verify No results found message when units is not available

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify No results found message when units is not available

16__As a user Login to application and navigate RTAL dashboard and verify calender option available under EDD column

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify calender option available under EDD column

17__As a user Login to application and navigate RTAL dashboard and verify able to select date from calender option available under EDD column

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify able to select date from calender option available under EDD column

18__As a user Login to application and navigate RTAL dashboard and verify drop down list available under Disposition column

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify drop down list available under Disposition column

19__As a user Login to application and navigate RTAL dashboard and verify able to select values from drop down list available under Disposition column

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify able to select values from drop down list available under Disposition column

20__As a user Login to application and navigate RTAL dashboard and verify Add Barrier text field available under Possible Barriers column

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify Add Barrier text field available under Possible Barriers column

21__As a user Login to application and navigate RTAL dashboard and verify able to Add Barrier under Possible Barriers column

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify able to Add Barrier under Possible Barriers column

22__As a user Login to application and navigate RTAL dashboard and verify able to delete Barrier under Possible Barriers column

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify able to delete Barrier under Possible Barriers column

23__As a user Login to application and navigate RTAL dashboard and verify note text field available under Notes column

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify notes text field available under Notes column

24__As a user Login to application and navigate RTAL dashboard and verify able to Add Note under Notes column

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify able to Add Note under Notes column

25__As a user Login to application and navigate RTAL dashboard and verify able to delete Note under Notes column

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify able to delete Note under Notes column

26__As a user Login to application and navigate RTAL dashboard and verify able to Vertical scroll with sticky header

    [Tags]  regression-test  rtal

    Login to application and navigate RTAL dashboard and verify able to Vertical scroll with sticky header