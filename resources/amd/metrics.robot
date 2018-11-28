*** Settings ***
Documentation    Suite description

Resource    ../../resources/amd/pom/signinobj.robot
Resource    ../../resources/amd/pom/leftpaneobj.robot
Resource    ../../resources/amd/pom/homepageobj.robot
Resource    ../../resources/amd/pom/profilepageobj.robot
Resource    ../../resources/amd/pom/metricspageobj.robot

*** Keywords ***

login and verify Metrics page

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page

navigate to Metrics page and hospital workarea metric and time range

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe

navigate to Metrics page and able to select time range

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    select values from Time Intervals drop down in metrics and verify

navigate to Metrics page and verify deep drive page

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page

navigate to Metrics page and veiw and verify Metrics by selecting different option avaialble from "I want to see this metric by"

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    select the value from 'I want to see this metric by'- check out time (timeseries)
    select the value from 'I want to see this metric by' check out time (day of week)
    select the value from 'I want to see this metric by' check out time (by hour)
    select the value from 'I want to see this metric by' acuity
    select the value from 'I want to see this metric by' discharge disposition
    select the value from 'I want to see this metric by' Doctor

navigate to Metrics page and select "Show me x points" different options

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.select value from Show me drop down list

navigate to Metrics page and select "sort" different options

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.select value from sort drop down list


navigate to Metrics page and select "display" different options

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.select value from Display drop down list


navigate to Metrics page and select "Vertical Bar Chart" and check chart is displayed

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.verify Vertical bar chart is displayed
    metricspageobj.select Show labels checkbox
    metricspageobj.verify labels is displayed for vertical bar chart
    metricspageobj.select Show me 5 points
    metricspageobj.verify 5 point vertical bar chart

navigate to Metrics page and select "Horizontal Bar Chart" and check chart is displayed

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    minimize chat window under metricpage
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.select Horizontal Bar Chart from Display list
    metricspageobj.verify Horizontal Bar Chart is displayed
    metricspageobj.select Show labels checkbox
    metricspageobj.select Show me 5 points
    metricspageobj.verify 5 point Horizontal bar chart
    metricspageobj.verify labels is displayed for Horizontal bar chart


navigate to Metrics page and select "Line Chart" and check chart is displayed

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.minimize chat window under metricpage
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.select line Chart from Display list
    metricspageobj.verify line Chart is displayed
    metricspageobj.select Show labels checkbox
    metricspageobj.select Show me 5 points
    metricspageobj.verify 5 point line chart
    metricspageobj.verify labels is displayed for line chart

navigate to Metrics page and select "Area Chart" and check chart is displayed

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.minimize chat window under metricpage
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.select Area Chart from Display list
    metricspageobj.verify Area Chart is displayed
    metricspageobj.select Show labels checkbox
    metricspageobj.select Show me 5 points
    metricspageobj.verify 5 point Area chart
    metricspageobj.verify labels is displayed for Area chart

navigate to Metrics page and select "Pie Chart" and check chart is displayed

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.minimize chat window under metricpage
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.select Pie Chart from Display list
    metricspageobj.verify Pie Chart is displayed
    metricspageobj.select Show labels checkbox
    metricspageobj.select Show me 5 points
    metricspageobj.verify 5 point Pie chart
    metricspageobj.verify labels is displayed for pie chart

navigate to Metrics page and select "Box Plot" and check chart is displayed

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.minimize chat window under metricpage
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.select Box Plot from Display list
    metricspageobj.verify Box Plot is displayed
    metricspageobj.select Show labels checkbox
    metricspageobj.select Show me 5 points
    metricspageobj.verify 5 point Box Plot


navigate to Metrics page and verify choose grouping drop down list

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.verify Vertical bar chart is displayed
    metricspageobj.click on Add Dimension
    metricspageobj.click choose grouping drop down list and verify list


navigate to Metrics page and select value from grouping drop down list and verify Display drop down list

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.verify Vertical bar chart is displayed
    metricspageobj.verify Display drop down list values
    metricspageobj.click on Add Dimension
    metricspageobj.select the value from choose grouping drop down list
    metricspageobj.verify Display drop down list values after selecting value from choose grouping drop down list


navigate to Metrics page and select value from grouping drop down list and verify Vertical Bar Chart

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.verify Vertical bar chart is displayed
    metricspageobj.select Show labels checkbox
    metricspageobj.select Show me 10 points
    metricspageobj.click on Add Dimension
    metricspageobj.select the value from choose grouping drop down list
    metricspageobj.verify Vertical Bar Chart with grouping value selected

navigate to Metrics page and select value from grouping drop down list and Horizontal Bar Chart Chart

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.verify Vertical bar chart is displayed
    metricspageobj.select Show labels checkbox
    metricspageobj.select Show me 10 points
    metricspageobj.click on Add Dimension
    metricspageobj.select the value from choose grouping drop down list
    metricspageobj.select Horizontal Bar Chart from Display list
    metricspageobj.verify Horizontal Bar Chart with grouping value selected


navigate to Metrics page and select value from grouping drop down list and verify Stacked Vertical Bar Chart

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.verify Vertical bar chart is displayed
    metricspageobj.select Show labels checkbox
    metricspageobj.select Show me 10 points
    metricspageobj.click on Add Dimension
    metricspageobj.select the value from choose grouping drop down list
    metricspageobj.select Stacked Vertical Bar Chart from Display list
    metricspageobj.verify Stacked Vertical Bar Chart with grouping value selected

