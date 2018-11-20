*** Settings ***
Documentation    Suite description

Resource    ../../resources/admin/pom/adminloginpageobj.robot
Resource    ../../resources/admin/pom/adminhomepageobj.robot
Resource    ../../resources/admin/pom/adminleftpaneobj.robot
Resource    ../../resources/admin/pom/adminhomepageobj.robot
Resource    ../../resources/admin/adminlogin.robot
Resource    ../../resources/admin/pom/adminmetricspageobj.robot
Resource    ../../resources/admin/admincommon.robot



*** Keywords ***

Navigate to Metrics page from adminleftpane

    Open Browser  about:blank   ${BROWSER}
    Maximize Browser Window
    delete all cookies
    adminlogin.Login with valid adminuser and adminpassword
    adminleftpaneobj.Verify Home link in adminleftpane
    adminleftpaneobj.click Home link in adminleftpane
    adminleftpaneobj.Verify Main link in adminleftpane
    adminleftpaneobj.Mouseover on Main link
    adminleftpaneobj.click Metrics link in Sub menu

Navigate to metricpage and verify page

   verify Metrics page element/fields

simple metric search

    adminmetricspageobj.verify metrics search box
    adminmetricspageobj.Enter metric name in search text box  ${METRICS_NAME}
    adminmetricspageobj.click search button
    adminmetricspageobj.Verify metrics search result
    adminmetricspageobj.click on Show all link
    adminmetricspageobj.clear metric name in search field

verify search using by selecting table list

    adminmetricspageobj.click on table drop down list
    adminmetricspageobj.select value from table drop down list
    adminmetricspageobj.click on Show all link

verify metric search by selecting value from work area drop down list

    adminmetricspageobj.click on Work Areas drop down list
    adminmetricspageobj.select value from Work Areas drop down list
    adminmetricspageobj.click on Show all link

verify able to do metric reset by clikcing link try to reset filters

    adminmetricspageobj.verify metrics search box
    adminmetricspageobj.Enter metric name in search text box gives 0 metrics result
    adminmetricspageobj.click search button
    adminmetricspageobj.verify 0 metrics search
    adminmetricspageobj.clear metric name in search field


