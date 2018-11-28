*** Settings ***
Library         SeleniumLibrary
Resource        ../pom/../amdvariables.robot



*** Keywords ***

verify AMD home page loaded

    page should contain element  css=.icon-home

verify Dashboards page loaded

     run keyword if  page should contain link  Click to create dashboard
     ...   log    You don't have any dashboards
     ...   ELSE
     ...   fail   page should contain element  xpath=//*[@id='dashboard-view']/div[1]/div/div[1]/h3

verify Metrics page loaded

    page should contain  Metrics
    page should contain element  css=.btn-link.btn.explain-toggle
    ##page should contain element  xpath=//*[@id='metric-view']/div[2]/div/div/div[1]/div[1]/div/a[2]

minimize chat window under metricpage

   Run Keyword And Ignore Error  select frame  css=iframe[data-test-id='ChatWidgetWindow-iframe']
   Run Keyword And Ignore Error  click element  css=.meshim_widget_widgets_IconFont.icon_font.close
   Run Keyword And Ignore Error  unselect frame

verfiy Alert page loaded

    page should contain  Your feed
    page should contain  Notifications
    page should contain element  css=.btn.btn-flat.dismiss-all.aside
    ##page should contain element  xpath=//*[@id='notification-view']/div[2]/div/h4[1]
    ##page should contain element  xpath=//*[@id='notification-view']/div[1]/div/div/h3

verfiy Staffing page loaded

    page should contain  Staffing
    page should contain element  css=.hero-unit-title.gutter-adjustment
    ##page should contain element  xpath=//h3[text()='Staffing']


verfiy missionControl page loaded

    Set Browser Implicit Wait	30 seconds
    title should be  ED mission control

###################Metrics###########3

verify Metrics page

    page should contain  Metrics

    #select Hospitals
    ##page should contain element  xpath=//div[@id='s2id_s2-hospitals']
    page should contain element  css=div#s2id_s2-hospitals

    #Work Areas
    ##page should contain element  xpath=//div[@id='s2id_s2-work-areas']
    page should contain element  css=div#s2id_s2-work-areas

    # search for Metrics
    ##page should contain element  xpath=//div[@id='s2id_s2-metrics']
    page should contain element  css=div#s2id_s2-metrics


    #Time Intervals
    ##page should contain element  xpath=//a[@id='metrics-time-dropdown']
    page should contain element  css=a#metrics-time-dropdown



click Hospitals drop down

    ##click element  xpath=//div[@id='s2id_s2-hospitals']
    click element  css=div#s2id_s2-hospitals


select the Hospitals from the list of value under metrics page

    ##click element  xpath=//div[@id='s2id_s2-hospitals']
    click element  css=div#s2id_s2-hospitals
    click element  xpath=//div[@id='select2-drop']/ul/li/div[text()='${HOSPITALS_METRICS}']

verify the hospital value selected under metrics page

    ##${current_hosp} =  get text  xpath=//div[@id='s2id_s2-hospitals']/a/span[@class='select2-chosen']
    ${current_hosp} =  get text  css=div[id='s2id_s2-hospitals']>a>span[class='select2-chosen']
    log  ${current_hosp}
    should be equal as strings  ${current_hosp}  ${HOSPITALS_METRICS}

select the Work Areas from the list of value under metrics page

    ##click element  xpath=//div[@id='s2id_s2-work-areas']
    sleep  2s
    click element  css=div[id='s2id_s2-work-areas']
    wait until page contains element  xpath=//div[@id='select2-drop']/ul/li/div[text()='${WORKAREAS_METRICS}']  20s
    click element  xpath=//div[@id='select2-drop']/ul/li/div[text()='${WORKAREAS_METRICS}']


verify the Work Areas value selected under metrics page

    ##${current_workarea} =  get text  xpath=//div[@id='s2id_s2-work-areas']/a/span[@class='select2-chosen']
    ${current_workarea} =  get text  css=div[id='s2id_s2-work-areas']>a>span[class='select2-chosen']
    log  ${current_workarea}
    should be equal as strings  ${current_workarea}  ${WORKAREAS_METRICS}


select the metrics from the list of value under metrics page

    ##click element  xpath=//div[@id='s2id_s2-metrics']
    click element  css=div[id='s2id_s2-metrics']
    click element  xpath=//div[@id='select2-drop']/ul/li/div[text()='${METRIC_METRICS}']


verify the Metric value selected under metrics page

    sleep  2s
    ##${current_metric} =  get text  xpath=//div[@id='s2id_s2-metrics']/a/span[@class='select2-chosen']
    ${current_metric} =  get text  css=div[id='s2id_s2-metrics']>a>span[class='select2-chosen']
    log  ${current_metric}
    should be equal as strings  ${current_metric}  ${METRIC_METRICS}


click the Time Intervals from the list of value under metrics page

    ##click element  xpath=//a[@id='metrics-time-dropdown']
    sleep  2s
    click element  css=a[id='metrics-time-dropdown']

verify Time Intervals drop down values in metrics

    page should contain  Today
    page should contain  Yesterday
    page should contain  1W
    page should contain  1M
    page should contain  3M
    page should contain  6M
    page should contain  1Y
    page should contain  3Y
    page should contain  MTD
    page should contain  YTD
    page should contain  Choose time range


