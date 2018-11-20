*** Settings ***
Library         SeleniumLibrary
Resource        ../pom/../amdvariables.robot
Resource        leftpaneobj.robot

*** Keywords ***
###################Homepage###########

verify AMD home page loaded

    page should contain element  css=.icon-home

verify Dashboards page loaded

     run keyword if  page should contain link  Click to create dashboard
     ...   log    You don't have any dashboards
     ...   ELSE
     ...   fail   page should contain element  xpath=//*[@id='dashboard-view']/div[1]/div/div[1]/h3

verify Dashboards page loaded1

     page should contain  Dashboards
     Location Should Contain  dashboard

verify Metrics page loaded

    #Page Should Contain Button     Go to Explain
    page should contain element  xpath=//*[@id='metric-view']/div[2]/div/div/div[1]/div[1]/div/a[2]

verfiy Alert page loaded


    page should contain element  xpath=//*[@id='notification-view']/div[2]/div/h4[1]
    page should contain element  xpath=//*[@id='notification-view']/div[1]/div/div/h3

verfiy Staffing page loaded


    page should contain element  xpath=//h3[text()='Staffing']


verfiy missionControl page loaded

    Set Browser Implicit Wait	30 seconds
    title should be  ED mission control

###################Dashboards###########3

verify dashboards page

    sleep  5s
    page should contain  Dashboards
    page should contain element  xpath=//div[@id='dashboard-view']/div/div/div/h3[@class='hero-unit-title']
    page should contain element  xpath=//h4[@class='dashboard-name hero-unit-title dropdown-toggle']

    #Time Intervals
    page should contain element  xpath=//a[@class='btn btn-flat dropdown-toggle']/i[@class='icon-time']
    #page should contain element  xpaht=(//a[@class='btn btn-flat dropdown-toggle']/span[@class='display-interval'])[1]

    # Action drop down
    page should contain element  xpath=//a[@class='btn btn-flat dropdown-toggle']/i[@class='icon-inbox']


    #Edit TODO
    #page should contain element  xpath=//a [@class='btn btn-flat toggle-edit-mode']/i[@class='icon-edit']
    page should contain element  xpath=//span[@class='edit-mode-t-label']



click dashboard drop down

    click element  css=.dashboard-name.hero-unit-title.dropdown-toggle
    #click element  xpath=//h4[@class='dashboard-name hero-unit-title dropdown-toggle']
    wait until page contains element  css=.text-info.add-dashboard>a  2s
    #sleep  2s

verify dashboard drop down page

    page should contain  Owner
    page should contain  Editor
    page should contain  Viewer
    # + Add to (Create Dashboard)
    page should contain  Add
    #page should contain element  xpath=//li[@class='text-info add-dashboard']/a[text()='Add']
    page should contain element  css=.text-info.add-dashboard>a

check automation test dashboard is present if present delete the same

    ${status}=  run keyword and return status  page should not contain  ${CREATE_DASHBOARD}
    log  ${status}
    run keyword if  ${status} ==True  Click on Add to Create new Dashboard
    #run keyword if  ${status} ==True  sleep  1s
    run keyword unless  ${status} ==True  delete automation test dashboard

delete automation test dashboard

    click link  //div[@class='span9']/ul/li/a[contains(text(), '${CREATE_DASHBOARD}')]
    sleep  2s
    #${current_dash} =  get text  xpath=//div[@class='dashboard-name span']/a/h4
    ${current_dash} =  get text  css=.dashboard-name.hero-unit-title.dropdown-toggle
    log  ${current_dash}
    should be equal as strings  ${current_dash}  ${CREATE_DASHBOARD}
    click on Actions drop drop list
    veriy Actions drop drop list
    click on delete dashboard
    leftpaneobj.click on Dashboards icon
    click dashboard drop down
    Click on Add to Create new Dashboard


Click on Add to Create new Dashboard

    #click element  xpath=//i[@class='icon-plus-sign-alt']
    #wait until element is visible  css=.icon-plus-sign-alt  2s
    click element  css=.text-info.add-dashboard>a
    #click element  css=.icon-plus-sign-alt  .icon-plus-sign-alt

verify Create Dashboard popup screen

    page should contain  Create Dashboard
    page should contain  Dashboard Name
    page should contain textfield  name=name
    page should contain button  Create
    page should contain button  Cancel