verify able to navigate to Creating new metric page by clicking Add Metric

    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify "INFO" tab selected by default

    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.verify Metrics Info tab displayed by default
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify "INFO" tab field content

    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.verify Metrics Info tab element/fields
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify "Name" field is mandatory

    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.Enter new metric Description  ${DESCRIPTION}
    adminmetricspageobj.Enter new metric Units  ${UNITS}
    adminmetricspageobj.Enter new metric abbreviation
    adminmetricspageobj.Select new metric Work Areas  ${WORK AREA}
    adminmetricspageobj.Select Best If goes Lower Radio Button
    adminmetricspageobj.Click Save and continue editing Button
    adminmetricspageobj.verify metric Name field valdation message
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify Metric with this Name already exists

    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.Enter existing metric name
    adminmetricspageobj.Enter new metric Description  ${DESCRIPTION}
    adminmetricspageobj.Enter new metric Units  ${UNITS}
    adminmetricspageobj.Enter new metric abbreviation
    adminmetricspageobj.Select new metric Work Areas  ${WORK AREA}
    adminmetricspageobj.Select Best If goes Lower Radio Button
    adminmetricspageobj.Click Save and continue editing Button
    adminmetricspageobj.verify Metric with this Name already exists validation message
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify "Description" field is mandatory

    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.Enter new metric name
    adminmetricspageobj.Enter new metric Units  ${UNITS}
    adminmetricspageobj.Enter new metric abbreviation
    adminmetricspageobj.Select new metric Work Areas  ${WORK AREA}
    adminmetricspageobj.Select Best If goes Lower Radio Button
    adminmetricspageobj.Click Save and continue editing Button
    adminmetricspageobj.verify metric Description field valdation message
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify "Units" field is mandatory

    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.Enter new metric name
    adminmetricspageobj.Enter new metric Description  ${DESCRIPTION}
    adminmetricspageobj.Enter new metric abbreviation
    adminmetricspageobj.Select new metric Work Areas  ${WORK AREA}
    adminmetricspageobj.Select Best If goes Lower Radio Button
    adminmetricspageobj.Click Save and continue editing Button
    adminmetricspageobj.verify metric Unit field valdation message
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify "Abbreviation" field is mandatory

    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.Enter new metric name
    adminmetricspageobj.Enter new metric Description  ${DESCRIPTION}
    adminmetricspageobj.Enter new metric Units  ${UNITS}
    adminmetricspageobj.Select new metric Work Areas  ${WORK AREA}
    adminmetricspageobj.Select Best If goes Lower Radio Button
    adminmetricspageobj.clear metric Abbreviation field
    adminmetricspageobj.Click Save and continue editing Button
    adminmetricspageobj.verify metric Abbreviation field valdation message
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify "Workarea" field is mandatory

    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.Enter new metric name
    adminmetricspageobj.Enter new metric Description  ${DESCRIPTION}
    adminmetricspageobj.Enter new metric Units  ${UNITS}
    adminmetricspageobj.Select Best If goes Lower Radio Button
    adminmetricspageobj.Click Save and continue editing Button
    adminmetricspageobj.verify metric Workarea field valdation message
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify "Best If goes" field is mandatory

    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.Enter new metric name
    adminmetricspageobj.Enter new metric Description  ${DESCRIPTION}
    adminmetricspageobj.Enter new metric Units  ${UNITS}
    adminmetricspageobj.Enter new metric abbreviation
    adminmetricspageobj.Select new metric Work Areas  ${WORK AREA}
    adminmetricspageobj.Click Save and continue editing Button
    adminmetricspageobj.verify metric Best If goes field valdation message
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify able to navigate to "DATA" tab under Add metric

    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.click DATA link
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify "DATA" tab field content tab under Add metric

    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.click DATA link
    adminmetricspageobj.verify Metrics DATA tab element/fields
    adminmetricspageobj.Click Save and continue editing Button
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify 'Which Table' and 'On' fields are visible on selecting 'Requires Join' check box

    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.click DATA link
    adminmetricspageobj.verify 'Which Table' and 'On' fields are visible
    adminmetricspageobj.Click Save and continue editing Button
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify able to select What Type check box's

    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.click DATA link
    adminmetricspageobj.verify What Type Normal Radio Button selected
    adminmetricspageobj.Select What Type Sum Radio Button
    adminmetricspageobj.verify What Type Sum Radio Button selected
    adminmetricspageobj.Select What Type Cumulative Radio Button
    adminmetricspageobj.verify What Type Cumulative Radio Button selected
    adminmetricspageobj.Select What Type Census Radio Button
    adminmetricspageobj.verify What Type Census Radio Button selected
    adminmetricspageobj.click DATA link
    adminmetricspageobj.Click Save and continue editing Button
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify able to navigate to "Metric definitions" tab under Add metric

    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.click Metric definitions link
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify "Metric definitions" tab field content tab under Add metric

    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.click Metric definitions link
    adminmetricspageobj.click Add another Metric definition link
    adminmetricspageobj.click new Metric definition link
    adminmetricspageobj.verify Metric definitions tab element/fields
    adminmetricspageobj.Click Save and continue editing Button
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify able to create new metric

    adminmetricspageobj.verify metric autotestdata present if yes clean up
    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.Enter new metric name
    adminmetricspageobj.Enter new metric Description  ${DESCRIPTION}
    adminmetricspageobj.Enter new metric Units  ${UNITS}
    adminmetricspageobj.Enter new metric abbreviation
    adminmetricspageobj.Select new metric Work Areas  ${WORK AREA}
    adminmetricspageobj.Select Best If goes Lower Radio Button
    adminmetricspageobj.verify Best If goes Lower Radio Button selected
    adminmetricspageobj.click DATA link
    adminmetricspageobj.select value from SQL Table drop down list  ${SQL TABLE}
    adminmetricspageobj.select Requires Join check box
    adminmetricspageobj.verify What Type Normal Radio Button selected
    adminmetricspageobj.Select What Type Cumulative Radio Button
    adminmetricspageobj.verify What Type Cumulative Radio Button selected
    adminmetricspageobj.Enter Time Column  ${TIME_COLUMN}
    adminmetricspageobj.Enter Select query  ${SELECT_QUERY}
    adminmetricspageobj.Enter Where clause  ${WHERE_CLAUSE}
    adminmetricspageobj.click Metric definitions link
    adminmetricspageobj.click Add another Metric definition link
    adminmetricspageobj.click new Metric definition link
    adminmetricspageobj.Enter Metric Definition Name  ${METRIC_DEF_NAME}
    adminmetricspageobj.click Hospital list  ${HOSPITAL}
    adminmetricspageobj.click Regression list  ${REGRESSION}
    adminmetricspageobj.Enter Baseline Name
    adminmetricspageobj.Enter Target Name
    adminmetricspageobj.Enter Filters Name
    adminmetricspageobj.Enter LastUpdatedStats
    adminmetricspageobj.Enter RowStats
    adminmetricspageobj.Enter Paired (denominator) metric
    adminmetricspageobj.Enter Role of paired metric
    adminmetricspageobj.Enter Filters excluded from paired denominator
    adminmetricspageobj.click save button
    adminmetricspageobj.Verify Metric add succesfully message

