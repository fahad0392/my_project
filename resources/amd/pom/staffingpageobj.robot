*** Settings ***
Library         SeleniumLibrary
Resource        ../pom/../amdvariables.robot


*** Keywords ***
###################Staffing###########

verify Staffing page loaded

    #wait until page contains element  css=.btn.save-plan  10s
    page should contain  Staffing
    page should contain element  css=.hero-unit-title.gutter-adjustment
    Location Should Contain  staffing

verify Staffing page

    page should contain element  css=div[class='btn-group hospital-select']>a
    page should contain element  css=div[class='btn-group workarea-select']>a
    page should contain element  css=div[class='btn-group resource-select']>a
    page should contain element  css=.staffing-header>h3
    page should contain  Expected Workload

    page should contain element  css=.scheduling-section>h3
    page should contain  Click a cell above to add a new shift or double click one of the scheduled shifts below if you would like to modify it.
    page should contain  Staffing Plan
    page should contain element  css=.btn.save-plan
    page should contain element  css=.btn.load-plan
    page should contain element  css=.btn.options-plan.dropdown-toggle

    page should contain element  css=.btn.options-plan.dropdown-toggle
    page should contain element  css=div[class='dropdown inline-block dow-select'] .display
    page should contain element  css=div[class='dropdown inline-block month-select'] .display



select the hospital from drop down list

     click element  css=div[class='btn-group hospital-select']>a
     click element  xpath=//div[@class='btn-group hospital-select open']//a[contains(text(),'Test Hospital 3')]


select value from workarea drop down list

     click element  css=div[class='btn-group workarea-select']>a
     click element  xpath=//a[contains(text(),'ED Staffing')]

select value from resource drop down list

     click element  css=div[class='btn-group resource-select']>a
     click element  xpath=//a[contains(text(),'RN')]

select value from days drop down list

     click element  css=div[class='dropdown inline-block dow-select'] .display
     click element  xpath=//a[text()='Tuesdays']

select value from month drop down list

     click element  css=div[class='dropdown inline-block month-select'] .display
     click element  xpath=//a[text()='December']

verify Staffing plan graph is displayed

     page should contain element  css=g[class='highcharts-axis']>path
     page should contain element  css=.highcharts-title
     page should contain element  css=.highcharts-title>tspan
     page should contain element  css=g[class='highcharts-series-group']
     page should contain element  css=g[class='highcharts-legend-item']>text>tspan
     page should contain element  css=g[class='highcharts-axis-labels highcharts-xaxis-labels']
     page should contain element  css=g[class='highcharts-axis-labels highcharts-xaxis-labels']>text>tspan
     page should contain element  css=g[class='highcharts-axis-labels highcharts-yaxis-labels']
     page should contain element  css=g[class='highcharts-axis-labels highcharts-yaxis-labels']>text>tspan
     page should contain element  css=g[class='highcharts-grid']>path
     page should contain element  css=g[class='highcharts-axis']>path
     page should contain element  css=g[class='highcharts-legend'] text>tspan
     page should contain element  css=g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect
     page should contain element  css=g[class='highcharts-axis-labels highcharts-xaxis-labels']>text


select different days and verify staffing plan reflected accordingly

     click element  css=div[class='dropdown inline-block dow-select'] .display
     click element  xpath=//a[text()='Mondays']
     page should contain  Mon 12 am
     page should contain  Mon 2 am
     page should contain  Mon 12 pm
     click element  css=div[class='dropdown inline-block dow-select'] .display
     click element  xpath=//a[text()='Tuesdays']
     page should contain  Tue 12 am
     page should contain  Tue 2 am
     page should contain  Tue 12 pm
     click element  css=div[class='dropdown inline-block dow-select'] .display
     click element  xpath=//a[text()='Wednesdays']
     page should contain  Wed 12 am
     page should contain  Wed 2 am
     page should contain  Wed 12 pm
     click element  css=div[class='dropdown inline-block dow-select'] .display
     click element  xpath=//a[text()='Thursdays']
     page should contain  Thu 12 am
     page should contain  Thu 2 am
     page should contain  Thu 12 pm
     click element  css=div[class='dropdown inline-block dow-select'] .display
     click element  xpath=//a[text()='Fridays']
     page should contain  Fri 12 am
     page should contain  Fri 2 am
     page should contain  Fri 12 pm
     click element  css=div[class='dropdown inline-block dow-select'] .display
     click element  xpath=//a[text()='Saturdays']
     page should contain  Sat 12 am
     page should contain  Sat 2 am
     page should contain  Sat 12 pm
     click element  css=div[class='dropdown inline-block dow-select'] .display
     click element  xpath=//a[text()='Sundays']
     page should contain  Sun 12 am
     page should contain  Sun 2 am
     page should contain  Sun 12 pm


