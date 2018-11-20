verify AMD home page loaded*** Settings ***
Library         SeleniumLibrary
Resource        ../pom/../amdvariables.robot



*** Keywords ***

verify AMD home page loaded

    sleep  5s
    Wait Until Page Contains  Welcome  30s
    Location Should Contain  metro
    page should contain  Welcome

verify Dashboards page loaded

    Wait Until Page Contains  You don't have any dashboards  timeout=30s
    page should contain  You don't have any dashboards

verify Metrics page loaded

    page should contain  Metrics
    Location Should Contain  metric

verfiy Alert page loaded

    page should contain  Your feed
    page should contain element  css=.btn.btn-flat.dismiss-all.aside
    page should contain element  css=.hero-unit-title
    page should contain button  Add an alert


verfiy Staffing page loaded

    page should contain element  css=.hero-unit-title.gutter-adjustment
    page should contain  Staffing

verfiy litmos page loaded

    Location Should Contain  litmos.com/home/dashboard
    page should contain  Home
    page should contain  Course Library
    page should contain  Achievements
    page should contain  Live Sessions
    page should contain element  css=#nav_home
    page should contain element  css=#navViewAll>a

verfiy missionControl page loaded

    Location Should Contain  missionControl
    title should be  ED mission control
    wait until element is visible  css=#fullscreen-btn  5s
    page should contain element  css=#fullscreen-btn
    page should contain element  css=.sidebar-header.slim-bottom


verify home page content

    page should contain  Welcome ${FIRST NAME}!
    page should contain link  ${FIRST NAME} ${LAST NAME}
    page should contain  You have
    page should contain  no new notifications
    page should contain  . Below is a snapshot of what's happening at
    page should contain  your facilities
    page should contain  over the last 7 days.

    page should contain  Recent Dashboards
    page should contain  Recent Metrics
    page should contain element  xpath=//input[@placeholder='Search for dashboard or metric']
    page should contain element  id=index-search
    page should contain element  css=#home-hosp-label
    ##page should contain element  xpath=//span[text()='your facilities']

click on your facilities drop down list

    ##click element  xpath=//span[@id='home-hosp-label']
    click element  css=#home-hosp-label

select value from your facilities drop down list

    click element  xpath=//span[@id='home-hosp-label']
    click element  xpath=//a[text()='${YOUR_FACILITIES}']
    #click element  css=a[hosid='8']

minimize chat window under homepage

   ##Run Keyword And Ignore Error  click element  xpath=//div[@class='meshim_widget_widgets_IconFont icon_font close']
   Run Keyword And Ignore Error  click element  css=div[class='meshim_widget_widgets_IconFont icon_font close']

   ##Run Keyword And Ignore Error  select frame  xpath=.//body/div[2]/iframe
   Run Keyword And Ignore Error  select frame  css=iframe[data-test-id='ChatWidgetWindow-iframe']

   Run Keyword And Ignore Error  click element  css=.meshim_widget_widgets_IconFont icon_font
   ##Run Keyword And Ignore Error  click element  xpath=.//*[@class='meshim_widget_widgets_IconFont icon_font']

   Run Keyword And Ignore Error  click element  css=.overlay.jx_ui_Widget
   Run Keyword And Ignore Error  unselect frame


select 'your facilities' value from your facilities drop down list

    minimize chat window under homepage
    click element  xpath=//span[@id='home-hosp-label']
    click element  xpath=//a[text()='your facilities']

verify selected hospital snapshot

     page should contain element  xpath=//span[text()='${YOUR_FACILITIES}']

verify your facilities is reset to default

     page should contain element  xpath=//span[text()='your facilities']

Search for dashboard or metric from home page

    [Arguments]      ${Enter_search_input}
    input text  id=index-search  ${Enter_search_input}
    click element  xpath=//a[@href='#']/div/strong[text()='${Enter_search_input}']
    ##sleep  2s

verify Metrics page is displayed

    page should contain  Metrics

click dashboard link under Recent Dashboards

    page should contain link  css=#hp-dashboard-container-in >p:nth-of-type(1)>a
    ${HOME_RECENT_DASHBOARD} =  get text  css=#hp-dashboard-container-in >p:nth-of-type(1)>a
    log  ${HOME_RECENT_DASHBOARD}
    #set global variable  ${HOME_RECENT_DASHBOARD}
    click link  ${HOME_RECENT_DASHBOARD}

click Metrics link under Recent Metrics

    page should contain link  css=#hp-metric-container-in >p:nth-of-type(1)>a
    ${HOME_RECENT_METRIC} =  get text  css=#hp-metric-container-in >p:nth-of-type(1)>a
    log  ${HOME_RECENT_METRIC}
    click link  ${HOME_RECENT_METRIC}


