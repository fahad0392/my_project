*** Settings ***
Library         SeleniumLibrary
Library         robot.libraries.DateTime
#Library        robot.libraries.String
#Library        String

Resource  leftpaneobj.robot
Resource  homepageobj.robot
Resource  ../common.robot

*** Variables ***

${SEARCH_KEYWORD}
${SEARCH_UNIT_KEYWORD}  NYP RTAL Board


*** Keywords ***

verify Emory RTAL page loaded

    wait until page does not contain  Loading your list now…  30s
    wait until element is visible  css=.css-12wthef>tr>th:nth-child(1)  30s
    wait until page contains element  css=svg[class='css-1jktehj']  10s
    title should be  RTAL Board
    Location Should Contain  rtal/boards
    wait until element is visible  css=.css-1qi4odd  20s
    page should contain element  css=.css-70qvj9 > svg > g

verify Emory RTAL dashboard page

    page should contain  Emory
    page should contain  Full Screen
    page should contain  Print
    page should contain  Search
    page should contain  Sort by
    page should contain  Patient Name

    page should contain  Patient Name
    page should contain  Diagnosis
    page should contain  LOS
    page should contain  EDD
    page should contain  Disposition
    page should contain  Possible Barriers
    page should contain  Insurance
    page should contain  Notes

verify Full Screen option in Emory RTAL dashboard page

    wait until page contains  Full Screen  20s
    page should contain  Full Screen
    page should contain element  css=.css-tis6se
    page should contain element  css=.css-tis6se>svg

click on Full Screen option in Emory RTAL dashboard page

    click element  css=.css-tis6se>span

verify Exit Full Screen option in Emory RTAL dashboard page

    wait until page contains  Exit Full Screen  20s
    page should contain  Exit Full Screen
    page should contain element  css=.css-tis6se

click on Exit Full Screen option in Emory RTAL dashboard page

    click element  css=.css-tis6se>span

verify Print option in Emory RTAL dashboard page

    page should contain  Print
    #page should contain element  css=.css-aoxxts>span:nth-child(3)>svg
    page should contain element  css=.css-aoxxts>span:nth-child(2)>span
    page should contain element  css=.css-aoxxts>span:nth-child(2)>svg

click on Print option in Emory RTAL dashboard page

    click element  css=.css-aoxxts>span:nth-child(2)>span
    #click element  css=.css-aoxxts>span:nth-child(3)>svg
    sleep  5s
    page should not contain  Server Error
    page should not contain  There was an error on our web server. Our developers have received an email and are on the problem. The issue will be fixed soon. Sorry for the inconvenience.

printwindow

    select window  Title=Print
    Wait Until Element Is Visible  css=#print-header > div > button.cancel
    Click Element    css=#print-header > div > button.cancel
    Sleep    5s

click on SORT BY drop down list in Emory RTAL dashboard page

    click element  css=.css-1gls0f3>span:nth-child(2)>svg>path

verify default value SORT BY dropdown in Emory RTAL dashboard page

   ${default_sort_value} =    Get text   css=.css-1gls0f3>span:nth-child(1)
   log  ${default_sort_value}
   should be equal as strings  ${default_sort_value}  Patient Name

verify SORT BY dropdown list of values in Emory RTAL dashboard page

    #page should contain  Patient Name
    page should contain  LOS
    #page should contain  EDD
    #page should contain element  css=div[class='css-sik0ai'] ul>li:nth-child(3)
    #page should not contain element  css=div[class='css-sik0ai'] ul>li:nth-child(4)

verify able to select different sort option from SORT BY dropdown in Emory RTAL dashboard page

    click on SORT BY drop down list in Emory RTAL dashboard page
    click element  css=div[class='css-aoxxts'] ul>li:nth-child(1)

