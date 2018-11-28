*** Settings ***
Documentation    Suite description

Resource    ../../resources/admin/pom/adminloginpageobj.robot
Resource    ../../resources/admin/pom/adminhomepageobj.robot
Resource    ../../resources/admin/pom/adminleftpaneobj.robot
Resource    ../../resources/admin/pom/adminhomepageobj.robot
Resource    ../../resources/admin/adminlogin.robot
Resource    ../../resources/admin/pom/adminmetricspageobj.robot
Resource    ../../resources/admin/pom/adminuserpageobj.robot
Resource    ../../resources/admin/admincommon.robot


*** Keywords ***

Navigate to USER page from adminleftpane

    adminlogin.Login with valid adminuser and adminpassword
    adminleftpaneobj.Verify Home link in adminleftpane
    adminleftpaneobj.click Home link in adminleftpane
    adminleftpaneobj.Verify Main link in adminleftpane
    adminleftpaneobj.Mouseover on Authentication and Authorization link
    adminleftpaneobj.click Users link in Sub menu

End User test

    adminleftpaneobj.check for alert
    adminleftpaneobj.click Home link in adminleftpane
    adminleftpaneobj.Verify Main link in adminleftpane
    adminleftpaneobj.Mouseover on Authentication and Authorization link
    adminleftpaneobj.click Users link in Sub menu

valid admin user should able to navigate to Users page

    adminuserpageobj.verify Users page loaded

valid admin user should able to navigate to ADD USER page

    adminuserpageobj.Click Add user Button
    adminuserpageobj.verify ADD USER page loaded
    adminuserpageobj.click Users link in top-breadcrumbs

valid admin user should able to navigate to ADD USER page and fill out General details

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save Button
    adminuserpageobj.Verify user added message after clicking on save button
    adminuserpageobj.click Users link in top-breadcrumbs
    adminuserpageobj.Enter in search box
    adminuserpageobj.click on search button
    adminuserpageobj.verify search result page

validate admin user should able to search new user created and able to edit

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save Button
    adminuserpageobj.Verify user added message after clicking on save button
    adminuserpageobj.click Users link in top-breadcrumbs
    adminuserpageobj.Enter in search box
    adminuserpageobj.click on search button
    adminuserpageobj.verify search result page
    adminuserpageobj.Click on username to edit
    adminuserpageobj.verify users edit page
    adminuserpageobj.click Users link in top-breadcrumbs

validate required First name field validation under general tab

    adminuserpageobj.Click Add user Button
    adminuserpageobj.verify ADD USER page loaded
    adminuserpageobj.Enter Last name
    adminuserpageobj.Enter New Username
    adminuserpageobj.Enter Email
    adminuserpageobj.Enter Password
    adminuserpageobj.Enter Password confirmation
    adminuserpageobj.Click Save Button
    adminuserpageobj.verify First name validation required field message
    adminuserpageobj.click Users link in top-breadcrumbs

validate required Last name field validation under general tab

    adminuserpageobj.Click Add user Button
    adminuserpageobj.verify ADD USER page loaded
    adminuserpageobj.Enter First name
    adminuserpageobj.Enter New Username
    adminuserpageobj.Enter Email
    adminuserpageobj.Enter Password
    adminuserpageobj.Enter Password confirmation
    adminuserpageobj.Click Save Button
    adminuserpageobj.verify Last name: validation required field message
    adminuserpageobj.click Users link in top-breadcrumbs

validate required Email field validation under general tab

    adminuserpageobj.Click Add user Button
    adminuserpageobj.verify ADD USER page loaded
    adminuserpageobj.Enter First name
    adminuserpageobj.Enter Last name
    adminuserpageobj.Enter New Username
    adminuserpageobj.Enter Password
    adminuserpageobj.Enter Password confirmation
    adminuserpageobj.Click Save Button
    adminuserpageobj.verify Email: validation required field message
    adminuserpageobj.click Users link in top-breadcrumbs