verify able to Delete selected metrics

    adminleftpaneobj.click Home link in adminleftpane
    adminleftpaneobj.Verify Main link in adminleftpane
    adminleftpaneobj.Mouseover on Main link
    adminleftpaneobj.click Metrics link in Sub menu
    adminmetricspageobj.Enter metric name to be deleted in search text box
    adminmetricspageobj.click search button
    adminmetricspageobj.verify the search result
    adminmetricspageobj.Select Checkbox1
    adminmetricspageobj.select value tabular action drop down list
    adminmetricspageobj.click Go button
    adminmetricspageobj.verify delete confirm message
    adminmetricspageobj.click Yes, I'm sure button
    adminmetricspageobj.verify successfully deleted message

verify able to create new metric and edit

    adminmetricspageobj.verify metric autotestdata present if yes clean up
    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.Enter new metric name
    adminmetricspageobj.Enter new metric Description  ${DESCRIPTION}
    adminmetricspageobj.Enter new metric Units  ${UNITS}
    adminmetricspageobj.Select new metric Work Areas  ${WORK AREA}
    adminmetricspageobj.Select Best If goes Lower Radio Button
    adminmetricspageobj.verify Best If goes Lower Radio Button selected
    adminmetricspageobj.click DATA link
    adminmetricspageobj.select value from SQL Table drop down list  ${SQL TABLE}
    adminmetricspageobj.click save button
    adminmetricspageobj.Verify Metric add succesfully message
    adminmetricspageobj.Enter metric name to be deleted in search text box
    adminmetricspageobj.click search button
    adminmetricspageobj.verify the search result
    adminmetricspageobj.click on metric to edit
    adminmetricspageobj.verify edit metric page loaded
    adminmetricspageobj.Enter new metric abbreviation
    adminmetricspageobj.Select new metric Work Areas  ${WORK AREA}
    adminmetricspageobj.click DATA link
    adminmetricspageobj.select Requires Join check box
    adminmetricspageobj.verify What Type Normal Radio Button selected
    adminmetricspageobj.Select What Type Cumulative Radio Button
    adminmetricspageobj.verify What Type Cumulative Radio Button selected
    adminmetricspageobj.Enter Time Column  ${TIME_COLUMN}
    adminmetricspageobj.Enter Select query  ${SELECT_QUERY}
    adminmetricspageobj.Enter Where clause  ${WHERE_CLAUSE}
    adminmetricspageobj.click Metric definitions link
    adminmetricspageobj.click Add another Metric definition link
    adminmetricspageobj.click new Metric definition link
    adminmetricspageobj.Enter Metric Definition Name  ${METRIC_DEF_NAME}
    adminmetricspageobj.click Hospital list  ${HOSPITAL}
    adminmetricspageobj.click Regression list  ${REGRESSION}
    adminmetricspageobj.Enter Baseline Name
    adminmetricspageobj.Enter Target Name
    adminmetricspageobj.Enter Filters Name
    adminmetricspageobj.Enter LastUpdatedStats
    adminmetricspageobj.Enter RowStats
    adminmetricspageobj.Enter Paired (denominator) metric
    adminmetricspageobj.Enter Role of paired metric
    adminmetricspageobj.Enter Filters excluded from paired denominator
    adminmetricspageobj.click save button
    adminmetricspageobj.Verify Metric was changed successfully message
    adminmetricspageobj.Enter metric name to be deleted in search text box
    adminmetricspageobj.click search button
    adminmetricspageobj.verify the search result
    adminmetricspageobj.Select Checkbox1
    adminmetricspageobj.select value tabular action drop down list
    adminmetricspageobj.click Go button
    adminmetricspageobj.verify delete confirm message
    adminmetricspageobj.click Yes, I'm sure button
    adminmetricspageobj.verify successfully deleted message

