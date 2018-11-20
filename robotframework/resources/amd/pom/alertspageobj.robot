*** Settings ***
Library         SeleniumLibrary
Resource        ../pom/../amdvariables.robot


*** Keywords ***
###################Homepage###########

verify Alert page loaded

    page should contain  Notifications
    page should contain element  css=.btn.btn-flat.dismiss-all.aside
    Location Should Contain  feed

verify Alert page

    page should contain  Notifications
    page should contain element  css=#notification-view .hero-unit-title
    page should contain  Your feed
    page should contain element  css=.page-container.container.container-vertical-small>h4[class='inline-block']
    PAGE SHOULD CONTAIN ELEMENT  css=.btn.btn-flat.dismiss-all.aside
    page should contain  Your alerts

    page should contain  Metric
    page should contain  Facility
    page should contain  Threshold
    page should contain  Edit
    page should contain  Delete
    page should contain button  Add an alert
    page should contain  Alerts help you stay on top of metric performance by notifying you if a given metric has crossed a specified threshold. For example, you can set up and alert to email you if the average wait time goes above 20 minutes.

verify Add an alert button

     page should contain button  Add an alert

click on Add an alert button

     click button  css=.btn.btn-flat.btn-primary.add-alert

verify Add Alert displayed

     page should contain  Add Alert
     page should contain  Select Metric
     page should contain  Notify me via

verify Add Alert popup screen

     page should contain  Add Alert
     page should contain button  Smart Alert
     page should contain button  css=#smarttog
     page should contain button  Basic Alert
     page should contain button  css=#basictog
     page should contain  Select Metric
     page should contain element  css=.select2-choice
     page should contain  Notify me via
     page should contain checkbox  feedNotif
     page should contain checkbox  emailNotif
     page should contain checkbox  smsNotif

     page should contain  Advanced
     page should contain element  css=.smartalert-only.advanced
     page should contain button  css=#addalert
     page should contain button  css=#cancelalert


click on Advanced link under Add Alert popup screen

    click link  css=.smartalert-only.advanced



verify field under Advanced link

     page should contain  Threshold(%)
     page should contain element  name=thresholdsa
     #Trigger when low
     page should contain checkbox  triggerLeft
     #Trigger when high
     page should contain checkbox  triggerRight

     page should contain  But only for certain slices of the metric
     page should contain checkbox  specificSlices
     #.specificSlices
     page should contain  Monitor this metric by
     page should contain element  css=.pivotSelector
     page should contain  Monitor it for
     page should contain element  css=.select2-choices
     page should contain element  css=.close


close Add Alert popup screen

     click element  css=.close

click on Add alert button under Add Alert pop screen

     click element  xpath=//span[contains(text(),'Add alert')]
     sleep  2s


select Smart Alert under Add Alert popup screen

     click button  Smart Alert
     #click button  css=#smarttog

select Basic Alert under Add Alert popup screen

     click button  Basic Alert
     #click button  css=#basictog

verify Basic Alert under Add Alert popup screen

     page should contain  Select Metric
     #page should contain element  css=#select2-chosen-5
     page should contain  Notify me via
     page should contain checkbox  feedNotif
     page should contain checkbox  emailNotif
     page should contain checkbox  smsNotif
     page should contain  Average over
     page should contain element  name=alertAbove
     page should contain  Notify me at most
     page should contain  once every

select value from Select Metric drop down list

     click element  css=#s2id_s2-metricdefinition
     click element  xpath=//div[contains(text(),'${ALERT_SELECT_METRICS}')]
     #click element  xpath=//div[contains(text(),'Test Hospital 3 - Roomed in ED to MD Start - DC')]


verify Feed check box selected

    checkbox Should Be Selected  name=feedNotif

select Notify me via Feed checkbox

     select checkbox  name=feedNotif
     checkbox Should Be Selected	name=feedNotif

Unselect Notify me via Feed Checkbox

      Unselect Checkbox  name=feedNotif
      checkbox Should Not Be Selected  name=feedNotif

verify Email check box selected

     checkbox Should Be Selected  name=emailNotif

Unselect Notify me via Email Checkbox

      wait until page contains element  css=.icon-phone  5s
      click element  css=.icon-phone
      checkbox Should Not Be Selected  name=emailNotif

verify SMS check box is not selected

      checkbox should not be selected  name=smsNotif

select Notify me via SMS checkbox

     click element  css=.icon-comment
     #select checkbox  name=smsNotif

verify SMS check box is selected

     checkbox Should Be Selected  name=smsNotif

