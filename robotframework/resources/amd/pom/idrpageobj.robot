*** Settings ***
Library         SeleniumLibrary
Library         robot.libraries.DateTime
#Library        robot.libraries.String
#Library        String

Resource  leftpaneobj.robot
Resource  homepageobj.robot
Resource  dashboardpageobj.robot
Resource  alertspageobj.robot
Resource  staffingpageobj.robot
Resource  ../common.robot

*** Keywords ***

verify AMD IDR page loaded

    wait until page contains element  css=.q-logo  10s
    title should be  Qventus IDR
    Location Should Contain  patientList
    page should contain image  Qventus logo

verify IDR dashboard page

    page should contain element  css=#title
    page should contain element  css=.super-bold.title-date
    page should contain element  css=div[class='inline-block subtitle title-time']>.medium
    page should contain  Last Updated:
    page should contain  EDT
    page should contain image  Qventus logo
    page should contain element  css=#fullscreen-btn


    page should contain  SORT BY:
    page should contain element  xpath=//span[@id='react-select-2--value']/div[1]

    page should contain  Switch units
    page should contain element  css=.unit-dropdown-placeholder

    page should contain  IDR Attendance
    page should contain element  css=.attendance-btn

    page should contain  Patient
    page should contain  Room
    page should contain  Diagnosis
    page should contain  Team
    page should contain  LOS
    page should contain  EDD
    page should contain  Disposition
    page should contain  Possible Barriers
    page should contain  Insurance
    page should contain  Follow-ups
    page should contain  Print
    page should contain element  css=.fa.fa-print

verify print option in IDR page

    page should contain  Print
    page should contain element  css=.fa.fa-print
    page should contain element  css=.print-btn>span

click on SORT BY drop down list

    click element  xpath=//span[@id='react-select-2--value']/div[1]

verify SORT BY dropdown list of values

    click on SORT BY drop down list
    page should contain  EDD
    page should contain  Current LOS
    page should contain  Disposition
    page should contain  Room
    page should contain  Nurse
    page should contain  Attending
    page should contain element  xpath=//div[@id='react-select-2--option-0']
    page should contain element  xpath=//div[@id='react-select-2--option-1']
    page should contain element  xpath=//div[@id='react-select-2--option-2']
    page should contain element  xpath=//div[@id='react-select-2--option-3']
    page should contain element  xpath=//div[@id='react-select-2--option-4']
    page should contain element  xpath=//div[@id='react-select-2--option-5']
    page should not contain element  xpath=//div[@id='react-select-2--option-6']

verify default value SORT BY dropdown

   ${default_sort_value} =    Get text   xpath=//span[@id='react-select-2--value-item']
   log  ${default_sort_value}
   should be equal as strings  ${default_sort_value}  Room
   #EDD

verify able to select different sort option from SORT BY dropdown

   select the Current LOS value from SORT BY dropdown list
   verify the Current LOS value is selected from SORT BY dropdown list
   select the Disposition value from SORT BY dropdown list
   verify the Disposition value is selected from SORT BY dropdown list
   select the Room value from SORT BY dropdown list
   verify the Room value is selected from SORT BY dropdown list
   select the Nurse value from SORT BY dropdown list
   verify the Nurse value is selected from SORT BY dropdown list
   select the Attending value from SORT BY dropdown list
   verify the Attending value is selected from SORT BY dropdown list
   select the EDD value from SORT BY dropdown list
   verify the EDD value is selected from SORT BY dropdown list


select the Current LOS value from SORT BY dropdown list

   click on SORT BY drop down list
   ${sort_value} =    Get text  css=#react-select-2--option-1
   should be equal as strings  ${sort_value}  Current LOS
   click element  css=#react-select-2--option-1

verify the Current LOS value is selected from SORT BY dropdown list

   ${current_sort_value} =    Get text   xpath=//span[@id='react-select-2--value-item']
   log  ${current_sort_value}
   should be equal as strings  ${current_sort_value}  Current LOS