#   @{List_of_values} =  create list  Patient Name  LOS  EDD
#   # To select LOS
#   click on SORT BY drop down list in Emory RTAL dashboard page
#   click element  css=div[class='css-sik0ai'] ul>li:nth-child(2)
#   ${sort_value} =  Get text  css=.css-1gls0f3>span:nth-child(1)
#   log  ${sort_value}
#   should be equal as strings  ${sort_value}  @{List_of_values}[1]
#   log  ${sort_value}
#   log  @{List_of_values}[1]
#
#   # To select EDD
#   click on SORT BY drop down list in Emory RTAL dashboard page
#   click element  css=div[class='css-sik0ai'] ul>li:nth-child(3)
#   ${sort_value} =  Get text  css=.css-1gls0f3>span:nth-child(1)
#   log  ${sort_value}
#   log  @{List_of_values}[2]
#   should be equal as strings  ${sort_value}  @{List_of_values}[2]
#   # To select Patient Name
#   click on SORT BY drop down list in Emory RTAL dashboard page
#   click element  css=div[class='css-sik0ai'] ul>li:nth-child(1)
#   ${sort_value} =  Get text  css=.css-1gls0f3>span:nth-child(1)
#   should be equal as strings  ${sort_value}  @{List_of_values}[0]
#   log  ${sort_value}
#   log  @{List_of_values}[0]

verify Search option in Emory RTAL dashboard page

    page should contain  Search
    page should contain element  css=.css-aoxxts>span:nth-child(3)>span>span
    page should contain element  css=.css-aoxxts>span:nth-child(3)>span>svg

click on Search option in Emory RTAL dashboard page

    click element  css=.css-aoxxts>span:nth-child(3)>span>svg

verify Search box displayed to search table content in Emory RTAL dashboard page

    page should contain element  css=.css-1tw7lby.focus-within
    page should contain element  css=.css-1avmwpo.focus-within

Close Search box in Emory RTAL dashboard page

    click element  css=.css-1avmwpo.focus-within

Enter keyword to search in table content

    [Arguments]      ${SEARCH_KEYWORD}

    input text  css=.css-1tw7lby.focus-within  ${SEARCH_KEYWORD}

verify table content search result

    page should contain  ${SEARCH_KEYWORD}

verify No results found message for table content search

    page should contain  No results found

click on Switch units drop down list in Emory RTAL dashboard page

    click element  css=.css-1qi4odd

verify units Search box displayed in Switch units drop down list under Emory RTAL dashboard page

    page should contain element  css=.css-ntgy0z.focus-within
    #page should contain element  css=.css-92jgwx>input[placeholder='Search by keyword...']

verify Switch units dropdown list of values

    page should contain  Emory
    page should contain  NYP RTAL Board
    page should contain  Sutter Rx Board

verify default value Switch units dropdown

   ${default_switchunit_value} =    Get text   css=.css-7em3ng
   log  ${default_switchunit_value}
   should be equal as strings  ${default_switchunit_value}  Emory Board

verify able to select different units option from Switch units dropdown in Emory RTAL dashboard page

   @{List_of_values} =  create list  Emory Board  NYP RTAL Board  Sutter Rx Board
   # To select NYP RTAL Board
   click on Switch units drop down list in Emory RTAL dashboard page
   wait until element is visible  css=.css-ntgy0z.focus-within  2s
   click element  css=.css-ntgy0z.focus-within
   input text  css=.css-ntgy0z.focus-within  @{List_of_values}[1]
   click element  css=.css-125ckwz
   wait until page does not contain  Loading your list now…  30s
   wait until element is visible  css=.css-12wthef>tr>th:nth-child(1)  30s
   #verify Emory RTAL page loaded
   ${unit_value} =  Get text  css=.css-7em3ng
   log  ${unit_value}
   should be equal as strings  ${unit_value}  @{List_of_values}[1]
   log  ${unit_value}
   log  @{List_of_values}[1]

      # To select Sutter Rx Board
   click on Switch units drop down list in Emory RTAL dashboard page
   wait until element is visible  css=.css-ntgy0z.focus-within  2s
   click element  css=.css-ntgy0z.focus-within
   input text  css=.css-ntgy0z.focus-within  @{List_of_values}[2]
   click element  css=.css-125ckwz
   wait until page does not contain  Loading your list now…  30s
   wait until element is visible  css=.css-12wthef>tr>th:nth-child(1)  30s
   ${unit_value} =  Get text  css=.css-7em3ng
   log  ${unit_value}
   should be equal as strings  ${unit_value}  @{List_of_values}[2]
   log  ${unit_value}
   log  @{List_of_values}[2]

      # To select Emory Board (default)
   click on Switch units drop down list in Emory RTAL dashboard page
   sleep  2s
   click element  xpath=//span[text()='Emory Board']
   verify Emory RTAL page loaded
   ${unit_value} =  Get text  css=.css-7em3ng
   log  ${unit_value}
   should be equal as strings  ${unit_value}  @{List_of_values}[0]
   log  ${unit_value}
   log  @{List_of_values}[0]

