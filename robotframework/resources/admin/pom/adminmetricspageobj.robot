*** Settings ***
Library         SeleniumLibrary

Resource        ../../admin/admincommon.robot
Resource        ../pom/../metricsvariable.robot


*** Keywords ***

verify Metrics page element/fields

    Wait Until Page Contains Element  name=q  5s
    page should contain link  Metrics
    page should contain textfield  name=q
    page should contain link  Add metric
    page should contain element  xpath=//span[contains(text(),'By Work Areas')]
    page should contain element  xpath=//span[contains(text(),'By table')]
    page should contain element  css=input[type='submit']
    page should contain link  Name
    page should contain link  Unit
    page should contain link  Abbreviation
    page should contain link  Level
    page should contain link  BestDir
    page should contain link  Selector
    page should contain  Workareas
    page should contain element  css=div[class='actions initialized'] span[class='select2-selection__rendered']
    page should contain element  css=.this-page
    page should contain button  Go


verify metrics search box

    #page should contain textfield    xpath=//input[@name='q']
    page should contain textfield  css=#searchbar


Enter metric name in search text box

    [Arguments]      ${METRICS_NAME}
    input text  name=q   ${METRICS_NAME}
    log  ${METRICS_NAME}

Enter metric name in search text box gives 0 metrics result
    #[Arguments]      ${q}
    input text  name=q   IAMNOTPRESENT
    log  IAMNOTPRESENT

clear metric name in search field

    Clear Element Text  name=q

