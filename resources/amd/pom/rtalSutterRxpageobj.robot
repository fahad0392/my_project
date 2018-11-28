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
${SEARCH_UNIT_KEYWORD}  Sutter Rx RTAL Board


*** Keywords ***

verify default RTAL page loaded

    wait until page does not contain  Loading your list now…  30s
    wait until element is visible  css=.css-12wthef>tr>th:nth-child(1)  30s
    wait until page contains element  css=svg[class='css-1jktehj']  10s
    title should be  RTAL Board
    Location Should Contain  rtal/boards
    wait until element is visible  css=.css-1qi4odd  20s
    page should contain element  css=.css-70qvj9 > svg > g

Navigate to Sutter Rx RTAL Board page

    #Switch units drop down list default rtal page
    click element  css=.css-1qi4odd
    wait until element is visible  css=.css-ntgy0z.focus-within  2s
    click element  css=.css-ntgy0z.focus-within
    input text  css=.css-ntgy0z.focus-within  Sutter Rx Board
    click element  css=.css-125ckwz
    #Sutter Rx RTAL Board
    #click element  css=div[class='css-u9wu0y focus-within'] li[class='css-d1zlrg']:nth-child(2)>span

verify Sutter Rx RTAL page loaded

    wait until page does not contain  Loading your list now…  30s
    wait until element is visible  css=.css-12wthef>tr>th:nth-child(1)  30s
    wait until page contains element  css=svg[class='css-1jktehj']  10s
    title should be  RTAL Board
    Location Should Contain  rtal/boards/3
    wait until element is visible  css=.css-1qi4odd  20s
    page should contain element  css=.css-70qvj9 > svg > g

verify Sutter Rx RTAL dashboard page

    page should contain  Sutter Rx Board
    verify Sutter Rx RTAL tabular column
    verify Full Screen option in Sutter Rx RTAL dashboard page
    verify Print option in Sutter Rx RTAL dashboard page
    verify Search option in Sutter Rx RTAL dashboard page
    verify Candidates filter option in Sutter Rx RTAL dashboard page
    verify Reviewed filter option in Sutter Rx RTAL dashboard page

verify Candidates filter option in Sutter Rx RTAL dashboard page

    page should contain  Candidates
    page should contain element  css=.css-aoxxts>span:nth-child(1)>span[class='css-uk6cul']
    page should contain element  css=.css-aoxxts>span:nth-child(1)>span[class='css-3468v4']


verify Reviewed filter option in Sutter Rx RTAL dashboard page

    page should contain  Reviewed
    page should contain element  css=.css-aoxxts>span:nth-child(2)>span[class='css-uk6cul']
    page should contain element  css=.css-aoxxts>span:nth-child(2)>span[class='css-3468v4']


verify Sutter Rx RTAL tabular column

    page should contain  Patient
    page should contain  Unit - Room
    page should contain  Provider
    page should contain  LOS
    page should contain  Order Info
    page should contain  Medicine Name
    page should contain  Protocol
    page should contain  Probability
    page should contain  Status
    page should contain  Notes

verify Full Screen option in Sutter Rx RTAL dashboard page

    page should contain element  css=.css-tis6se
    page should contain element  css=.css-tis6se>svg

click on Full Screen option in Sutter Rx RTAL dashboard page

    click element  css=.css-tis6se

verify Exit Full Screen option in Sutter Rx RTAL dashboard page

    #wait until page contains  Exit Full Screen  20s
    page should contain element  css=.css-tis6se

click on Exit Full Screen option in Sutter Rx RTAL dashboard page

    click element  css=.css-tis6se

verify Print option in Sutter Rx RTAL dashboard page

    page should contain element  css=.css-aoxxts>span:nth-child(4)
    page should contain element  css=.css-aoxxts>span:nth-child(4)>svg

click on Print option in Sutter Rx RTAL dashboard page

    click element  css=.css-aoxxts>span:nth-child(4)>svg
    page should not contain  Server Error
    page should not contain  There was an error on our web server. Our developers have received an email and are on the problem. The issue will be fixed soon. Sorry for the inconvenience.
    sleep  3s
    printwindow
    #press key  ctrl+shift+p
    #handle alert  action=DISMISS
    #click element  css=button[class='cancel']
    ##@{Windows}=    Get Window Names
    ##log  @{Windows}

    ##@{Windows_title}=    Get Window Titles
    ##log  @{Windows_title}
    #printwindow