select values from Time Intervals drop down in metrics and verify

    click the Time Intervals from the list of value under metrics page
    click element  css=div[class='metric-page-header']>div a[data-name='Today']
    ${current_interval} =  get text  css=div[class='metric-page-header']>div>div>a[id='metrics-time-dropdown']>span[class='display-interval']
    log  ${current_interval}
    should be equal as strings  ${current_interval}  Today

    click the Time Intervals from the list of value under metrics page
    click element  css=div[class='metric-page-header']>div a[data-name='Yesterday']
    ${current_interval} =  get text  css=div[class='metric-page-header']>div>div>a[id='metrics-time-dropdown']>span[class='display-interval']
    log  ${current_interval}
    should be equal as strings  ${current_interval}  Yesterday

    click the Time Intervals from the list of value under metrics page
    #click element  xpath=//div[@class='dashboard-controls span align-heading']//li/a[@class='change-interval']/span[contains(text(), '1W')]
    click element  xpath=//div[@class='metric-page-header']/div/div/ul/li/a/span[contains(text(), '1W')]
    ##${current_interval} =  get text  xpath=//div[@class='metric-page-header']/div/div/a[@id='metrics-time-dropdown']/span[@class='display-interval']
    ${current_interval} =  get text  css=div[class='metric-page-header']>div>div>a[id='metrics-time-dropdown']>span[class='display-interval']
    log  ${current_interval}
    should be equal as strings  ${current_interval}  1W

    click the Time Intervals from the list of value under metrics page
    click element  xpath=//div[@class='metric-page-header']/div/div/ul/li/a/span[contains(text(), '1M')]
    ##${current_interval} =  get text  xpath=//div[@class='metric-page-header']/div/div/a[@id='metrics-time-dropdown']/span[@class='display-interval']
    ${current_interval} =  get text  css=div[class='metric-page-header']>div>div>a[id='metrics-time-dropdown']>span[class='display-interval']
    log  ${current_interval}
    should be equal as strings  ${current_interval}  1M


    click the Time Intervals from the list of value under metrics page
    click element  xpath=//div[@class='metric-page-header']/div/div/ul/li/a/span[contains(text(), '3M')]
    ##${current_interval} =  get text  xpath=//div[@class='metric-page-header']/div/div/a[@id='metrics-time-dropdown']/span[@class='display-interval']
    ${current_interval} =  get text  css=div[class='metric-page-header']>div>div>a[id='metrics-time-dropdown']>span[class='display-interval']
    log  ${current_interval}
    should be equal as strings  ${current_interval}  3M

    click the Time Intervals from the list of value under metrics page
    click element  css=div[class='metric-page-header']>div a[data-name='6M']
    ${current_interval} =  get text  css=div[class='metric-page-header']>div>div>a[id='metrics-time-dropdown']>span[class='display-interval']
    log  ${current_interval}
    should be equal as strings  ${current_interval}  6M

    click the Time Intervals from the list of value under metrics page
    click element  xpath=//div[@class='metric-page-header']/div/div/ul/li/a/span[contains(text(), '1Y')]
    ${current_interval} =  get text  xpath=//div[@class='metric-page-header']/div/div/a[@id='metrics-time-dropdown']/span[@class='display-interval']
    ##${current_interval} =  get text  css=div[class='metric-page-header']>div>div>a[id='metrics-time-dropdown']>span[class='display-interval']
    log  ${current_interval}
    should be equal as strings  ${current_interval}  1Y

    click the Time Intervals from the list of value under metrics page
    click element  css=div[class='metric-page-header']>div a[data-name='1Y']
    ${current_interval} =  get text  css=div[class='metric-page-header']>div>div>a[id='metrics-time-dropdown']>span[class='display-interval']
    log  ${current_interval}
    should be equal as strings  ${current_interval}  1Y

    click the Time Intervals from the list of value under metrics page
    click element  xpath=//div[@class='metric-page-header']/div/div/ul/li/a/span[contains(text(), 'MTD')]
    ##sleep  2s
    ${current_interval} =  get text  xpath=//div[@class='metric-page-header']/div/div/a[@id='metrics-time-dropdown']/span[@class='display-interval']
    ##${current_interval} =  get text  css=div[class='metric-page-header']>div>div>a[id='metrics-time-dropdown']>span[class='display-interval']
    log  ${current_interval}
    should be equal as strings  ${current_interval}  MTD

    click the Time Intervals from the list of value under metrics page
    click element  xpath=//div[@class='metric-page-header']/div/div/ul/li/a/span[contains(text(), 'YTD')]
    ##sleep  2s
    ##${current_interval} =  get text  xpath=//div[@class='metric-page-header']/div/div/a[@id='metrics-time-dropdown']/span[@class='display-interval']
    ${current_interval} =  get text  css=div[class='metric-page-header']>div>div>a[id='metrics-time-dropdown']>span[class='display-interval']
    log  ${current_interval}
    should be equal as strings  ${current_interval}  YTD


select Choose time range from Time Intervals drop down in metricpage

    #click element  xpath=//div[@class='dashboard-controls span align-heading']//li/a[@class='change-interval']/span[contains(text(), 'Choose time range')]
    click link  Choose time range


verify Custom timeframe pop up screen under metric page

    page should contain  Custom timefram
    # from date field
    page should contain  From
    ##page should contain textfield  xpath=//input[@class='input-medium start']
    page should contain textfield  css=input[class='input-medium start']
    ##page should contain element  xpath=//div[@class='input-append date start dp-start']//i[@class='icon-calendar tall']
    page should contain element  css=div[class='input-append date start dp-start']>span>i
        # To date field
    page should contain  To
    page should contain textfield  xpath=//input[@class='input-medium end']
    ##page should contain element  xpath=//div[@class='input-append date start dp-start']//i[@class='icon-calendar tall']
    page should contain element  css=div[class='input-append date end dp-end']>span>i
    page should contain  Or select a predefined range:
    page should contain button  2M
    page should contain button  2Y
    page should contain button  5Y
    page should contain button  ALL
    page should contain button  Finish
    page should contain button  ×

