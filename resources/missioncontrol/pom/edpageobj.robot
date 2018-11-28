*** Settings ***

Library         SeleniumLibrary
Library         robot.libraries.String
Library         Collections
Library         OperatingSystem
Library         robot.libraries.DateTime


Resource        ../mccommon.robot

*** Variables ***

@{Months}  January  Feburary   March  April  May  June  July  August  September  October  November  December
${CURRENT_DATE}


*** Keywords ***

verify mc Emergency Department dashboard page loaded

    title should be   ED mission control
    page should contain  Emergency Department
    page should contain  status at
    page should contain  Showing the current state on

verify mc Emergency Department dashboard hostpital name

    page should contain  Emergency Department
    page should contain  status at ${REALHOSPITAL_NAME}

verify 4 main mc metrics dials under Emergency Department dashboard

    page should contain   Total Census

    page should contain   Length of stay
    page should contain   of discharges in
    PAGE SHOULD CONTAIN   the last 60 minutes

    page should contain   Expected patients will
    page should contain   be discharged in the
    page should contain   next hour

    page should contain   Expected patients will
    page should contain   be admitted in the
    page should contain   next hour


verify Status Counts present under Emergency Department dashboard

    page should contain  Waiting Room
    page should contain  Triaged
    page should contain  Roomed
    page should contain  Pending Discharges
    page should contain  Pending Admits

click on date/time drop down in Emergency Department dashboard

    click element  css=.currentDt

