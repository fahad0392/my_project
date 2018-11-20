*** Settings ***
Documentation    Suite description

Resource    ../../resources/amd/pom/signinobj.robot
Resource    ../../resources/amd/pom/leftpaneobj.robot
Resource    ../../resources/amd/pom/alertspageobj.robot

*** Keywords ***

Login and navigate to Alert page

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    verify Alert page loaded


login and verify Alert page

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    alertspageobj.verify Alert page loaded
    alertspageobj.verify Alert page

Login and navigate to Alert page and verify Add an alert option

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    alertspageobj.verify Alert page loaded
    alertspageobj.verify Add an alert button


Login and navigate to Alert page and verify Add Alert popup screen displayed

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    alertspageobj.verify Alert page loaded
    alertspageobj.verify Add an alert button
    alertspageobj.click on Add an alert button
    alertspageobj.verify Add Alert displayed

Login and navigate to Alert page and verify Add Alert popup screen fields

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    alertspageobj.verify Alert page loaded
    alertspageobj.verify Add an alert button
    alertspageobj.click on Add an alert button
    alertspageobj.verify Add Alert displayed
    alertspageobj.verify Add Alert popup screen

Login and navigate to Alert page and verify Advanced option under Add Alert popup screen

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    alertspageobj.verify Alert page loaded
    alertspageobj.verify Add an alert button
    alertspageobj.click on Add an alert button
    alertspageobj.verify Add Alert displayed
    alertspageobj.click on Advanced link under Add Alert popup screen
    alertspageobj.verify field under Advanced link
    alertspageobj.close Add Alert popup screen


Login and navigate to Alert page and verify Basic Alerts under Add Alert popup screen

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    alertspageobj.verify Alert page loaded
    alertspageobj.verify Add an alert button
    alertspageobj.click on Add an alert button
    alertspageobj.verify Add Alert displayed
    alertspageobj.select Basic Alert under Add Alert popup screen
    alertspageobj.verify Basic Alert under Add Alert popup screen

Login and navigate to Alert page and create a Smart Alert

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    alertspageobj.verify Alert page loaded
    alertspageobj.verify Add an alert button
    alertspageobj.click on Add an alert button
    alertspageobj.verify Add Alert displayed
    alertspageobj.select value from Select Metric drop down list
    alertspageobj.verify Feed check box selected
    alertspageobj.verify Email check box selected
    alertspageobj.verify SMS check box is not selected
    alertspageobj.select Notify me via SMS checkbox
    alertspageobj.verify SMS check box is selected
    alertspageobj.click on Add alert button under Add Alert pop screen
    alertspageobj.Delete newly created alert under Your alerts

Login and navigate to Alert page and create a Smart Alert and edit the newly created alert

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    alertspageobj.verify Alert page loaded
    alertspageobj.verify Add an alert button
    alertspageobj.click on Add an alert button
    alertspageobj.verify Add Alert displayed
    alertspageobj.select value from Select Metric drop down list
    alertspageobj.verify Feed check box selected
    alertspageobj.verify Email check box selected
    alertspageobj.verify SMS check box is not selected
    alertspageobj.select Notify me via SMS checkbox
    alertspageobj.verify SMS check box is selected
    alertspageobj.click on Add alert button under Add Alert pop screen
    alertspageobj.Edit newly created alert under Your alerts
    alertspageobj.verify Edit Smart Alert pop screen displayed
    #alertspageobj.Unselect Notify me via Email Checkbox
    #alertspageobj.click on Advanced link under Add Alert popup screen
    alertspageobj.click on Advanced link under edit Alert popup screen
    alertspageobj.verify field under Advanced link
    alertspageobj.Entered the Threshold(%) value in edit Alert popup screen
    alertspageobj.click on Edit alert button under Edit Smart Alert pop screen
    alertspageobj.Delete newly created alert under Your alerts


Login and navigate to Alert page and create a Smart Alert by selecting advanced option

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    alertspageobj.verify Alert page loaded
    alertspageobj.verify Add an alert button
    alertspageobj.click on Add an alert button
    alertspageobj.verify Add Alert displayed
    alertspageobj.select value from Select Metric drop down list
    alertspageobj.click on Advanced link under Add Alert popup screen
    alertspageobj.verify field under Advanced link
    alertspageobj.Entered the Threshold(%) value
    alertspageobj.verify Trigger when low check box is selected
    alertspageobj.verify Trigger when high check box is selected
    alertspageobj.select But only for certain slices of the metric check box
    alertspageobj.click on Add alert button under Add Alert pop screen
    alertspageobj.Delete newly created alert under Your alerts


Login and navigate to Alert page and create a Basic Alert

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    alertspageobj.verify Alert page loaded
    alertspageobj.verify Add an alert button
    alertspageobj.click on Add an alert button
    alertspageobj.verify Add Alert displayed
    alertspageobj.select Basic Alert under Add Alert popup screen
    alertspageobj.verify Basic Alert under Add Alert popup screen
    alertspageobj.select value from Select Metric drop down list
    alertspageobj.verify Feed check box selected
    alertspageobj.verify Email check box selected
    alertspageobj.verify SMS check box is not selected
    select value from Average over drop down list
    select value from Trigger when drop down list
    select value from Notify me at most once every drop down list
    alertspageobj.Enter Threshold under Basic Alert
    #alertspageobj.select value from Average over drop down list
    #alertspageobj.select value from Notify me at most once every drop down list
    alertspageobj.click on Add alert button under Add Alert pop screen
    alertspageobj.Delete newly created alert under Your alerts
