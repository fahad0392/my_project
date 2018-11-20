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

verify default RTAL page loaded

    wait until page does not contain  Loading your list now…  30s
    wait until element is visible  css=.css-12wthef>tr>th:nth-child(1)  30s
    wait until page contains element  css=svg[class='css-1jktehj']  10s
    title should be  RTAL Board
    Location Should Contain  rtal/boards
    wait until element is visible  css=.css-1qi4odd  20s
    page should contain element  css=.css-70qvj9 > svg > g

Navigate to NYP RTAL Board page

    #Switch units drop down list default rtal page
    click element  css=.css-1qi4odd
    #NYP RTAL Board
    wait until element is visible  css=.css-ntgy0z.focus-within  2s
    click element  css=.css-ntgy0z.focus-within
    input text  css=.css-ntgy0z.focus-within  NYP RTAL Board
    click element  css=.css-125ckwz
    #click element  css=div[class='css-u9wu0y focus-within'] li[class='css-d1zlrg']:nth-child(1)>span

verify NYP RTAL page loaded

    wait until page does not contain  Loading your list now…  30s
    wait until element is visible  css=.css-12wthef>tr>th:nth-child(1)  30s
    wait until page contains element  css=svg[class='css-1jktehj']  10s
    title should be  RTAL Board
    Location Should Contain  rtal/boards/2
    wait until element is visible  css=.css-1qi4odd  20s
    page should contain element  css=.css-70qvj9 > svg > g

verify NYP RTAL dashboard page

    page should contain  NYP RTAL Board
    verify NYP RTAL tabular column
    verify Full Screen option in NYP RTAL dashboard page
    verify Print option in NYP RTAL dashboard page
    verify Search option in NYP RTAL dashboard page
    verify sort option in NYP RTAL dashboard page

verify NYP RTAL tabular column

    page should contain  Patient Name
    page should contain  Room
    page should contain  Diagnosis
    page should contain  Care Team
    page should contain  EDD
    page should contain  LOS
    page should contain  EDD
    page should contain  Possible Barriers
    page should contain  Insurance
    page should contain  Follow-Up

verify Full Screen option in NYP RTAL dashboard page

    page should contain element  css=.css-tis6se
    page should contain element  css=.css-tis6se>svg

click on Full Screen option in NYP RTAL dashboard page

    click element  css=.css-tis6se

verify Exit Full Screen option in NYP RTAL dashboard page

    page should contain element  css=.css-tis6se

click on Exit Full Screen option in NYP RTAL dashboard page

    click element  css=.css-tis6se

verify Print option in NYP RTAL dashboard page

    page should contain element  css=.css-aoxxts>span:nth-child(3)
    page should contain element  css=.css-aoxxts>span:nth-child(3)>svg

click on Print option in NYP RTAL dashboard page

    click element  css=.css-aoxxts>span:nth-child(3)>svg
    page should not contain  Server Error
    page should not contain  There was an error on our web server. Our developers have received an email and are on the problem. The issue will be fixed soon. Sorry for the inconvenience.
    sleep  3s
    printwindow

printwindow

    get window names
    get window identifiers
    get window titles
    select window  NEW
    Wait Until Element Is Visible  css=#print-header > div > button.cancel
    Click Element    css=#print-header > div > button.cancel
    select window  main

verify sort option in NYP RTAL dashboard page

     page should contain element  css=.css-1gls0f3>span:nth-child(1)
     page should contain element  css=.css-1gls0f3>span:nth-child(2)>svg>path

click on SORT BY drop down list in NYP RTAL dashboard page

    click element  css=.css-1gls0f3>span:nth-child(2)>svg>path

verify default value SORT BY dropdown in NYP RTAL dashboard page

   ${default_sort_value} =    Get text   css=.css-1gls0f3>span:nth-child(1)
   log  ${default_sort_value}
   should be equal as strings  ${default_sort_value}  Patient Name

verify SORT BY dropdown list of values in NYP RTAL dashboard page

    page should contain  Patient Name
    page should contain  Room
    page should contain  LOS
    page should contain element  css=div[class='css-1k3pu7y'] ul>li:nth-child(3)
    page should not contain element  css=div[class='css-1k3pu7y'] ul>li:nth-child(4)

verify able to select different sort option from SORT BY dropdown in NYP RTAL dashboard page

#    @{List_of_values} =  create list  Room  LOS
#    # To select LOS
#    click on SORT BY drop down list in NYP RTAL dashboard page
#    click element  css=div[class='css-sik0ai'] ul>li:nth-child(2)
#    ${sort_value} =  Get text  css=.css-1gls0f3>span:nth-child(1)
#    log  ${sort_value}
#    should be equal as strings  ${sort_value}  @{List_of_values}[1]
#    log  ${sort_value}
#    log  @{List_of_values}[1]
#    # To select ROOM
#    click on SORT BY drop down list in NYP RTAL dashboard page
#    click element  css=div[class='css-sik0ai'] ul>li:nth-child(1)
#    ${sort_value} =  Get text  css=.css-1gls0f3>span:nth-child(1)
#    should be equal as strings  ${sort_value}  @{List_of_values}[0]
#    log  ${sort_value}
#    log  @{List_of_values}[0]



   @{List_of_values} =  create list  Patient Name  Room  LOS
   # To select LOS
   click on SORT BY drop down list in NYP RTAL dashboard page
   click element  css=div[class='css-1k3pu7y'] ul>li:nth-child(2)
   ${sort_value} =  Get text  css=.css-1gls0f3>span:nth-child(1)
   log  ${sort_value}
   should be equal as strings  ${sort_value}  @{List_of_values}[1]
   log  ${sort_value}
   log  @{List_of_values}[1]

   # To select EDD
   click on SORT BY drop down list in NYP RTAL dashboard page
   click element  css=div[class='css-1k3pu7y'] ul>li:nth-child(3)
   ${sort_value} =  Get text  css=.css-1gls0f3>span:nth-child(1)
   log  ${sort_value}
   log  @{List_of_values}[2]
   should be equal as strings  ${sort_value}  @{List_of_values}[2]
   # To select Patient Name
   click on SORT BY drop down list in NYP RTAL dashboard page
   click element  css=div[class='css-1k3pu7y'] ul>li:nth-child(1)
   ${sort_value} =  Get text  css=.css-1gls0f3>span:nth-child(1)
   should be equal as strings  ${sort_value}  @{List_of_values}[0]
   log  ${sort_value}
   log  @{List_of_values}[0]

