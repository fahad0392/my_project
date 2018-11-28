*** Settings ***
Documentation    Suite description

Resource        ../resources/admin/admincommon.robot   # necessary for Setup & Teardown
Resource        ../resources/admin/adminlogin.robot    # necessary for lower level keywords in test cases
Resource        ../resources/admin/adminmetrics.robot   # necessary for lower level keywords in test cases

Library         SeleniumLibrary

Suite Setup     Start metricsuite
#Test Setup       Begin Test
#Test Teardown    End Test
Suite Teardown   End metricsuite


# Copy/paste the below command to Terminal to execute:
# pybot -d results/admin -i admin tests/adminmetrics.robot


*** Test Cases ***


1__As Admin user should be able navigate to METRICS page

    [Tags]  regression-test  admin-metrics  daily-smoketest

    Navigate to metricpage and verify page

2__As Admin user should be able to do simple metric search

    [Tags]  regression-test  admin-metrics  daily-smoketest

    simple metric search

3__As Admin user should be able to do metrics search by filtering Table

    [Tags]  regression-test  admin-metrics

    verify search using by selecting table list

4__As Admin user should be able to do metrics search by filtering work area

    [Tags]  regression-test  admin-metrics

    verify metric search by selecting value from work area drop down list

5__As Admin user should be able to do to reset filters when 0 metrics search result

    [Tags]  regression-test  admin-metrics

    verify able to do metric reset by clikcing link try to reset filters

6__As Admin user should be able navigate to ADD METRIC page by clicking on "Add Metric" button

    [Tags]  regression-test  admin-metrics

    verify able to navigate to Creating new metric page by clicking Add Metric

7__As Admin user should able to verify "INFO" tab selected by default

    [Tags]  regression-test  admin-metrics

    verify "INFO" tab selected by default

8__As Admin user should able to verify "INFO" tab field content

    [Tags]  regression-test  admin-metrics

    verify "INFO" tab field content

9__As Admin user should able to verify "Name" field is mandatory

    [Tags]  regression-test  admin-metrics

    verify "Name" field is mandatory

10__As Admin user should able to verify Metric with this Name already exists

    [Tags]  regression-test  admin-metrics

    verify Metric with this Name already exists

11__As Admin user should able to verify "Description" field is mandatory

    [Tags]  regression-test  admin-metrics

    verify "Description" field is mandatory

12__As Admin user should able to verify "Units" field is mandatory

    [Tags]  regression-test  admin-metrics

    verify "Units" field is mandatory

13__As Admin user should able to verify "Abbreviation" field is mandatory

    [Tags]  regression-test  admin-metrics

    verify "Abbreviation" field is mandatory

14__As Admin user should able to verify "Workarea" field is mandatory

    [Tags]  regression-test  admin-metrics

    verify "Workarea" field is mandatory

15__As Admin user should able to verify "Best If goes" field is mandatory

    [Tags]  regression-test  admin-metrics

    verify "Best If goes" field is mandatory

16__As Admin user should able to navigate to "DATA" tab under Add metric

    [Tags]  regression-test  admin-metrics

    verify able to navigate to "DATA" tab under Add metric

17__As Admin user should able to verify "DATA" tab fields content

    [Tags]  regression-test  admin-metrics

    verify "DATA" tab field content tab under Add metric

18__As Admin user should able to verify 'Which Table' and 'On' fields are visible on selecting 'Requires Join' check box

    [Tags]  regression-test  admin-metrics

    verify 'Which Table' and 'On' fields are visible on selecting 'Requires Join' check box

19__As Admin user should able to verify able to select What Type check box's

    [Tags]  regression-test  admin-metrics

    verify able to select What Type check box's

20__As Admin user should able to navigate to "Metric definitions" tab under Add metric

    [Tags]  regression-test  admin-metrics

    verify able to navigate to "Metric definitions" tab under Add metric

21__As Admin user should able to verify "Metric definitions" tab fields content

    [Tags]  regression-test  admin-metrics

    verify "Metric definitions" tab field content tab under Add metric

###############################################

22__As Admin user should able to Create new metric

     [Tags]  regression-test  admin-metrics  daily-smoketest

   verify able to create new metric

23__As Admin user should able to Delete new metric created

     [Tags]  regression-test  admin-metrics

   verify able to Delete selected metrics  daily-smoketest

24__As Admin user should able to Create new metric and able to modify in edit mode

     [Tags]  regression-test  admin-metrics

   verify able to create new metric and edit

25__As Admin user should able to verify Save as new option available in edit mode

     [Tags]  regression-test  admin-metrics

   verify Save as new option available in edit mode

26__As Admin user should able to Save as new metric in edit mode

     [Tags]  regression-test  admin-metrics

   verify able to Save as new metric in edit mode

27__As Admin user should able to "Save and add another" metric

     [Tags]  regression-test  admin-metrics

   verify able to Save and add another metric

28__As Admin user should able to "Save and add another" metric in edit mode

     [Tags]

   verify able to Save and add another metric in edit mode

29__As Admin user should able to "Delete" metric in edit mode

     [Tags]  regression-test  admin-metrics

   verify able to Delete metric in edit mode

30__As Admin user should able to verify query build using "Validate" button

    [Tags]  regression-test  admin-metrics

    validate the query builder

31__As Admin user should able to build incorrect query and verify same using button "Validate" for warning message

    [Tags]  regression-test  admin-metrics

    validate the query builder with incorrect query

32__As Admin user should able to Set row stats and verify same

    [Tags]  regression-test  admin-metrics

    validate the Set row stats

33__As Admin user should able to navigate to History page in metric in edit mode

     [Tags]  regression-test_add  admin-metrics

    verify Admin user should able to navigate to History page in metric