validate required username field validation under general tab

    adminuserpageobj.Click Add user Button
    adminuserpageobj.verify ADD USER page loaded
    adminuserpageobj.Enter First name
    adminuserpageobj.Enter Last name
    adminuserpageobj.Enter Email
    adminuserpageobj.Enter Password
    adminuserpageobj.Enter Password confirmation
    adminuserpageobj.verify Username: validation required field message
    adminuserpageobj.Click Save Button
    adminuserpageobj.click Users link in top-breadcrumbs

validate required Password field validation under general tab

    adminuserpageobj.Click Add user Button
    adminuserpageobj.verify ADD USER page loaded
    adminuserpageobj.Enter First name
    adminuserpageobj.Enter Last name
    adminuserpageobj.Enter New Username
    adminuserpageobj.Enter Email
    adminuserpageobj.verify Password: validation required field message
    adminuserpageobj.click Users link in top-breadcrumbs

validate required Password confirmation field validation under general tab

    adminuserpageobj.Click Add user Button
    adminuserpageobj.verify ADD USER page loaded
    adminuserpageobj.Enter First name
    adminuserpageobj.Enter Last name
    adminuserpageobj.Enter New Username
    adminuserpageobj.Enter Email
    adminuserpageobj.Enter Password
    adminuserpageobj.verify Passwordconfirmation: validation required field message
    adminuserpageobj.click Users link in top-breadcrumbs

validate cannot use duplicate username

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save Button
    adminuserpageobj.Verify user added message after clicking on save button
    adminuserpageobj.click Users link in top-breadcrumbs
    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save Button
    adminuserpageobj.verify username already exists message
    adminuserpageobj.click Users link in top-breadcrumbs

verify fields under Hospital/WorkArea present in tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.verify page HOSPITAL/WORKAREA tab

valid admin user should able to navigate to Hospital/WorkArea tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.select value from PrimaryHospital list
    adminuserpageobj.select value from WorkArea list
    adminuserpageobj.select value from PrimaryWorkarea list
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click Users link in top-breadcrumbs

validate required Hospitals field validation under HOSPITAL/WORKAREA tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from PrimaryHospital list
    adminuserpageobj.select value from WorkArea list
    adminuserpageobj.select value from PrimaryWorkarea list
    adminuserpageobj.select value from Groups list under Hospital/WorkArea
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.verify hospitals field validation and required field message

verify no exception after clicking Click Save and continue button when no value for Hospitals and PrimaryHospital is selected

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.mention with button to be clicked  Save and continue editing
    adminuserpageobj.verify hospitals field validation and required field message

verify no exception after clicking Click Save button when no value for Hospitals and PrimaryHospital is selected

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.mention with button to be clicked  Save
    adminuserpageobj.verify hospitals field validation and required field message


validate required Department field validation under HOSPITAL/WORKAREA tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.select value from PrimaryHospital list
    adminuserpageobj.select value from PrimaryWorkarea list
    adminuserpageobj.select value from Groups list under Hospital/WorkArea
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.verify Department field validation and required field message

verify fields under PERMISSIONS present in tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on PERMISSIONS
    adminuserpageobj.verify page Permissions tab

valid admin user should able to navigate to Permissions tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.select value from WorkArea list
    adminuserpageobj.select value from PrimaryHospital list
    adminuserpageobj.select value from PrimaryWorkarea list
    adminuserpageobj.select value from Groups list under Hospital/WorkArea
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click on PERMISSIONS
    adminuserpageobj.verify help text in Permissions tab
    adminuserpageobj.verify Active checkbox selected/checked
    adminuserpageobj.Select Staff status Checkbox
    adminuserpageobj.verify Staff status checkbox selected/checked
    adminuserpageobj.Select Superuser status Checkbox
    adminuserpageobj.verify Superuser status checkbox selected/checked
    adminuserpageobj.select value from User permissions list
    adminuserpageobj.Enter Permission Level
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.verify save changed message after clicking Save and continue editing
    adminuserpageobj.click Users link in top-breadcrumbs

