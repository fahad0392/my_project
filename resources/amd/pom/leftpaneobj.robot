*** Settings ***
Library         SeleniumLibrary
#Resource        ../common.robot



*** Keywords ***

mouse over on leftpane

     mouse over  css=div[id='sidebar']
     mouse over  css=#panelCaller
     sleep  2s

Verify home button in leftpane

    wait until page contains element  css=.icon-home  timeout=30
    page should contain element  css=.icon-home

click on home button

   wait until element is visible  css=.logo.gutter-adjustment>img  10s
   #click element  xpath=//i[@class='icon-home']
   click element  css=.icon-home

verify signout button

    wait until page contains element  css=.icon-home  timeout=30
    #page should contain element  xpath=//i[@class='icon-user']
    page should contain element  css=.icon-user
    #page should contain element  xpath=//a[text()='Sign out']

click on home

     wait until element is visible  css=.icon-home  10s
     click element  css=.icon-home

click on signout

    execute javascript  document.querySelector('#sidebar').scrollTop=600
    click element  css=.icon-user
    set focus to element  css=a[href='/logout']
    press key  css=a[href='/logout']  \\13
    #click element  css=a[href='/logout']

click on Dashboards icon

    #click element  xpath=//i[@class="icon-dashboard"]
    click element  css=.icon-dashboard

verify Dashboards button under leftpane

    page should contain element  css=.icon-dashboard
    page should contain element  xpath=//i[text()='Dashboards']

verify Metrics button under leftpane

    page should contain element  css=.icon-signal
    page should contain element  xpath=//i[text()='Metrics']

click on Metrics icon

    click element  css=.icon-signal
    #click element  xpath=//i[text()='Metrics']

verify Alerts button under leftpane

    page should contain element  css=.icon-inbox
    page should contain element  xpath=//i[text()='Alerts']

click on Alerts icon

    click element  css=.icon-inbox
    #click element  xpath=//i[@class="icon-inbox"]

verify Staffing button under leftpane

    page should contain element  css=.icon-calendar
    page should contain element  xpath=//i[text()='Staffing']

click on Staffing icon

    click element  css=.icon-calendar
    #click element  xpath=//i[@class='icon-calendar']

click on litmos icon

    page should contain element  css=#litmos
    click element  css=#litmos

verify MC button under leftpane

    page should contain element  css=.icon-plane
    page should contain element  xpath=//i[text()='MC']

click on MC icon

    click element  css=.icon-plane
    #click element  xpath=//i[@class='icon-plane']

click Profile link

     click element  css=a[href='/metro/#me']
     #click element  xpath=//a[text()='Profile']

click contact support link

    click element  css=a[href='/metro/#contactform']
    #click element  xpath=//a[text()='Contact Support']

click on user Icons

    click element  css=.icon-user
    #click element  xpath=//i[@class='icon-user']

click on Patient List icon

    click element  css=.icon-list-alt
    #click element  xpath=//i[text()='Patient List']

verify IDR option in leftpane

    wait until page contains element  css=.icon-list-alt  2s
    page should contain element  css=.icon-list-alt
    page should contain element  css=li[data-name='patient-list-view']>a>i.name
    page should contain  Patient List

verify RTAL option in leftpane

    wait until page contains element  css=.icon-list-alt  2s
    page should contain element  css=.icon-list-alt
    page should contain element  css=a[href='/rtal/']>i[class='name']
    page should contain  RTAL

click on RTAL icon

    click element  css=.icon-list-alt