navigate to Metrics page and select value from grouping drop down list and Stacked Horizontal Bar Chart


    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.verify Vertical bar chart is displayed
    metricspageobj.select Show labels checkbox
    metricspageobj.select Show me 10 points
    metricspageobj.click on Add Dimension
    metricspageobj.select the value from choose grouping drop down list
    metricspageobj.select Stacked Horizontal Bar Chart from Display list
    metricspageobj.verify Stacked Horizontal Bar Chart with grouping value selected


navigate to Metrics page and select value from grouping drop down list and verify Stacked Vertical Bar (%) Chart

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.verify Vertical bar chart is displayed
    metricspageobj.select Show labels checkbox
    metricspageobj.select Show me 10 points
    metricspageobj.click on Add Dimension
    metricspageobj.select the value from choose grouping drop down list
    metricspageobj.select Stacked Vertical Bar (%) Chart from Display list
    metricspageobj.verify Stacked Vertical Bar (%) Chart with grouping value selected

navigate to Metrics page and select value from grouping drop down list and Stacked Horizontal Bar (%) Chart

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.verify Vertical bar chart is displayed
    metricspageobj.select Show labels checkbox
    metricspageobj.select Show me 10 points
    metricspageobj.click on Add Dimension
    metricspageobj.select the value from choose grouping drop down list
    metricspageobj.select Stacked Vertical Bar (%) Chart from Display list
    metricspageobj.verify Stacked Horizontal Bar (%) Chart with grouping value selected


navigate to Metrics page and select value from grouping drop down list and verify Heatmap

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.verify Vertical bar chart is displayed
    metricspageobj.select Show labels checkbox
    metricspageobj.select Show me 10 points
    metricspageobj.click on Add Dimension
    metricspageobj.select the value from choose grouping drop down list
    metricspageobj.select Heatmap from Display list
    metricspageobj.verify Heatmap with grouping value selected


navigate to Metrics page and select value from But I only want to show it for drop down list and update Deep drive filter

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.verify Vertical bar chart is displayed
    metricspageobj.select the value from 'I want to see this metric by' check out time (day of week)
    metricspageobj.select the value from But I only want to show it for drop down list
    metricspageobj.verify Update Deep Dive option displayed
    metricspageobj.Enter Search for value and verify


navigate to Metrics page and able to apply multiple filter by selecting value from But I only want to show it for drop down list

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.verify Vertical bar chart is displayed
    metricspageobj.select the value from 'I want to see this metric by' check out time (day of week)
    metricspageobj.select the value from But I only want to show it for drop down list
    metricspageobj.verify Update Deep Dive option displayed
    metricspageobj.Enter Search for value and verify
    metricspageobj.select the check out time (by hour) from But I only want to show it for drop down list
    metricspageobj.verify Update Deep Dive option displayed
    metricspageobj.Enter Search for value and update deep drive and verify able to edit and delete the filter under But I only want to show it for


navigate to Metrics page and verify Download options for Chart

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.verify Vertical bar chart is displayed
    metricspageobj.click on Chart context menu and verify download option


navigate to Go to Explain under Metrics page

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.verify Vertical bar chart is displayed
    metricspageobj.click on 'Go to Explain' button
    metricspageobj.verify Go to Explain page
    metricspageobj.verify chart is loaded in Go to Explain page

navigate to 'Go to Explain' under Metrics page and verify watch metrics and stop watching

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.verify Vertical bar chart is displayed
    metricspageobj.click on 'Go to Explain' button
    metricspageobj.verify Go to Explain page
    metricspageobj.verify chart is loaded in Go to Explain page
    metricspageobj.click Watch Metric button
    metricspageobj.verify Stop Watching button
    metricspageobj.click Stop Watching button
    metricspageobj.verify Watch Metric button

navigate to 'Go to Explain' under Metrics page and verify Explain Why!

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Metrics icon
    metricspageobj.verify Metrics page
    metricspageobj.select the Hospitals from the list of value under metrics page
    metricspageobj.verify the hospital value selected under metrics page
    metricspageobj.select the Work Areas from the list of value under metrics page
    metricspageobj.verify the Work Areas value selected under metrics page
    metricspageobj.select the metrics from the list of value under metrics page
    metricspageobj.verify the Metric value selected under metrics page
    metricspageobj.click the Time Intervals from the list of value under metrics page
    metricspageobj.verify Time Intervals drop down values in metrics
    metricspageobj.select Choose time range from Time Intervals drop down in metricpage
    metricspageobj.verify Custom timeframe pop up screen under metric page
    metricspageobj.click on ALL button in Custom timeframe
    metricspageobj.click on Finish button in Custom timeframe
    metricspageobj.verify Go to Explain button is visible if not click on Go to Deep Dive button
    metricspageobj.verify Deep Dive page
    metricspageobj.verify Vertical bar chart is displayed
    metricspageobj.click on 'Go to Explain' button
    metricspageobj.verify Go to Explain page
    metricspageobj.verify chart is loaded in Go to Explain page
    metricspageobj.click on chart to view Explain Why! button
    metricspageobj.verify Explain Why! button
    metricspageobj.click Explain Why! button


