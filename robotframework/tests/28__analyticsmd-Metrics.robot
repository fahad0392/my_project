*** Settings ***
Documentation    Suite description

Resource        ../resources/amd/common.robot   # necessary for Setup & Teardown
Resource        ../resources/amd/metrics.robot    # necessary for lower level keywords in test cases


Library         SeleniumLibrary

Test Setup       Begin Test
Test Teardown    End Test


*** Test Cases ***

###### Metrics ##############

01__As a user Login and Metrics page

    [Tags]  regression-test  metrics  daily-smoketest

    login and verify Metrics page

02__As a user Login and navigate to Metrics page and hospital ,workarea,metric and time range

    [Tags]  regression-test  metrics  daily-smoketest

    navigate to Metrics page and hospital workarea metric and time range

03__As a user Login and navigate to Metrics page and able to select time range

    [Tags]  regression-test  metrics  daily-smoketest

    navigate to Metrics page and able to select time range

04__As a user Login and navigate to Metrics page and verify deep drive

    [Tags]  regression-test  metrics

    navigate to Metrics page and verify deep drive page

05__As a user Login and navigate to Metrics page and "I want to see this metric by" different options

    [Tags]  regression-test  metrics

    navigate to Metrics page and veiw and verify Metrics by selecting different option avaialble from "I want to see this metric by"

06__As a user Login and navigate to Metrics page and select "Show me x points" different options

    [Tags]  regression-test  metrics

   navigate to Metrics page and select "Show me x points" different options

07__As a user Login and navigate to Metrics page and select "Sort" different options

    [Tags]  regression-test  metrics

   navigate to Metrics page and select "sort" different options

08__As a user Login and navigate to Metrics page and select "Display charts" different options

    [Tags]  regression-test  metrics

   navigate to Metrics page and select "display" different options

09__As a user Login and navigate to Metrics page and select "Vertical Bar Chart" and by selecting Show me 5 points and Show labels checked verify chart is displayed

    [Tags]  regression-test  metrics  daily-smoketest

   navigate to Metrics page and select "Vertical Bar Chart" and check chart is displayed

10__As a user Login and navigate to Metrics page and select "Horizontal Bar Chart" and by selecting Show me 5 points and Show labels checked verify chart is displayed

    [Tags]  regression-test  metrics

   navigate to Metrics page and select "Horizontal Bar Chart" and check chart is displayed

11__As a user Login and navigate to Metrics page and select "Line Chart" and by selecting Show me 5 points and Show labels checked verify chart is displayed

    [Tags]  regression-test  metrics

   navigate to Metrics page and select "Line Chart" and check chart is displayed

12__As a user Login and navigate to Metrics page and select "Area Chart" and by selecting Show me 5 points and Show labels checked verify chart is displayed

    [Tags]  regression-test  metrics

   navigate to Metrics page and select "Area Chart" and check chart is displayed

13__As a user Login and navigate to Metrics page and select "Pie Chart" and by selecting Show me 5 points and Show labels checked verify chart is displayed

    [Tags]  regression-test  metrics

   navigate to Metrics page and select "Pie Chart" and check chart is displayed

14__As a user Login and navigate to Metrics page and select "Box Chart" and by selecting Show me 5 points and Show labels checked verify chart is displayed

    [Tags]  regression-test  metrics  daily-smoketest

   navigate to Metrics page and select "Box Plot" and check chart is displayed

15__As a user Login and navigate to Metrics page and verify choose grouping drop down list

    [Tags]  regression-test  metrics

   navigate to Metrics page and verify choose grouping drop down list

16__As a user Login and navigate to Metrics page and select value from grouping drop down list and verify Display drop down list

    [Tags]  regression-test  metrics

   navigate to Metrics page and select value from grouping drop down list and verify Display drop down list

17__As a user Login and navigate to Metrics page and select value from grouping drop down list and verify Vertical Bar Chart

    [Tags]  regression-test  metrics

   navigate to Metrics page and select value from grouping drop down list and verify Vertical Bar Chart

18__As a user Login and navigate to Metrics page and select value from grouping drop down list and Horizontal Bar Chart Chart

    [Tags]  regression-test  metrics

   navigate to Metrics page and select value from grouping drop down list and Horizontal Bar Chart Chart

19__As a user Login and navigate to Metrics page and select value from grouping drop down list and Stacked Vertical Bar Chart

    [Tags]  regression-test  metrics

   navigate to Metrics page and select value from grouping drop down list and verify Stacked Vertical Bar Chart


20__As a user Login and navigate to Metrics page and select value from grouping drop down list and Stacked Horizontal Bar Chart

    [Tags]  regression-test  metrics

   navigate to Metrics page and select value from grouping drop down list and Stacked Horizontal Bar Chart

21__As a user Login and navigate to Metrics page and select value from grouping drop down list and Stacked Vertical Bar (%) Chart

    [Tags]  regression-test  metrics

   navigate to Metrics page and select value from grouping drop down list and verify Stacked Vertical Bar (%) Chart


22__As a user Login and navigate to Metrics page and select value from grouping drop down list and Stacked Horizontal Bar (%) Chart

    [Tags]  regression-test  metrics

   navigate to Metrics page and select value from grouping drop down list and Stacked Horizontal Bar (%) Chart

23__As a user Login and navigate to Metrics page and select value from grouping drop down list and Heatmap

    [Tags]  regression-test  metrics  daily-smoketest

   navigate to Metrics page and select value from grouping drop down list and verify Heatmap

24__As a user Login and navigate to Metrics page and select value from But I only want to show it for drop down list and update Deep drive filter

    [Tags]  regression-test  metrics

   navigate to Metrics page and select value from But I only want to show it for drop down list and update Deep drive filter

25__As a user Login and navigate to Metrics page and able to apply multiple filter by selecting value from But I only want to show it for drop down list

    [Tags]  regression-test  metrics

   navigate to Metrics page and able to apply multiple filter by selecting value from But I only want to show it for drop down list

26__As a user Login and navigate to Metrics page and verify Download options for Chart

    [Tags]  regression-test  metrics

    navigate to Metrics page and verify Download options for Chart

27__As a user Login and navigate to Go to Explain under Metrics page

    [Tags]  regression-test  metrics  daily-smoketest

    navigate to Go to Explain under Metrics page

28__As a user Login and navigate to 'Go to Explain' under Metrics page and verify watch metrics and stop watching

    [Tags]  regression-test  metrics  daily-smoketest

    navigate to 'Go to Explain' under Metrics page and verify watch metrics and stop watching

29__As a user Login and navigate to 'Go to Explain' under Metrics page and verify Explain Why!

    [Tags]  regression-test  metrics

    navigate to 'Go to Explain' under Metrics page and verify Explain Why!
