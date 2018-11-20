*** Settings ***

Library         SeleniumLibrary
Library         robot.libraries.String
Library         Collections
Library         OperatingSystem
Library         robot.libraries.DateTime



Resource        ../mccommon.robot

*** Variables ***

@{Months}  January  Feburary   March  April  May  June  July  August  September  October  November  December


*** Keywords ***

mcLoad login page

    Open Browser  about:blank   ${BROWSER}
    Maximize Browser Window
    delete all cookies
    go to   ${URL}

mclogin Page Loaded

    Wait Until Page Contains  Qventus
    page should contain element   css=.btn.btn-block.btn-large.btn-success.login-submit

mclogin page contains

    #page should contain element  xpath=//label[text()='Username or email']
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

MCload InPatient dashboard page

   ${BASE_URL1} =    Remove String    ${URL}    login
   log  ${BASE_URL1}
   Set Global Variable      ${BASE_URL1}
   ${MC_INPATIENT_URL}=  Catenate  ${BASE_URL1}missionControl/dashboard/${HOSPITAL_ID}/ip/
   go to   ${MC_INPATIENT_URL}


Reset realtimeMC page

    #go to   ${URL}

click on home button

   click element  xpath=//i[@class="icon-home"]
   Set Browser Implicit Wait	30 seconds

click on MC icon

    click element  xpath=//i[@class='icon-plane']


verify mc InPatient dashboard page

    title should be  IP mission control
    page should contain  Inpatient
    page should contain  status at
    page should contain  Showing the current state on

verify mc InPatient dashboard hostpital name

    page should contain  Inpatient
    page should contain  status at ${HOSPITAL_NAME}

####### Dials################

verify 4 main mc top dials displayed

    page should contain   Total Census

    page should contain   Available Beds

    page should contain  Pending Admits
    page should contain  for Next 24 Hours

    page should contain   Expected Discharges
    page should contain   for Next 24 Hours


Get Value From Total Census top dials

    ${Actual Total Census} =    Get text   css=html body.inpatient div.wrapper div.radial-wrapper div#div1 svg.radial-svg g g.labels text.label
     log  ${Actual Total Census}
     run keyword if  '${Actual Total Census}' >= '0'
     ...   log    Total Census is greater >=0
     ...   ELSE
     ...   fail   Total Census is error

Get Value From Available Beds top dials

    ${Available_Beds} =    Get text   css=html body.inpatient div.wrapper div.radial-wrapper div#div2 svg.radial-svg g g.labels text.label
     log  ${Available_Beds}
     run keyword if  '${Available_Beds}' >= '0'
     ...   log    Available Beds is greater >=0
     ...   ELSE
     ...   fail   Available Beds is error

Get Value From Pending Admits for Next 24 Hours top dials

    ${Pending Admitsfor Next 24 Hours} =    Get text   css=html body.inpatient div.wrapper div.radial-wrapper div#div3 svg.radial-svg g g.labels text.label
     log  ${Pending Admitsfor Next 24 Hours}
     run keyword if  '${Pending Admitsfor Next 24 Hours}' >= '0'
     ...   log    Pending Admitsfor Next 24 Hours is greater >=0
     ...   ELSE
     ...   fail   Pending Admitsfor Next 24 Hours is error

Get Value From Expected Discharges for Next 24 Hours top dials

    ${Expected Dischargesfor Next 24 Hours} =    Get text   css=html body.inpatient div.wrapper div.radial-wrapper div#div4 svg.radial-svg g g.labels text.label
     log  ${Expected Dischargesfor Next 24 Hours}
     run keyword if  '${Expected Dischargesfor Next 24 Hours}' >= '0'
     ...   log    Expected Dischargesfor Next 24 Hours is greater >=0
     ...   ELSE
     ...   fail   Expected Dischargesfor Next 24 Hours is error


###### Status Counts #######

verify Status Counts

    page should contain  Status Counts
    page should contain  Open Requests
    page should contain  Bed Closures


Get Value From Open Requests status count and verify

    ${countpresent}=    Run Keyword and Return Status    Element Should Be Visible    xpath=//table//tr[3]/td[2]//i
    Run Keyword If    '${countpresent}' == 'False'
    ...    Log    Open Requests count is blank
    ...    ELSE   Open Requests status count verification

