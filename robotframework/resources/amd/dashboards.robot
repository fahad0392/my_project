*** Settings ***
Documentation    Suite description

Resource    ../../resources/amd/pom/signinobj.robot
Resource    ../../resources/amd/pom/leftpaneobj.robot
Resource    ../../resources/amd/pom/homepageobj.robot
Resource    ../../resources/amd/pom/profilepageobj.robot
Resource    ../../resources/amd/pom/dashboardpageobj.robot

*** Keywords ***
#################HomePage################

login and verify home page

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    homepageobj.verify AMD home page loaded
    homepageobj.verify home page content

verify able to select hospital from your facilities list

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    homepageobj.verify AMD home page loaded
    homepageobj.select value from your facilities drop down list
    homepageobj.verify selected hospital snapshot
    homepageobj.select 'your facilities' value from your facilities drop down list
    homepageobj.verify your facilities is reset to default

search for dashboard from "Search for dashboard or metric" search field present in home page

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    homepageobj.verify AMD home page loaded
    homepageobj.Search for dashboard or metric from home page  ${HOME_DASHBOARD_SEARCH}
    dashboardpageobj.verify selected dashboard is displayed when dashboard searched from home page

search for Metrics from "Search for dashboard or metric" search field present in home page
    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    homepageobj.verify AMD home page loaded
    homepageobj.Search for dashboard or metric from home page  ${HOME_METRIC_SEARCH}
    homepageobj.verify Metrics page is displayed

view the dashboard by clicking on dashboard link under Recent Dashboards section

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    homepageobj.verify AMD home page loaded
    homepageobj.click dashboard link under Recent Dashboards
    dashboardpageobj.verify selected Recent Dashboards dashboard is displayed

view the Metric by clicking on Metric link under Recent Metrics section

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    homepageobj.verify AMD home page loaded
    homepageobj.click Metrics link under Recent Metrics
    homepageobj.verify Metrics page is displayed



#### Dashboard ###########

login as dashboard owner

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page

login and click on dashboard drop down

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click dashboard drop down
    dashboardpageobj.verify dashboard drop down page


Click the dashboard drop down and change the current dashboard

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.get the current dashboard
    dashboardpageobj.click dashboard drop down
    dashboardpageobj.verify dashboard drop down page
    dashboardpageobj.select dashboard under owner list


Click the dashboard drop down and change the dashboard under editor and verify

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click dashboard drop down
    dashboardpageobj.verify dashboard drop down page
    dashboardpageobj.select dashboard under Editor list


verify Unsubscribe and Edit option are present for dashboard having edit permission

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click dashboard drop down
    dashboardpageobj.verify dashboard drop down page
    dashboardpageobj.select dashboard under Editor list
    dashboardpageobj.click on Actions drop drop list
    dashboardpageobj.verify Unsubscribe option in Actions drop drop list
    dashboardpageobj.verify edit button in Dashboards page



Click the dashboard drop down and change the dashboard under Viewer and verify

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click dashboard drop down
    dashboardpageobj.verify dashboard drop down page
    dashboardpageobj.select dashboard under Viewer list


verify Unsubscribe and No Edit option are present for dashboard having view permission

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click dashboard drop down
    dashboardpageobj.verify dashboard drop down page
    dashboardpageobj.select dashboard under Viewer list
    dashboardpageobj.click on Actions drop drop list
    dashboardpageobj.verify Unsubscribe option in Actions drop drop list
    dashboardpageobj.click on Actions drop drop list
    dashboardpageobj.verify No edit button in Dashboards page having view permission


click on dashboard Time Intervals drop down and verify list

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click on Time Intervals drop down in Dashboards page
    dashboardpageobj.verify Time Intervals drop down values in Dashboards

click on dashboard Time Intervals drop down and select different value from the list

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click on Time Intervals drop down in Dashboards page
    dashboardpageobj.select values from Time Intervals drop down in Dashboards and verify

click on Choose time range in dashboard Time Intervals drop down and verify Custom timeframe

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click on Time Intervals drop down in Dashboards page
    dashboardpageobj.select Choose time range from Time Intervals drop down in Dashboards
    dashboardpageobj.verify Custom timeframe pop up screen
    dashboardpageobj.close Custom timeframe popup

click on 'Choose time range' in dashboard Time Intervals drop down and select a predefined range

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.select the dashboard
    dashboardpageobj.click on Time Intervals drop down in Dashboards page
    dashboardpageobj.select Choose time range from Time Intervals drop down in Dashboards
    dashboardpageobj.verify Custom timeframe pop up screen
    dashboardpageobj.click on ALL button in Custom timeframe
    dashboardpageobj.click on Finish button in Custom timeframe
    dashboardpageobj.verify graph loaded

Expand a chart under Dashboards page

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.select the dashboard
    dashboardpageobj.click on Time Intervals drop down in Dashboards page
    dashboardpageobj.select Choose time range from Time Intervals drop down in Dashboards
    dashboardpageobj.verify Custom timeframe pop up screen
    dashboardpageobj.click on ALL button in Custom timeframe
    dashboardpageobj.click on Finish button in Custom timeframe
    dashboardpageobj.verify graph loaded
    dashboardpageobj.click on icon-zoom-in
    dashboardpageobj.verify chart expand view page
    dashboardpageobj.click on close x button in Expanded View

click on Actions drop down and verify list

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click on Actions drop drop list
    dashboardpageobj.veriy Actions drop drop list

click on Actions drop down and verify Add drop down list

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click on Actions drop drop list
    dashboardpageobj.veriy Actions drop drop list
    dashboardpageobj.mouse over on Add Actions
    dashboardpageobj.verify Add drop down values