click on units Search box displayed in Switch units under Emory RTAL dashboard page

    click element  css=.css-ntgy0z.focus-within

Enter keyword to search in units Search box in Switch units drop down list under Emory RTAL dashboard page

    [Arguments]      ${SEARCH_UNIT_KEYWORD}

    input text  css=.css-ntgy0z.focus-within  ${SEARCH_UNIT_KEYWORD}

verify units Search search result in Switch units drop down list under Emory RTAL dashboard page

    page should contain element  css=.css-1pnc3tu
    ${unit_search_result} =  Get text  css=.css-1pnc3tu
    log  ${unit_search_result}
    log  ${SEARCH_UNIT_KEYWORD}
    should be equal as strings  ${unit_search_result}  ${SEARCH_UNIT_KEYWORD}

verify No results found message for units search

    page should contain element  css=.css-1kosks0
    ${unit_search_no_result} =  Get text  css=.css-1kosks0
    log  ${unit_search_no_result}
    should be equal as strings  ${unit_search_no_result}  No Results Found

click on EDD to view calander

  click element  css=tr:nth-child(1)>td:nth-child(4)>span svg

verify calender option available under EDD column

    click on EDD to view calander
    page should contain  Select EDD:
    page should contain element  css=span[aria-label='Previous Month']
    page should contain element  css=span[aria-label='Next Month']
    page should contain  Sun
    page should contain  Mon
    page should contain  Tue
    page should contain  Wed
    page should contain  Thu
    page should contain  Fri
    page should contain  Sat
    click on EDD to view calander

verify able to select date from calender under EDD column

    click on EDD to view calander
    page should contain  Select EDD:
    click element  css=.css-fpyxxg.css-11mm0h3>span
    page should not contain  Select EDD:

click on Disposition drop down list

    click element  css=tr:nth-child(1)>td:nth-child(5)>div>span svg

verify Disposition drop down list available under Disposition column

    click on Disposition drop down list
    page should contain element  css=tr:nth-child(1)>td:nth-child(5) ul>li