verify Search option in NYP RTAL dashboard page

    page should contain element  css=.css-aoxxts>span:nth-child(4)
    page should contain element  css=.css-aoxxts>span:nth-child(4)>span>svg

click on Search option in NYP RTAL dashboard page

    click element  css=.css-aoxxts>span:nth-child(4)>span>svg

verify Search box displayed to search table content in NYP RTAL dashboard page

    page should contain element  css=.css-1tw7lby.focus-within
    page should contain element  css=.css-1avmwpo.focus-within

Close Search box in NYP RTAL dashboard page

    click element  css=.css-1avmwpo.focus-within

Enter keyword to search in table content

    [Arguments]      ${SEARCH_KEYWORD}

    input text  css=.css-1tw7lby.focus-within  ${SEARCH_KEYWORD}

verify table content search result

    page should contain  ${SEARCH_KEYWORD}

verify No results found message for table content search

    page should contain  No results found

click on Switch units drop down list in NYP RTAL dashboard page

    click element  css=.css-1qi4odd

click on EDD to view calander

  click element  css=tr:nth-child(1)>td:nth-child(6)>span svg

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
    #click element  css=tr:nth-child(1)>td:nth-child(4)>span svg

verify able to select date from calender under EDD column

    click on EDD to view calander
    page should contain  Select EDD:
    sleep  2s
    ${id}=  get element count  css=div[class='css-1i19zsq']>div:nth-child(3)>div:nth-child(n)
    focus  css=div[class='css-1i19zsq']>div:nth-child(3)>div:nth-child(${id})>div:nth-child(7)
    click element  css=div[class='css-1i19zsq']>div:nth-child(3)>div:nth-child(${id})>div:nth-child(7)
    page should not contain  Select EDD:

verify Add Barrier text field available under Possible Barriers column

    page should contain textfield  css=tr:nth-child(1)>td:nth-child(7) input
    click element  css=tr:nth-child(1)>td:nth-child(7) input

Add new custom Barrier and verify custom Barrier added

    input text  css=tr:nth-child(1)>td:nth-child(7) input  AutoBar
    press key  css=tr:nth-child(1)>td:nth-child(7) input   \\13
    sleep  30s
    page should contain  AutoBar
    page should not contain  Sorry, failed to save entry

Delete newly created custom Barrier and verify barrier is not present

    page should contain  AutoBar
    ${Barrier_count} =    Get Element Count  css=tr:nth-child(1)>td:nth-child(7)>ul:nth-child(1)>li
    #${Barrier_count} =    Get Count  xpath=//tbody/tr[1]/td[7]/ul[@class='css-ugughd']/li
    log  ${Barrier_count}
    ${Barrier_count} =  Evaluate  ${Barrier_count} -1
    log  ${Barrier_count}
    page should contain element  css=tr:nth-child(1)>td:nth-child(7)>ul:nth-child(1)>li:nth-child(${Barrier_count}) svg
    #to delete barrier
    click element  css=tr:nth-child(1)>td:nth-child(7)>ul:nth-child(1)>li:nth-child(${Barrier_count}) svg
    page should not contain  AutoBar

verify Notes text field available under Follow-Up column

    wait until element is visible  css=tr:nth-child(1)>td.css-1sfj4uq>textarea  5s
    click element  css=tr:nth-child(1)>td.css-1sfj4uq>textarea

Add Note and verify Notes added under Follow-Up

    clear element text  css=tr:nth-child(1)>td.css-1sfj4uq>textarea
    #[Arguments]      ${SEARCH_UNIT_KEYWORD}
    input text  css=tr:nth-child(1)>td.css-1sfj4uq>textarea  Text entered by automation scripts
    #press key  css=tr:nth-child(1)>td.css-1sfj4uq>textarea  \\13
    mouse out  css=tr:nth-child(1)>td.css-1sfj4uq>textarea
    sleep  20s
    page should not contain  Sorry, failed to save entry
    page should contain  Text entered by automation scripts

Delete newly added note and verify note deleted

    page should contain  Text entered by automation scripts
    clear element text  csshtml.focus-within body.focus-within div#root div.css-1xykgx3 table.css-djlta0 tbody tr td.css-1sfj4uq textarea.css-1oppvhn
    sleep  10s
    mouse out  css=tr:nth-child(1)>td.css-1sfj4uq>textarea
    wait until page does not contain  Text entered by automation scripts  20s
    page should not contain  Text entered by automation scripts