click on hospital drop down and select hospital from list

    wait until page contains element  xpath=(//i[@class='fa fa-caret-down'])[2]  2s
    click element  xpath=(//i[@class='fa fa-caret-down'])[2]
    click element   xpath=//span[@class='dropdown open']/ul/li/a[text()='${SWITCH_HOSPITAL_NAME}']
    log  ${SWITCH_HOSPITAL_NAME}
    page should contain  Emergency Department
    page should contain  status at ${SWITCH_HOSPITAL_NAME}
    log  ${SWITCH_HOSPITAL_NAME}
    click element  xpath=(//i[@class='fa fa-caret-down'])[1]
    click element   xpath=//span[@class='dropdown open']/ul/li/a[text()='${HOSPITAL_NAME}']
    page should contain  Emergency Department
    page should contain  status at ${HOSPITAL_NAME}
    log  ${HOSPITAL_NAME}

get state of the emergency room on

   ${emergency_current_historical_datetime_displayed} =  Get Text  xpath=//span[@class='currentDt']
   log  ${emergency_current_historical_datetime_displayed}
   Should Be Equal    ${emergency_current_historical_datetime_displayed}    ${HISTORICAL_datetime}

click on Show the current state in realtime dashboard

    wait until page contains  Show the current state  2s
    click element   xpath=//a [text()= 'Show the current state']

Enter past date

    input text  name=date   ${MM-DD-YYYY}

verify state of the emergency room on previous week date

   get current state date
   log  ${get current state date}
   log  ${PREVIOUS_WEEK_TIME}
   ${PREVIOUS_WEEK_TIME}=  Convert to string  ${PREVIOUS_WEEK_TIME}
   ${get current state date}=  Convert to string  ${get current state date}
   log  ${get current state date}
   log  ${PREVIOUS_WEEK_TIME}
   Should Be Equal  "${get current state date}"  "${PREVIOUS_WEEK_TIME}"

verify state of the emergency room on previous month date

   get current state date
   log  ${get current state date}
   log  ${PREVIOUS_MONTH_TIME}
   ${PREVIOUS_MONTH_TIME}=  Convert to string  ${PREVIOUS_MONTH_TIME}
   ${get current state date}=  Convert to string  ${get current state date}
   log  ${get current state date}
   log  ${PREVIOUS_MONTH_TIME}
   Should Be Equal  "${get current state date}"  "${PREVIOUS_MONTH_TIME}"

Enter previous year date in Enter past time field

    input text  name=time   ${PREVIOUS_YEAR_TIME}
    log  ${PREVIOUS_YEAR_TIME}

Enter previous hour in Enter past time field ??

    input text  name=time   ${PREVIOUS_HOUR}
    log  ${PREVIOUS_HOUR}
    input text  name=date   ${MM-DD-YYYY}

verify state of the emergency room on previous hour date

   get current state date
   log  ${get current state time}
   Should Be Equal    09:40    ${get current state time}

verify state of the emergency room on previous minute date

   get current state date
   log  ${get current state time}
   Should Be Equal    09:40    ${get current state time}

click go button in Show a past state

    click button   xpath=//button[text()='Go']

verify Invalid date/time validation message in Show a past state

    page should contain   Bad date/time inputs - please fix!

verify Invalid hour validation message in Show a past state

     page should contain   Invalid hour

verify Invalid date in Show a past state

    #MM-DD-YYYY
    @{invaliddatelist}  create list  00-02-2016   13-02-2016   10-00-2016   10-32-2016   02-30-2016    09-31-2016
    :FOR      ${Item}     IN      @{invaliddatelist}
    \  input text  name=date   ${invaliddatelist}
    \  log  ${invaliddatelist}
    \  click go button in Show a past state
    \  verify Invalid date/time validation message in Show a past state
    \  MCload realtime dashboard page
    \  click on date/time drop down in realtime dashboard
    \  sleep  1s

verify Invalid hour/time in Show a past state
    #hh:mm
    @{invalidhourlist}  create list  24:23   -9:23   1212   12333
    :FOR      ${Item}     IN      @{invalidhourlist}
    \  input text  name=time   ${invalidhourlist}
    \  log  ${invalidhourlist}
    \  click go button in Show a past state
    \  verify Invalid hour validation message in Show a past state
    \  MCload realtime dashboard page
    \  click on date/time drop down in realtime dashboard
    \  sleep  1s
     #hh:mm
    @{invalidhourlist}  create list  12:60   12:38
    :FOR      ${Item}     IN      @{invalidhourlist}
    \  input text  name=time   ${invalidhourlist}
    \  log  ${invalidhourlist}
    \  click go button
    \  verify Invalid date/time validation message
    \  MCload realtime dashboard page
    \  click on date/time drop down in realtime dashboard
    \  sleep  1s


verify able to see zopim on Emergency Department dashboard page

    #click element  xpath=//html[@lang='en']/body/div[1]
    click element  css=html[lang='en']>body>div
    sleep  5s
    page should contain    Zopim


############################### Waiting Room #############

Get Value From Waiting Room status count and verify

    ${countpresent}=    Run Keyword and Return Status    Element Should Be Visible    xpath=//table//tr[1]/td[2]//i
    Run Keyword If    '${countpresent}' == 'False'
    ...    Log    Total Waiting Room count is blank
    ...    ELSE   Pending Waiting Room status count verifcation

Pending Waiting Room status count verifcation

    ${Actual waiting room count} =    Get text    xpath=(//td[@class='step-label'])[1]
    log  ${Actual waiting room count}
    ${Actual waiting room count}=   get regexp matches  ${Actual waiting room count}  [0-9]?[0-9]?[0-9]
    log  ${Actual waiting room count}
    ${Actual waiting room count}=  get from list  ${Actual waiting room count}  0
    log  ${Actual waiting room count}
    run keyword if  '${Actual waiting room count}' >= '0'
     ...   log    Total waiting room count is greater >=0
     ...   ELSE
     ...   fail   Total waiting room is error
    ${XpathCount}=    Get matching xpath count  xpath=//table//tr[1]/td[2]//i
    log  ${XpathCount}
    Should Be Equal    ${Actual waiting room count}    ${XpathCount}

##########################Roomed####################

Get Value From Roomed status count and verify

    ${countpresent}=    Run Keyword and Return Status    Element Should Be Visible    xpath=//table//tr[3]/td[2]//i
    Run Keyword If    '${countpresent}' == 'False'
    ...    Log    Total Roomed count is blank
    ...    ELSE   Pending Roomed status count verification

Pending Roomed status count verification

    ${Actual room count} =    Get text    xpath=(//td[@class='step-label'])[3]
    log  ${Actual room count}
    ${Actual room count}=   get regexp matches  ${Actual room count}  [0-9]?[0-9]?[0-9]
    log  ${Actual room count}
    ${Actual room count}=  get from list  ${Actual room count}  0
    log  ${Actual room count}
    run keyword if  '${Actual room count}' >= '0'
     ...   log    Total roomed count is greater >=0
     ...   ELSE
     ...   fail   Total roomed is error
    ${XpathCount}=    Get matching xpath count  xpath=//table//tr[3]/td[2]//i
    log  ${XpathCount}
    Should Be Equal    ${Actual room count}    ${XpathCount}
    #(//i[@class='fa fa-male fa-lg'])[138]  -- this give complete count

##################### Triaged #################

Get Value From Triaged Room status count and verify

    ${countpresent}=    Run Keyword and Return Status    Element Should Be Visible    xpath=//table//tr[2]/td[2]//i
    Run Keyword If    '${countpresent}' == 'False'
    ...    Log    Total Roomed count is blank
    ...    ELSE   Triaged status count verification

Triaged status count verification

    ${Actual Triaged room count} =    Get text    xpath=(//td[@class='step-label'])[2]
    log  ${Actual Triaged room count}
     ${Actual Triaged room count}=   get regexp matches  ${Actual Triaged room count}  [0-9]?[0-9]?[0-9]
    log  ${Actual Triaged room count}
    ${Actual Triaged room count}=  get from list  ${Actual Triaged room count}  0
    log  ${Actual Triaged room count}
    run keyword if  '${Actual Triaged room count}' >= '0'
     ...   log    Total Triaged count is greater >=0
     ...   ELSE
     ...   fail   Total Triaged is error
    ${XpathCount}=    Get matching xpath count  xpath=//table//tr[2]/td[2]//i
    log  ${XpathCount}
    Should Be Equal    ${Actual Triaged room count}    ${XpathCount}

#############################################

Get Value From Pending Discharges status count and verify2

    ${Actual Pending Discharges count}=    Get text    xpath=(//td[@class='step-label'])[4]
    log  ${Actual Pending Discharges count}
    ${XpathCount}=    Get matching xpath count  xpath=//table//tr[4]/td[2]//i
    log  ${XpathCount}
    set global variable  ${XpathCount}
    run keyword if  "${XpathCount}" != "0" statuscount  ${XpathCount}  ${Actual Pending Discharges count}
    run keyword if  "${XpathCount}" == "0"  log  Total Pending Discharges count is blank

statuscount
    [Arguments]  ${xpcount}  ${count}

    log   Total waiting room count is greater >=0
    ${Actual Pending Discharges count}=   get regexp matches  ${count}  [0-9]?[0-9]?[0-9]
    log  ${Actual Pending Discharges count}
    ${Actual Pending Discharges count}=  get from list  ${Actual Pending Discharges count}  0
    log  ${Actual Pending Discharges count}
    Should Be Equal    ${Actual Pending Discharges count}    ${xpcount}

########## Pending Discharges ###################

Get Value From Pending Discharges status count and verify

    ${countpresent}=    Run Keyword and Return Status    Element Should Be Visible    xpath=//table//tr[4]/td[2]//i
    Run Keyword If    '${countpresent}' == 'False'
    ...    Log    Total Pending Discharges count is blank
    ...    ELSE   Pending Discharges status count verification

Pending Discharges status count verification

    ${Actual Pending Discharges count} =    Get text    xpath=(//td[@class='step-label'])[4]
    log  ${Actual Pending Discharges count}
     ${Actual Pending Discharges count}=   get regexp matches  ${Actual Pending Discharges count}  [0-9]?[0-9]?[0-9]
    log  ${Actual Pending Discharges count}
    ${Actual Pending Discharges count}=  get from list  ${Actual Pending Discharges count}  0
    log  ${Actual Pending Discharges count}
    run keyword if  '${Actual Pending Discharges count}' >= '0'
     ...   log    Total Pending Discharges count is greater >=0
     ...   ELSE
     ...   fail   Total Pending Discharges is error
    ${XpathCount}=    Get matching xpath count  xpath=//table//tr[4]/td[2]//i
    log  ${XpathCount}
    Should Be Equal    ${Actual Pending Discharges count}    ${XpathCount}

###################################Pending Admits ###############

Get Value From Pending Admits status count and verify

    ${countpresent}=    Run Keyword and Return Status    Element Should Be Visible    xpath=//table//tr[5]/td[2]//i
    Run Keyword If    '${countpresent}' == 'False'
    ...    Log    Total Pending Discharges count is blank
    ...    ELSE   Pending Admits status count verification

Pending Admits status count verification

    ${Actual Pending Admits count} =    Get text    xpath=(//td[@class='step-label'])[5]
    log  ${Actual Pending Admits count}
    ${Actual Pending Admits count}=   get regexp matches  ${Actual Pending Admits count}  [0-9]?[0-9]?[0-9]
    log  ${Actual Pending Admits count}
    ${Actual Pending Admits count}=  get from list  ${Actual Pending Admits count}  0
    log  ${Actual Pending Admits count}
    run keyword if  '${Actual Pending Admits count}' >= '0'
     ...   log    Total Pending Discharges count is greater >=0
     ...   ELSE
     ...   fail   Total Pending Discharges is error
    ${XpathCount}=    Get matching xpath count  xpath=//table//tr[5]/td[2]//i
    Should Be Equal   ${Actual Pending Admits count}  ${XpathCount}


Get Value From Total Census and verify

    ${Actual Total Census} =    Get text   css=html body div.wrapper div.radial-wrapper div#div1 svg.radial-svg g g.labels text.label
   # ${Total Census} =    Get text   xpath=/html/body/div[3]/div[4]/div[1]/svg/g/g[3]/text
    log  ${Actual Total Census}
     run keyword if  '${Actual Total Census}' >= '0'
     ...   log    Total Census is greater >=0
     ...   ELSE
     ...   fail   Total Census is error

Length of stay of discharges in the last 60 minutes and verify

    ${Actual_Recent DischargeLength of Stay} =    Get text   css=#div2 > svg:nth-child(1) > g:nth-child(1) > g:nth-child(3) > text:nth-child(1)
    log  ${Actual_Recent DischargeLength of Stay}
    run keyword if  '${Actual_Recent DischargeLength of Stay}' >= '0'
     ...   log    Recent dischage Lengh of stay is greater >=0
     ...   ELSE
     ...   fail   Recent dischage Lengh of stay is error

Get Value From Expected patients will be dischargred in the next hour and verify

    ${Actual} =    Get text   css=html body div.wrapper div.radial-wrapper div#div3 svg.radial-svg g g.labels text.label
    log  ${Actual}
     run keyword if  '${Actual}' >= '0'
     ...   log    Expected patients will be dischargred in the next hour is greater >=0
     ...   ELSE
     ...   fail   Expected patients will be dischargred in the next hour is error

Get Value From Expected patients will be admitted in the next hour and verify

    ${Actual_admitted} =    Get text   css=#div4 > svg:nth-child(1) > g:nth-child(1) > g:nth-child(3)
    log  ${Actual_admitted}
    run keyword if  '${Actual_admitted}' >= '0'
     ...   log    Expected patients willbe admitted in thenext hour is greater >=0
     ...   ELSE
     ...   fail   Expected patients willbe admitted in thenext hour is error

verify Total Census equals to number of patients

     ${Actual Total Census} =    Get text   css=html body div.wrapper div.radial-wrapper div#div1 svg.radial-svg g g.labels text.label
     log  ${Actual Total Census}
     page should contain element  xpath=(//i[@class='fa fa-male fa-lg'])[${Actual Total Census}]
     ${temp} =  Evaluate  ${Actual Total Census} + 1
     log   {temp}
     page should not contain element  xpath=(//i[@class='fa fa-male fa-lg'])[${temp}]


verify Total Census equals to number of bubbles

     ${Actual Total Census} =    Get text   css=html body div.wrapper div.radial-wrapper div#div1 svg.radial-svg g g.labels text.label
     log  ${Actual Total Census}
     page should contain element  css=circle.node:nth-child(${Actual Total Census})
     ${temp} =  Evaluate  ${Actual Total Census} + 5
     page should contain element  css=circle.node:nth-child(${temp})
     ${temp} =  Evaluate  ${Actual Total Census} + 6
     page should not contain element  css=circle.node:nth-child(${temp})


verify Mark patient as outlier popup window

     click element  css=#fullscreen-btn
     #For scrolling to bottom
     Execute JavaScript  $("body").scrollTop($("body")[0].scrollHeight);
     ${Actual Total Census} =    Get text   css=html body div.wrapper div.radial-wrapper div#div1 svg.radial-svg g g.labels text.label
     #${Total Census} =    Get text   xpath=/html/body/div[3]/div[4]/div[1]/svg/g/g[3]/text
     log  ${Actual Total Census}
     ${temp} =  Evaluate  ${Actual Total Census} + 5
     ${temp1} =  Evaluate  ${temp} -1
     ${temp1} =  Evaluate  ${temp} -${Actual Total Census}
     click element    css=circle.node.node--leaf:nth-child(${temp1})
     page should contain  Mark patient as outlier?
     page should contain  This patient will be permanently removed from mission control. Are you sure?
     page should contain button  xpath=//button[contains(text(),'Remove')]
     page should contain button  xpath=//button[contains(text(),'Close')]
     wait until element is visible  css=.close  5s
     click element  css=.close
     wait until element is not visible  css=#remove-button  5s
     #For scrolling to top
     Execute JavaScript  $('html, body').scrollTop(0);

verify hover over patient

     ${Actual Total Census} =    Get text   css=html body div.wrapper div.radial-wrapper div#div1 svg.radial-svg g g.labels text.label
     log  ${Actual Total Census}
     ${temp} =  Evaluate  ${Actual Total Census} + 5
     ${temp1} =  Evaluate  ${temp} -${Actual Total Census}
     Execute JavaScript  $("body").scrollTop($("body")[0].scrollHeight);
     mouse over    css=circle.node.node--leaf:nth-child(${temp})
     page should contain element  xpath=//div[@class='d3-tip n']//span[contains(text(), 'Entered on')]
     page should contain element  xpath=//div[@class='d3-tip n']//span[contains(text(), 'Status')]
     Run keyword and ignore error  page should contain element  xpath=//div[@class='d3-tip n']//span[contains(text(), 'Recommendation')]
     page should contain element  xpath=//div[@class='d3-tip n']//span[contains(text(), 'Complaint')]
     Execute JavaScript  $('html, body').scrollTop(0);

click close button in Mark patient as outlier popup window

     reload page
     sleep  2s
     ${Actual Total Census} =    Get text   css=html body div.wrapper div.radial-wrapper div#div1 svg.radial-svg g g.labels text.label
     log  ${Actual Total Census}
     ${temp} =  Evaluate  ${Actual Total Census} + 5
     ${temp1} =  Evaluate  ${temp} -1
     ${temp1} =  Evaluate  ${temp} -${Actual Total Census}
     Execute JavaScript  $("body").scrollTop($("body")[0].scrollHeight);
     click element    css=circle.node.node--leaf:nth-child(${temp1})
     page should contain  Mark patient as outlier?
     page should contain  This patient will be permanently removed from mission control. Are you sure?
     page should contain button  xpath=//button[contains(text(),'Remove')]
     page should contain button  xpath=//button[contains(text(),'Close')]
     wait until element is visible  css=.btn.btn-default  5s
     click element  css=.btn.btn-default
     page should contain element   css=circle.node.node--leaf:nth-child(${temp})
     Execute JavaScript  $('html, body').scrollTop(0);
     ${Actual Total Census1} =    Get text   css=html body div.wrapper div.radial-wrapper div#div1 svg.radial-svg g g.labels text.label
     Should Be Equal    ${Actual Total Census1}     ${Actual Total Census}


click on remove patient button in Mark patient as outlier popup window

     reload page
     sleep  2s
     ${Actual Total Census} =    Get text   css=html body div.wrapper div.radial-wrapper div#div1 svg.radial-svg g g.labels text.label
     log  ${Actual Total Census}
     ${temp} =  Evaluate  ${Actual Total Census} + 5
     ${temp1} =  Evaluate  ${temp} -1
     ${temp1} =  Evaluate  ${temp} -${Actual Total Census}
     Execute JavaScript  $("body").scrollTop($("body")[0].scrollHeight);
     click element    css=circle.node.node--leaf:nth-child(${temp1})
     page should contain  Mark patient as outlier?
     page should contain  This patient will be permanently removed from mission control. Are you sure?
     page should contain button  xpath=//button[contains(text(),'Remove')]
     page should contain button  xpath=//button[contains(text(),'Close')]
     wait until element is visible  css=#remove-button  5s
     click element  css=#remove-button
     sleep  2s
     ${bubble_deleted} =  Evaluate  ${Actual Total Census} -1
     log  ${bubble_deleted}
     ${bubble_deleted} =  Convert to string  ${bubble_deleted}
     Execute JavaScript  $('html, body').scrollTop(0);
     ${current Total Census} =    Get text   css=html body div.wrapper div.radial-wrapper div#div1 svg.radial-svg g g.labels text.label
     Should Be Equal    ${bubble_deleted}     ${current Total Census}


verify Mark patient as outlier popup window is not displayed for non staff user

     reload page
     sleep  2s
     ${Actual Total Census} =    Get text   css=html body div.wrapper div.radial-wrapper div#div1 svg.radial-svg g g.labels text.label
     log  ${Actual Total Census}
     ${temp} =  Evaluate  ${Actual Total Census} + 5
     ${temp1} =  Evaluate  ${temp} -1
     ${temp1} =  Evaluate  ${temp} -${Actual Total Census}
     Execute JavaScript  $("body").scrollTop($("body")[0].scrollHeight);
     click element    css=circle.node.node--leaf:nth-child(${temp1})
     ${tempval}=   run keyword and return status    element should be visible  xpath=//button[text()='Remove patient']
     log  ${tempval}
     run keyword if  '${tempval}' == 'False'
     ...   log    Mark patient as outlier popup window is not displayed for non staff user
     ...   ELSE
     ...   fail   Mark patient as outlier popup window is displayed for non staff user
     Execute JavaScript  $('html, body').scrollTop(0);

verify most recent decisions with a tag of "Recent"

   click element  css=#fullscreen-btn
   wait until page contains element  css=#fullscreen-btn  5s
   Execute JavaScript  $("body").scrollTop($("body")[0].scrollHeight);
   sleep  2s
   page should contain element   xpath=(//i[@class='icon-time pointer space-left'])[1]
   click element   xpath=(//i[@class='icon-time pointer space-left'])[1]
   page should contain element  xpath=(//textarea[@name='comment'])[1]
   Execute JavaScript  $('html, body').scrollTop(0);


click on a decision and view all the comments

   Execute JavaScript  $("body").scrollTop($("body")[0].scrollHeight);
   wait until page contains element  xpath=(//i[@class='icon-time pointer space-left'])[1]
   page should contain element   xpath=(//i[@class='icon-time pointer space-left'])[1]
   page should contain   This is a more recent 1
   click element  xpath=//div[@class='decision-table']/div/div[1]/div/ul/li/a/span[2]
   page should contain element  xpath=(//textarea[@name='comment'])[1]
   sleep  1s
   page should contain  This comment is entered by automated scripts for testing purpose in comment field
   page should contain  - balaji
   #page should contain element  xpath=(//span[contains(text(),'- balaji')])[1]
   click element  xpath=//div[@class='decision-table']/div/div[1]/div/ul/li/a/span[2]
   Execute JavaScript  $('html, body').scrollTop(0);

Enter comments in desision in realtime dashboard page

   click element  css=#fullscreen-btn
   Execute JavaScript  $("body").scrollTop($("body")[0].scrollHeight);
   wait until page contains element  xpath=(//i[@class='icon-time pointer space-left'])[1]
   page should contain element   xpath=(//i[@class='icon-time pointer space-left'])[1]
   page should contain   This is a more recent 1
   click element  xpath=//div[@class='decision-table']/div/div[1]/div/ul/li/a/span[2]
   wait until page contains element  xpath=(//textarea[@name='comment'])[1]
   page should contain element  xpath=(//textarea[@name='comment'])[1]
   #click element  xpath=(//textarea[@name='comment'])[1]
   click element  css=#message1>form>textarea
   input text   xpath=(//textarea[@name='comment'])[1]   ${COMMENT_TEXT}
   click button   xpath=(//input[@id='submit'])[1]
   page should contain  ${COMMENT_TEXT}
   click element  xpath=(//a[@class='title']/span)[2]
   Execute JavaScript  $('html, body').scrollTop(0);

check sub-bubble either have name of nurse name or unassigned

    Execute JavaScript  $("body").scrollTop($("body")[0].scrollHeight);
    page should contain element   xpath=//*[@class='circle-label'][text()='${SUB_BUBLE_NURSENAME1}']
    page should contain element   xpath=//*[@class='circle-label'][text()='${SUB_BUBLE_NURSENAME2}']
    page should contain element   xpath=//*[@class='circle-label'][text()='Unassigned']
    Execute JavaScript  $('html, body').scrollTop(0);

click on circle present next to 'This is a more recent one' and verify

   Execute JavaScript  $("body").scrollTop($("body")[0].scrollHeight);
   click element  xpath=//i[@id='fullscreen-btn']
   click element  css=#fullscreen-btn
   page should contain element  xpath=(//i[@class='icon-time pointer space-left'])[1]
   page should contain   This is a more recent 1
   click element   xpath=(//i[@class='icon-time pointer space-left'])[1]
   click element  xpath=(//a[@class='title']/span)[2]
   ${data-time}=  Get Element Attribute  xpath=(//i[@class='icon-time pointer space-left'])[1]@data-time
   log  ${data-time}
   ${windowid}=  get window identifiers
   log  ${windowid}
   ${windowname}=  get window names
   log  ${windowname}
   select window   undefined
   close window
   select window   Title=ED mission control
   page should contain  Emergency Department
   page should contain  status at
   click on date/time drop down in Emergency Department dashboard
   click on show the current state in realtime dashboard
   Execute JavaScript  $('html, body').scrollTop(0);

get current state date

   ${temp}=  get text  xpath=//span[@class='currentDt']
   log   ${temp}
   ${temp1}=  get regexp matches   ${temp}  ^[A-Za-z]*
   ${month}=  get from list  ${temp1}  0
   log  ${month}
   ${temp1}=  get regexp matches   ${temp}  [0-9]?[0-9]
   ${date}=  get from list  ${temp1}  0
   log  ${date}

   ${temp1}=  get regexp matches   ${temp}  [0-9]?[[0-9]:[0-9]?[[0-9]
   ${time}=  get from list  ${temp1}  0
   log  ${time}


   ${temp1}=  get regexp matches   ${temp}  [A-Z]*$
   ${AM_PM}=  get from list  ${temp1}  0
   log  ${AM_PM}

   ${month}=  evaluate  ${Months}.index("${month}") + 1
   log  ${month}
   set global variable  ${month}
   #Run Keyword If  ${month}<10  ${month}  = Catenate  0${month}
   log  ${month}
   ${get current state date}=  set variable  ${month}-${date}-2017
   ${get current state time}=  set variable  ${time}
   set global variable  ${get current state time}
   set global variable  ${get current state date}
   [Return]   ${get current state date}


using java script to get data/time

   click element   xpath=(//span[@class='dropdown']/a/i)[2]
   sleep  2s
   ${getdate}=   Execute Javascript  return window.jQuery("input[name=date]").val();
   log  ${getdate}
   ${gettime}=   Execute Javascript  return window.jQuery("input[name=time]").val();
   log  ${gettime}


Current date1

   click element  css=.currentDt
   ${getdate}=   Execute Javascript  return window.jQuery("input[name=date]").val();


################# Historical Dashboard ######################


mcLoad login page

    Open Browser  about:blank   ${BROWSER}
    Maximize Browser Window
    delete all cookies
    go to   ${URL}

Reset historical page

    ${converted} =     Convert Date    ${current_date}    date_format=%m-%d-%Y    result_format=%Y-%m-%d
    log  ${converted}


mclogin Page Loaded

    page should contain element   css=.btn.btn-block.btn-large.btn-success.login-submit
    Wait Until Page Contains  Qventus
    page should contain  Qventus

mclogin page contains
    page should contain element  xpath=//label[text()='Username or email']
    page should contain element  css=.btn.btn-block.btn-large.btn-success.login-submit

Enter mcusername
    #[Arguments]      ${username}
    input text  name=username   ${USERNAME}
    log  ${USERNAME}


Enter mcpassword
    #[Arguments]       ${password}
    input text  name=password  ${PASSWORD}
    log  ${PASSWORD}

verify signinbutton

   page should contain element   css=.btn.btn-block.btn-large.btn-success.login-submit

click on mcSign button

   click element   css=.btn.btn-block.btn-large.btn-success.login-submit

MCload Historical dashboard page

   click on date/time drop down in Emergency Department dashboard
   click go button in Show a past state

Enter current date in Enter past date field

    input text  name=date   ${CURRENT_DATE}
    log  ${CURRENT_DATE}


get current date

   sleep  5s
   ${temp}=  get text  xpath=//span[@class='currentDt']
   log   ${temp}
   ${temp1}=  get regexp matches   ${temp}  ^[A-Za-z]*
   ${month}=  get from list  ${temp1}  0
   log  ${month}
   ${temp1}=  get regexp matches   ${temp}  [0-9]?[0-9]
   ${date}=  get from list  ${temp1}  0
   log  ${date}

   ${temp1}=  get regexp matches   ${temp}  [0-9]?[[0-9]:[0-9]?[[0-9]
   ${time}=  get from list  ${temp1}  0
   log  ${time}
   ${temp1}=  get regexp matches   ${temp}  [A-Z]*$
   ${AM_PM}=  get from list  ${temp1}  0
   log  ${AM_PM}

   ${month}=  evaluate  ${Months}.index("${month}") + 1
   log  ${month}
   ${currentdate}=  set variable  ${month}-${date}-2017
   ${CURRENT_DATE}=  set variable  ${currentdate}
   set global variable  ${CURRENT_DATE}

   [Return]   ${currentdate}


login as valid non staff user

     #click element   css=.btn.btn-block.btn-large.btn-success.login-submit
     close browser
     open Browser  about:blank   ${BROWSER}
     Maximize Browser Window
     delete all cookies
     go to   ${URL}
     Wait Until Page Contains  Qventus
     page should contain element  css=.btn.btn-block.btn-large.btn-success.login-submit
     input text  name=username   ${NON_USERNAME}
     log  ${NON_USERNAME}
     input text  name=password  ${NON_PASSWORD}
     log  ${NON_PASSWORD}
     click element   css=.btn.btn-block.btn-large.btn-success.login-submit
     mcloginLeftpanePageobj.click on MC icon


verify mc historical dashboard page title

    title should be   ED mission control
    page should contain  Emergency Department
    page should contain  status at
    page should contain  Showing the state on

verify mc historical dashboard hostpital name

    page should contain  status at ${HOSPITAL_NAME}

verify 4 main mc metrics

    page should contain   Total Census
    page should contain   Length of stay
    page should contain   of discharges in
    page should contain   the last 60 minutes


    page should contain   Expected patients will
    page should contain   be discharged in the
    page should contain   next hour

    page should contain   Expected patients will
    page should contain   be admitted in the
    page should contain   next hour


verify Status Counts

    page should contain  Waiting Room
    page should contain  Triaged
    page should contain  Roomed
    page should contain  Pending Discharges


Get Value From Text Field

    ${text} =    Get text    xpath=//*[@id="div1"]/svg/g/g[3]/text
    log  ${text}

click on hospital drop down

    click element  xpath=(//i[@class='fa fa-caret-down'])[2]

get state of the emergency room on??

   ${emergency_current_historical_datetime_displayed} =  Get Text  xpath=//span[@class='currentDt']
   log  ${emergency_current_historical_datetime_displayed}
   Should Be Equal    ${emergency_current_historical_datetime_displayed}    ${HISTORICAL_datetime}


select hospital from list


    click element   xpath=//span[@class='dropdown open']/ul/li/a[text()='${SELECT_HOSPITAL_NAME}']
    page should contain  Emergency Department
    page should contain  status at ${SELECT_HOSPITAL_NAME}
    click element  xpath=(//i[@class='fa fa-caret-down'])[1]
    click element   xpath=//span[@class='dropdown open']/ul/li/a[text()='${HOSPITAL_NAME}']
    page should contain  Emergency Department
    page should contain  status at ${HOSPITAL_NAME}


click on Show the current state

    #click element   xpath=//a [text()= 'Show the current state']
    click element  css=span[class='dropdown open']>ul>li>a


Enter past date ??

    input text  name=date   ${MM-DD-YYYY}


Enter past time

    input text  name=time   ${hh:mm}


Enter previous week date in Enter past date field

    get current date
    log  ${current_date}
    ${converted} =     Convert Date    ${current_date}    date_format=%m-%d-%Y    result_format=%Y-%m-%d
    log  ${converted}
    ${previous_week} =  Subtract Time From Date    ${converted}   7 days
    ${previous_week} =     Convert Date    ${previous_week}    date_format=%Y-%m-%d %H:%M:%S.%f    result_format=%m-%d-%Y
    log  ${previous_week}
    click on date/time drop down in Emergency Department dashboard
    input text  name=date   ${previous_week}
    log  ${previous_week}
    ${PREVIOUS_WEEK_TIME}=  set variable  ${previous_week}
    set global variable  ${PREVIOUS_WEEK_TIME}
    edpageobj.click go button
    verify state of the emergency room on previous week date

Enter previous week date in Enter past date field and verify

   click element   css=.currentDt
   sleep  2s
   ${getdate}=   Execute Javascript  return window.jQuery("input[name=date]").val();
   log  ${getdate}
   ${gettime}=   Execute Javascript  return window.jQuery("input[name=time]").val();
   log  ${gettime}
   ${converted} =     Convert Date    ${getdate}    date_format=%m/%d/%Y    result_format=%Y-%m-%d
   log  ${converted}
   ${current_date} =  Add Time To Date  ${converted}   0 days
   ${current_date} =     Convert Date    ${current_date}    date_format=%Y-%m-%d %H:%M:%S.%f    result_format=%m-%d-%Y
   log  ${current_date}

   ${converted} =     Convert Date    ${current_date}    date_format=%m-%d-%Y    result_format=%Y-%m-%d
   ${previous_week} =  Subtract Time From Date    ${converted}   7 days
   ${previous_week} =     Convert Date    ${previous_week}    date_format=%Y-%m-%d %H:%M:%S.%f    result_format=%m/%d/%Y
   log  ${previous_week}
   input text  name=date   ${previous_week}
   log  ${previous_week}
   edpageobj.click go button
   click element   css=.currentDt
   ${getdate}=   Execute Javascript  return window.jQuery("input[name=date]").val();
   log  ${getdate}
   Should Be Equal  ${getdate}  ${previous_week}

Enter previous month date in Enter past date field updated


   click element   css=.currentDt
   sleep  2s
   ${getdate}=   Execute Javascript  return window.jQuery("input[name=date]").val();
   log  ${getdate}
   ${gettime}=   Execute Javascript  return window.jQuery("input[name=time]").val();
   log  ${gettime}
   ${converted} =     Convert Date    ${getdate}    date_format=%m/%d/%Y    result_format=%Y-%m-%d
   log  ${converted}
   ${current_date} =  Add Time To Date  ${converted}   0 days
   ${current_date} =     Convert Date    ${current_date}    date_format=%Y-%m-%d %H:%M:%S.%f    result_format=%m-%d-%Y
   log  ${current_date}

   ${converted} =     Convert Date    ${current_date}    date_format=%m-%d-%Y    result_format=%Y-%m-%d
   ${previous_month} =  Subtract Time From Date    ${converted}   30 days
   ${previous_month} =     Convert Date    ${previous_month}    date_format=%Y-%m-%d %H:%M:%S.%f    result_format=%m/%d/%Y
   log  ${previous_month}
   input text  name=date   ${previous_month}
   log  ${previous_month}
   edpageobj.click go button
   click element   css=.currentDt
   ${getdate}=   Execute Javascript  return window.jQuery("input[name=date]").val();
   log  ${getdate}
   Should Be Equal  ${getdate}  ${previous_month}

Enter previous year date in Enter past date field updated

   click element   css=.currentDt
   sleep  2s
   ${getdate}=   Execute Javascript  return window.jQuery("input[name=date]").val();
   log  ${getdate}
   ${gettime}=   Execute Javascript  return window.jQuery("input[name=time]").val();
   log  ${gettime}
   ${converted} =     Convert Date    ${getdate}    date_format=%m/%d/%Y    result_format=%Y-%m-%d
   log  ${converted}
   ${current_date} =  Add Time To Date  ${converted}   0 days
   ${current_date} =     Convert Date    ${current_date}    date_format=%Y-%m-%d %H:%M:%S.%f    result_format=%m-%d-%Y
   log  ${current_date}

   ${converted} =     Convert Date    ${current_date}    date_format=%m-%d-%Y    result_format=%Y-%m-%d
   ${previous_year} =  Subtract Time From Date    ${converted}   365 days
   ${previous_year} =     Convert Date    ${previous_year}    date_format=%Y-%m-%d %H:%M:%S.%f    result_format=%m/%d/%Y
   log  ${previous_year}
   input text  name=date   ${previous_year}
   log  ${previous_year}
   edpageobj.click go button
   click element   css=.currentDt
   ${getdate}=   Execute Javascript  return window.jQuery("input[name=date]").val();
   log  ${getdate}
   Should Be Equal  ${getdate}  ${previous_year}


Enter previous hour in Enter past time field updated

   click element   css=.currentDt
   sleep  2s
   ${getdate}=   Execute Javascript  return window.jQuery("input[name=date]").val();
   log  ${getdate}
   ${gettime}=   Execute Javascript  return window.jQuery("input[name=time]").val();
   log  ${gettime}
   ${converted} =     Convert Date    ${getdate}    date_format=%m/%d/%Y    result_format=%Y-%m-%d
   log  ${converted}
   ${current_date} =  Add Time To Date  ${converted}   0 days
   ${current_date} =     Convert Date    ${current_date}    date_format=%Y-%m-%d %H:%M:%S.%f    result_format=%m-%d-%Y
   log  ${current_date}
   log  ${previous_hour}
   #click on date/time drop down in Emergency Department dashboard
   ##input text  name=time   ${previous_hour}
    input text  name=time  05:15
    log  ${previous_hour}
    edpageobj.click go button
    click element   css=.currentDt
    ${gettime}=   Execute Javascript  return window.jQuery("input[name=time]").val();
    log  ${getdate}
    Should Be Equal  ${gettime}  05:15


Enter previous week date in Enter past time field

    input text  name=time   ${PREVIOUS_WEEK_TIME}
    log  ${PREVIOUS_WEEK_TIME}

verify state of the emergency room on previous week date??

   ${emergency_current_historical_datetime_displayed} =  Get Text  xpath=//span[@class='currentDt']
   log  ${emergency_current_historical_datetime_displayed}
   log  ${PREVIOUS_WEEK_DATETIME}


Enter previous month date in Enter past date field

    get current date
    log  ${current_date}
    ${converted} =     Convert Date    ${current_date}    date_format=%m-%d-%Y    result_format=%Y-%m-%d
    log  ${converted}
    ${previous_month} =  Subtract Time From Date    ${converted}   30 days
    ${previous_month} =     Convert Date    ${previous_month}    date_format=%Y-%m-%d %H:%M:%S.%f    result_format=%m-%d-%Y
    #${previous} =  Subtract Time From Date    ${current_date}   7 days
    click on date/time drop down in Emergency Department dashboard
    input text  name=date   ${previous_month}
    log  ${previous_month}
    ${PREVIOUS_MONTH_TIME}=  set variable  ${previous_month}
    set global variable  ${PREVIOUS_MONTH_TIME}
    edpageobj.click go button
    verify state of the emergency room on previous month date


Enter previous month date in Enter past time field

    input text  name=time   ${PREVIOUS_MONTH_TIME}
    log  ${PREVIOUS_MONTH_TIME}

Enter previous year date in Enter past date field

    get current date
    log  ${current_date}
    ${converted} =     Convert Date    ${current_date}    date_format=%m-%d-%Y    result_format=%Y-%m-%d
    log  ${converted}
    ${previous_year} =  Subtract Time From Date    ${converted}   365 days
    ${previous_year} =     Convert Date    ${previous_year}    date_format=%Y-%m-%d %H:%M:%S.%f    result_format=%m-%d-%Y
    #${previous} =  Subtract Time From Date    ${current_date}   7 days
    click on date/time drop down in Emergency Department dashboard
    input text  name=date   ${previous_year}
    log  ${previous_year}
    ${PREVIOUS_YEAR_TIME}=  set variable  ${previous_year}
    set global variable  ${PREVIOUS_YEAR_TIME}
    click go button in Show a past state
    verify state of the emergency room on previous year date

Enter previous year date in Enter past time field ??

    input text  name=time   ${PREVIOUS_YEAR_TIME}
    log  ${PREVIOUS_YEAR_TIME}

verify state of the emergency room on previous year date

   get current state date
   log  ${get current state date}
   log  ${PREVIOUS_MONTH_TIME}
   ${PREVIOUS_YEAR_TIME}=  Convert to string  ${PREVIOUS_YEAR_TIME}
   ${get current state date}=  Convert to string  ${get current state date}
   log  ${get current state date}
   log  ${PREVIOUS_YEAR_TIME}
   Should Be Equal  "${get current state date}"  "${PREVIOUS_YEAR_TIME}"

Enter previous hour in Enter past time field

    input text  name=time   09:40
    input text  name=date   ${current_date}

Enter previous Minute in Enter past time field

    input text  name=time   09:46
    log  ${PREVIOUS_MINUTE}
    input text  name=date   ${current_date}

click go button

      click button   xpath=//button[text()='Go']

verify Invalid date/time validation message

      page should contain   Bad date/time inputs - please fix!

verify Invalid hour validation message

     page should contain   Invalid hour

verify Invalid date in time dropdown

    #MM-DD-YYYY
    ${count}=  set variable  ${0}
    @{invaliddatelist}  create list  00-02-2016   13-02-2016   10-00-2016   10-32-2016   02-30-2016    09-31-2016
    :FOR      ${Item}     IN      @{invaliddatelist}
    \  input text  name=date   ${invaliddatelist[${count}]}
    \  log  ${invaliddatelist}
    \  click go button
    \  verify Invalid date/time validation message
    \  click on date/time drop down in Emergency Department dashboard
    \  #click on date/time drop down
    \  sleep  1s
    \  ${count}=  evaluate  ${count}+1


verify Invalid hour/time in time dropdown
    #hh:mm
    ${count}=  set variable  ${0}
    @{invalidhourlist}  create list  24:23  -9:23  1212  12333
    :FOR      ${Item}     IN      @{invalidhourlist}
    \  input text  name=time   ${invalidhourlist[${count}]}
    \  log  ${invalidhourlist}
    \  click go button
    \  verify Invalid hour validation message
    \  click on date/time drop down in Emergency Department dashboard
    \  click on date/time drop down in Emergency Department dashboard
    \  sleep  1s
    \  ${count}=  evaluate  ${count}+1
     #hh:mm
    ${count}=  set variable  ${0}
    @{invalidhourlist}  create list  12:60  12:38
    :FOR      ${Item}     IN      @{invalidhourlist}

    \  input text  name=time   ${invalidhourlist[${count}]}
    \  log  ${invalidhourlist}
    \  click go button
    \  verify Invalid date/time validation message
    \  click on date/time drop down in Emergency Department dashboard
    \  click on date/time drop down in Emergency Department dashboard
    \  sleep  1s
    \  ${count}=  evaluate  ${count}+1


verify zopim on the page

    #page should contain    Leave a message
    click element       xpath=//html[@lang='en']/body/div[1]
    sleep  5s
    page should contain    Zopim
    #page should contain element   xpath=(//a[@class='meshim_widget_widgets_branding_Zopim desktop'])[2]

###########################Total Census#############

Get value From Total Census historical page and verify

    ${historical_Actual_Total_Census} =    Get text   css=html body div.wrapper div.radial-wrapper div#div1 svg.radial-svg g g.labels text.label
    log  ${historical_Actual_Total_Census}
     run keyword if  '${historical_Actual_Total_Census}' >= '0'
     ...   log    Total Census is greater >=0
     ...   ELSE
     ...   fail   Total Census is error

Get value Length of stay of discharges in the past hour and verify

    ${historical_Actual_Length of stay} =    Get text   css=html body div.wrapper div.radial-wrapper div#div2 svg.radial-svg g g.labels text.label
    log  ${historical_Actual_Length of stay}
    run keyword if  '${historical_Actual_Length of stay}' >= '0'
     ...   log    Length of stay of discharges in the past hour is greater >=0
     ...   ELSE
     ...   fail   Length of stay of discharges in the past hour is error



Get value Expected patients willbe discharged in thenext hour and verify

    ${historical_Actual_Exp_patients_willbe_discharged} =    Get text   css=html body div.wrapper div.radial-wrapper div#div3 svg.radial-svg g g.labels text.label
    log  ${historical_Actual_Exp_patients_willbe_discharged}
    run keyword if  '${historical_Actual_Exp_patients_willbe_discharged}' >= '0'
     ...   log    Expected patients willbe discharged in thenext hour is greater >=0
     ...   ELSE
     ...   fail   Expected patients willbe discharged in thenext hour is error


Get value Expected patients willbe admitted in thenext hour and verify

    ${historical_Actual_Exp_patients_willbe_admitted} =    Get text   css=html body div.wrapper div.radial-wrapper div#div4 svg.radial-svg g g.labels text.label
    log  ${historical_Actual_Exp_patients_willbe_admitted}
    run keyword if  '${historical_Actual_Exp_patients_willbe_admitted}' >= '0'
     ...   log    Expected patients willbe admitted in thenext hour is greater >=0
     ...   ELSE
     ...   fail   Expected patients willbe admitted in thenext hour is error



verify Total Census equals to number of patients in historcial page

     ${Actual Total Census} =    Get text   css=html body div.wrapper div.radial-wrapper div#div1 svg.radial-svg g g.labels text.label
     log  ${Actual Total Census}
     page should contain element  xpath=(//i[@class='fa fa-male fa-lg'])[${Actual Total Census}]

     ${temp} =  Evaluate  ${Actual Total Census} + 1
     log   {temp}
     page should not contain element  xpath=(//i[@class='fa fa-male fa-lg'])[${temp}]


################Status Counts #################
############################### Waiting Room #############

Get Value From Waiting Room status count from historical view page and verify

    ${countpresent}=    Run Keyword and Return Status    Element Should Be Visible    xpath=//table//tr[1]/td[2]//i
    Run Keyword If    '${countpresent}' == 'False'
    ...    Log    Total Waiting Room count is blank
    ...    ELSE   Pending Waiting Room status count verifcation1

Pending Waiting Room status count verifcation1

    ${Actual waiting room count} =    Get text    xpath=(//td[@class='step-label'])[1]
    log  ${Actual waiting room count}
    ${Actual waiting room count}=   get regexp matches  ${Actual waiting room count}  [0-9]?[0-9]?[0-9]
    log  ${Actual waiting room count}
    ${Actual waiting room count}=  get from list  ${Actual waiting room count}  0
    log  ${Actual waiting room count}
    run keyword if  '${Actual waiting room count}' >= '0'
     ...   log    Total waiting room count is greater >=0
     ...   ELSE
     ...   fail   Total waiting room is error
    ${XpathCount}=    Get matching xpath count  xpath=//table//tr[1]/td[2]//i
    log  ${XpathCount}
    Should Be Equal    ${Actual waiting room count}    ${XpathCount}


##########################Roomed####################

Get Value From Roomed status count from historical view page and verify

    ${countpresent}=    Run Keyword and Return Status    Element Should Be Visible    xpath=//table//tr[3]/td[2]//i
    Run Keyword If    '${countpresent}' == 'False'
    ...    Log    Total Roomed count is blank
    ...    ELSE   Pending Roomed status count verifcations

Pending Roomed status count verifcations

    ${Actual room count} =    Get text    xpath=(//td[@class='step-label'])[3]
    log  ${Actual room count}
    ${Actual room count}=   get regexp matches  ${Actual room count}  [0-9]?[0-9]?[0-9]
    log  ${Actual room count}
    ${Actual room count}=  get from list  ${Actual room count}  0
    log  ${Actual room count}
    run keyword if  '${Actual room count}' >= '0'
     ...   log    Total roomed count is greater >=0
     ...   ELSE
     ...   fail   Total roomed is error
    ${XpathCount}=    Get matching xpath count  xpath=//table//tr[3]/td[2]//i
    log  ${XpathCount}
    Should Be Equal    ${Actual room count}    ${XpathCount}
    #(//i[@class='fa fa-male fa-lg'])[138]  -- this give complete count

##################### Triaged #################

Get Value From Triaged Room status count from historical view page and verify

    ${countpresent}=    Run Keyword and Return Status    Element Should Be Visible    xpath=//table//tr[2]/td[2]//i
    Run Keyword If    '${countpresent}' == 'False'
    ...    Log    Total Roomed count is blank
    ...    ELSE   Triaged status count verifcation

Triaged status count verifcation

    ${Actual Triaged room count} =    Get text    xpath=(//td[@class='step-label'])[2]
    log  ${Actual Triaged room count}
     ${Actual Triaged room count}=   get regexp matches  ${Actual Triaged room count}  [0-9]?[0-9]?[0-9]
    log  ${Actual Triaged room count}
    ${Actual Triaged room count}=  get from list  ${Actual Triaged room count}  0
    log  ${Actual Triaged room count}
    run keyword if  '${Actual Triaged room count}' >= '0'
     ...   log    Total Triaged count is greater >=0
     ...   ELSE
     ...   fail   Total Triaged is error
    ${XpathCount}=    Get matching xpath count  xpath=//table//tr[2]/td[2]//i
    log  ${XpathCount}
    Should Be Equal    ${Actual Triaged room count}    ${XpathCount}

########## Pending Discharges ###################

Get Value From Pending Discharges status count from historical view page and verify

    ${countpresent}=    Run Keyword and Return Status    Element Should Be Visible    xpath=//table//tr[4]/td[2]//i
    Run Keyword If    '${countpresent}' == 'False'
    ...    Log    Total Pending Discharges count is blank
    ...    ELSE   Pending Discharges status count verifcations

Pending Discharges status count verifcations

    ${Actual Pending Discharges count} =    Get text    xpath=(//td[@class='step-label'])[4]
    log  ${Actual Pending Discharges count}
     ${Actual Pending Discharges count}=   get regexp matches  ${Actual Pending Discharges count}  [0-9]?[0-9]?[0-9]
    log  ${Actual Pending Discharges count}
    ${Actual Pending Discharges count}=  get from list  ${Actual Pending Discharges count}  0
    log  ${Actual Pending Discharges count}
    run keyword if  '${Actual Pending Discharges count}' >= '0'
     ...   log    Total Pending Discharges count is greater >=0
     ...   ELSE
     ...   fail   Total Pending Discharges is error
    ${XpathCount}=    Get matching xpath count  xpath=//table//tr[4]/td[2]//i
    log  ${XpathCount}
    Should Be Equal    ${Actual Pending Discharges count}    ${XpathCount}

###################################Pending Admits ###############

Get Value From Pending Admits status count from historical view page and verify

    ${countpresent}=    Run Keyword and Return Status    Element Should Be Visible    xpath=//table//tr[5]/td[2]//i
    Run Keyword If    '${countpresent}' == 'False'
    ...    Log    Total Pending Discharges count is blank
    ...    ELSE   Pending Admits status count verifcation in historical page

Pending Admits status count verifcation in historical page

    ${Actual Pending Admits count} =    Get text    xpath=(//td[@class='step-label'])[5]
    log  ${Actual Pending Admits count}
    ${Actual Pending Admits count}=   get regexp matches  ${Actual Pending Admits count}  [0-9]?[0-9]?[0-9]
    log  ${Actual Pending Admits count}
    ${Actual Pending Admits count}=  get from list  ${Actual Pending Admits count}  0
    log  ${Actual Pending Admits count}
    run keyword if  '${Actual Pending Admits count}' >= '0'
     ...   log    Total Pending Discharges count is greater >=0
     ...   ELSE
     ...   fail   Total Pending Discharges is error
    ${XpathCount}=    Get matching xpath count  xpath=//table//tr[5]/td[2]//i
    Should Be Equal   ${Actual Pending Admits count}  ${XpathCount}


################Bubbles########################

verify Mark patient as outlier popup window is not displayed in historical dashboard

     ${Actual Total Census} =    Get text   css=html body div.wrapper div.radial-wrapper div#div1 svg.radial-svg g g.labels text.label
     #${Total Census} =    Get text   xpath=/html/body/div[3]/div[4]/div[1]/svg/g/g[3]/text
     log  ${Actual Total Census}
     ${temp} =  Evaluate  ${Actual Total Census} + 5
     ${temp1} =  Evaluate  ${temp} -1
     ${temp1} =  Evaluate  ${temp} -${Actual Total Census}
     #For scrolling to bottom
     Execute JavaScript  $("body").scrollTop($("body")[0].scrollHeight);
     click element    css=circle.node.node--leaf:nth-child(${temp1})
     sleep  3s
     ${tempval}=   run keyword and return status    element should be visible  xpath=//button[text()='Remove patient']
     log  ${tempval}
     run keyword if  '${tempval}' == 'False'
     ...   log    Mark patient as outlier popup window is not displayed for non staff user
     ...   ELSE
     ...   fail   Mark patient as outlier popup window is displayed for non staff user
     #For scrolling to top
     Execute JavaScript  $('html, body').scrollTop(0);

#######################Recommendations############