Fill new Dashboard Name

    #[Arguments]      ${CREATE_DASHBOARD}
    #input text  name=name  ${CREATE_DASHBOARD}
    #click element  css=.name
    #input text  css=.name  ${CREATE_DASHBOARD}
    #input text into prompt  ${CREATE_DASHBOARD}
    input text  xpath=//div[@class='modal hide in']//input  ${CREATE_DASHBOARD}

click on Create button present in Create Dashboard

    #click button  Create
    click button  xpath=//div[@class='modal hide in']//button[@class='btn btn-success']
    #click button  css=.btn.btn-success

click on Cancel button present in Create Dashboard

    click button  Cancel


verify new test dashboard is created

   sleep  5s
   page should contain  Dashboards
   page should contain  ${CREATE_DASHBOARD}
   page should contain  You don't have any key metrics. Click to add a key metric.
   #page should contain element  xpath=//a[@class='btn add-keymetric']
   page should contain element  css=.btn.add-keymetric
   page should contain  You don't have any graphs. Click to add a graph.
   #page should contain element  xpath=//a[@class='btn add-graph']
   page should contain element  css=.btn.add-graph
   page should contain  You don't have any viewtables. Click to add a table.
   #page should contain element  xpath=//a[@class='btn add-viewtable']
   page should contain element  css=.btn.add-viewtable





verify selected dashboard is displayed when dashboard searched from home page

    page should contain  Dashboards
    #${current_dash} =  get text  xpath=//div[@class='dashboard-name span']/a/h4
    ${current_dash} =  get text  css=.dashboard-name.hero-unit-title.dropdown-toggle
    log  ${current_dash}
    should be equal as strings  ${current_dash}  ${HOME_DASHBOARD_SEARCH}

verify selected Recent Dashboards dashboard is displayed

    page should contain  Dashboards
    page should contain element  css=.dashboard-name.hero-unit-title.dropdown-toggle
    #${current_dash} =  get text  xpath=//div[@class='dashboard-name span']/a/h4
    #${current_dash} =  get text  css=.dashboard-name.hero-unit-title.dropdown-toggle
    #log  ${current_dash}
    #should be equal as strings  ${current_dash}  ${HOME_RECENT_DASHBOARD}


get the current dashboard

    #${current_dash} =  get text  xpath=//div[@class='dashboard-name span']/a/h4
    ${current_dash} =  get text  css=.dashboard-name.hero-unit-title.dropdown-toggle
    log  ${current_dash}
    #should be equal as strings  ${current_dash}  A good dash
    ${status}=  run keyword and return status  should be equal as strings  ${current_dash}  ${DASHBOARD1}
    log  ${status}
    run keyword if  ${status} ==True  sleep  1s
    run keyword unless  ${status} ==True  select the dashboard

select the dashboard

    click dashboard drop down
    click link  //div[@class='span9']/ul/li/a[contains(text(), '${DASHBOARD1}')]
    #//li/a[contains(text(), 'A good dash')]

select dashboard under owner list

     sleep  5s
     wait until element is visible  xpath=//div[@class='span9']/ul/li/a[contains(text(), '${DASHBOARD2}')]
     page should contain link  ${DASHBOARD2}
     log  ${DASHBOARD2}
     sleep  5s
     click link  xpath=//div[@class='span9']/ul/li/a[contains(text(), '${DASHBOARD2}')]
     ${current_dash} =  get text  xpath=//div[@class='dashboard-name span']/a/h4
     #${current_dash} =  get text  css=.dashboard-name.hero-unit-title.dropdown-toggle
     log  ${current_dash}
     should be equal as strings  ${current_dash}  ${DASHBOARD2}

select dashboard under Editor list

     sleep  2s
     wait until element is visible  xpath=//div[@class='span9']/ul/li/a[contains(text(), '${EDITOR_DASHBOARD1}')]
     page should contain link  ${EDITOR_DASHBOARD1}
     log  ${EDITOR_DASHBOARD1}
     sleep  5s
     click link  xpath=//div[@class='span9']/ul/li/a[contains(text(), '${EDITOR_DASHBOARD1}')]
     #${current_dash} =  get text  xpath=//div[@class='dashboard-name span']/a/h4
     ${current_dash} =  get text  css=.dashboard-name.hero-unit-title.dropdown-toggle
     log  ${current_dash}
     should be equal as strings  ${current_dash}  ${EDITOR_DASHBOARD1}
     click dashboard drop down
     sleep  2s
     wait until element is visible  xpath=//div[@class='span9']/ul/li/a[contains(text(), '${EDITOR_DASHBOARD2}')]
     page should contain link  ${EDITOR_DASHBOARD2}
     log  ${EDITOR_DASHBOARD2}
     sleep  5s
     click link  xpath=//div[@class='span9']/ul/li/a[contains(text(), '${EDITOR_DASHBOARD2}')]
     #${current_dash} =  get text  xpath=//div[@class='dashboard-name span']/a/h4
     ${current_dash} =  get text  css=.dashboard-name.hero-unit-title.dropdown-toggle
     log  ${current_dash}
     should be equal as strings  ${current_dash}  ${EDITOR_DASHBOARD2}