close Custom timeframe popup

    click button  ×

click on ALL button in Custom timeframe

    sleep  2s
    wait until page contains element  css=.btn.btn-default.preset  5s
    click button  ALL


click on Finish button in Custom timeframe

    click button  Finish
    wait until page contains element  css=g[class='highcharts-button']>rect  10s



click on 'Go to Explain' button

    ##click element  xpath=//a[contains(text(), ' Go to Explain')]
    click element  css=.btn-link.btn.explain-toggle


click on 'Go to Deep Dive' button

    ##click element  xpath=//a[contains(text(), 'Go to Deep Dive')]
    click element  css=.btn-link.btn.investigate-toggle


verify Go to Explain button is visible if not click on Go to Deep Dive button

    ##${status}=  run keyword and return status  element should be visible  xpath=//a[contains(text(),'Go to Explain')]
    ${status}=  run keyword and return status  element should be visible  css=.btn-link.btn.explain-toggle
    log  ${status}
    ##run keyword if  ${status} ==True  page should contain element  xpath=//a[contains(text(), 'Add to dashboard')]
    run keyword if  ${status} ==True  page should contain element  css=.btn-link.btn.investigate-toggle
    run keyword unless  ${status} ==True  click on 'Go to Deep Dive' button

minimize chat window

   ##Run Keyword And Ignore Error  click element  xpath=//div[@class='meshim_widget_widgets_IconFont icon_font close']
   Run Keyword And Ignore Error  click element  css=div[class='meshim_widget_widgets_IconFont icon_font close']

   ##Run Keyword And Ignore Error  select frame  xpath=.//body/div[2]/iframe
   Run Keyword And Ignore Error  select frame  css=iframe[data-test-id='ChatWidgetWindow-iframe']

   ##Run Keyword And Ignore Error  click element  xpath=.//*[@class='meshim_widget_widgets_IconFont icon_font']
   Run Keyword And Ignore Error  click element  css=.meshim_widget_widgets_IconFont icon_font

   Run Keyword And Ignore Error  click element  css=.overlay.jx_ui_Widget
   Run Keyword And Ignore Error  unselect frame



verify Deep Dive page

    minimize chat window
    ##page should contain element  xpath=//a[contains(text(), 'Go to Explain')]
    page should contain element  css=.btn-link.btn.explain-toggle
    page should contain  I want to see this metric by
    #check out time (timeseries)
    ##page should contain element  xpath=//span[@ class='groupby-display']
    page should contain element  css=span[class='groupby-display']

    #+ Add Dimension
    ##page should contain element  xpath=//a[@ class='btn btn-link add-dimension']
    page should contain element  css=a[class='btn btn-link add-dimension']

    page should contain  But I only want to show it for
    page should contain element  xpath=//a[@ class='dropdown-toggle']/span[text()='(click for options)']


    #Sort auto
    ##page should contain element  xpath=//span[text()='auto']
    page should contain element  css=.sort-display

    #With at least
    ##page should contain element  xpath=//span[text()='1 row']
    page should contain element  css=.having-display

    #Show me 2000 points
    ##page should contain element  xpath=//span[text()='2000 points']
    page should contain element  css=.limit-display

    #Display Vertical bar chart

    ##page should contain element  xpath=//span[@class='type-display']
    page should contain element  css=.type-display

    #Show labels
    page should contain checkbox  id=showChartLabels

    #Add to dashboard button
    ##page should contain element  xpath=//a[contains(text(), 'Add to dashboard')]
    page should contain element  css=.btn.btn-default.add-to-dashboard

    # TODO
    #down load button

    #Show labels check box
    page should contain checkbox  id=showChartLabels


select the value from 'I want to see this metric by'- check out time (timeseries)

    ##click element  xpath=//span[@ class='groupby-display']
    sleep  5s
    click element  css=.groupby-display
    click element  xpath=//a[text()='check out time (timeseries)']
    wait until page contains  May '14  2s
    page should contain  Mar '14

select the value from 'I want to see this metric by' check out time (day of week)

    ##click element  xpath=//span[@ class='groupby-display']
    click element  css=.groupby-display
    click element  xpath=//a[text()='check out time (day of week)']
    wait until page contains  check out time (day of week)  20s
    wait until page contains  Sunday  5s
    page should contain  Sunday
    page should contain  Monday
    page should contain  Wednesday
    page should contain  Thursday
    page should contain  Friday
    page should contain  Saturday
    #page should contain element  css=div.metric-chart g[class*='xaxis'] > text:nth-child(n)
    #page should contain element  css=div.metric-chart g[class*='xaxis'] > text:nth-child(1)
    #page should contain element  css=div.metric-chart g[class*='xaxis'] > text:nth-child(7)


select the value from 'I want to see this metric by' check out time (by hour)

    ##click element  xpath=//span[@ class='groupby-display']
    click element  css=.groupby-display
    click element  xpath=//a[text()='check out time (by hour)']
    wait until page contains  12 am  5s
    page should contain  12 am
    page should contain  1 am
    page should contain  2 am
    page should contain  3 am
    page should contain  4 am
    page should contain  5 am
    page should contain  6 am
    page should contain  7 am
    page should contain  8 am
    page should contain  9 am
    page should contain  10 am
    page should contain  11 am
    page should contain  12 pm
    page should contain  1 pm
    page should contain  2 pm
    page should contain  3 pm
    page should contain  4 pm
    page should contain  5 pm
    page should contain  6 pm
    page should contain  7 pm
    page should contain  8 pm
    page should contain  9 pm
    page should contain  10 pm
    page should contain  11 pm
    page should contain  12 pm