select the Disposition value from SORT BY dropdown list

   click on SORT BY drop down list
   ${sort_value} =    Get text  css=#react-select-2--option-2
   should be equal as strings  ${sort_value}  Disposition
   click element  css=#react-select-2--option-2

verify the Disposition value is selected from SORT BY dropdown list

   ${current_sort_value} =    Get text   xpath=//span[@id='react-select-2--value-item']
   log  ${current_sort_value}
   should be equal as strings  ${current_sort_value}  Disposition

select the Room value from SORT BY dropdown list

   click on SORT BY drop down list
   ${sort_value} =    Get text  css=#react-select-2--option-3
   should be equal as strings  ${sort_value}  Room
   click element  css=#react-select-2--option-3

verify the Room value is selected from SORT BY dropdown list

   ${current_sort_value} =    Get text   xpath=//span[@id='react-select-2--value-item']
   log  ${current_sort_value}
   should be equal as strings  ${current_sort_value}  Room

select the Nurse value from SORT BY dropdown list

   click on SORT BY drop down list
   ${sort_value} =    Get text  css=#react-select-2--option-4
   should be equal as strings  ${sort_value}  Nurse
   click element  css=#react-select-2--option-4

verify the Nurse value is selected from SORT BY dropdown list

   ${current_sort_value} =    Get text   xpath=//span[@id='react-select-2--value-item']
   log  ${current_sort_value}
   should be equal as strings  ${current_sort_value}  Nurse

select the Attending value from SORT BY dropdown list

   click on SORT BY drop down list
   ${sort_value} =    Get text  css=#react-select-2--option-5
   should be equal as strings  ${sort_value}  Attending
   click element  css=#react-select-2--option-5

verify the Attending value is selected from SORT BY dropdown list

   ${current_sort_value} =    Get text   xpath=//span[@id='react-select-2--value-item']
   log  ${current_sort_value}
   should be equal as strings  ${current_sort_value}  Attending
   click element  css=#fullscreen-btn

select the EDD value from SORT BY dropdown list

   click on SORT BY drop down list
   ${sort_value} =    Get text  css=#react-select-2--option-0
   log  ${sort_value}
   should be equal as strings  ${sort_value}  EDD
   #click element  css=#react-select-2--option-0
   click element  xpath=//div[@id='react-select-2--option-0']


verify the EDD value is selected from SORT BY dropdown list

   ${current_sort_value} =    Get text   xpath=//span[@id='react-select-2--value-item']
   log  ${current_sort_value}
   should be equal as strings  ${current_sort_value}  EDD



click on Switch units drop down list

    click element  css=.fa.fa-exchange

verify Switch units dropdown list of values

    click on Switch units drop down list
    page should contain  FTSM CARDIAC TELEMETRY 3400
    page should contain  GTSM


verify default value Switch units dropdown

   ${default_switchunit_value} =    Get text   css=#title
   log  ${default_switchunit_value}
   should be equal as strings  ${default_switchunit_value}  FTSM CARDIAC TELEMETRY 3400

verify able to select different units option from Switch units dropdown

   select the GTSM value from SORT BY dropdown list
   verify the screen is switched to selected GTSM unit
   #select the FTSM CARDIAC TELEMETRY 3400 value from SORT BY dropdown list
   #verify the screen is switched to selected FTSM CARDIAC TELEMETRY 3400 unit


select the GTSM value from SORT BY dropdown list

   click on Switch units drop down list
   ${current_switchunit_value} =    Get text   css=#title
   should be equal as strings  ${current_switchunit_value}  FTSM CARDIAC TELEMETRY 3400
   click element  css=#react-select-3--option-1


verify the screen is switched to selected GTSM unit

   ${current_switchunit_value} =    Get text   css=#title
   log  ${current_switchunit_value}
   should be equal as strings  ${current_switchunit_value}  GTSM
   idrpageobj.verify IDR dashboard page