select dashboard under Viewer list

     sleep  5s
     wait until element is visible  xpath=//div[@class='span9']/ul/li/a[contains(text(), '${VIEWER_DASHBOARD1}')]
     page should contain link  ${VIEWER_DASHBOARD1}
     log  ${VIEWER_DASHBOARD1}
     sleep  5s
     click link  xpath=//div[@class='span9']/ul/li/a[contains(text(), '${VIEWER_DASHBOARD1}')]
     sleep  10s
     #${current_dash} =  get text  xpath=//div[@class='dashboard-name span']/a/h4
     ${current_dash} =  get text  css=.dashboard-name.hero-unit-title.dropdown-toggle
     log  ${current_dash}
     should be equal as strings  ${current_dash}  ${VIEWER_DASHBOARD1}
     click dashboard drop down
     wait until element is visible  xpath=//div[@class='span9']/ul/li/a[contains(text(), '${VIEWER_DASHBOARD2}')]
     page should contain link  ${VIEWER_DASHBOARD2}
     log  ${VIEWER_DASHBOARD2}
     sleep  5s
     click link  xpath=//div[@class='span9']/ul/li/a[contains(text(), '${VIEWER_DASHBOARD2}')]
     sleep  5s
     #${current_dash} =  get text  xpath=//div[@class='dashboard-name span']/a/h4
     ${current_dash} =  get text  css=.dashboard-name.hero-unit-title.dropdown-toggle
     log  ${current_dash}
     should be equal as strings  ${current_dash}  ${VIEWER_DASHBOARD2}


click on Time Intervals drop down in Dashboards page

    click element  xpath=//a[@class='btn btn-flat dropdown-toggle']/i[@class='icon-time']
    sleep  5s

verify Time Intervals drop down values in Dashboards

    page should contain  1W
    page should contain  1M
    page should contain  3M
    page should contain  1Y
    page should contain  MTD
    page should contain  YTD
    page should contain  Choose time range
    page should contain element  xpath=//div[@class='dashboard-controls span align-heading']//li/a[@class='change-interval']/span[contains(text(), '1W')]

select values from Time Intervals drop down in Dashboards and verify

    click element  xpath=//div[@class='dashboard-controls span align-heading']//li/a[@class='change-interval']/span[contains(text(), '1W')]
    sleep  2s
    ${current_interval} =  get text  xpath=//div[@class='dashboard-controls span align-heading']//span[@class='display-interval']
    log  ${current_interval}
    should be equal as strings  ${current_interval}  1W

    click on Time Intervals drop down in Dashboards page
    click element  xpath=//div[@class='dashboard-controls span align-heading']//li/a[@class='change-interval']/span[contains(text(), '1M')]
    sleep  2s
    ${current_interval} =  get text  xpath=//div[@class='dashboard-controls span align-heading']//span[@class='display-interval']
    log  ${current_interval}
    should be equal as strings  ${current_interval}  1M


    click on Time Intervals drop down in Dashboards page
    click element  xpath=//div[@class='dashboard-controls span align-heading']//li/a[@class='change-interval']/span[contains(text(), '3M')]
    sleep  2s
    ${current_interval} =  get text  xpath=//div[@class='dashboard-controls span align-heading']//span[@class='display-interval']
    log  ${current_interval}
    should be equal as strings  ${current_interval}  3M

    click on Time Intervals drop down in Dashboards page
    click element  xpath=//div[@class='dashboard-controls span align-heading']//li/a[@class='change-interval']/span[contains(text(), '1Y')]
    sleep  2s
    ${current_interval} =  get text  xpath=//div[@class='dashboard-controls span align-heading']//span[@class='display-interval']
    log  ${current_interval}
    should be equal as strings  ${current_interval}  1Y

    click on Time Intervals drop down in Dashboards page
    click element  xpath=//div[@class='dashboard-controls span align-heading']//li/a[@class='change-interval']/span[contains(text(), 'MTD')]
    sleep  2s
    ${current_interval} =  get text  xpath=//div[@class='dashboard-controls span align-heading']//span[@class='display-interval']
    log  ${current_interval}
    should be equal as strings  ${current_interval}  MTD

    click on Time Intervals drop down in Dashboards page
    click element  xpath=//div[@class='dashboard-controls span align-heading']//li/a[@class='change-interval']/span[contains(text(), 'YTD')]
    sleep  2s
    ${current_interval} =  get text  xpath=//div[@class='dashboard-controls span align-heading']//span[@class='display-interval']
    log  ${current_interval}
    should be equal as strings  ${current_interval}  YTD


