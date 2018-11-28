*** Settings ***
Library         SeleniumLibrary
Resource        ../../admin/admincommon.robot



*** Keywords ***

Verify Home link in adminleftpane

    page should contain element  css=.sidebar-section>a[href='/atc/']>span
    page should contain element  css=span[class='sidebar-link-label']>span[class='sidebar-link-icon icon-data']


click Home link in adminleftpane

    click link  css=.sidebar-section>a[href='/atc/']
    #click link  css=.sidebar-section>a[href='/atc/']>span

Verify Main link in adminleftpane

    Run Keyword And Ignore Error  Confirm Action
    wait until page contains element  css=a[data-popup-section-class='sidebar-popup-section-main']  5s
    page should contain  Main
    page should contain link  css=a[data-app-label='main']

click Main link in adminleftpane

    wait until page contains element  css=a[data-order='6']  10s
    click link  css=a[data-app-label='main']

Mouseover on Main link

    wait until page contains element  css=a[data-order='6']  10s
    mouse over  css=a[data-popup-section-class='sidebar-popup-section-main']
    sleep  2s

Mouseover on Authentication and Authorization link

    wait until page contains element  css=a[data-popup-section-class='sidebar-popup-section-auth']  10s
    #mouse over  css=a[data-order='1']
    mouse over  css=a[data-popup-section-class='sidebar-popup-section-auth']
    sleep  2s

Verify Metrics link in Sub menu

    click element  xpath=//*[@id="container"]/div[9]/div[2]/div/div[6]/input
    input text  xpath=//*[@id="container"]/div[9]/div[2]/div/div[6]/input  Metrics
    click element  xpath=//*[@id="container"]/div[9]/div[2]/div/div[6]/ul/li[31]/a
    wait until page contains element  css=li[class='sidebar-popup-list-item model-metric selected']>a[href='/atc/main/metric/']
    page should contain link  Metrics

click Metrics link in Sub menu

    click element  css=div[class='sidebar-popup-section sidebar-popup-section-main']>.sidebar-popup-search
    input text  css=div[class='sidebar-popup-section sidebar-popup-section-main']>.sidebar-popup-search  Metrics
    click element  css=a[href='/atc/main/metric/']

click Users link in Sub menu

    wait until element is visible  css=div[class='sidebar-popup-section sidebar-popup-section-auth']>div  20s
    click element  css=div[class='sidebar-popup-section sidebar-popup-section-auth']>input
    #click element  xpath=//*[@id="container"]/div[9]/div[2]/div/div[1]/input
    #input text  xpath=//*[@id="container"]/div[9]/div[2]/div/div[1]/input  Users
    input text  css=div[class='sidebar-popup-section sidebar-popup-section-auth']>input  Users
    click element  xpath=//*[@id="container"]/div[9]/div[2]/div/div[1]/ul/li[3]/a

check for alert

    Run Keyword And Ignore Error  click element  css=.related-popup-back-label
    Run Keyword And Ignore Error  Confirm Action
    ${status} =  Run Keyword And Return Status   Alert Should Be Present  This page is asking you to confirm that you want to leave - data you have entered may not be saved.
    Log  ${status}
    Run Keyword If   ${status} ==True  sleep  1s