verify drop down list available under Disposition column

    click on Disposition drop down list
    click element  xpath=//span[normalize-space(text())='Home']
    ${current_dispo_value} =  Get text  css=tr:nth-child(1)>td:nth-child(5)>div>span:nth-child(1)>span>span[class='css-1b4wu03']
    log  ${current_dispo_value}
    should be equal as strings  ${current_dispo_value}  Home

    click on disposition drop down list
    click element  xpath=//span[normalize-space(text())='Home w/ PT']
    ${current_dispo_value} =  Get text  css=tr:nth-child(1)>td:nth-child(5)>div>span:nth-child(1)>span>span[class='css-1b4wu03']
    log  ${current_dispo_value}
    should be equal as strings  ${current_dispo_value}  Home w/ PT
    page should contain element  css=tr:nth-child(1)>td:nth-child(5) ul[class='css-uawz71']>li>svg
    ${steps_value} =    Get text   css=tr:nth-child(1)>td:nth-child(5) ul[class='css-uawz71']>li>span
    log  ${steps_value}
    should be equal as strings  ${steps_value}  PT

    click on disposition drop down list
    click element  xpath=//span[normalize-space(text())='Acute Rehab']
    ${current_dispo_value} =  Get text  css=tr:nth-child(1)>td:nth-child(5)>div>span:nth-child(1)>span>span[class='css-1b4wu03']
    log  ${current_dispo_value}
    should be equal as strings  ${current_dispo_value}  Acute Rehab
    #page should contain element  css=tr:nth-child(1)>td:nth-child(5) ul[class='css-uawz71']>li:nth-child(1)>svg
    #${steps_value} =    Get text   css=tr:nth-child(1)>td:nth-child(5) ul[class='css-uawz71']>li:nth-child(1)>span
    #log  ${steps_value}
    #should be equal as strings  ${steps_value}  PT
    #page should contain element  css=tr:nth-child(1)>td:nth-child(5) ul[class='css-uawz71']>li:nth-child(2)>svg
    #${steps_value} =    Get text   css=tr:nth-child(1)>td:nth-child(5) ul[class='css-uawz71']>li:nth-child(2)>span
    #log  ${steps_value}
    #should be equal as strings  ${steps_value}  REH

verify Add Barrier text field available under Possible Barriers column

    page should contain textfield  css=tr:nth-child(1)>td:nth-child(6) input
    click element  css=tr:nth-child(1)>td:nth-child(6) input

Add new custom Barrier and verify custom Barrier added

    #[Arguments]      ${SEARCH_UNIT_KEYWORD}
    input text  css=tr:nth-child(1)>td:nth-child(6) input  AutoBar
    press key  css=tr:nth-child(1)>td:nth-child(6) input  \\13
    sleep  20s
    page should not contain  Sorry, failed to save entry
    page should contain  AutoBar

Delete newly created custom Barrier and verify barrier is not present

    page should contain  AutoBar
    ${Barrier_count} =    Get Element Count  xpath=//tbody/tr[1]/td[6]/ul[@class='css-ugughd']/li
    log  ${Barrier_count}
    ${Barrier_count} =  Evaluate  ${Barrier_count} -1
    log  ${Barrier_count}
    page should contain element  css=tr:nth-child(1)>td:nth-child(6)>ul[class='css-ugughd']>li:nth-child(${Barrier_count})
    #to delete barrier
    click element  css=tr:nth-child(1)>td:nth-child(6)>ul[class='css-ugughd']>li:nth-child(${Barrier_count}) svg
    sleep  20s
    page should not contain  Sorry, failed to save entry
    page should not contain  AutoBar

verify Notes text field available under Notes column

    wait until element is visible  css=tr:nth-child(1)>td:nth-child(8) textarea  5s
    page should contain element  css=tr:nth-child(1)>td:nth-child(8) textarea
    click element  css=tr:nth-child(1)>td:nth-child(8) textarea

Add Notes and verify Notes added

    clear element text  css=tr:nth-child(1)>td:nth-child(8) textarea
    #[Arguments]      ${SEARCH_UNIT_KEYWORD}
    input text  css=tr:nth-child(1)>td:nth-child(8) textarea  Text entered by automation scripts
    #press key  css=tr:nth-child(1)>td:nth-child(8) textarea  \\13
    mouse out  css=tr:nth-child(1)>td:nth-child(8) textarea
    sleep  20s
    page should not contain  Sorry, failed to save entry
    page should contain  Text entered by automation scripts

Delete newly added note and verify note deleted

    page should contain  Text entered by automation scripts
    clear element text  css=tr:nth-child(1)>td:nth-child(8) textarea
    mouse out  css=tr:nth-child(1)>td:nth-child(8) textarea
    sleep  2s
    wait until page does not contain  Text entered by automation scripts  20s
    page should not contain  Text entered by automation scripts

verify able to Vertical scroll with sticky header

    page should contain element  css=.css-1avmwpo
    execute javascript  document.documentElement.scrollTop = document.documentElement.scrollHeight;
    element should be visible  css=.css-1k5uyy6