verify Save as new option available in edit mode

    adminmetricspageobj.verify metric autotestdata present if yes clean up
    adminmetricspageobj.Create new metric
    adminmetricspageobj.Edit newly created metric
    adminmetricspageobj.verify Save as new option present in edit mode
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify able to Save as new metric in edit mode

    adminmetricspageobj.verify metric autotestdata present if yes clean up
    adminmetricspageobj.verify mertics by using save as new metric present if yes clean up
    adminmetricspageobj.Create new metric
    adminmetricspageobj.Edit newly created metric
    adminmetricspageobj.verify Save as new option present in edit mode
    adminmetricspageobj.Enter save as new metric name
    adminmetricspageobj.click on Save as new button
    adminmetricspageobj.verify save as new metric is created
    adminmetricspageobj.verify mertics by using save as new metric present if yes clean up

verify able to Save and add another metric

    adminmetricspageobj.verify metric autotestdata present if yes clean up
    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.Enter new metric name
    adminmetricspageobj.Enter new metric Description  ${DESCRIPTION}
    adminmetricspageobj.Enter new metric Units  ${UNITS}
    adminmetricspageobj.Select new metric Work Areas  ${WORK AREA}
    adminmetricspageobj.Select Best If goes Lower Radio Button
    adminmetricspageobj.verify Best If goes Lower Radio Button selected
    adminmetricspageobj.click DATA link
    adminmetricspageobj.select value from SQL Table drop down list  ${SQL TABLE}
    adminmetricspageobj.Click Save and add another Button
    adminmetricspageobj.Verify Metric was You may add another metric below message
    adminmetricspageobj.click Metrics link in top-breadcrumbs
    adminmetricspageobj.Enter metric name to be deleted in search text box
    adminmetricspageobj.click search button
    adminmetricspageobj.verify the search result
    adminmetricspageobj.Select Checkbox1
    adminmetricspageobj.select value tabular action drop down list
    adminmetricspageobj.click Go button
    adminmetricspageobj.verify delete confirm message
    adminmetricspageobj.click Yes, I'm sure button
    adminmetricspageobj.verify successfully deleted message

