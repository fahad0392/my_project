*** Settings ***
Documentation    Suite description

Resource        ../resources/amd/common.robot   # necessary for Setup & Teardown
Resource        ../resources/amd/dashboards.robot    # necessary for lower level keywords in test cases


Library         SeleniumLibrary

Test Setup       Begin Test
Test Teardown    End Test


# Copy/paste the below command to Terminal to execute:
# pybot -d results/login --reporttitle "analyticsMD Funcational Automation Test Summary Report"  --logtitle "analyticsMD Funcational Automation Test Detailed LOG" --variable URL:<Enter url undertest> --variable ADMIN_URL:<Enter url undertest>  tests/27__analyticsmd-Dashboards.robot

*** Test Cases ***

###### Homepage #####

1__As user login and verify home page

    [Tags]  regression-test  dashboards  daily-smoketest

   login and verify home page

2__As user login and verify able to select hospital from your facilities list

    [Tags]  regression-test  dashboards  daily-smoketest

   verify able to select hospital from your facilities list


3__As user login and verify able to search for dashboard from "Search for dashboard or metric" search field present in home page

    [Tags]  regression-test  dashboards  daily-smoketest

    search for dashboard from "Search for dashboard or metric" search field present in home page

4__As user login and verify able to search for Metrics from "Search for dashboard or metric" search field present in home page

    [Tags]  regression-test  dashboards  daily-smoketest

    search for Metrics from "Search for dashboard or metric" search field present in home page

5__As user login and verify able to view the dashboard by clicking on dashboard link under Recent Dashboards section

    [Tags]  regression-test  dashboards

    view the dashboard by clicking on dashboard link under Recent Dashboards section

6__As user login and verify able to view the Metric by clicking on Metric link under Recent Metrics section

    [Tags]  regression-test  dashboards

    view the Metric by clicking on Metric link under Recent Metrics section

7__login and view a dashboard as a owner.

    [Tags]  regression-test  dashboards

    login as dashboard owner

###### dashboard #####

8__As user click on dashboard drop down and verify page content

    [Tags]  regression-test  dashboards  daily-smoketest

    login and click on dashboard drop down

9__As user click on dashboard drop down and change the dashboard under owner and verify

    [Tags]  regression-test  dashboards  daily-smoketest

    Click the dashboard drop down and change the current dashboard

10__As user click on dashboard drop down and change the dashboard under Editor and verify

    [Tags]  regression-test  dashboards

    Click the dashboard drop down and change the dashboard under editor and verify

11__As user click on dashboard verify Unsubscribe and Edit option are present for dashboard having edit permission

    [Tags]  regression-test  dashboards

    verify Unsubscribe and Edit option are present for dashboard having edit permission

12__As user click on dashboard drop down and change the dashboard under Viewer and verify

    [Tags]  regression-test  dashboards

    Click the dashboard drop down and change the dashboard under Viewer and verify

13__As user click on dashboard verify Unsubscribe and No Edit option are present for dashboard having view permission

    [Tags]  regression-test  dashboards

    verify Unsubscribe and No Edit option are present for dashboard having view permission

14__As user click on dashboard Time Intervals drop down and verify list

    [Tags]  regression-test  dashboards  daily-smoketest

    click on dashboard Time Intervals drop down and verify list

15__As user click on dashboard Time Intervals drop down and select different value from the list

    [Tags]  regression-test  dashboards  daily-smoketest

    click on dashboard Time Intervals drop down and select different value from the list


16__As user click on 'Choose time range' in dashboard Time Intervals drop down verify Custom timeframe

    [Tags]  regression-test  dashboards  daily-smoketest

    click on Choose time range in dashboard Time Intervals drop down and verify Custom timeframe

17__As user click on 'Choose time range' in dashboard Time Intervals drop down and select a predefined range

    [Tags]  regression-test  dashboards  daily-smoketest

    click on 'Choose time range' in dashboard Time Intervals drop down and select a predefined range

18__As user click on + button to Expand a chart under Dashboards page

    [Tags]  regression-test  dashboards

     Expand a chart under Dashboards page

19__As user click on dashboard Actions drop down and verify list

    [Tags]  regression-test  dashboards

    click on Actions drop down and verify list

20__As user click on dashboard Actions drop down and verify Add drop down ist

    [Tags]  regression-test  dashboards

    click on Actions drop down and verify Add drop down list

21__As user navigate to Add Key Metric page and verify

    [Tags]  regression-test  dashboards  daily-smoketest

    navigate to Add Key Metric page and verify

22__As user navigate to Add Key Metric page ,enter all the infomration and submit

    [Tags]  regression-test  dashboards  daily-smoketest

    navigate to Add Key Metric page,enter all the information and submit

23__As user navigate to Add Graph page and verify

    [Tags]  regression-test  dashboards  daily-smoketest

    navigate to Add Graph page and verify

24__As user navigate to Add Graph page and enter all the infomration and submit

    [Tags]  regression-test  dashboards  daily-smoketest

    navigate to Add Graph page,enter all the information and submit

25__As user navigate to Add Table page and verify

    [Tags]  regression-test  dashboards  daily-smoketest

    navigate to Add Table page and verify

26__As user navigate to Add Table page and enter all the infomration and submit

    [Tags]  regression-test  dashboards  daily-smoketest

    navigate to Add Table page,enter tablename and submit

27__As user navigate to Add Print page and verify

    [Tags]  regression-test  dashboards

    navigate to Print page and verify

28__As user navigate to Share/Manage page and verify

    [Tags]  regression-test  dashboards

    navigate to Share/Manage page and verify

29__As user navigate to Dashboards ,click on Edit button and verify edit mode

    [Tags]  regression-test  dashboards

    navigate to Dashboards ,click on Edit button and verify edit mode

30__As user navigate to Dashboards ,click on ADD to view Create Dashboard popup screen

    [Tags]  regression-test  dashboards

    navigate to Dashboards ,click on ADD to view Create Dashboard popup screen

31__As user navigate to Dashboards and new Create Dashboard

    [Tags]  regression-test  dashboards

    navigate to Dashboards and new Create Dashboard