validate required Permission Level field validation under PERMISSIONS tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.select value from PrimaryHospital list
    adminuserpageobj.select value from WorkArea list
    adminuserpageobj.select value from PrimaryWorkarea list
    adminuserpageobj.select value from Groups list under Hospital/WorkArea
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click on PERMISSIONS
    adminuserpageobj.clear Permission level field content
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click on PERMISSIONS
    adminuserpageobj.verify Permission level field validation and required field message
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click Users link in top-breadcrumbs

valid admin user should able to navigate to Permissions tab and select/unselect Active status check box

    adminuserpageobj.Enter in search box
    adminuserpageobj.click on search button
    adminuserpageobj.verify search result page
    adminuserpageobj.Click on username to edit
    adminuserpageobj.click on PERMISSIONS
    adminuserpageobj.verify Active checkbox selected/checked
    adminuserpageobj.UnSelect Active Checkbox
    adminuserpageobj.verify Active checkbox Not Be Selected/unchecked
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click Users link in top-breadcrumbs

valid admin user should able to navigate to Permissions tab and select/unselect Staff status check box

    adminuserpageobj.Enter in search box
    adminuserpageobj.click on search button
    adminuserpageobj.verify search result page
    adminuserpageobj.Click on username to edit
    adminuserpageobj.click on PERMISSIONS
    adminuserpageobj.verify Staff status checkbox Not Be Selected/unchecked
    adminuserpageobj.Select Staff status Checkbox
    adminuserpageobj.verify Staff status checkbox selected/checked
    adminuserpageobj.Unselect Staff status Checkbox
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click Users link in top-breadcrumbs

valid admin user should able to navigate to Permissions tab and select/unselect Superuser status check box

    adminuserpageobj.Enter in search box
    adminuserpageobj.click on search button
    adminuserpageobj.verify search result page
    adminuserpageobj.Click on username to edit
    adminuserpageobj.click on PERMISSIONS
    adminuserpageobj.verify Superuser status checkbox Not Be Selected/unchecked
    adminuserpageobj.Select Superuser status Checkbox
    adminuserpageobj.verify Superuser status checkbox selected/checked
    adminuserpageobj.Unselect Superuser status Checkbox
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click Users link in top-breadcrumbs


verify fields under CONTACTS present in tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on CONTACTS
    adminuserpageobj.verify page Contacts tab
    adminuserpageobj.click Users link in top-breadcrumbs

valid admin user should able to navigate to CONTACTS tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.select value from PrimaryHospital list
    adminuserpageobj.select value from PrimaryWorkarea list
    adminuserpageobj.select value from Groups list under Hospital/WorkArea
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click on CONTACTS
    adminuserpageobj.verify page Contacts tab
    adminuserpageobj.Enter USER Phone number
    adminuserpageobj.Enter USER Fax number
    adminuserpageobj.Enter USER VoceraId number
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click Users link in top-breadcrumbs


verify fields under IDENTITY present in tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on IDENTITY
    adminuserpageobj.verify Identity tab is loaded

valid admin user should able to navigate to IDENTITY tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.select value from PrimaryHospital list
    adminuserpageobj.select value from WorkArea list
    adminuserpageobj.select value from PrimaryWorkarea list
    adminuserpageobj.select value from Groups list under Hospital/WorkArea
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click on CONTACTS
    adminuserpageobj.click on IDENTITY
    adminuserpageobj.select value from Select Important Column: drop down list
    adminuserpageobj.click on Select Important Column search button
    adminuserpageobj.click on Add link
    adminuserpageobj.verify Current Identities table row has remove link
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click Users link in top-breadcrumbs