select the value from 'I want to see this metric by' acuity

    ##click element  xpath=//span[@ class='groupby-display']
    click element  css=.groupby-display
    click element  xpath=//a[text()='acuity']
    wait until page contains element  css=div.metric-chart g[class*='xaxis'] text:nth-child(2)  5s
    page should contain element  css=div.metric-chart g[class*='xaxis'] text:nth-child(2)
    page should contain element  css=div.metric-chart g[class*='xaxis'] text:nth-child(1)
    page should contain element  css=div.metric-chart g[class*='xaxis'] > text:nth-child(n)


select the value from 'I want to see this metric by' discharge disposition

    ##click element  xpath=//span[@ class='groupby-display']
    click element  css=.groupby-display
    click element  xpath=//a[text()='discharge disposition']
    wait until page contains element  css=div [class='metric-chart']  5s
    page should contain element  css=div [class='metric-chart']
    page should contain element  css=g[class='highcharts-button'] rect
    #page should contain  pure discharge
    #page should contain  other
    #page should contain  lwbs
    #page should contain  eloped
    #page should contain  ama
    page should contain  admitted


select the value from 'I want to see this metric by' Doctor

    ##click element  xpath=//span[@ class='groupby-display']
    click element  css=.groupby-display
    click element  xpath=//a[text()='doctor']
    wait until page contains  Villacorta, Clare  5s
    page should contain  Villacorta, Clare
    page should contain  Yeary, Kelly
    page should contain  Beier, Lorrie
    page should contain element  css=div.metric-chart g[class*='xaxis'] > text:nth-child(n)