Open Requests status count verification

    ${Open Requests count} =    Get text    xpath=(//td[@class='step-label'])[2]
    log  ${Open Requests count}
     ${Actual Triaged room count}=   get regexp matches  ${Open Requests count}  [0-9]?[0-9]?[0-9]
    log  ${Open Requests count}
    ${Open Requests count}=  get from list  ${Open Requests count}  0
    log  ${Open Requests count}
    run keyword if  '${Actual Triaged room count}' >= '0'
     ...   log    Total Triaged count is greater >=0
     ...   ELSE
     ...   fail   Total Triaged is error
    ${XpathCount}=    Get matching xpath count  xpath=//table//tr[3]/td[2]//i
    log  ${XpathCount}
    Should Be Equal    ${Open Requests count}    ${XpathCount}
    #(//i[@class='fa fa-male fa-lg'])[138]  -- this give complete count

Get Value From Bed Closures status count and verify

    ${countpresent}=    Run Keyword and Return Status    Element Should Be Visible    xpath=//table//tr[3]/td[2]//i
    Run Keyword If    '${countpresent}' == 'False'
    ...    Log    Bed Closures count is blank
    ...    ELSE   Bed Closures status count verification

Bed Closures status count verification

    ${Bed Closures count} =    Get text    xpath=(//td[@class='step-label'])[2]
    log  ${Bed Closures count}
     ${Bed Closures count}=   get regexp matches  ${Bed Closures count}  [0-9]?[0-9]?[0-9]
    log  ${Bed Closures count}
    ${Bed Closures count}=  get from list  ${Bed Closures count}  0
    log  ${Bed Closures count}
    run keyword if  '${Bed Closures count}' >= '0'
     ...   log    Total Triaged count is greater >=0
     ...   ELSE
     ...   fail   Total Triaged is error
    ${XpathCount}=    Get matching xpath count  xpath=//table//tr[3]/td[2]//i
    log  ${XpathCount}
    Should Be Equal    ${Bed Closures count}    ${XpathCount}
    #(//i[@class='fa fa-male fa-lg'])[138]  -- this give complete count


########

inPatientpageobj.verify bubbles legends

    page should contain  Occupied
    page should contain element  css=#legend > ul:nth-child(1) > li:nth-child(1) > svg:nth-child(1) > circle:nth-child(1)
    page should contain  Available
    page should contain element  css=#legend > ul:nth-child(1) > li:nth-child(2) > svg:nth-child(1) > circle:nth-child(1)
    page should contain  Closed
    page should contain element  css=#legend > ul:nth-child(1) > li:nth-child(3) > svg:nth-child(1) > circle:nth-child(1)


verify sub-bubble have name of units

    page should contain element   xpath=//*[@class='circle-label'][text()='${SUB_BUBLE_UNITNAME1}']
    page should contain element   xpath=//*[@class='circle-label'][text()='${SUB_BUBLE_UNITNAME2}']
    page should contain element   xpath=//*[@class='circle-label'][text()='${SUB_BUBLE_UNITNAME3}']
    page should contain element   xpath=//*[@class='circle-label'][text()='${SUB_BUBLE_UNITNAME4}']
    page should contain element   xpath=//*[@class='circle-label'][text()='${SUB_BUBLE_UNITNAME5}']
    #Execute Javascript  window.jQuery("circle[class=node]").eq(4);
    ${Total_unit_count}=   Execute Javascript  return window.jQuery("circle[class=node]").length
    log  ${Total_unit_count}
    ${Total_unit_count}=  Convert To Integer  ${Total_unit_count}
    ${UNITS_COUNT}=  Convert To Integer  ${UNITS_COUNT}
    Should Be Equal    ${Total_unit_count}     ${UNITS_COUNT}

verify unit bubles have tool tip

    click element  xpath=//i[@id='fullscreen-btn']
    mouse over  css=html body.inpatient div.wrapper table tbody tr td div.vis-container svg g circle.node
    Execute Javascript  jquery=window.jQuery("circle[class=node]").eq(3).mouseover()
    sleep  1s
    page should contain  Scheduled admit
    page should contain  Occupied beds
    page should contain  Available beds
    page should contain  Closed beds
    Execute Javascript  jquery=window.jQuery("circle[class=node]").eq(4).mouseover()
    sleep  1s
    page should contain  Scheduled admit
    page should contain  Occupied beds
    page should contain  Available beds
    page should contain  Closed beds

verify tooltips in the bubble shows bed name

    click element  xpath=//i[@id='fullscreen-btn']
    mouse over  css=circle.node.node--leaf:nth-child(4)
    page should contain  Bed
    page should contain  bed101
    #page should contain  xpath=//span[@class='tooltip-label']