verify able to Save and add another metric in edit mode

    adminmetricspageobj.verify metric autotestdata present if yes clean up
    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.Enter new metric name
    adminmetricspageobj.Enter new metric Description  ${DESCRIPTION}
    adminmetricspageobj.Enter new metric Units  ${UNITS}
    adminmetricspageobj.Select new metric Work Areas  ${WORK AREA}
    adminmetricspageobj.Select Best If goes Lower Radio Button
    adminmetricspageobj.verify Best If goes Lower Radio Button selected
    adminmetricspageobj.click DATA link
    adminmetricspageobj.select value from SQL Table drop down list  ${SQL TABLE}
    adminmetricspageobj.click save button
    adminmetricspageobj.Verify Metric add succesfully message
    adminmetricspageobj.Enter metric name to be deleted in search text box
    adminmetricspageobj.click search button
    adminmetricspageobj.verify the search result
    adminmetricspageobj.click on metric to edit
    adminmetricspageobj.verify edit metric page loaded
    adminmetricspageobj.Select new metric Work Areas  ${WORK AREA}
    adminmetricspageobj.Click Save and add another Button
    adminmetricspageobj.Verify Metric was You may add another metric below message in edit mode
    adminmetricspageobj.click Metrics link in top-breadcrumbs
    adminmetricspageobj.Enter metric name to be deleted in search text box
    adminmetricspageobj.click search button
    adminmetricspageobj.verify the search result
    adminmetricspageobj.Select Checkbox1
    adminmetricspageobj.select value tabular action drop down list
    adminmetricspageobj.click Go button
    adminmetricspageobj.verify delete confirm message
    adminmetricspageobj.click Yes, I'm sure button
    adminmetricspageobj.verify successfully deleted message

verify able to Delete metric in edit mode

    adminmetricspageobj.verify metric autotestdata present if yes clean up
    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.Enter new metric name
    adminmetricspageobj.Enter new metric Description  ${DESCRIPTION}
    adminmetricspageobj.Enter new metric Units  ${UNITS}
    adminmetricspageobj.Select new metric Work Areas  ${WORK AREA}
    adminmetricspageobj.Select Best If goes Lower Radio Button
    adminmetricspageobj.verify Best If goes Lower Radio Button selected
    adminmetricspageobj.click DATA link
    adminmetricspageobj.select value from SQL Table drop down list  ${SQL TABLE}
    adminmetricspageobj.click save button
    adminmetricspageobj.Verify Metric add succesfully message
    adminmetricspageobj.Enter metric name to be deleted in search text box
    adminmetricspageobj.click search button
    adminmetricspageobj.verify the search result
    adminmetricspageobj.click on metric to edit
    adminmetricspageobj.verify edit metric page loaded
    adminmetricspageobj.click on delete button in edit mode
    adminmetricspageobj.click "Yes, I'm sure" button in edit mode
    adminmetricspageobj.verify successfully deleted message in edit mode
    adminmetricspageobj.Enter metric name to be deleted in search text box
    adminmetricspageobj.click search button
    adminmetricspageobj.verify 0 metrics search

validate the query builder

    adminleftpaneobj.click Home link in adminleftpane
    adminleftpaneobj.Verify Main link in adminleftpane
    adminleftpaneobj.Mouseover on Main link
    adminleftpaneobj.click Metrics link in Sub menu
    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.click DATA link
    adminmetricspageobj.select value from SQL Table drop down list  ${SQL TABLE}
    adminmetricspageobj.verify What Type Normal Radio Button selected
    adminmetricspageobj.Enter Time Column  ${TIME_COLUMN}
    adminmetricspageobj.Enter Select query  ${SELECT_QUERY}
    adminmetricspageobj.Enter Where clause  ${WHERE_CLAUSE}
    adminmetricspageobj.click validate button
    adminmetricspageobj.verify query is valid
    adminmetricspageobj.click Metrics link in top-breadcrumbs
    #Confirm Action

validate the query builder with incorrect query

    adminleftpaneobj.click Home link in adminleftpane
    adminleftpaneobj.Verify Main link in adminleftpane
    adminleftpaneobj.Mouseover on Main link
    adminleftpaneobj.click Metrics link in Sub menu
    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.click DATA link
    adminmetricspageobj.select value from SQL Table drop down list  ${SQL TABLE}
    adminmetricspageobj.verify What Type Normal Radio Button selected
    adminmetricspageobj.Enter Time Column  ${TIME_COLUMN}
    adminmetricspageobj.Enter Select query  ${SELECT_QUERY}
    adminmetricspageobj.Enter in correct Where clause
    adminmetricspageobj.click validate button
    adminmetricspageobj.verify query error message
    adminmetricspageobj.click Metrics link in top-breadcrumbs