Unselect Notify me via SMS Checkbox

      click element  css=.icon-comment
      #Unselect Checkbox  name=smsNotif
      checkbox Should Not Be Selected  name=smsNotif


Delete newly created alert under Your alerts

     ${row_count_before} =  Get Matching Xpath Count  //table[@id='notif-alerts-table']/tbody/tr
     log  ${row_count_before}
     click element  xpath=//table[@id='notif-alerts-table']/tbody/tr[1]/td[5]/a
     Confirm Action
     ${row_count_after} =  Get Matching Xpath Count  //table[@id='notif-alerts-table']/tbody/tr
     log  ${row_count_after}
     Should Not Be Equal  ${row_count_before}  ${row_count_after}


Edit newly created alert under Your alerts

    click element  xpath=//table[@id='notif-alerts-table']/tbody/tr[1]/td[4]/i


Entered the Threshold(%) value

        input text  name=thresholdsa  ${ALERT_THRESHOLD}


verify Trigger when low check box is selected

     checkbox Should Be Selected  name=triggerLeft

verify Trigger when low check box is not selected

      checkbox should not be selected  name=triggerLeft


verify Trigger when high check box is selected

     checkbox Should Be Selected  name=triggerRight

verify Trigger when high check box is not selected

      checkbox should not be selected  name=triggerRight

select But only for certain slices of the metric check box

     select checkbox  name=specificSlices
     checkbox Should Be Selected	name=specificSlices

Unselect But only for certain slices of the metric Checkbox

      Unselect Checkbox  name=specificSlices
      checkbox Should Not Be Selected  name=specificSlices


select value from Monitor it for list1

     click element  xpath=html/body/div[11]/form/div[2]/div[3]/div[4]/select
     #click element  xpath=//div[@id='s2id_autogen230']/ul
     #sleep  5s
     click element  xpath=//div[text()='${ALERT_MONITOR_IT_FOR}']
     #sleep  5s
     #click element  xpath=html/body/div[11]/form/div[2]/div[3]/div[4]/select
     #click element  xpath=html/body/div[11]/form/div[2]/div[3]/div[4]/select/option[text()='acuity']

verify Monitor this metric by field is disabled

     element should be disabled  xpath=html/body/div[11]/form/div[2]/div[3]/div[4]/select

select value from Monitor this metric by list

     click element  css=html body.metro div.modal.hide.in form.form-horizontal.alert-form.smart div.modal-body div.smartalert-advanced div.controls select.pivotSelector
     click element  xpath=//option[text()='${ALERT_MONITOR_THIS_METRIC_BY}']


select value from Monitor it for list

     click element  css=.select2-choices
     #click element  css=html body.metro div.modal.hide.in form.form-horizontal.alert-form.smart div.modal-body div.smartalert-advanced div.controls div#s2id_autogen121.select2-container.select2-container-multi.pivotValues ul.select2-choices
     click element  xpath=//div[text()='${ALERT_MONITOR_IT_FOR}']


select value from Average over drop down list

      click element  css=body > div.modal.hide.in > form > div.modal-body > div:nth-child(6) > div > select
      click element  xpath=//option[text()='${ALERT_AVERAGE_OVER}']

Enter Threshold under Basic Alert


   input text  css=body > div.modal.hide.in > form > div.modal-body > div:nth-child(8) > div > input  ${ALERT_BASIC_THRESHOLD}

select value from Trigger when drop down list


      click element  css=body > div.modal.hide.in > form > div.modal-body > div:nth-child(7) > div > select
      click element  xpath=//option[text()='${ALERT_TRIGGER_WHEN}']

select value from Notify me at most once every drop down list

      click element  css=body > div.modal.hide.in > form > div.modal-body > div:nth-child(9) > div > select
      click element  xpath=//option[text()='${ALERT_NOTIFY_ME_AT_MOST_ONCE_EVERY}']
      sleep  1s


verify Edit Smart Alert pop screen displayed

     page should contain  Edit Smart Alert
     page should contain element  xpath=//*[@id="addalert"]/span


click on Edit alert button under Edit Smart Alert pop screen

     click element  xpath=//span[contains(text(),'Edit alert')]

click on Advanced link under edit Alert popup screen

    click element  css=body > div.modal.hide.in > form > div.modal-body > a


Entered the Threshold(%) value in edit Alert popup screen

     input text  css=html body.metro div.modal.hide.in form.form-horizontal.alert-form.smart div.modal-body div.smartalert-advanced div.controls input  8