verify 0 metrics search

    wait until page contains  0 results (
    page should contain  0 metrics

click on try to reset filters link

    #click link  try to reset filters
    click link  css=.small.quiet>a

Enter metric name to be deleted in search text box

    #[Arguments]      ${q}
    input text  name=q   ${NEWMETRICS_NAME}
    log  ${NEWMETRICS_NAME}

verify the search result

    log  verify search result
    ${metrics_name_temp1}    Get Text    xpath=.//*[@id='result_list']/tbody/tr/th/a
    Should Be Equal As Strings    ${metrics_name_temp1}    ${NEWMETRICS_NAME}
    page should contain link  ${NEWMETRICS_NAME}


verify metric autotestdata present if yes clean up

    Run Keyword And Ignore Error  click link  Metrics
    Run Keyword And Ignore Error  Confirm Action
    #[Arguments]      ${q}
    input text  name=q   ${NEWMETRICS_NAME}
    log  ${NEWMETRICS_NAME}
    click search button
    #Run Keyword If  page should contain link  ${NEWMETRICS_NAME}
    ${status}=  run keyword and return status  page should not contain link  ${NEWMETRICS_NAME}
    log  ${status}
    run keyword if  ${status} ==True  click on try to reset filters link
    run keyword unless  ${status} ==True  delete the automation test metrics

delete the automation test metrics

    adminmetricspageobj.verify the search result
    adminmetricspageobj.Select Checkbox1
    adminmetricspageobj.select value tabular action drop down list
    adminmetricspageobj.click Go button
    adminmetricspageobj.verify delete confirm message
    adminmetricspageobj.click Yes, I'm sure button
    adminmetricspageobj.verify successfully deleted message


Select Checkbox1

    wait until page contains element  css=.small.quiet>a  3s
    ##click element  xpath=.//*[@id='result_list']/tbody/tr/th/a[text()='${NEWMETRICS_NAME}']/../preceding-sibling::td/label
    #click element  xpath=//tr[@class='row1']/td/label[@for='unique_checkbox_id_0']
    click element  css=table[id=result_list]>tbody>tr:nth-child(1)>td>label

click on metric to edit

    page should contain link  ${NEWMETRICS_NAME}
    click link  ${NEWMETRICS_NAME}

verify edit metric page loaded

    page should contain  Creating new metric
    page should contain  ${NEWMETRICS_NAME}
    title should be  Change metric | QVENTUS

click on History button under metric edit mode

    click link  History

verify History page under metric

    title should be  Change history: ${NEWMETRICS_NAME} (${UNITS}) | Django site admin
    page should contain  History
    page should contain  Object
    page should contain  Date/time
    page should contain  Comment
    page should contain  Changed by
    page should contain  Choose a date from the list below to revert to a previous version of this object.

Create new metric

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

Edit newly created metric

    adminmetricspageobj.Enter metric name to be deleted in search text box
    adminmetricspageobj.click search button
    adminmetricspageobj.verify the search result
    adminmetricspageobj.click on metric to edit
    adminmetricspageobj.verify edit metric page loaded


verify Save as new option present in edit mode

    page should contain button  name=_saveasnew

click on Save as new button

    click button  name=_saveasnew

Enter save as new metric name

    input text  name=name   ${SAVE_AS_NEW_METRICS_NAME}

verify save as new metric is created

   page should contain   The metric "${SAVE_AS_NEW_METRICS_NAME} (${UNITS})" was added successfully. You may edit it again below.

verify mertics by using save as new metric present if yes clean up

    Run Keyword And Ignore Error  click link  Metrics
    Run Keyword And Ignore Error  Confirm Action
    clear metric name in search field
    #[Arguments]      ${q}
    input text  name=q   ${SAVE_AS_NEW_METRICS_NAME}
    log  ${SAVE_AS_NEW_METRICS_NAME}
    click search button
    ${status}=  run keyword and return status  page should not contain link  ${SAVE_AS_NEW_METRICS_NAME}
    log  ${status}
    run keyword if  ${status} ==True  click on try to reset filters link
    run keyword unless  ${status} ==True  delete the save as new metric created

delete the save as new metric created

   ${metrics_name_temp1}    Get Text    css=table[id=result_list]>tbody>tr:nth-child(1)>th>a
   Should Be Equal As Strings    ${metrics_name_temp1}    ${SAVE_AS_NEW_METRICS_NAME}
   page should contain link  ${SAVE_AS_NEW_METRICS_NAME}
   adminmetricspageobj.Select Checkbox1
   adminmetricspageobj.select value tabular action drop down list
   adminmetricspageobj.click Go button
   page should contain  Are you sure you want to delete the selected metric? All of the following objects and their related items will be deleted:
   page should contain  ${SAVE_AS_NEW_METRICS_NAME}  (${UNITS})
   page should contain  Metric:
   adminmetricspageobj.click Yes, I'm sure button
   adminmetricspageobj.verify successfully deleted message

select value tabular action drop down list

    #click element  xpath=//div[@class='actions initialized'] //span[@class='select2-selection__rendered']
    click element  css=div[class='actions initialized'] .select2-selection__rendered
    input text  css=.select2-search__field  Delete selected metrics
    click element  xpath=//li[text()='Delete selected metrics']

click Go button

    click element     xpath=//button[@type='submit']

click search button

    click element     xpath=//input[@type='submit']

verify delete confirm message

    page should contain  Are you sure you want to delete the selected metric? All of the following objects and their related items will be deleted:
    page should contain  ${NEWMETRICS_NAME}  (${UNITS})
    page should contain  Metric:

click Yes, I'm sure button

    click element  xpath=//input[@type='submit']

verify successfully deleted message

    wait until page contains element  css=.success  2s
    page should contain  Successfully deleted 1 metric.

click on table drop down list

    click element  xpath=//span[contains(text(),'By table')]

select value from table drop down list

    input text  css=.select2-search__field  ${tablename}
    #input text  xpath=.//*[@class='select2-search__field']  ${tablename}
    #press key   xpath=.//*[@class='select2-search__field']  \\13
    press key   css=.select2-search__field  \\13

click on Work Areas drop down list

    click element  xpath=//span[contains(text(),'By Work Areas')]

select value from Work Areas drop down list

    input text  css=.select2-search__field  ${WORK AREA}
    #input text  xpath=.//*[@class='select2-search__field']  ${WORK AREA}
    #press key   xpath=.//*[@class='select2-search__field']  \\13
    press key   css=.select2-search__field  \\13

click on abbreviation drop down list

    click element  xpath=//span[text()='abbreviation']

click on Show all link

    #click element       xpath=//a[text()='Show all']
    sleep  2s
    click element  css=.small.quiet>a
    #page should not contain link  Show all

click on Add metric button

    #click element   xpath=//a[@class='addlink']
    click link  Add metric

Verify metrics search result

    ${metrics_name_temp}    Get Text    xpath=.//*[@id='result_list']/tbody/tr/th/a
    Should Be Equal As Strings    ${metrics_name_temp}    ${METRICS_NAME}

verify HOME link present in rightpane

    page should contain link     xpath=(//a[@href='/atc/'])[1]

click on HOME link in rightpane

    click link   xpath=(//a[@href='/atc/'])[1]

click Metrics link in top-breadcrumbs

    click link  Metrics
    Run Keyword And Ignore Error  Confirm Action
    wait until page contains element  css=.addlink  10s

###############  Add metric  Creating new metric ##########


verify Creating new metric page loaded

    page should contain  Creating new metric
    page should contain  Add metric
    title should be  Add metric | QVENTUS


verify Metrics Info tab displayed by default

    page should contain  Name:
    page should contain  Description:
    page should contain  Permission Level:
    page should contain  Units:

verify Metrics Info tab element/fields

    page should contain element  name=name
    page should contain element  name=description
    page should contain element  name=unit
    page should contain element  name=abbreviation
    page should contain element  xpath=//ul[@class='select2-selection__rendered']
    #page should contain  Hold down "Control", or "Command" on a Mac, to select more than one.
    page should contain element  id=select2-id_level-container
    page should contain  Lower
    Page Should Contain Radio Button  xpath=//input[@type="radio" and @value="-1"]
    page should contain  Neither
    Page Should Contain Radio Button  xpath=//input[@type="radio" and @value="0"]
    page should contain  Higher
    Page Should Contain Radio Button  xpath=//input[@type="radio" and @value="1"]


Enter new metric name

    input text  name=name   ${NEWMETRICS_NAME}

Enter existing metric name

    input text  name=name   ${EXISTING_METRICS_NAME}

Enter new metric Description

    [Arguments]      ${DESCRIPTION}
    input text  name=description   ${DESCRIPTION}

Enter new metric Units

    [Arguments]      ${UNITS}
    input text  name=unit   ${UNITS}

Enter new metric abbreviation

    input text  name=abbreviation   ${ABBREVIATION}

Select new metric Work Areas

   [Arguments]      ${WORK AREA}
   #click element  xpath=//ul[@class='select2-selection__rendered']
   click element  css=ul[class='select2-selection__rendered']
   input text  css=span[class='select2-search select2-search--dropdown']>input  ${WORK AREA}
   click element  css=li[class='select2-results__option select2-results__option--highlighted']
   #press key   css=span[class='select2-search select2-search--dropdown']>input  \\13
   #click element  xpath=//li[text()='${WORK AREA}']

select Permission Level

   click element  id=select2-id_level-container
   click element  xpath=//li[text()=${PERMISSION LEVEL}]

Select Best If goes Lower Radio Button

    select radio button  bestDir  -1

verify Best If goes Lower Radio Button selected

    Radio Button Should Be Set To    bestDir    -1

Select Best If goes Neither Radio Button

    select radio button  bestDir  0

verify Best If goes Neither Radio Button selected

    Radio Button Should Be Set To    bestDir    0

Select Best If goes Higher Radio Button

    select radio button  bestDir  1

verify Best If goes Higher Radio Button selected

    Radio Button Should Be Set To    bestDir    1

verify metric Name field valdation message

    wait until page contains element  css=.errorlist>li  10s
    page should contain element  css=div[class='form-row errors field-name'] li
    page should contain  This field is required.

verify Metric with this Name already exists validation message

    wait until page contains element  css=.errorlist>li  2s
    page should contain element  css=div[class='form-row errors field-name'] li
    page should contain  Metric with this Name already exists.

verify metric Description field valdation message

    wait until page contains element  css=.errorlist>li  2s
    page should contain element  css=div[class='form-row errors field-description'] li
    page should contain  This field is required.

verify metric Unit field valdation message

    wait until page contains element  css=.errorlist>li  2s
    page should contain element  css=div[class='form-row errors field-unit'] li
    page should contain  This field is required.

clear metric Abbreviation field

    Clear Element Text  name=abbreviation

verify metric Abbreviation field valdation message

    page should contain element  css=div[class='form-row errors field-abbreviation'] li
    page should contain  This field is required.

verify metric Workarea field valdation message

    page should contain element  css=div[class='form-row errors field-workArea'] li
    page should contain  This field is required.

verify metric Best If goes field valdation message

    page should contain element  css=div[class='form-row errors field-bestDir'] li
    page should contain  This field is required.


###############  Add metric  Creating new metric DATA TAB ##########

click DATA link

    click link  Data
    page should contain  Now define the query
    page should contain element  xpath=//button[@id='btnValidate']
    page should contain button  Validate

verify Metrics DATA tab element/fields

    #SQL Table:
    page should contain textfield  name=table
    #Database Name:
    page should contain textfield  name=dbName
    #Requires Join
    Page Should Contain Checkbox  temp_id
    # What Type:
    Page Should Contain Checkbox  xpath=//input[@type='checkbox' and @name='temp_id']
    Page Should Contain Radio Button  Sum
    Page Should Contain Radio Button  xpath=//input[@type="radio" and @value="Sum"]
    Page Should Contain Radio Button  Normal
    Page Should Contain Radio Button  xpath=//input[@type="radio" and @value="Normal"]
    Page Should Contain Radio Button  Cumulative
    Page Should Contain Radio Button  xpath=//input[@type="radio" and @value="Cumulative"]
    Page Should Contain Radio Button  Census
    Page Should Contain Radio Button  xpath=//input[@type="radio" and @value="Census"]
    #TimeGroup
    page should contain element  css=#select2-id_timeGroup-container
    #Time Column:
    page should contain textfield  timeColumn
    page should contain textfield  xpath=//input[@type='text' and @name='timeColumn']
    #Select
    page should contain element  name=selector
    #Where
    page should contain element  name=defFilters
    #Slice Filters
    page should contain element  name=sliceFilters
    #Validate
    page should contain button  css=#btnValidate


verify 'Which Table' and 'On' fields are visible

    click element  xpath=.//*[@id='metric_form']/div[1]/ul
    page should contain  Which Table:
    page should contain textfield  name=joinTable
    page should contain  On:
    page should contain element  name=joinCondition

select value from SQL Table drop down list

    [Arguments]      ${SQL TABLE}

    input text  name=table   ${SQL TABLE}
    run keyword and ignore error  click element  css=#ui-active-menuitem
    run keyword and ignore error  click element  css=ul[class='ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all']>li:nth-child(1)>a

select value from Which Table drop down list

    input text  name=joinTable   ${WHICH TABLE}

select Requires Join check box

    click element  css=.vCheckboxLabel

Select What Type Normal Radio Button

    select radio button  calculationType  Normal

verify What Type Normal Radio Button selected

    Radio Button Should Be Set To    calculationType    Normal
    page should contain  Performs the query for the metric without modifications

Select What Type Sum Radio Button

    select radio button  calculationType  Sum

verify What Type Sum Radio Button selected

    Radio Button Should Be Set To   calculationType   Sum
    page should contain  Normalizes a metric for daily calculations. For example, a count(*) as a sum metric will return daily average counts

Select What Type Cumulative Radio Button

    select radio button  calculationType  Cumulative

verify What Type Cumulative Radio Button selected

    Radio Button Should Be Set To   calculationType   Cumulative
    page should contain  Similar to Normal metric, but indicates that the frontend should reflect all values as Totals rather than Averages

Select What Type Census Radio Button

    select radio button  calculationType  Census

verify What Type Census Radio Button selected

    Radio Button Should Be Set To   calculationType   Census
    page should contain  Specialized metric used for calculating census. This metric does not use standard SQL and requires special syntax ('start_timestamp, end_timestamp'

Select TimeGroup

   [Arguments]      ${TIME GROUP}

   click element  css=#select2-id_timeGroup-container
   input text  css=span[class='select2-search select2-search--dropdown']>input  ${TIME GROUP}
   press key   css=span[class='select2-search select2-search--dropdown']>input  \\13
   #click element  xpath=//li[text()='${TIME GROUP}']


Enter Time Column

    [Arguments]      ${TIME_COLUMN}
    input text  name=timeColumn   ${TIME_COLUMN}

Enter Select query

    [Arguments]      ${SELECT_QUERY}
    input text  name=selector   ${SELECT_QUERY}

Enter in correct Where clause

    ${invalid_where_clause} =  set variable  ${WHERE_CLAUSE}]
    log  ${invalid_where_clause}
    input text  name=defFilters   ${invalid_where_clause}

Enter Where clause

    [Arguments]      ${WHERE_CLAUSE}
    input text  name=defFilters   ${WHERE_CLAUSE}

Enter ON joincondition

    input text  name=joinCondition   ${ON_JOINCONDITION}

click validate button

    #click element  xpath=//*[@id='btnValidate']
    click element  css=#btnValidate

verify query is valid

    wait until page contains  Metric Data in Time Series  3s
    page should contain     Metric Data in Time Series

verify query error message

    wait until page contains element  css=#queryError  10s
    wait until page contains  Warning!  5s
    page should contain  You have an error in your SQL syntax;


########### Metric definitions tab ####################

click Metric definitions link

    #click element  xpath=//a[contains(text(),'Metric definitions')]
    click link  Metric definitions
    #click element  css=li[class='changeform-tabs-item selected']>a
    page should contain link  Add another Metric definition


click Add another Metric definition link

    #click element  xpath=//a[contains(text(),'Add another Metric definition')]

    click element  css=.add-row

click new Metric definition link

    click element  css=.inline-navigation-item.selected

verify Metric definitions tab element/fields

    page should contain element  id=id_metricdefinition_set-0-metricName
    page should contain  Metric Definition Name:
    page should contain element  id=select2-id_metricdefinition_set-0-hospital-container
    page should contain  Hospital:
    page should contain element  id=select2-id_metricdefinition_set-0-regression-container
    page should contain  Regression:
    page should contain element  id=id_metricdefinition_set-0-baseline
    page should contain  Baseline:
    page should contain element  id=id_metricdefinition_set-0-target
    page should contain  Target:
    page should contain element  id=id_metricdefinition_set-0-filters
    page should contain  Filters:
    page should contain element  id=id_metricdefinition_set-0-lastUpdatedStats_0
    page should contain  LastUpdatedStats:
    page should contain element  id=id_metricdefinition_set-0-lastUpdatedStats_1
    page should contain element  id=id_metricdefinition_set-0-rowStats
    page should contain  RowStats:
    page should contain  Does this definition need a second metrics (ie normalized against something else)?
    page should contain  Paired (denominator) metric:
    page should contain element  id=select2-id_metricdefinition_set-0-pairedMetricRole-container
    page should contain  What role should this paired metric play?
    page should contain  Role of paired metric:
    page should contain element  id=id_metricdefinition_set-0-pairedExcludedFilters
    page should contain  Filters excluded from paired denominator:
    page should contain button  css=#btnRowstats
    page should contain button  Set row stats


Enter Metric Definition Name

    [Arguments]      ${METRIC_DEF_NAME}
    input text  css=#id_metricdefinition_set-0-metricName  ${METRIC_DEF_NAME}

click Hospital list

    [Arguments]      ${HOSPITAL}

    click element  css=#select2-id_metricdefinition_set-0-hospital-container
    click element  css=span[class='select2-search select2-search--dropdown'] input
    input text  css=span[class='select2-search select2-search--dropdown'] input  ${HOSPITAL}
    press key   css=span[class='select2-search select2-search--dropdown']>input  \\13
    #click element  xpath=//li[text()='${HOSPITAL}']


click Regression list

    [Arguments]      ${REGRESSION}
    click element  css=#select2-id_metricdefinition_set-0-regression-container
    input text  css=span[class='select2-search select2-search--dropdown']>input  ${REGRESSION}
    press key   css=span[class='select2-search select2-search--dropdown']>input  \\13
    #click element   xpath=//li[text()='${REGRESSION}']

Enter Baseline Name

    input text  css=#id_metricdefinition_set-0-baseline  ${Baseline}

Enter Target Name

    input text  css=#id_metricdefinition_set-0-target  ${Target}

Enter Filters Name

    input text  id=id_metricdefinition_set-0-filters  ${Filters}

Enter LastUpdatedStats

    input text  css=#id_metricdefinition_set-0-lastUpdatedStats_0  ${LastUpdatedStats}

Enter LastUpdatedStatstime

    input text  css=#id_metricdefinition_set-0-lastUpdatedStats_1  ${LastUpdatedStatstime}

Enter RowStats

    input text  css=#id_metricdefinition_set-0-rowStats  ${RowStats}

Enter Paired (denominator) metric

    click element  css=#select2-id_metricdefinition_set-0-pairedMetric-container
    input text  css=span[class='select2-search select2-search--dropdown']>input  ${Paired_denominator_metric}
    press key   css=span[class='select2-search select2-search--dropdown']>input  \\13
    #click element  xpath=//li[text()='${Paired_denominator_metric}']
    #select from list  id=select2-id_metricdefinition_set-0-pairedMetric-results  ED volume (count)

Enter Role of paired metric

     click element  css=#select2-id_metricdefinition_set-0-pairedMetricRole-container
     input text  css=span[class='select2-search select2-search--dropdown']>input  ${Role of paired metric}
     press key   css=span[class='select2-search select2-search--dropdown']>input  \\13
     #click element  xpath=//li[text()='${Role of paired metric}']

Enter Filters excluded from paired denominator

     input text  id=id_metricdefinition_set-0-pairedExcludedFilters  ${Filters excluded from paired denominator}

click save button

     click button   name=_save

Click Save and continue editing Button

      click button   name=_continue

Click Save and add another Button

      click button   name=_addanother

click on delete button in edit mode

       click link  Delete

verify delete confirm message in edit mode

    page should contain  Delete
    page should contain  Are you sure you want to delete the metric "${NEWMETRICS_NAME} (${UNITS})"? All of the following related items will be deleted:
    page should contain  Summary
    page should contain  Metric: ${NEWMETRICS_NAME} (${UNITS})
    page should contain button  value=Yes, I'm sure
    page should contain link  No, take me back

click "Yes, I'm sure" button in edit mode

    click button  css=input[type='submit']

verify successfully deleted message in edit mode

     page should contain   The metric "${NEWMETRICS_NAME} (${UNITS})" was deleted successfully.

Verify Metric add succesfully message

     page should contain   The metric "${NEWMETRICS_NAME} (${UNITS})" was added successfully.

Verify Metric was changed successfully message

     page should contain   The metric "${NEWMETRICS_NAME} (${UNITS})" was changed successfully.

Verify Metric was You may add another metric below message

     page should contain  The metric "${NEWMETRICS_NAME} (${UNITS})" was added successfully. You may add another metric below.
     page should contain  Creating new metric

Verify Metric was You may add another metric below message in edit mode

     page should contain  The metric "${NEWMETRICS_NAME} (${UNITS})" was changed successfully. You may add another metric below.
     page should contain  Creating new metric

verify Metric Definition Name field valdation message

    wait until page contains  xpath=//fieldset[@id='module_0']/div[1]/ul/li
    page should contain  This field is required.

verify LastUpdatedStats field valdation message

    wait until page contains  xpath=//fieldset[@id='module_0']/div[6]/ul/li
    page should contain  This field is required.

verify RowStats field valdation message

    wait until page contains  xpath=//fieldset[@id='module_0']/div[7]/ul/li
    page should contain  This field is required.

click on Set row stats button

   click button  css=div[id='metricdefinition_set-0'] #btnRowstats


verify graph displayed under Set row stats

    sleep  5s
    wait until page contains element  css=#select2-id_metricdefinition_set-0-regression-container  50s
    page should contain element  css=text[class='highcharts-title'] tspan
    Execute JavaScript    window.scrollTo(0,2000)
    click element  css=path[class='highcharts-button-symbol']
    page should contain  Print chart
    page should contain  Download PNG image
    page should contain  Download JPEG image
    page should contain  Download PDF document
    page should contain  Download SVG vector image