verify fields under MEMBERSHIP present in tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on MEMBERSHIP
    adminuserpageobj.verify MEMBERSHIP tab is loaded
    adminuserpageobj.click Users link in top-breadcrumbs

verify able to click on ADD Dashboards button under MEMBERSHIP tab and verify Add Dashboard Membership page

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on MEMBERSHIP
    adminuserpageobj.verify MEMBERSHIP tab is loaded
    adminuserpageobj.click on Add Dashboards under Membership
    adminuserpageobj.verify Add Dashboard Membership page
    adminuserpageobj.click on back to naviagte to Membership tab
    adminuserpageobj.click Users link in top-breadcrumbs

verify able to add Dashboard Membership from MEMBERSHIP tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click on MEMBERSHIP
    adminuserpageobj.verify MEMBERSHIP tab is loaded
    adminuserpageobj.click on Add Dashboards under Membership
    adminuserpageobj.verify Add Dashboard Membership page
    adminuserpageobj.select value from dashboard drop down list
    adminuserpageobj.select value from type drop down list
    adminuserpageobj.select value from UserProfile drop down list
    adminuserpageobj.click on save button under Add Dashboard Membership
    adminuserpageobj.verify Dashboards table updated with new dashboard membership
    adminuserpageobj.Click Save Button

verify able to remove Dashboard Membership under MEMBERSHIP tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click on MEMBERSHIP
    adminuserpageobj.verify MEMBERSHIP tab is loaded
    adminuserpageobj.click on Add Dashboards under Membership
    adminuserpageobj.verify Add Dashboard Membership page
    adminuserpageobj.select value from dashboard drop down list
    adminuserpageobj.select value from type drop down list
    adminuserpageobj.select value from UserProfile drop down list
    adminuserpageobj.click on save button under Add Dashboard Membership
    adminuserpageobj.verify Dashboards table updated with new dashboard membership
    adminuserpageobj.Remove Dashboards Membership from Dashboards table
    adminuserpageobj.Click Save Button


verify able to click on ADD Email Reports button under MEMBERSHIP tab and verify Add email report membership page

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on MEMBERSHIP
    adminuserpageobj.verify MEMBERSHIP tab is loaded
    adminuserpageobj.click on Add Email Reports under Membership
    adminuserpageobj.verify email report membership page
    adminuserpageobj.click on back to naviagte to Membership tab
    adminuserpageobj.click Users link in top-breadcrumbs

verify able to add email report membership from MEMBERSHIP tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click on MEMBERSHIP
    adminuserpageobj.verify MEMBERSHIP tab is loaded
    adminuserpageobj.click on Add Email Reports under Membership
    adminuserpageobj.verify email report membership page
    adminuserpageobj.select value from EReport drop down list
    adminuserpageobj.select value from UserProfile drop down from list add email report membership page
    adminuserpageobj.click on save button under add email report membership page
    adminuserpageobj.verify Email Reports table updated with new email report membership
    adminuserpageobj.Click Save Button

verify able to remove email report membership from MEMBERSHIP tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click on MEMBERSHIP
    adminuserpageobj.verify MEMBERSHIP tab is loaded
    adminuserpageobj.click on Add Email Reports under Membership
    adminuserpageobj.verify email report membership page
    adminuserpageobj.select value from EReport drop down list
    adminuserpageobj.select value from UserProfile drop down from list add email report membership page
    adminuserpageobj.click on save button under add email report membership page
    adminuserpageobj.verify Email Reports table updated with new email report membership
    adminuserpageobj.Remove Email Reports Membership from Email Reports table
    adminuserpageobj.Click Save Button


verify able to click on ADD Decision Modules button under MEMBERSHIP tab and verify Add Decision Module Membership page

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on MEMBERSHIP
    adminuserpageobj.verify MEMBERSHIP tab is loaded
    adminuserpageobj.click on Add Decision Modules under Membership
    adminuserpageobj.verify Add Decision Module Membership page
    adminuserpageobj.click on back to naviagte to Membership tab
    adminuserpageobj.click Users link in top-breadcrumbs