select different months from drop down list

     click element  css=div[class='dropdown inline-block month-select'] .display
     ${value1} =  get text  xpath=(//a[@class='change-month'])[1]
     log  ${value1}
     ${value2} =  get text  xpath=(//a[@class='change-month'])[2]
     log  ${value2}
     ${value3} =  get text  xpath=(//a[@class='change-month'])[3]
     log  ${value3}
     click element  xpath=(//a[@class='change-month'])[1]
     ${current_value_selected} =  get text  css=div[class='dropdown inline-block month-select'] .display
     log  ${current_value_selected}
     Should Be Equal As Strings    ${value1}    ${current_value_selected}
     click element  css=div[class='dropdown inline-block month-select'] .display
     click element  xpath=(//a[@class='change-month'])[2]
     ${current_value_selected} =  get text  css=div[class='dropdown inline-block month-select'] .display
     log  ${current_value_selected}
     Should Be Equal As Strings    ${value2}    ${current_value_selected}
     click element  css=div[class='dropdown inline-block month-select'] .display
     click element  xpath=(//a[@class='change-month'])[3]
     ${current_value_selected} =  get text  css=div[class='dropdown inline-block month-select'] .display
     log  ${current_value_selected}
     Should Be Equal As Strings    ${value3}    ${current_value_selected}


verify export to PDF and PNG option available

     click element  css=g[class='highcharts-button']
     page should contain element  css=div[class='highcharts-contextmenu']>div>div:nth-child(1)
     page should contain element  css=div[class='highcharts-contextmenu']>div>div:nth-child(2)
     page should contain  Export PNG
     page should contain  Export PDF


click on Difference and verify Create a new shift popup screen populated


    #click element  css=#highcharts-10 > svg > g.highcharts-series-group > g.highcharts-series.highcharts-series-0.highcharts-tracker > rect:nth-child(7)
    click element  css=td[class='difference-heatmap'] .highcharts-series-group rect:nth-child(1)
    page should contain  Create a new shift
    #click button  xpath=//div[@class='modal hide in']//button[@type='button']
    click button  css=div[class='modal hide in'] button[type='button']
    click element  css=td[class='difference-heatmap'] .highcharts-series-group rect:nth-child(20)
    page should contain  Create a new shift
    click button  css=div[class='modal hide in'] button[type='button']
    click element  css=td[class='difference-heatmap'] .highcharts-series-group rect:nth-child(28)
    page should contain  Create a new shift
    click button  css=div[class='modal hide in'] button[type='button']

click on Difference

     click element  css=td[class='difference-heatmap'] .highcharts-series-group rect:nth-child(15)

verify Create a new shift popup screen

    page should contain  Create a new shift
    page should contain  Resource area
    page should contain  Number of workers
    page should contain  Start time
    page should contain  Duration (hours)

    page should contain element  xpath=//input[@value='Nurse']
    page should contain element  name=workers
    page should contain element  name=start-time
    page should contain element  name=duration
    page should contain button  Create
    page should contain button  Cancel


Create a new shift

    page should contain element  xpath=//input[@value='Nurse']
    input text  name=workers  6
    input text  name=duration  8
    click button  css=div[class='modal hide in'] button[class='btn btn-primary']

verify a new shift displayed under Staffing Plan

    page should contain element  css=.shift-label.text-center
    page should contain element  css=p[class='shift-label text-center']

verify Number of workers and Duration (hours) fields are madatory

    page should contain  Create a new shift
    click button  css=div[class='modal hide in'] button[class='btn btn-primary']
    page should contain  Please enter a valid number of workers for this shift.
    input text  name=workers  6
    click button  css=div[class='modal hide in'] button[class='btn btn-primary']
    page should contain  Please enter a duration between 0 and 24 hours.

click load plan icon

    click element  css=.btn.load-plan

verify Load a staffing plan popup screen

    page should contain  Load a staffing plan
    wait until page contains element  css=.plan-row>td  10s
    page should contain  Name
    page should contain  Last Modified
    page should contain  shifts
    #load button
    page should contain button  css=div[class='modal hide in'] button[class='btn btn-primary']
    #cancel button
    page should contain button  css=div[class='modal hide in'] button[type='button']


verify Download as CSV and other options

     click element  css=.btn.options-plan.dropdown-toggle
     page should contain  Download as CSV
     page should contain  Copy to a different day
     page should contain  Clear shifts
     page should contain element  css=.download-shifts
     page should contain element  css=.copy-shifts
     page should contain element  css=.clear-shifts


select Copy to a different day option

     click element  css=.btn.options-plan.dropdown-toggle
     click element  css=.copy-shifts

verify Copy to a different day popup screen

     page should contain element  css=div[class='modal hide in']  h4
     page should contain element  css=div[class='modal hide in']  input
     page should contain  Copy shifts from
     #copy button
     page should contain button  css=div[class='modal hide in'] button[class='btn btn-primary']
     #cancel button
     page should contain button  css=div[class='modal hide in'] button[type='button']


select Clear shifts from the following days

     click element  css=.btn.options-plan.dropdown-toggle
     click element  css=.clear-shifts


verify Clear shifts from the following days popup screen

     page should contain  Clear shifts from the following days
     page should contain  Monday
     page should contain  Tuesday
     page should contain  Wednesday
     page should contain  Thursday
     page should contain  Friday
     page should contain  Saturday
     page should contain  Sunday