select the FTSM CARDIAC TELEMETRY 3400 value from SORT BY dropdown list

   click on Switch units drop down list
   ${current_switchunit_value} =    Get text   css=#title
   should be equal as strings  ${current_switchunit_value}  GTSM
   click element  css=#react-select-3--option-0

verify the screen is switched to selected FTSM CARDIAC TELEMETRY 3400 unit

   ${current_switchunit_value} =    Get text   css=#title
   log  ${current_switchunit_value}
   should be equal as strings  ${current_switchunit_value}  FTSM CARDIAC TELEMETRY 3400
   idrpageobj.verify IDR dashboard page

click on print option in idr page

    click element  css=.print-btn>span
    sleep  10s
    Run Keyword And Ignore Error  Confirm Action
    page should not contain  Server Error
    page should not contain  There was an error on our web server. Our developers have received an email and are on the problem. The issue will be fixed soon. Sorry for the inconvenience.

click on disposition drop down list

   click element  css=div[data-index='6'] .disposition-select .Select-arrow


verify disposition dropdown list of values

    click on disposition drop down list
    page should contain  Home
    page should contain  Home w/ services
    page should contain  Home w/ PT
    page should contain  SAR
    page should contain  SNF
    page should contain  Acute rehab
    page should contain  Home hospice
    page should contain  Hospice
    page should contain  LTACH
    page should contain  Psych
    page should contain  Shelter/SRO
    page should contain  Other

verify able to select different option from Disposition dropdown

    click element  css=div[data-index='6']
    click on disposition drop down list
    click element  xpath=//div[normalize-space(text())='Home']
    click on disposition drop down list
    click element  xpath=//div[normalize-space(text())='Home w/ services']
    click on disposition drop down list
    click element  xpath=//div[normalize-space(text())='Home w/ PT']
    page should contain element  xpath=//div[@data-index='6']//div[@class='disposition-select']//li[1]
    ${steps_value} =    Get text   xpath=//div[@data-index='6']//div[@class='disposition-select']//li[1]
    log  ${steps_value}
    should be equal as strings  ${steps_value}  PT
    click on disposition drop down list
    click element  xpath=//div[normalize-space(text())='SAR']
    page should contain element  xpath=//div[@data-index='6']//div[@class='disposition-select']//li[1]
    ${steps_value} =    Get text   xpath=//div[@data-index='6']//div[@class='disposition-select']//li[1]
    log  ${steps_value}
    should be equal as strings  ${steps_value}  PT
    click on disposition drop down list
    click element  xpath=//div[normalize-space(text())='SNF']
    click on disposition drop down list
    click element  xpath=//div[normalize-space(text())='Acute rehab']
    page should contain element  xpath=//div[@data-index='6']//div[@class='disposition-select']//li[1]
    ${steps_value} =    Get text   xpath=//div[@data-index='6']//div[@class='disposition-select']//li[1]
    log  ${steps_value}
    should be equal as strings  ${steps_value}  PT
    page should contain element  xpath=//div[@data-index='6']//div[@class='disposition-select']//li[2]
    ${steps_value} =    Get text   xpath=//div[@data-index='6']//div[@class='disposition-select']//li[2]
    log  ${steps_value}
    should be equal as strings  ${steps_value}  REH
    click on disposition drop down list
    click element  xpath=//div[normalize-space(text())='Home hospice']
    click on disposition drop down list
    click element  xpath=//div[normalize-space(text())='Hospice']
    click on disposition drop down list
    click element  xpath=//div[normalize-space(text())='LTACH']
    click on disposition drop down list
    click element  xpath=//div[normalize-space(text())='Psych']
    click on disposition drop down list
    click element  xpath=//div[normalize-space(text())='Shelter/SRO']
    click on disposition drop down list
    click element  xpath=//div[normalize-space(text())='Other']