select Choose time range from Time Intervals drop down in Dashboards

    #click element  xpath=//div[@class='dashboard-controls span align-heading']//li/a[@class='change-interval']/span[contains(text(), 'Choose time range')]
    click link  Choose time range
    sleep  2s

verify Custom timeframe pop up screen

    page should contain  Custom timefram
    # from date field
    page should contain  From
    page should contain textfield  xpath=//input[@class='input-medium start']
    page should contain element  xpath=//div[@class='input-append date start dp-start']//i[@class='icon-calendar tall']
        # To date field
    page should contain  To
    page should contain textfield  xpath=//input[@class='input-medium end']
    page should contain element  xpath=//div[@class='input-append date start dp-start']//i[@class='icon-calendar tall']
    page should contain  Or select a predefined range:
    page should contain button  2M
    page should contain button  2Y
    page should contain button  5Y
    page should contain button  ALL
    page should contain button  Finish
    page should contain button  ×

close Custom timeframe popup

    click button  ×

click on ALL button in Custom timeframe

    click button  ALL


click on Finish button in Custom timeframe

    click button  Finish
    #todo sleep  10s

click on Actions drop drop list

    click element  xpath=//a[@class='btn btn-flat dropdown-toggle']/i[@class='icon-inbox']
    sleep  2s


veriy Actions drop drop list

     page should contain  Add
     page should contain  Print
     page should contain  Share/Manage
     page should contain  Delete

click on delete dashboard

    #click element  xpath=//span[starts-with(normalize-space(text()),'Delete')]
    click element  css=.delete-view.unsubscribe>a
    Confirm Action

verify Unsubscribe option in Actions drop drop list

     page should contain  Unsubscribe
     page should contain element  xpath=//span[starts-with(normalize-space(text()),'Unsubscribe')]

mouse over on Add Actions

     mouse over  xpath=//i[@class='icon-plus-sign']

select value Print from Actions list

     mouse over  xpath=//i[@class='icon-print icon-white']
     click element  xpath=//i[@class='icon-print icon-white']

select value Share/Manage from Actions list

     mouse over  xpath=//i[@ class='icon-wrench icon-white']
     click element  xpath=//i[@ class='icon-wrench icon-white']
     sleep  10s

select value Delete from Actions list

     mouse over  xpath=//i[@ class='icon-trash icon-white']
     click element  xpath=//i[@ class='icon-trash icon-white']


verify Add drop down values

     page should contain  Metric
     page should contain  Graph
     page should contain  Table

select value Metric from add drop down

     click element  xpath=//a[text()='Metric']

select value Graph from add drop down

     click element  xpath=//a[text()='Graph']

select value Table from add drop down

     click element  xpath=//a[text()='Table']