select value from Show me drop down list

    ##click element  xpath=//span[@class='limit-display']
    click element  css=span.limit-display
    #Show me 5 points
    click element  xpath=(//li[@class='limit'])[1]
    page should contain element  xpath=//span[text()='5 points']

    #Show me 10 points
    ##click element  xpath=//span[@class='limit-display']
    click element  css=span.limit-display
    click element  xpath=(//li[@class='limit'])[2]
    page should contain element  xpath=//span[text()='10 points']

    #Show me 25 points
    ##click element  xpath=//span[@class='limit-display']
    click element  css=span.limit-display
    click element  xpath=(//li[@class='limit'])[3]
    page should contain element  xpath=//span[text()='25 points']

    #Show me 50 points
    ##click element  xpath=//span[@class='limit-display']
    click element  css=span.limit-display
    click element  xpath=(//li[@class='limit'])[4]
    page should contain element  xpath=//span[text()='50 points']

    #Show me 100 points
    ##click element  xpath=//span[@class='limit-display']
    click element  css=span.limit-display
    click element  xpath=(//li[@class='limit'])[5]
    page should contain element  xpath=//span[text()='100 points']

    #Show me 500 points
    ##click element  xpath=//span[@class='limit-display']
    click element  css=span.limit-display
    click element  xpath=(//li[@class='limit'])[6]
    page should contain element  xpath=//span[text()='500 points']

    #Show me 2000 points
    ##click element  xpath=//span[@class='limit-display']
    click element  css=span.limit-display
    click element  xpath=(//li[@class='limit'])[7]
    page should contain element  xpath=//span[text()='2000 points']


select Show me 5 points

     click element  css=span.limit-display
     click element  css=li[data-value='5']
     wait until page contains  5 points  30s

verify 5 point vertical bar chart

     wait until element is not visible  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g>rect:nth-child(6)  10s
     ##wait until element is visible  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g>rect  5s
     page should contain element  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g>rect:nth-child(5)
     page should not contain element  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g>rect:nth-child(6)
     ##${labels1} =  Get Matching Xpath Count  div[@class='metric-chart']//g[@class='highcharts-series highcharts-series-0 highcharts-tracker']/rect
     ##${count} =  Get Matching Xpath Count  //div[@class='metric-chart']/div/svg/g[@class='highcharts-series highcharts-series-0 highcharts-tracker']/rect

select value from sort drop down list

    ##click element  xpath=//span[@class='sort-display']
    click element  css=span.sort-display
    #Sort auto
    click element  xpath=//a[text()='auto']

    page should contain element  xpath=//span[text()='auto']
    ##click element  xpath=//span[@class='sort-display']
    click element  css=span.sort-display

    #Sort ascending
    click element  xpath=//a[text()='ascending']
    page should contain element  xpath=//span[text()='ascending']
    ##click element  xpath=//span[@class='sort-display']
    click element  css=span.sort-display

    #Sort descending
    click element  xpath=//a[text()='descending']
    page should contain element  xpath=//span[text()='descending']


verify Display drop down list values

    click element  css=span.type-display
    page should contain element  css=.chart-type>a
    page should contain  Vertical Bar Chart
    page should contain  Horizontal Bar Chart
    page should contain  Line Chart
    page should contain  Area Chart
    page should contain  Pie Chart
    page should contain  Box Plot


select value from Display drop down list

    ##click element  xpath=//span[@class='type-display']
    click element  css=span.type-display

    #Display Horizontal Bar Chart
    click element  xpath=//li[@class='chart-type']/a[text()='Horizontal Bar Chart']

    #page should contain  Horizontal Bar Chart
    page should contain element  xpath=//span[text()='Horizontal Bar Chart']
    ##click element  xpath=//span[@class='type-display']
    click element  css=span.type-display

    #Display Vertical Bar Chart

    click element  xpath=//li[@class='chart-type']/a[text()='Vertical Bar Chart']
    page should contain  Vertical Bar Chart
    ##click element  xpath=//span[@class='type-display']
    click element  css=span.type-display

    #Display Line Chart

    click element  xpath=//li[@class='chart-type']/a[text()='Line Chart']
    page should contain  Line Chart

    ##click element  xpath=//span[@class='type-display']
    click element  css=span.type-display
    #Display Area Chart
    click element  xpath=//li[@class='chart-type']/a[text()='Area Chart']
    page should contain  Area Chart

    ##click element  xpath=//span[@class='type-display']
    click element  css=span.type-display
    #Display Pie Chart
    click element  xpath=//li[@class='chart-type']/a[text()='Pie Chart']
    page should contain  Pie Chart

    ##click element  xpath=//span[@class='type-display']
    click element  css=span.type-display
    #Display boxplot
    click element  xpath=//li[@class='chart-type']/a[text()='Box Plot']
    page should contain  Box Plot


Show labels

     page should contain element  css=g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker'] > text>tspan

select Show labels checkbox

     ##select checkbox  Show labels
     select checkbox  id=showChartLabels
     Checkbox Should Be Selected  id=showChartLabels

verify labels is displayed for vertical bar chart

     wait until element is visible  css=g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>text>tspan  2s
     page should contain element  css=g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>text>tspan


verify Vertical bar chart is displayed

    wait until element is visible  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g>rect:nth-child(1)  5s
    page should not contain element  css=.insights-error
    page should not contain  Error investigating
    page should not contain  No data found for this range
    page should contain element  css=div[class='metric-chart']>div>svg>.highcharts-grid>path:nth-child(n)
    page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(n)
    page should contain element  css=div[class='metric-chart']>div>svg>.highcharts-tooltip>path:nth-child(n)
#    select Show labels checkbox
#    verify labels is displayed for vertical bar chart
#    select Show me 5 points
#    verify 5 point vertical bar chart


    #wait until element is visible  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g>rect:nth-child(1)
    #div[class='metric-chart']>div>svg>.highcharts-series-group>g>rect -- count points
    #g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>text>tspan --show labels


select Horizontal Bar Chart from Display list

    click element  css=.type-display
    click element  css=li[data-value='bar']>a
    wait until page contains  Horizontal Bar Chart  5s

verify labels is displayed for Horizontal bar chart

     wait until element is visible  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g>text>tspan  10s
     page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g>text>tspan


verify 5 point Horizontal bar chart

     wait until element is not visible  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g>rect:nth-child(6)  20s
     ##wait until element is visible  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g>rect  5s
     page should contain element  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g>rect:nth-child(5)
     page should not contain element  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g>rect:nth-child(6)

verify Horizontal Bar Chart is displayed

    wait until element is visible  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g>rect:nth-child(1)  5s
    #page should contain  Horizontal Bar Chart
    page should not contain element  css=.insights-error
    page should not contain  Error investigating
    page should not contain  No data found for this range
    page should contain element  css=div[class='metric-chart']>div>svg>.highcharts-grid>path:nth-child(n)
    page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(n)
    page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(n)
    page should contain element  css=div[class='metric-chart']>div>svg>.highcharts-tooltip>path:nth-child(n)
    #select Show labels checkbox
    #select Show me 5 points
    #verify 5 point Horizontal bar chart
    #verify labels is displayed for Horizontal bar chart


select line Chart from Display list

    click element  css=.type-display
    click element  css=li[data-value='line']>a
    wait until page contains  Line Chart  5s

verify labels is displayed for line chart

     wait until element is visible  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0']>g>text>tspan  10s
     page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0']>g>text>tspan

verify 5 point line chart

     wait until element is not visible  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g[class='highcharts-markers highcharts-series-0 highcharts-tracker']>path:nth-child(6)  10s
     wait until page contains element  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g[class='highcharts-markers highcharts-series-0 highcharts-tracker']>path:nth-child(5)  5s
     page should contain element  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g[class='highcharts-markers highcharts-series-0 highcharts-tracker']>path:nth-child(5)
     page should not contain element  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g[class='highcharts-markers highcharts-series-0 highcharts-tracker']>path:nth-child(6)

verify line Chart is displayed

    wait until element is visible  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g[class='highcharts-series highcharts-series-0']>path:nth-child(1)  10s
    page should not contain element  css=.insights-error
    page should not contain  Error investigating
    page should not contain  No data found for this range
    page should contain element  css=div[class='metric-chart']>div>svg>.highcharts-grid>path:nth-child(n)
    page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(n)
    page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(n)
    page should contain element  css=div[class='metric-chart']>div>svg>.highcharts-tooltip>path:nth-child(n)

select Area Chart from Display list

    click element  css=.type-display
    click element  css=li[data-value='area']>a
    wait until page contains  Area Chart  5s

verify labels is displayed for Area chart

     wait until element is visible  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0']>g>text>tspan  10s
     page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0']>g>text>tspan

verify 5 point Area chart

     sleep  2s
     wait until element is visible  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0']>g:nth-child(5)  10s
     wait until page contains element  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0']>g:nth-child(5)  10s
     page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0']>g>text:nth-child(1)
     page should not contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0']>g:nth-child(6)

verify Area Chart is displayed

    wait until element is visible  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g[class='highcharts-series highcharts-series-0']>path:nth-child(1)  10s
    page should not contain element  css=.insights-error
    page should not contain  Error investigating
    page should not contain  No data found for this range
    page should contain element  css=div[class='metric-chart']>div>svg>.highcharts-grid>path:nth-child(n)
    page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(n)
    page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(n)
    page should contain element  css=div[class='metric-chart']>div>svg>.highcharts-tooltip>path:nth-child(n)


####PIE chart

select Pie Chart from Display list

    click element  css=.type-display
    click element  css=li[data-value='pie']>a
    wait until page contains  Pie Chart  20s


verify 5 point Pie chart

     #wait until element does not contain  css=div[class='metric-chart']>div>svg>g[class='highcharts-series highcharts-series-0 highcharts-tracker']>path:nth-child(6)  10s
     wait until element does not contain  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>path:nth-child(6)  20s
     #highcharts-26 > svg > g.highcharts-data-labels.highcharts-series-0.highcharts-tracker > g:nth-child(12) > text > tspan
     wait until element is visible  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g
     wait until page contains element  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g>text>tspan
     page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g>text:nth-child(1)
     #page should not contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g:nth-child(6)

verify Pie Chart is displayed

    wait until element is visible  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g[class='highcharts-series highcharts-series-0 highcharts-tracker']>path:nth-child(1)  10s
    page should not contain element  css=.insights-error
    page should not contain  Error investigating
    page should not contain  No data found for this range
    #page should contain element  css=div[class='metric-chart']>div>svg>.highcharts-grid>path:nth-child(n)

    #page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(n)
    #page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(n)
    page should contain element  css=div[class='metric-chart']>div>svg>.highcharts-tooltip>path:nth-child(n)

verify labels is displayed for pie chart

     wait until element is visible  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g>text>tspan  10s
     page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g>text>tspan


###Box ###


select Box Plot from Display list

    click element  css=.type-display
    click element  css=li[data-value='boxplot']>a
    wait until page contains  Box Plot  5s

verify labels is displayed for Box Plot

     wait until element is visible  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0']>g>text>tspan  10s
     page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0']>g>text>tspan

verify 5 point Box Plot

     wait until element does not contain  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g[class='highcharts-series highcharts-series-0 highcharts-tracker']>g:nth-child(6)  30s
     #wait until element is not visible  css=div[class='metric-chart']>div>svg>g[class='highcharts-data-labels highcharts-series-0']>g:nth-child(6)  10s
     sleep  5s
     wait until element is visible  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g[class='highcharts-series highcharts-series-0 highcharts-tracker']>g:nth-child(5)  10s
     wait until page contains element  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g[class='highcharts-series highcharts-series-0 highcharts-tracker']>g:nth-child(1)
     #wait until page contains element  css=div[class='metric-chart']>div>svg>g[class='highcharts-series highcharts-series-0 highcharts-tracker']>g:nth-child(5)  10s
     page should contain element  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g[class='highcharts-series highcharts-series-0 highcharts-tracker']>g>path:nth-child(1)
     #page should not contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-series highcharts-series-0 highcharts-tracker']>g:nth-child(6)

verify Box Plot is displayed

    wait until element is visible  css=div[class='metric-chart']>div>svg>.highcharts-series-group>g[class='highcharts-series highcharts-series-0 highcharts-tracker']>g:nth-child(2)  10s
    page should not contain element  css=.insights-error
    page should not contain  Error investigating
    page should not contain  No data found for this range
    page should contain element  css=div[class='metric-chart']>div>svg>.highcharts-grid>path:nth-child(n)
    page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(n)
    page should contain element  css=div[class='metric-chart']>div>svg>g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(n)
    page should contain element  css=div[class='metric-chart']>div>svg>.highcharts-tooltip>path:nth-child(n)


click on Add Dimension

    click element  css=.btn.btn-link.add-dimension
    wait until page contains element  css=.advanced-groupby-display  2s
    page should contain element  css=.remove-advanced-groupby


click choose grouping drop down list and verify list

    click element  css=.advanced-groupby-display
    page should contain element  css=.advanced-groupby.groupby-label>a  2s
    page should contain  check out time (timeseries)
    page should contain  check out time (day of week)
    page should contain  check out time (by hour)
    page should contain  check out time (week to week)
    page should contain  check out time (month to month)
    page should contain  acuity
    page should contain  discharge disposition
    page should contain  doctor
    page should contain  doctor2
    page should contain  patient


select the value from choose grouping drop down list

    ##click element  xpath=//span[@ class='groupby-display']
    click element  css=.advanced-groupby-display
    wait until page contains element  css=.advanced-groupby.groupby-label>a  2s
    #click element  xpath=//a[text()='check out time (day of week)']
    sleep  2s
    click element  xpath=//li[@class='advanced-groupby groupby-label']/a[text()='check out time (timeseries)']
    wait until page contains  check out time (day of week)  5s


verify Display drop down list values after selecting value from choose grouping drop down list

    click element  css=span.type-display
    page should contain element  css=.chart-type>a
    page should contain  Vertical Bar Chart
    page should contain  Horizontal Bar Chart
    page should contain  Stacked Vertical Bar Chart
    page should contain  Stacked Horizontal Bar Chart
    page should contain  Stacked Vertical Bar (%) Chart
    page should contain  Stacked Horizontal Bar (%) Chart
    page should contain  Heatmap

select Show me 10 points

     click element  css=span.limit-display
     click element  css=li[data-value='10']
     wait until page contains  10 points  10s


verify Vertical Bar Chart with grouping value selected

     sleep  10s
     #labels
     wait until element is visible  css=g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>text>tspan  20s
     page should contain element  css=g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>text>tspan
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect:nth-child(10)
     #sleep  1s
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect:nth-child(11)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(1)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(10)
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(11)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text>tspan

     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(1)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(6)
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(11)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text>tspan

     page should contain element  css=div[class='metric-chart'] g[class='highcharts-grid']>path
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-6 highcharts-tracker']


verify Horizontal Bar Chart with grouping value selected

        #labels
     wait until element is visible  css=g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g>text>tspan  20s
     page should contain element  css=g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g>text>tspan
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect:nth-child(10)
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect:nth-child(11)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(1)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(5)
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(6)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text>tspan

     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(1)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(6)
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(12)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text>tspan

     page should contain element  css=div[class='metric-chart'] g[class='highcharts-grid']>path
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-6 highcharts-tracker']



select Stacked Vertical Bar Chart from Display list

    click element  css=.type-display
    click element  css=li[data-value='stackedvertbar']>a
    wait until page contains  Stacked Vertical Bar Chart  5s

select Stacked Horizontal Bar Chart from Display list

    click element  css=.type-display
    click element  css=li[data-value='stackedhorzbar']>a
    wait until page contains  Stacked Horizontal Bar Chart  5s

select Stacked Vertical Bar (%) Chart from Display list

    click element  css=.type-display
    click element  css=li[data-value='pstackedvertbar']>a
    wait until page contains  Stacked Vertical Bar (%) Chart  10s

select Stacked Horizontal Bar (%) Chart from Display list

    click element  css=.type-display
    click element  css=li[data-value='pstackedhorzbar']>a
    wait until page contains  Stacked Horizontal Bar (%) Chart  10s

select Heatmap from Display list

    click element  css=.type-display
    click element  css=li[data-value='heatmap']>a
    wait until page contains  Heatmap  5s


verify Stacked Vertical Bar Chart with grouping value selected

     #labels
     wait until element is visible  css=g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g>text>tspan  30s
     page should contain element  css=g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g>text>tspan
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect:nth-child(10)
     sleep  1s
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect:nth-child(11)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(1)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(10)
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(11)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text>tspan

     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(1)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(6)
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(11)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text>tspan

     page should contain element  css=div[class='metric-chart'] g[class='highcharts-grid']>path
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-6 highcharts-tracker']

verify Stacked Horizontal Bar Chart with grouping value selected

     sleep  2s
     page should contain element  css=g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g>text>tspan
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect:nth-child(10)
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect:nth-child(11)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(1)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(5)
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(6)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text>tspan

     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(1)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(6)
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(12)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text>tspan

     page should contain element  css=div[class='metric-chart'] g[class='highcharts-grid']>path
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-6 highcharts-tracker']


verify Stacked Vertical Bar (%) Chart with grouping value selected

     #labels
     wait until element is visible  css=g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g>text>tspan  30s
     page should contain element  css=g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g>text>tspan
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect:nth-child(10)
     sleep  1s
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect:nth-child(11)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(1)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(10)
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(11)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text>tspan

     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(1)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(6)
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(11)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text>tspan

     page should contain element  css=div[class='metric-chart'] g[class='highcharts-grid']>path
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-6 highcharts-tracker']


verify Stacked Horizontal Bar (%) Chart with grouping value selected

        #labels
     wait until element is visible  css=g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g>text>tspan  30s
     page should contain element  css=g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g>text>tspan
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect:nth-child(10)
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect:nth-child(11)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(1)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(5)
     sleep  1s
     #page should not contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(6)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text>tspan

     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(1)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(6)
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(12)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text>tspan

     page should contain element  css=div[class='metric-chart'] g[class='highcharts-grid']>path
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-6 highcharts-tracker']



verify Heatmap with grouping value selected

     #labels
     sleep  20s
     wait until element is visible  css=g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g>text>tspan  30s
     page should contain element  css=g[class='highcharts-data-labels highcharts-series-0 highcharts-tracker']>g>text>tspan
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect:nth-child(10)
     sleep  5s
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect:nth-child(11)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(1)
     wait until element is visible  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(10)  20s
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(10)
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text:nth-child(11)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-xaxis-labels']>text>tspan

     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(1)
     #page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(7)
     page should not contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text:nth-child(11)
     page should contain element  css=div[class='metric-chart'] g[class='highcharts-axis-labels highcharts-yaxis-labels']>text>tspan

     page should contain element  css=div[class='metric-chart'] g[class='highcharts-grid']>path
     #page should contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-6 highcharts-tracker']
     page should contain element  css=g[class='highcharts-legend-item']>rect
     page should contain element  css=g[class='highcharts-axis-labels highcharts-coloraxis-labels']>text


select the value from But I only want to show it for drop down list

    click element  xpath=//span[text()='(click for options)']
    sleep  2s
    click element  xpath=(//a[text()='check out time (day of week)'])[3]
    wait until page contains  Sunday  10s
    page should contain  Sunday
    page should contain  Monday
    page should contain  Tuesday
    page should contain  Wednesday
    page should contain  Thursday
    page should contain  Friday
    page should contain  Saturday

select the check out time (by hour) from But I only want to show it for drop down list

    click element  xpath=//span[text()='(click for options)']
    sleep  2s
    click element  xpath=(//a[text()='check out time (by hour)'])[3]
    wait until page contains  3 am  10s

verify Update Deep Dive option displayed

    page should contain  Click the values you want to include in this filter or
    page should contain button  css=.btn.btn-primary.deep-dive-update
    page should contain button  css=.btn.cancel-update
    page should contain textfield  css=.filter-search

Enter Search for value and verify

    input text  css=.filter-search  Monday
    press key  css=.filter-search  \\13
    sleep  1s
    input text  css=.filter-search  Thursday
    press key  css=.filter-search  \\13
    sleep  1s
    input text  css=.filter-search  Saturday
    press key  css=.filter-search  \\13
    sleep  1s
    click element  css=.btn.btn-primary.deep-dive-update
    wait until element is visible  css=.filter-list.filters>div  20s
    sleep  5s
    page should contain element  css=.filter-list.filters>div
    page should contain  Monday
    page should contain  Thursday
    page should contain  Saturday

Enter Search for value and update deep drive and verify able to edit and delete the filter under But I only want to show it for

    input text  css=.filter-search  12 am
    press key  css=.filter-search  \\13
    sleep  1s
    input text  css=.filter-search  3 am
    press key  css=.filter-search  \\13
    sleep  1s
    input text  css=.filter-search  7 pm
    press key  css=.filter-search  \\13
    sleep  2s
    click element  css=.btn.btn-primary.deep-dive-update
    wait until element is visible  css=.filter-list.filters>div  20s
    sleep  5s
    page should contain element  css=.filter-list.filters>div
    page should contain  Monday
    page should contain  Thursday
    page should contain  Saturday
    page should contain element  css=div[data-model-id='TC@DW']>a
    page should contain element  css=div[data-model-id='TC@DW']>span
    page should contain element  css=div[data-model-id='TC@HR']>a
    page should contain element  css=div[data-model-id='TC@HR']>span
    click element  css=div[data-model-id='TC@HR']>a
    page should contain element  css=.btn.btn-primary.deep-dive-update
    wait until element is not visible  css=div[data-model-id='TC@HR']>a  10s
    element should not be visible  css=div[data-model-id='TC@HR']>a  2s
    #page should not contain element  css=div[data-model-id='TC@HR']>a
    click element  css=.btn.cancel-update
    sleep  10s
    wait until element is visible  css=div[class='filter-list filters']>div:nth-child(1)>a  20s
    #wait until element is visible  css==div[data-model-id='TC@DW']>a  20s
    #click element  css=div[data-model-id='TC@DW']>a
    click element  css=div[class='filter-list filters']>div:nth-child(1)>a
    page should contain element  css=.btn.btn-primary.deep-dive-update
    #wait until element is not visible  css=div[data-model-id='TC@DW']>a
    sleep  2s
    #wait until element is not visible  css=div[class='filter-list filters']>div:nth-child(1)>a  20s
    click element  css=.btn.cancel-update
    sleep  10s
    #wait until element is visible  css=div[data-model-id='TC@HR']>span  20s
    wait until element is visible  css=div[class='filter-list filters']>div:nth-child(2)>span  20s
    #click element  css=div[data-model-id='TC@HR']>span
    click element  css=div[class='filter-list filters']>div:nth-child(2)>span
    #page should not contain element  css=div[data-model-id='TC@HR']>a
    page should not contain element  css=div[class='filter-list filters']>div:nth-child(2)>a
    click element  css=div[data-model-id='TC@HR']>span
    #click element  css=div[class='filter-list filters']>div:nth-child(2)>span
    #page should not contain element  css=div[data-model-id='TC@DW']>a
    page should not contain element  css=div[class='filter-list filters']>div:nth-child(2)>a

click on Chart context menu and verify download option

    click element  css=.highcharts-button
    page should contain  Download PNG image
    page should contain  Download PDF document
    page should contain  Download CSV

verify Go to Explain page

    page should contain  Go to Deep Dive
    page should contain element  css=#watch-metric
    execute javascript  window.scrollTo(0,document.body.scrollHeight);
    wait until page contains  Select an interval and we will try to explain any unusual performance we see.  5s
    page should contain  Select an interval and we will try to explain any unusual performance we see.

verify chart is loaded in Go to Explain page

    page should contain element  css=g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect
    page should contain element  css=g[class='highcharts-legend-item'] tspan
    page should contain element  css=div[class='metric-chart'] g[ class='highcharts-axis-labels highcharts-xaxis-labels'] tspan
    page should contain element  css=div[class='metric-chart'] g[ class='highcharts-axis-labels highcharts-yaxis-labels'] tspan

click Watch Metric button

    click element  css=#watch-metric

verify Stop Watching button

    wait until page contains element  xpath=//a[text()='Stop Watching']  2s
    page should contain element  xpath=//a[text()='Stop Watching']

click Stop Watching button

    click element  css=#watch-metric

verify Watch Metric button

    wait until page contains element  xpath=//a[text()='Watch Metric']  2s
    page should contain element  xpath=//a[text()='Watch Metric']

click on chart to view Explain Why! button

    page should contain element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect:nth-child(n)
    click element  css=div[class='metric-chart'] g[class='highcharts-series highcharts-series-0 highcharts-tracker']>rect:nth-child(100)

verify Explain Why! button

    execute javascript  window.scrollTo(0,document.body.scrollHeight);
    wait until element is visible  css=.btn.btn-flat.btn-primary.explain-it  5s
    page should contain button  css=.btn.btn-flat.btn-primary.explain-it

click Explain Why! button

    click button  css=.btn.btn-flat.btn-primary.explain-it
    page should contain element  css=.exp-direction-label
    page should contain  Possible explanations for a