verify able to select and unselect flags under Possible Barriers


   ${barriers_count} =  get matching xpath count  //div[@data-index='6']//div[@class='rt-td no-wrap']/ul/li
   log  ${barriers_count}
   page should contain element  xpath=//div[@data-index='6']//div[@class='rt-td no-wrap']/ul/li[${barriers_count}]/i
   click element  xpath=//div[@data-index='6']//div[@class='rt-td no-wrap']/ul/li[${barriers_count}]/i
   click element  xpath=//div[@data-index='6']//div[@class='rt-td no-wrap']/ul/li[${barriers_count}]/i
   page should contain element  xpath=//div[@data-index='6']//div[@class='rt-td no-wrap']/ul/li[${barriers_count}-1]/i
   click element  xpath=//div[@data-index='6']//div[@class='rt-td no-wrap']/ul/li[${barriers_count}-1]/i
   click element  xpath=//div[@data-index='6']//div[@class='rt-td no-wrap']/ul/li[${barriers_count}-1]/i
   page should contain element  xpath=//div[@data-index='6']//div[@class='rt-td no-wrap']/ul/li[${barriers_count}-2]/i
   click element  xpath=//div[@data-index='6']//div[@class='rt-td no-wrap']/ul/li[${barriers_count}-2]/i
   click element  xpath=//div[@data-index='6']//div[@class='rt-td no-wrap']/ul/li[${barriers_count}-2]/i
   page should contain element  xpath=//div[@data-index='6']//li[${barriers_count}-3]/i
   click element  xpath=//div[@data-index='6']//div[@class='rt-td no-wrap']/ul/li[${barriers_count}-3]/i
   click element  xpath=//div[@data-index='6']//div[@class='rt-td no-wrap']/ul/li[${barriers_count}-3]/i


Enter noted under Notes field

   Clear Element Text  xpath=//div[@data-index='6']//div[@class='note']
   #click element  xpath=//div[@data-index='6']//div[@class='note']
   input text  xpath=//div[@data-index='6']//div[@class='note']  This is comment enter by automation for testing purpose
   click element  xpath=//div[@data-index='7']//div[@class='note']
   reload page
   page should contain  This is comment enter by automation for testing purpose

verify able to delete under Notes field

   Run keyword and ignore error  page should contain  This is comment enter by automation for testing purpose
   Clear Element Text  xpath=//div[@data-index='6']//div[@class='note']
   #click element  xpath=//div[@data-index='6']//div[@class='note']
   input text  xpath=//div[@data-index='6']//div[@class='note']  This is comment enter by automation for testing purpose
   click element  xpath=//div[@data-index='7']//div[@class='note']
   reload page
   page should contain  This is comment enter by automation for testing purpose
   Clear Element Text  xpath=//div[@data-index='6']//div[@class='note']
   click element  xpath=//div[@data-index='7']//div[@class='note']
   reload page
   #Textfield Value Should Be  xpath=//div[@data-index='6']//div[@class='note']  ${EMPTY}
   page should not contain  This is comment enter by automation for testing purpose

click to open date picker

   click element  css=div[data-index='6'] .group>.Select-arrow

verify date picker displayed

   page should contain element  css=.react-datepicker__month-container

verify date picker EDD column

   click to open date picker
   verify date picker displayed

Select EDD date from date picker

   ${current_time} =  Get Current Date  LOCAL
   log  ${current_time}
   ${current_time} =  Convert Date  ${current_time}  date_format=%Y-%m-%d %H:%M:%S.%f  result_format=%m-%d-%Y
   log  ${current_time}
   ${current_date} =  Convert Date  ${current_time}  date_format=%m-%d-%Y  result_format=%d
   log  ${current_date}
   ${current_date} =  convert to integer  ${current_date}
   log  ${current_date}
   verify date picker EDD column
   sleep  1s
   click element  css=div[aria-label='day-${current_date}']
   Run keyword if  ${current_date} >= 27  select future date
   Run Keyword Unless  ${current_date} > 27  select future date 1
   ${current_date} =  evaluate  ${current_date}-1
   click to open date picker
   #${access}=  Get Element Attribute  css=div[aria-label='day-${current_date}']
   #log  ${access}
   #Element Should Be Disabled  css=div[aria-label='day-${current_date}']
   #Element Should Be Disabled  css=div[aria-label='day-${current_date}']