printwindow

    get window names
    get window identifiers
    get window titles
    select window  NEW
    Wait Until Element Is Visible  css=#print-header > div > button.cancel
    Click Element    css=#print-header > div > button.cancel
    Sleep    5s
    select window  main
    #handle alert  action=Dismiss

verify Search option in Sutter Rx RTAL dashboard page

    page should contain element  css=.css-aoxxts>span:nth-child(5)
    page should contain element  css=.css-aoxxts>span:nth-child(5)>span>svg

click on Search option in Sutter Rx RTAL dashboard page

    click element  css=.css-aoxxts>span:nth-child(5)>span>svg

verify Search box displayed to search table content in Sutter Rx RTAL dashboard page

    page should contain element  css=.css-1tw7lby.focus-within
    #page should contain element  css=.css-1avmwpo.focus-within

Close Search box in Sutter Rx RTAL dashboard page

    click element  css=.css-1avmwpo.focus-within

Enter keyword to search in table content

    [Arguments]      ${SEARCH_KEYWORD}

    input text  css=.css-1tw7lby.focus-within  ${SEARCH_KEYWORD}

verify table content search result

    page should contain  ${SEARCH_KEYWORD}

verify No results found message for table content search

    page should contain  No results found

click on Switch units drop down list in Sutter Rx RTAL dashboard page

    click element  css=.css-1qi4odd
    #click element  css=.css-7em3ng

click on STATUS drop down list under status column

   click element  css=tr:nth-child(1)>td:nth-child(9)>span>span>span[class='css-gcgird']

verify STATUS dropdown list of values under status column in Sutter Rx RTAL dashboard page

    page should contain  Discontinued
    page should contain  Don't Show Again
    page should contain  Pt Not Ready
    page should contain element  css=tr:nth-child(1)>td:nth-child(9)>span ul>li:nth-child(3)
    page should not contain element  css=tr:nth-child(1)>td:nth-child(9)>span ul>li:nth-child(4)

verify able to select status option from status dropdown in Sutter Rx RTAL dashboard page

   @{List_of_values} =  create list  Discontinued  Don't Show Again  Pt Not Ready
   #
   click on STATUS drop down list under status column
   click element  css=tr:nth-child(1)>td:nth-child(9)>span ul>li:nth-child(3)
   ${status_value} =  Get text  css=tr:nth-child(1)>td:nth-child(9)>span:nth-child(1)>span>span>span
   log  ${status_value}
   should be equal as strings  ${status_value}  @{List_of_values}[2]
   log  ${status_value}
   log  @{List_of_values}[1]

verify Notes text field available under Follow-Up column

    wait until element is visible  css=tr:nth-child(1)>td.css-1sfj4uq>textarea  5s
    #page should contain element  css=tr:nth-child(1)>td:nth-child(8)>textarea
    #page should contain textfield  css=tr:nth-child(1)>td:nth-child(8) textarea
    click element  css=tr:nth-child(1)>td.css-1sfj4uq>textarea

Add Note and verify Notes added under Follow-Up

    clear element text  css=tr:nth-child(1)>td.css-1sfj4uq>textarea
    #[Arguments]      ${SEARCH_UNIT_KEYWORD}
    input text  css=tr:nth-child(1)>td.css-1sfj4uq>textarea  Text entered by automation scripts
    #press key  css=tr:nth-child(1)>td.css-1sfj4uq>textarea  \\13
    #sleep  20s
    mouse out  css=tr:nth-child(1)>td.css-1sfj4uq>textarea
    sleep  20s
    page should not contain  Sorry, failed to save entry
    page should contain  Text entered by automation scripts