verify able to Add Decision Module Membership from MEMBERSHIP tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click on MEMBERSHIP
    adminuserpageobj.verify MEMBERSHIP tab is loaded
    adminuserpageobj.click on Add Decision Modules under Membership
    adminuserpageobj.verify Add Decision Module Membership page
    adminuserpageobj.select value from Decision Modules drop down list under Add Decision Module Membership page
    adminuserpageobj.select value from UserProfile drop down list under Add Decision Module Membership page
    adminuserpageobj.click on save button under Add Decision Module Membership
    adminuserpageobj.verify Decision Modules table updated with new Decision Module Membership
    adminuserpageobj.Click Save Button

verify able to remove Decision Module Membership from MEMBERSHIP tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click on MEMBERSHIP
    adminuserpageobj.verify MEMBERSHIP tab is loaded
    adminuserpageobj.click on Add Decision Modules under Membership
    adminuserpageobj.verify Add Decision Module Membership page
    adminuserpageobj.select value from Decision Modules drop down list under Add Decision Module Membership page
    adminuserpageobj.select value from UserProfile drop down list under Add Decision Module Membership page
    adminuserpageobj.click on save button under Add Decision Module Membership
    adminuserpageobj.verify Decision Modules table updated with new Decision Module Membership
    adminuserpageobj.Remove Decision Module Membership from Decision Modules table
    adminuserpageobj.Click Save Button

verify able to click on ADD Smart Alerts button under MEMBERSHIP tab and verify Add Smart Alert Memberships page

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on MEMBERSHIP
    adminuserpageobj.verify MEMBERSHIP tab is loaded
    adminuserpageobj.click on Add Smart Alerts under Membership
    adminuserpageobj.verify Add Smart Alert Memberships page
    adminuserpageobj.click on back to naviagte to Membership tab
    adminuserpageobj.click Users link in top-breadcrumbs

verify able to Add Smart Alerts Membership from MEMBERSHIP tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click on MEMBERSHIP
    adminuserpageobj.verify MEMBERSHIP tab is loaded
    adminuserpageobj.click on Add Smart Alerts under Membership
    adminuserpageobj.verify Add Smart Alert Memberships page
    adminuserpageobj.select value from Decision Modules drop down list under Add Smart Alert Membership page
    adminuserpageobj.select value from UserProfile drop down list under Add Smart Alert Membership page
    adminuserpageobj.click on save button under Add Smart Alert Membership page
    adminuserpageobj.verify Smart Alert table updated with new Smart Alert Membership Membership
    adminuserpageobj.Click Save Button

verify able to remove Smart Alerts Membership from MEMBERSHIP tab

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.Click Save and continue editing Button
    adminuserpageobj.click on MEMBERSHIP
    adminuserpageobj.verify MEMBERSHIP tab is loaded
    adminuserpageobj.click on Add Smart Alerts under Membership
    adminuserpageobj.verify Add Smart Alert Memberships page
    adminuserpageobj.select value from Decision Modules drop down list under Add Smart Alert Membership page
    adminuserpageobj.select value from UserProfile drop down list under Add Smart Alert Membership page
    adminuserpageobj.click on save button under Add Smart Alert Membership page
    adminuserpageobj.verify Smart Alert table updated with new Smart Alert Membership Membership
    adminuserpageobj.Remove Smart Alert Membership from Smart Alert table
    adminuserpageobj.Click Save Button