select future date

   click to open date picker
   Run keyword and ignore error  click element  css=div[aria-label='day-2']
   click to open date picker
   Run keyword and ignore error  click element  css=div[aria-label='day-3]

select future date 1

   click to open date picker
   click element  css=div[aria-label='day-28']

verify two month calender is displayed in date picker

   click to open date picker
   verify date picker displayed
   page should contain element  css=.react-datepicker__navigation.react-datepicker__navigation--next
   page should not contain element  css=.react-datepicker__navigation.react-datepicker__navigation--previous
   click element  css=.react-datepicker__navigation.react-datepicker__navigation--next
   page should contain element  css=.react-datepicker__navigation.react-datepicker__navigation--previous
   page should not contain element  css=.react-datepicker__navigation.react-datepicker__navigation--next
   click element  css=.react-datepicker__navigation.react-datepicker__navigation--previous
   page should contain element  css=.react-datepicker__navigation.react-datepicker__navigation--next


verify patient name format under patient under patient

   page should contain  Rob0719
   page should contain  46
   page should contain  F
   page should contain  233566989
   page should contain element  css=div[data-index='6'] p[class='patient-cell capitalize patient-name']
   page should contain element  css=div[data-index='6'] p[class='aside patient-cell']
   page should contain element  css=div[data-index='6'] p[class='patient-cell']
   page should contain element  Las0719


verify able to navigate other module from IDR dashboard

   leftpaneobj.mouse over on leftpane
   leftpaneobj.Verify home button in leftpane
   leftpaneobj.click on home
   homepageobj.verify AMD home page loaded
   leftpaneobj.click on Patient List icon
   verify AMD IDR page loaded
   leftpaneobj.mouse over on leftpane
   leftpaneobj.verify Dashboards button under leftpane
   leftpaneobj.click on Dashboards icon
   dashboardpageobj.verify Dashboards page loaded1
   leftpaneobj.click on Patient List icon
   verify AMD IDR page loaded
   leftpaneobj.mouse over on leftpane
   leftpaneobj.verify Metrics button under leftpane
   leftpaneobj.click on Metrics icon
   homepageobj.verify Metrics page loaded
   leftpaneobj.click on Patient List icon
   sleep  2s
   verify AMD IDR page loaded
   leftpaneobj.mouse over on leftpane
   leftpaneobj.verify Alerts button under leftpane
   leftpaneobj.click on Alerts icon
   alertspageobj.verify Alert page loaded
   leftpaneobj.click on Patient List icon
   verify AMD IDR page loaded
   mouse over on leftpane
   leftpaneobj.verify Staffing button under leftpane
   leftpaneobj.click on Staffing icon
   staffingpageobj.verify Staffing page loaded
   leftpaneobj.click on Patient List icon
   verify AMD IDR page loaded
   leftpaneobj.mouse over on leftpane
   leftpaneobj.verify MC button under leftpane
   leftpaneobj.click on MC icon
   homepageobj.verfiy missionControl page loaded
   #leftpaneobj.click on Patient List icon
   #verify AMD IDR page loaded


navigate to IDR EDD Export link


   ${URL1} =  Remove String  ${URL}  login
   log  ${URL1}
   go to   ${URL1}patientList/1/edd/export/


verify access denied message IDR - EDD Export

   page should contain  You do not have access to download the EDD CSV.


verify access denied message should not displayed IDR - EDD Export

   page should not contain  You do not have access to download the EDD CSV.