Delete newly added note and verify note deleted

    page should contain  Text entered by automation scripts
    #input text  css=tr:nth-child(1)>td:nth-child(8) textarea  ${EMPTY}
    #click element  css=tr:nth-child(1)>td:nth-child(8) textarea
    #clear element text  css=tr:nth-child(1)>td:nth-child(8) textarea
    clear element text  csshtml.focus-within body.focus-within div#root div.css-1xykgx3 table.css-djlta0 tbody tr td.css-1sfj4uq textarea.css-1oppvhn
    #clear element text  css=html.focus-within body.focus-within div#root.focus-within div.css-1xykgx3.focus-within table.css-djlta0.focus-within tbody.focus-within tr.focus-within td.css-1sfj4uq.focus-within textarea.css-1oppvhn.focus-within
    mouse out  css=tr:nth-child(1)>td.css-1sfj4uq>textarea
    sleep  10s
    wait until page does not contain  Text entered by automation scripts  20s
    page should not contain  Text entered by automation scripts

verify Candidates and Reviewed filter options present in Sutter Rx RTAL dashboard page

    verify Candidates filter option in Sutter Rx RTAL dashboard page
    verify Reviewed filter option in Sutter Rx RTAL dashboard page

verify # of rows present is equal count of Candidates plus count of Reviewed

    ${ccount} =  get text  css=.css-aoxxts>span:nth-child(1)>span[class='css-3468v4']
    log  ${ccount}
    ${ccount} =  Convert To Integer  ${ccount}
    ${rcount} =  get text  css=.css-aoxxts>span:nth-child(2)>span[class='css-3468v4']
    log  ${rcount}
    ${rcount} =  Convert To Integer  ${rcount}
    log  ${rcount}
    ${totalcount} =  evaluate  ${ccount} + ${rcount}
    log  ${totalcount}
    ${rowcount} =  get element count  css=tbody>tr
    log  ${rowcount}
    ${rowcount} =  Convert To Integer  ${rowcount}
    log  ${rowcount}
    Should Be Equal  ${totalcount}  ${rowcount}

click on candidates filter

     click element  css=.css-aoxxts>span:nth-child(1)>span[class='css-3468v4']

verify Candidates dashboard by using Candidates filter

     click element  css=.css-aoxxts>span:nth-child(1)>span[class='css-3468v4']
     ${ccount} =  get text  css=.css-aoxxts>span:nth-child(1)>span[class='css-3468v4']
     log  ${ccount}
     ${ccount} =  Convert To Integer  ${ccount}
     log  ${ccount}
     ${rowcount} =  get element count  css=tbody>tr
     log  ${rowcount}
     ${rowcount} =  Convert To Integer  ${rowcount}
     log  ${rowcount}
     Should Be Equal  ${ccount}  ${rowcount}

verify Reviewed dashboard by using reviewed filter

     click element  css=.css-aoxxts>span:nth-child(2)>span[class='css-uk6cul']
     ${rcount} =  get text  css=.css-aoxxts>span:nth-child(2)>span[class='css-3468v4']
     log  ${rcount}
     ${rcount} =  Convert To Integer  ${rcount}
     log  ${rcount}
     ${rowcount} =  get element count  css=tbody>tr
     log  ${rowcount}
     ${rowcount} =  Convert To Integer  ${rowcount}
     log  ${rowcount}
     Should Be Equal  ${rcount}  ${rowcount}

verify able to reveiw the status under Candidates filter list

    ${status_value} =  Get text  css=tr:nth-child(1)>td:nth-child(9)>span:nth-child(1)>span>span[class='css-1b4wu03']
    log  ${status_value}
    should be equal as strings  ${status_value}  To Review…
    ${bccount} =  get text  css=.css-aoxxts>span:nth-child(1)>span[class='css-3468v4']
    log  ${bccount}
    ${bccount} =  Convert To Integer  ${bccount}
    log  ${bccount}
    ${bccount} =  evaluate  ${bccount} - 1
    click on STATUS drop down list under status column
    click element  css=tr:nth-child(1)>td:nth-child(9)>span ul>li:nth-child(1)
    sleep  2s
    ${account} =  get text  css=.css-aoxxts>span:nth-child(1)>span[class='css-3468v4']
    log  ${account}
    ${account} =  Convert To Integer  ${account}
    log  ${account}
    Should Be Equal  ${bccount}  ${account}
#    sleep  2s
#    ${rowcount} =  get element count  css=tbody>tr
#    log  ${rowcount}
#    ${rowcount} =  Convert To Integer  ${rowcount}
#    log  ${rowcount}
#    Should Be Equal  ${account}  ${rowcount}