navigate to Add Key Metric page and verify

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click on Actions drop drop list
    dashboardpageobj.veriy Actions drop drop list
    dashboardpageobj.mouse over on Add Actions
    dashboardpageobj.verify Add drop down values
    dashboardpageobj.select value Metric from add drop down
    dashboardpageobj.verify Add Key Metric page

navigate to Add Key Metric page,enter all the information and submit

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.click dashboard drop down
    dashboardpageobj.Click on Add to Create new Dashboard
    dashboardpageobj.verify Create Dashboard popup screen
    dashboardpageobj.Fill new Dashboard Name
    dashboardpageobj.click on Create button present in Create Dashboard
    dashboardpageobj.verify new test dashboard is created
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click on Actions drop drop list
    dashboardpageobj.veriy Actions drop drop list
    dashboardpageobj.mouse over on Add Actions
    dashboardpageobj.verify Add drop down values
    dashboardpageobj.select value Metric from add drop down
    dashboardpageobj.verify Add Key Metric page
    dashboardpageobj.select value from Which hospital is this metric in? list
    dashboardpageobj.select the value from Which department, if any, is this metric associated with? list
    dashboardpageobj.select the value from Finally, choose your metric list
    dashboardpageobj.Click submit button under Add Key Metric page
    dashboardpageobj.verify Add Key Metric
    dashboardpageobj.click on Actions drop drop list
    dashboardpageobj.veriy Actions drop drop list
    dashboardpageobj.click on delete dashboard


navigate to Add Graph page and verify

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click on Actions drop drop list
    dashboardpageobj.veriy Actions drop drop list
    dashboardpageobj.mouse over on Add Actions
    dashboardpageobj.verify Add drop down values
    dashboardpageobj.select value Graph from add drop down
    dashboardpageobj.verify Add Graph page


navigate to Add Graph page,enter all the information and submit

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.click dashboard drop down
    dashboardpageobj.Click on Add to Create new Dashboard
    dashboardpageobj.verify Create Dashboard popup screen
    dashboardpageobj.Fill new Dashboard Name
    dashboardpageobj.click on Create button present in Create Dashboard
    dashboardpageobj.verify new test dashboard is created
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click on Actions drop drop list
    dashboardpageobj.veriy Actions drop drop list
    dashboardpageobj.mouse over on Add Actions
    dashboardpageobj.verify Add drop down values
    dashboardpageobj.select value Graph from add drop down
    dashboardpageobj.verify Add Graph page
    dashboardpageobj.Fill Give the graph a name under Add Graph
    dashboardpageobj.select value from Which hospital is this metric in? list under Add Graph
    dashboardpageobj.select the value from Which department, if any, is this metric associated with? list under Add Graph
    dashboardpageobj.select the value from Finally, choose your metric list under Add Graph
    dashboardpageobj.click on Add Metric button present under Add Graph
    dashboardpageobj.Click submit button under Add Graph page
    dashboardpageobj.verify new Graph added under new dashboard
    dashboardpageobj.click on Actions drop drop list
    dashboardpageobj.veriy Actions drop drop list
    dashboardpageobj.click on delete dashboard

navigate to Add Table page and verify

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click on Actions drop drop list
    dashboardpageobj.veriy Actions drop drop list
    dashboardpageobj.mouse over on Add Actions
    dashboardpageobj.verify Add drop down values
    dashboardpageobj.select value Table from add drop down
    dashboardpageobj.verify Add Table

navigate to Add Table page,enter tablename and submit

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    #dashboardpageobj.verify dashboards page
    dashboardpageobj.click dashboard drop down
    dashboardpageobj.Click on Add to Create new Dashboard
    dashboardpageobj.verify Create Dashboard popup screen
    dashboardpageobj.Fill new Dashboard Name
    dashboardpageobj.click on Create button present in Create Dashboard
    dashboardpageobj.verify new test dashboard is created
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click on Actions drop drop list
    dashboardpageobj.veriy Actions drop drop list
    dashboardpageobj.mouse over on Add Actions
    dashboardpageobj.verify Add drop down values
    dashboardpageobj.select value Table from add drop down
    dashboardpageobj.verify Add Table
    dashboardpageobj.Enter new table name
    dashboardpageobj.Click submit button under Add Table page

navigate to Print page and verify

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click on Actions drop drop list
    dashboardpageobj.veriy Actions drop drop list
    dashboardpageobj.select value Print from Actions list
    dashboardpageobj.verify Print this dashboard to PDF page

navigate to Share/Manage page and verify

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click on Actions drop drop list
    dashboardpageobj.veriy Actions drop drop list
    dashboardpageobj.select value Share/Manage from Actions list
    dashboardpageobj.verify Share/Manage page


navigate to Dashboards ,click on Edit button and verify edit mode

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click on edit button in Dashboards page
    dashboardpageobj.verify edit mode is enabled to edit Dashboards
    dashboardpageobj.click on edit button in Dashboards page


navigate to Dashboards ,click on ADD to view Create Dashboard popup screen

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click dashboard drop down
    dashboardpageobj.verify dashboard drop down page
    dashboardpageobj.Click on Add to Create new Dashboard
    dashboardpageobj.verify Create Dashboard popup screen


navigate to Dashboards and new Create Dashboard

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Dashboards icon
    dashboardpageobj.verify dashboards page
    dashboardpageobj.click dashboard drop down
    dashboardpageobj.verify dashboard drop down page
    dashboardpageobj.check automation test dashboard is present if present delete the same
    #dashboardpageobj.click dashboard drop down
    #dashboardpageobj.verify dashboard drop down page
    #dashboardpageobj.Click on Add to Create new Dashboard
    dashboardpageobj.verify Create Dashboard popup screen
    dashboardpageobj.Fill new Dashboard Name
    dashboardpageobj.click on Create button present in Create Dashboard