verify Add Key Metric page

     page should contain  Add Key Metric

     page should contain  Which hospital is this metric in?
     page should contain element  xpath=(//input[@class='hospital'])[1]
     page should contain  Which department, if any, is this metric associated with?
     page should contain element  xpath=(//input[@class='department'])[1]
     page should contain  Finally, choose your metric
     page should contain element  xpath=(//input[@class='metricdefinition'])[1]
     page should contain button  Submit
     page should contain button  Close



Click submit button under Add Key Metric page

     click button  Submit

Click Close button under Add Key Metric page

     click button  Close

click on Which hospital is this metric in? drop down

     click element  xpath=(//span[@class='add-on btn dropdown-toggle'])[1]

select value from Which hospital is this metric in? list

      #Select From List  xpath=//ul[@class='typeahead typeahead-long dropdown-menu']/li[@data-value="Hospital C"]
      #Select From List By Label  xpath=(//div[@class='metricdef-selection']/div/div/select)[1]  Hospital C
      sleep  2s
      #select from list by label  xpath=(//select[@class='hospital'])[2]  Rose de Lima
      #select from list  xpath=(//select[@class='hospital'])[1]  Rose de Lima
      click element   xpath=(//span[@class='add-on btn dropdown-toggle'])[1]
      click element   css=form[class='form-horizontal keymetric-create-form'] input[class='hospital']
      input text  css=form[class='form-horizontal keymetric-create-form'] input[class='hospital']  ${Which hospital is this metric in?}
      sleep  2s
      click element  xpath=//li[@data-value='${Which hospital is this metric in?}']


select the value from Which department, if any, is this metric associated with? list

      sleep  2s
      click element   xpath=(//span[@class='add-on btn dropdown-toggle'])[2]
      sleep  2s
      click element   xpath=(//span[@class='add-on btn dropdown-toggle'])[2]
      click element  css=form[class='form-horizontal keymetric-create-form'] input[class='department']
      input text  css=form[class='form-horizontal keymetric-create-form'] input[class='department']  ${Which department is this metric in?}
      sleep  2s
      click element  xpath=//li[@data-value='${Which department is this metric in?}']
      sleep  2s

select the value from Finally, choose your metric list

      #click element  xpath=(//span[@class='add-on btn dropdown-toggle'])[3]
      click element  css=form[class='form-horizontal keymetric-create-form'] input[class='metricdefinition']
      input text  css=form[class='form-horizontal keymetric-create-form'] input[class='metricdefinition']  ${Finally choose your metric}
      #click element  xpath=//li[@data-value='${Finally choose your metric}']
      click element  css=li[data-value='${Finally choose your metric}']


verify Add Key Metric

      sleep  2s
      page should not contain  page should contain  You don't have any key metrics. Click to add a key metric.
      page should contain  at ${Which hospital is this metric in?}
      page should contain  ${Finally choose your metric}

###################

verify Add Graph page

     page should contain  Give the graph a name
     page should contain element  name=name

     page should contain  Which hospital is this metric in?
     page should contain element  xpath=(//input[@class='hospital'])[1]
     page should contain  Which department, if any, is this metric associated with?
     page should contain element  xpath=(//input[@class='department'])[1]
     page should contain  Finally, choose your metric
     page should contain element  xpath=(//input[@class='metricdefinition'])[1]
     page should contain element  xpath=//div[text()='Add Metric']

     page should contain  Hospital
     page should contain  Metric
     page should contain  Show Target?
     page should contain  Type

     page should contain button  Submit
     page should contain button  Close

Fill Give the graph a name under Add Graph

    #[Arguments]      ${CREATE_DASHBOARD}
    #input text  name=name  mynewgraph
    #input text into prompt  ${CREATE_DASHBOARD}
    input text  xpath=//div[@class='modal hide large in']//input[@name='name']  mynewgraph

Click submit button under Add Graph page

     click button  Submit

Click Close button under Add Graph page

     click button  Close

click on Which hospital is this metric in? drop down under Add Graph

     click element  xpath=(//span[@class='add-on btn dropdown-toggle'])[1]

select value from Which hospital is this metric in? list under Add Graph

      #Select From List  xpath=//ul[@class='typeahead typeahead-long dropdown-menu']/li[@data-value="Hospital C"]
      #Select From List By Label  xpath=(//div[@class='metricdef-selection']/div/div/select)[1]  Hospital C
      sleep  2s
      #select from list by label  xpath=(//select[@class='hospital'])[2]  Rose de Lima
      #select from list  xpath=(//select[@class='hospital'])[1]  Rose de Lima
      click element   xpath=(//span[@class='add-on btn dropdown-toggle'])[1]
      click element   css=form[class='form-horizontal graph-create-form'] input[class='hospital']
      input text  css=form[class='form-horizontal graph-create-form'] input[class='hospital']  ${Which hospital is this metric in?}
      sleep  2s
      click element  xpath=//li[@data-value='${Which hospital is this metric in?}']


select the value from Which department, if any, is this metric associated with? list under Add Graph

      click element   xpath=(//span[@class='add-on btn dropdown-toggle'])[2]
      sleep  2s
      sleep  2s
      click element   xpath=(//span[@class='add-on btn dropdown-toggle'])[2]
      click element  css=form[class='form-horizontal graph-create-form'] input[class='department']
      input text  css=form[class='form-horizontal graph-create-form'] input[class='department']  ${Which department is this metric in?}
      sleep  2s
      click element  xpath=//li[@data-value='${Which department is this metric in?}']
      sleep  2s


select the value from Finally, choose your metric list under Add Graph

      click element   xpath=(//span[@class='add-on btn dropdown-toggle'])[3]
      click element  css=form[class='form-horizontal graph-create-form'] input[class='metricdefinition']
      input text  css=form[class='form-horizontal graph-create-form'] input[class='metricdefinition']  ${Finally choose your metric}
      #sleep  2s
      wait until page contains element  xpath=//li[@data-value='${Finally choose your metric}']  timeout=2s
      click element  xpath=//li[@data-value='${Finally choose your metric}']
      #sleep  2s

click on Add Metric button present under Add Graph

      click element  xpath=//div[@class='btn btn-primary add-metric']

verify new Graph added under new dashboard

      #sleep  2s
      wait until page contains  mynewgraph  2s
      page should contain  mynewgraph
      #wait until element does not contain  You don't have any graphs. Click to add a graph.  timeout=2s
      #page should contain element  xpath=//a[@class='btn add-graph']
      #page should not contain  You don't have any graphs. Click to add a graph.
      #page should not contain  You don't have any graphs. Click to add a graph.
      #page should not contain element  css=.btn.add-graph

      #page should contain element  xpath=//a[@class='btn add-graph']
      #page should contain  mynewgraph



#################

verify Add Table

     page should contain  Give the new table a name
     page should contain element  name=name
     page should contain button  Create
     page should contain button  Cancel

Enter new table name

     input text  xpath=//div[@class='modal hide in']//input  Test table

Click submit button under Add Table page

     click element  xpath=(//button[@class='btn btn-success'])[2]

Click Close button under Add Table page

     click button  Cancel

################################3


verify Print this dashboard to PDF page


     page should contain  Print this dashboard to PDF
     page should contain  Click the button below to download a PDF of your dashboard.
     page should contain button  Print
     page should contain button  Close

verify Share/Manage page


    page should contain  Dashboard name:
    page should contain element  name=name
    page should contain  Default timeframe:
    page should contain element  name=timeFrame

    page should contain  Show most recent value for KeyMetric
    page should contain checkbox  name=showLastValue

    page should contain  Search for user:
    page should contain textfield  name=search

    page should contain  Who has access to this dashboard

    page should contain  Name
    page should contain  Permission
    page should contain button  Save and close
    page should contain button  Cancel


#### Edit#############

verify edit button in Dashboards page

    page should contain  Edit
    page should contain element  xpath=//span[@class='edit-mode-t-label']

verify No edit button in Dashboards page having view permission

    #sleep  2s
    #page should not contain  Edit
    #page should not contain element  xpath=//span[@class='edit-mode-t-label']
    wait until element is not visible  xpath=//span[@class='edit-mode-t-label']  2s
    element should not be visible  xpath=//span[@class='edit-mode-t-label']


click on edit button in Dashboards page

    click element  xpath=//span[@class='edit-mode-t-label']

verify edit mode is enabled to edit Dashboards

    #sleep  5s
    wait until page contains element  xpath=//i[@class='icon-trash']    timeout=5s
    page should contain element  xpath=//i[@class='icon-trash']
    page should contain element  xpath=//i[@class='icon-trash icon-white delete-km']


###################


verify graph loaded

     sleep  20s
     wait until element is visible  css=.span4.graph-title-bar-name  timeout=20s
     page should not contain  No data

click on icon-zoom-in

     # RN Productivity
     wait until element is visible  css=#dashboard-view-body > div:nth-child(3) > div.row.graph-collection > div:nth-child(1) > div.row.graph-title-bar.spacing-s > div.span2.pull-right > a.expand.icon.transparent-icon.pull-right > i  5s
     #wait until element is visible  xpath=(//i[@class='icon-zoom-in'])[1]  5s
     click element  css=#dashboard-view-body > div:nth-child(3) > div.row.graph-collection > div:nth-child(1) > div.row.graph-title-bar.spacing-s > div.span2.pull-right > a.expand.icon.transparent-icon.pull-right > i
     #click element  xpath=(//i[@class='icon-zoom-in'])[1]

verify chart expand view page

     wait until element is visible  css=div[class='expandview']>div>button[class='close']  5s
     wait until page contains  Expanded View
     page should contain  Expanded View
     #page should contain element  xpath=//g[@class='highcharts-button']


click on close x button in Expanded View

        #click button  ×
        click button  xpath=//div[@class='expandview']/div/button[@class='close']