verify metric Name field validation under Info tab

    adminleftpaneobj.click Home link in adminleftpane
    adminleftpaneobj.Verify Main link in adminleftpane
    adminleftpaneobj.Mouseover on Main link
    adminleftpaneobj.click Metrics link in Sub menu
    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.Enter new metric Description  ${DESCRIPTION}
    adminmetricspageobj.Enter new metric Units  ${UNITS}
    adminmetricspageobj.Enter new metric abbreviation
    adminmetricspageobj.Select Best If goes Lower Radio Button
    adminmetricspageobj.verify metric Name field valdation message

verify metric Description field validation under Info tab

    adminleftpaneobj.click Home link in adminleftpane
    adminleftpaneobj.Verify Main link in adminleftpane
    adminleftpaneobj.Mouseover on Main link
    adminleftpaneobj.click Metrics link in Sub menu
    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.enter new metric name
    adminmetricspageobj.Enter new metric Units  ${UNITS}
    adminmetricspageobj.Enter new metric abbreviation
    adminmetricspageobj.Select Best If goes Lower Radio Button
    adminmetricspageobj.verify metric Name field valdation message

validate the Set row stats

    adminmetricspageobj.verify metric autotestdata present if yes clean up
    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.Enter new metric name
    adminmetricspageobj.Enter new metric Description  ${DESCRIPTION}
    adminmetricspageobj.Enter new metric Units  ${UNITS}
    adminmetricspageobj.Enter new metric abbreviation
    adminmetricspageobj.Select new metric Work Areas  ${WORK AREA1}
    adminmetricspageobj.Select Best If goes Lower Radio Button
    adminmetricspageobj.verify Best If goes Lower Radio Button selected
    adminmetricspageobj.click DATA link
    adminmetricspageobj.select value from SQL Table drop down list  ${SQL TABLE}
    adminmetricspageobj.select Requires Join check box
    adminmetricspageobj.verify What Type Normal Radio Button selected
    adminmetricspageobj.Enter Time Column  ${TIME_COLUMN}
    adminmetricspageobj.Enter Select query  ${SELECT_QUERY1}
    adminmetricspageobj.Enter Where clause  ${WHERE_CLAUSE1}
    adminmetricspageobj.click Metric definitions link
    adminmetricspageobj.click Add another Metric definition link
    adminmetricspageobj.click new Metric definition link
    adminmetricspageobj.Enter Metric Definition Name  ${METRIC_DEF_NAME}
    adminmetricspageobj.click Hospital list  ${HOSPITAL1}
    adminmetricspageobj.click Regression list  ${REGRESSION1}
    adminmetricspageobj.Click Save and continue editing Button
    adminmetricspageobj.click Metric definitions link
    adminmetricspageobj.click on Set row stats button
    adminmetricspageobj.verify graph displayed under Set row stats
    adminmetricspageobj.click save button
    adminmetricspageobj.Verify Metric was changed successfully message

verify Admin user should able to navigate to History page in metric

    adminmetricspageobj.verify metric autotestdata present if yes clean up
    adminmetricspageobj.click on Add metric button
    adminmetricspageobj.verify Creating new metric page loaded
    adminmetricspageobj.Enter new metric name
    adminmetricspageobj.Enter new metric Description  ${DESCRIPTION}
    adminmetricspageobj.Enter new metric Units  ${UNITS}
    adminmetricspageobj.Select new metric Work Areas  ${WORK AREA}
    adminmetricspageobj.Select Best If goes Lower Radio Button
    adminmetricspageobj.verify Best If goes Lower Radio Button selected
    adminmetricspageobj.click DATA link
    adminmetricspageobj.select value from SQL Table drop down list  ${SQL TABLE}
    adminmetricspageobj.click save button
    adminmetricspageobj.Verify Metric add succesfully message
    adminmetricspageobj.Enter metric name to be deleted in search text box
    adminmetricspageobj.click search button
    adminmetricspageobj.verify the search result
    adminmetricspageobj.click on metric to edit
    adminmetricspageobj.verify edit metric page loaded
    adminmetricspageobj.click on History button under metric edit mode
    adminmetricspageobj.verify History page under metric
    adminmetricspageobj.click Metrics link in top-breadcrumbs