verify able to create new user

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.verify user added message after clicking Save and continue editing
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.select value from PrimaryHospital list
    adminuserpageobj.select value from WorkArea list
    adminuserpageobj.select value from PrimaryWorkarea list
    adminuserpageobj.select value from Groups list under Hospital/WorkArea
    adminuserpageobj.Click Save Button
    adminuserpageobj.verify save changed message
    adminuserpageobj.search newly created user and verify
    adminuserpageobj.verify row1 Active icon-tick
    adminuserpageobj.verify row1 STAFF STATUS icon-cross
    adminuserpageobj.verify row1 SUPERUSER STATUS icon-cross
    adminuserpageobj.click on Show all link

verify able to create new user Staff

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.verify user added message after clicking Save and continue editing
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.select value from PrimaryHospital list
    adminuserpageobj.select value from WorkArea list
    adminuserpageobj.select value from PrimaryWorkarea list
    adminuserpageobj.select value from Groups list under Hospital/WorkArea
    adminuserpageobj.click on PERMISSIONS
    adminuserpageobj.verify Staff status checkbox Not Be Selected/unchecked
    adminuserpageobj.Select Staff status Checkbox
    adminuserpageobj.verify Staff status checkbox selected/checked
    adminuserpageobj.Click Save Button
    adminuserpageobj.verify save changed message
    adminuserpageobj.search newly created user and verify
    adminuserpageobj.verify row1 Active icon-tick
    adminuserpageobj.verify row1 STAFF STATUS icon-tick
    adminuserpageobj.verify row1 SUPERUSER STATUS icon-cross
    adminuserpageobj.click on Show all link

verify able to create new Superuser user

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.verify user added message after clicking Save and continue editing
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.select value from PrimaryHospital list
    adminuserpageobj.select value from WorkArea list
    adminuserpageobj.select value from PrimaryWorkarea list
    adminuserpageobj.select value from Groups list under Hospital/WorkArea
    adminuserpageobj.click on PERMISSIONS
    adminuserpageobj.verify Superuser status checkbox Not Be Selected/unchecked
    adminuserpageobj.Select Superuser status Checkbox
    adminuserpageobj.verify Superuser status checkbox selected/checked
    adminuserpageobj.Click Save Button
    adminuserpageobj.verify save changed message
    adminuserpageobj.search newly created user and verify
    adminuserpageobj.verify row1 Active icon-tick
    adminuserpageobj.verify row1 STAFF STATUS icon-cross
    adminuserpageobj.verify row1 SUPERUSER STATUS icon-tick
    adminuserpageobj.click on Show all link

verify able to create new user by selecting staff & Superuser user permission

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save and continue editing Button
    adminuserpageobj.verify user added message after clicking Save and continue editing
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.select value from PrimaryHospital list
    adminuserpageobj.select value from WorkArea list
    adminuserpageobj.select value from PrimaryWorkarea list
    adminuserpageobj.select value from Groups list under Hospital/WorkArea
    adminuserpageobj.click on PERMISSIONS
    adminuserpageobj.verify Staff status checkbox Not Be Selected/unchecked
    adminuserpageobj.Select Staff status Checkbox
    adminuserpageobj.verify Staff status checkbox selected/checked
    adminuserpageobj.verify Superuser status checkbox Not Be Selected/unchecked
    adminuserpageobj.Select Superuser status Checkbox
    adminuserpageobj.verify Superuser status checkbox selected/checked
    adminuserpageobj.Click Save Button
    adminuserpageobj.verify save changed message
    adminuserpageobj.search newly created user and verify
    adminuserpageobj.verify row1 Active icon-tick
    adminuserpageobj.verify row1 STAFF STATUS icon-tick
    adminuserpageobj.verify row1 SUPERUSER STATUS icon-tick
    adminuserpageobj.click on Show all link

