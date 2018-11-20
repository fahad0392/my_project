*** Settings ***
Documentation    Suite description

Resource        ../resources/amd/common.robot   # necessary for Setup & Teardown
Resource        ../resources/amd/staffing.robot    # necessary for lower level keywords in test cases


Library         SeleniumLibrary

Test Setup       Begin Test
Test Teardown    End Test


*** Test Cases ***

###### Metrics ##############

1__As a user Login and navigate to staffing page

    [Tags]

    Login and navigate to staffing page

2__As a user Login and navigate to staffing page and verify

    [Tags]

    login and verify staffing page

3__As a user Login and navigate to staffing page and verify staffing plan displayed

    [Tags]

    Login and navigate to staffing page and verify staffing plan displayed


4__As a user Login and navigate to staffing page and verify able to select different days and verify staffing plan reflected accordingly

    [Tags]

    Login and navigate to staffing page and verify able to select different days and verify staffing plan reflected accordingly


5__As a user Login and navigate to staffing page and verify able to select different months

    [Tags]

    navigate to staffing page and verify able to select different months


6__As a user Login and navigate to staffing page and verify export to PDF and PNG

    [Tags]

    navigate to staffing page and verify export to PDF and PNG

7__As a user Login and navigate to staffing page and verify Create a new shift pop is displayed on clicking in difference

    [Tags]

    navigate to staffing page and verify Create a new shift pop is displayed on clicking in difference

8__As a user Login and navigate to staffing page and verify Create a new shift pop screen

    [Tags]

    navigate to staffing page and verify Create a new shift pop screen


9__As a user Login and navigate to staffing page and Create a new shift

    [Tags]

    navigate to staffing page and Create a new shift


10__As a user Login and navigate to staffing page and Number of workers and Duration (hours) field mandatory

    [Tags]

    navigate to staffing page and Number of workers and Duration (hours) field mandatory


11__As a user Login and navigate to staffing page and verify Load a staffing plan pop screen

    [Tags]

     navigate to staffing page and verify Load a staffing plan pop screen


12__As a user Login and navigate to staffing page and verify Download as CSV ,Copy to a different day and Clear shifts

    [Tags]

    navigate to staffing page and verify Download as CSV and other options


13__As a user Login and navigate to staffing page and verify Copy shifts from to another day popup screen

    [Tags]

    navigate to staffing page and verify Copy shifts from to another day popup screen

14__As a user Login and navigate to staffing page and verify Clear shifts from the following days popup screen

     [Tags]

    navigate to staffing page and verify Clear shifts from the following days popup screen