verify able to user should able to edit USER and modify and save

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save Button
    adminuserpageobj.verify user added message after clicking Save and continue editing
    adminuserpageobj.click Users link in top-breadcrumbs
    adminuserpageobj.Enter in search box
    adminuserpageobj.click on search button
    adminuserpageobj.verify search result page
    adminuserpageobj.Click on username to edit
    adminuserpageobj.click on HOSPITAL/WORKAREA
    adminuserpageobj.select value from HOSPITAL multiselectlist
    adminuserpageobj.select value from PrimaryHospital list
    adminuserpageobj.select value from WorkArea list
    adminuserpageobj.select value from WorkArea list
    adminuserpageobj.select value from PrimaryWorkarea list
    adminuserpageobj.select value from Groups list under Hospital/WorkArea
    adminuserpageobj.Click Save Button

simple user search

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save Button
    adminuserpageobj.click Users link in top-breadcrumbs
    adminuserpageobj.get the total number of users present
    adminuserpageobj.Enter existing username in search text box
    adminuserpageobj.click on search button
    adminuserpageobj.verify number of users in search result should be less than total user present
    adminuserpageobj.verify search result page existing user

verify user search using by selecting active list

    adminuserpageobj.get the total number of users present
    adminuserpageobj.select value from active list  Yes
    adminuserpageobj.verify active=yes user filter result
    adminuserpageobj.verify number of users in search result should be less than total user present
    adminuserpageobj.click on Show all link
    adminuserpageobj.get the total number of users present
    adminuserpageobj.select value from active list  No
    adminuserpageobj.verify active=No user filter result
    adminuserpageobj.verify number of users in search result should be less than total user present
    adminuserpageobj.click on Show all link

verify user search by selecting value from staff drop down list

    adminuserpageobj.get the total number of users present
    adminuserpageobj.select value from staff status list  Yes
    adminuserpageobj.verify staffstatus=yes user filter result
    adminuserpageobj.verify number of users in search result should be less than total user present
    adminuserpageobj.click on Show all link
    adminuserpageobj.get the total number of users present
    adminuserpageobj.select value from staff status list  No
    adminuserpageobj.verify staffstatus=No user filter result
    adminuserpageobj.verify number of users in search result should be less than total user present
    adminuserpageobj.click on Show all link

verify user search by selecting value from superuser drop down list

    adminuserpageobj.get the total number of users present
    adminuserpageobj.select value from superuser status list  Yes
    adminuserpageobj.verify superuserstatus=yes user filter result
    adminuserpageobj.verify number of users in search result should be less than total user present
    adminuserpageobj.click on Show all link
    adminuserpageobj.get the total number of users present
    adminuserpageobj.select value from superuser status list  No
    adminuserpageobj.verify superuserstatus=No user filter result
    adminuserpageobj.verify number of users in search result should be less than total user present
    adminuserpageobj.click on Show all link

verify user search by selecting value from groups drop down list

    adminuserpageobj.get the total number of users present
    adminuserpageobj.select value from groups status list  Local Staff
    adminuserpageobj.click on search button
    adminuserpageobj.verify number of users in search result should be less than total user present
    adminuserpageobj.click on Show all link

verify user search by selecting value from By hospital drop down list

    adminuserpageobj.get the total number of users present
    adminuserpageobj.select value from By hospital list  Hospital A
    adminuserpageobj.click on search button
    adminuserpageobj.verify number of users in search result should be less than total user present
    adminuserpageobj.click on Show all link


verify able to do user reset by clicking link try to reset filters

    adminuserpageobj.Enter user name in search text box gives 0 metrics result
    adminuserpageobj.click on search button
    adminuserpageobj.verify 0 user search result

verify user should be able to navigate to history page

    adminuserpageobj.Navigate to Add user page fill up the General tab and Click Save Button
    adminuserpageobj.Verify user added message after clicking on save button
    adminuserpageobj.click Users link in top-breadcrumbs
    adminuserpageobj.Enter in search box
    adminuserpageobj.click on search button
    adminuserpageobj.verify search result page
    adminuserpageobj.Click on username to edit
    adminuserpageobj.verify users edit page
    adminuserpageobj.click on History button
    adminuserpageobj.verify user History page
    adminuserpageobj.click Users link in top-breadcrumbs

