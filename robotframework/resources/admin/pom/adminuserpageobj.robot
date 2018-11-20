*** Settings ***
Library         SeleniumLibrary
Library         robot.libraries.String

#Resource        ../admincommon.robot
#Resource        ../uservariable.robot
#Resource       /pom/signinobj.robot
Resource        ../../admin/admincommon.robot
Resource        ../pom/../uservariable.robot


*** Keywords ***

verify Users page loaded

    page should contain  Add user
    page should contain  Users
    title should be  Select user to change | QVENTUS
    page should contain button  Search
    page should contain button  css=.button

Click Add user Button

    Run Keyword And Ignore Error  Confirm Action
    wait until page contains element  css=.addlink  2s
    click element  css=.addlink

Enter in search box

    Run Keyword And Ignore Error  Confirm Action
    input text  name=q   ${NEWUSERNAME}
    log   ${NEWUSERNAME}

Enter existing username in search text box

    #[Arguments]      ${q}
    input text  name=q   ${SEARCH_USER_NAME}
    log  ${SEARCH_USER_NAME}

Enter user name in search text box gives 0 metrics result

    #[Arguments]      ${q}
    input text  name=q   IAMNOTPRESENT
    log  IAMNOTPRESENT

verify 0 user search result

    #sleep  5s
    wait until page contains  0 results (  5s
    #page should contain link  try to reset filters
    click link  css=.small.quiet>a

click on search button

    click button  xpath=//input[@type='submit']

verify search result page

    #page should contain link  Show all
    page should contain link  css=.small.quiet>a
    page should contain link  ${NEWUSERNAME}
    page should contain link  ${NEWUSERNAME}'s profile

verify search result page existing user

    page should contain link  css=.small.quiet>a
    page should contain link  ${SEARCH_USER_NAME}
    page should contain link  ${SEARCH_USER_NAME}'s profile

Click on username to edit

    click link  ${NEWUSERNAME}

verify users edit page

    title should be  Change user | QVENTUS
    page should contain link  History
    page should contain  General
    page should contain  Hospital/WorkArea
    page should contain  Permissions
    page should contain  Contacts
    page should contain  Identity
    page should contain  Activity
    page should contain  Membership

click on History button

    click link  History

verify user History page

     title should be  Change history: ${NEWUSERNAME} | QVENTUS
     page should contain  History
     page should contain  Date/time
     page should contain  User
     page should contain  Action

verify row1 Active icon-tick

   wait until page contains element  xpath=//tr[@class='row1']/td[@class='field-is_active']/span[@class='icon-tick']  3s
   page should contain element  xpath=//tr[@class='row1']/td[@class='field-is_active']/span[@class='icon-tick']
   page should contain element  xpath=(//td[@class='field-is_active']/span[@class='icon-tick'])[1]
   page should contain image  xpath=(//td[@class='field-is_active']/img[@alt='True'])[1]

verify row1 Active icon-cross

   wait until page contains element  xpath=(//td[@class='field-is_active']/span[@class='icon-cross'])[1]  3s
   page should contain element  xpath=(//td[@class='field-is_active']/span[@class='icon-cross'])[1]
   page should contain image  xpath=(//td[@class='field-is_active']/img[@alt='False'])[1]

verify row1 STAFF STATUS icon-tick

   wait until page contains element  xpath=(//td[@class='field-is_staff']/span[@class='icon-tick'])[1]  3s
   page should contain element  xpath=(//td[@class='field-is_staff']/span[@class='icon-tick'])[1]
   page should contain image  xpath=(//td[@class='field-is_staff']/img[@alt='True'])[1]

verify row1 STAFF STATUS icon-cross

   wait until page contains element  xpath=(//td[@class='field-is_staff']/span[@class='icon-cross'])[1]  3s
   page should contain element  xpath=(//td[@class='field-is_staff']/span[@class='icon-cross'])[1]
   page should contain image  xpath=(//td[@class='field-is_staff']/img[@alt='False'])[1]

verify row1 SUPERUSER STATUS icon-tick

   wait until page contains element  xpath=(//td[@class='field-is_superuser']/span[@class='icon-tick'])[1]  3s
   page should contain element  xpath=(//td[@class='field-is_superuser']/span[@class='icon-tick'])[1]
   page should contain image  xpath=(//td[@class='field-is_superuser']/img[@alt='True'])[1]

verify row1 SUPERUSER STATUS icon-cross

   wait until page contains element  xpath=(//td[@class='field-is_superuser']/span[@class='icon-cross'])[1]  3s
   page should contain element  xpath=(//td[@class='field-is_superuser']/span[@class='icon-cross'])[1]
   page should contain image  xpath=(//td[@class='field-is_superuser']/img[@alt='False'])[1]

verify active=yes user filter result

   wait until page contains element  xpath=//td[@class="field-is_active"]/span[@class='icon-tick']  3s
   page should contain element  xpath=//td[@class="field-is_active"]/span[@class='icon-tick']
   page should not contain element  xpath=//td[@class="field-is_active"]/span[@class='icon-cross']

verify active=No user filter result

   wait until page contains element  xpath=//td[@class="field-is_active"]/span[@class="icon-cross"]  3s
   page should contain element  xpath=//td[@class="field-is_active"]/span[@class="icon-cross"]
   page should not contain element  xpath=//td[@class="field-is_active"]/span[@class="icon-tick"]

verify staffstatus=yes user filter result

   wait until page contains element  xpath=//td[@class="field-is_staff"]/span[@class="icon-tick"]  3s
   page should contain element  xpath=//td[@class="field-is_staff"]/span[@class="icon-tick"]
   page should not contain element  xpath=//td[@class="field-is_staff"]/span[@class="icon-cross"]


verify staffstatus=No user filter result

   wait until page contains element  xpath=//td[@class="field-is_staff"]/span[@class="icon-cross"]  3s
   page should contain element  xpath=//td[@class="field-is_staff"]/span[@class="icon-cross"]
   page should not contain element  xpath=//td[@class="field-is_staff"]/span[@class="icon-tick"]

verify superuserstatus=yes user filter result

   wait until page contains element  xpath=//td[@class="field-is_superuser"]/span[@class="icon-tick"]  3s
   page should contain element  xpath=//td[@class="field-is_superuser"]/span[@class="icon-tick"]
   page should not contain element  xpath=//td[@class="field-is_superuser"]/span[@class="icon-cross"]

verify superuserstatus=No user filter result

   wait until page contains element  xpath=//td[@class="field-is_superuser"]/span[@class="icon-cross"]  3s
   page should contain element  xpath=//td[@class="field-is_superuser"]/span[@class="icon-cross"]
   page should not contain element  xpath=//td[@class="field-is_superuser"]/span[@class="icon-tick"]

verify the search result

    log  verify search result
    ${user_name_temp1}    Get Text    xpath=//tr[@class='row1']/th/a
    Should Be Equal As Strings    ${user_name_temp1}    ${NEWUSERNAME}
    page should contain link  ${NEWUSERNAME}

verify autotest user data present if yes cleanup NEWUSER

    #[Arguments]      ${q}
    input text  name=q   ${NEWUSERNAME}
    log  ${NEWUSERNAME}
    click on search button
    ${status}=  run keyword and return status  page should not contain link  ${NEWUSERNAME}
    log  ${status}
    run keyword if  ${status} ==True  click on try to reset filters link in Users page
    run keyword unless  ${status} ==True  delete the automation test user

delete the automation test user

    adminuserpageobj.verify the search result
    adminuserpageobj.Select row1 Checkbox
    adminuserpageobj.select value Delete User(s) tabular action drop down list
    adminuserpageobj.click Go button
    adminuserpageobj.verify delete user confirm message
    adminuserpageobj.click on delete user button present in Delete users confirmation page
    adminuserpageobj.click on try to reset filters link in Users page

search newly created user and verify

    #[Arguments]      ${q}
    input text  name=q   ${NEWUSERNAME}
    log  ${NEWUSERNAME}
    click on search button
    page should contain link  ${NEWUSERNAME}
    page should contain  ${FIRST_NAME}
    page should contain  ${LAST_NAME}
    page should contain  ${NEW_USER_EMAIL}
    page should contain link  ${NEWUSERNAME}'s profile

click on Show all link

    #click link  Show all
    sleep  2s
    click link  css=.small.quiet>a

click on try to reset filters link in Users page

    #click link  try to reset filters
    click link  css=.small.quiet>a

Select row1 Checkbox

    ##click element  xpath=//tr[@class='row1']/td/label
    click element  css=.action-checkbox>label

select value Delete User(s) tabular action drop down list

    click element  css=div[class='actions initialized'] .select2-selection__rendered
    click element  xpath=//li[text()='Delete User(s)']

click Go button

    click element  css=.button
    #click element  xpath=//button[@type='submit']

click Active to apply sorting

    click link  Active

verify delete user confirm message

    title should be  Delete users confirmation
    page should contain  Are you sure you want to delete these users?
    page should contain button  name=delete
    page should contain button  name=cancel

click on delete user button present in Delete users confirmation page

    click button  name=delete
    sleep  2s

verify successfully deleted message

select value from active list

    [Arguments]      ${ACTIVE_VALUE}
    click element  xpath=//span[normalize-space(text())='By active']
    click element  xpath=//li[text()='${ACTIVE_VALUE}']
    #Select From List By Label  xpath=(//select[@class='changelist-filter-select select2-hidden-accessible'])[1]  ${ACTIVE_VALUE}

select value from staff status list

    [Arguments]      ${STAFF_VALUE}
    click element  xpath=//span[normalize-space(text())='By staff status']
    click element  xpath=//li[text()='${STAFF_VALUE}']
    #Select From List By Label  xpath=(//select[@class='changelist-filter-select select2-hidden-accessible'])[2]  ${STAFF_VALUE}

select value from superuser status list

    [Arguments]      ${SUPER_VALUE}

    click element  xpath=//span[normalize-space(text())='By superuser status']
    click element  xpath=//li[text()='${SUPER_VALUE}']
    #Select From List By Label  xpath=(//select[@class='changelist-filter-select select2-hidden-accessible'])[3]  ${super_VALUE}

select value from groups status list

    [Arguments]      ${GROUP_VALUE}

    click element  xpath=//span[normalize-space(text())='By groups']
    click element  xpath=//li[text()='${GROUP_VALUE}']
    #Select From List By Label  xpath=(//select[@class='changelist-filter-select select2-hidden-accessible'])[4]  ${GROUP_VALUE}

get the total number of users present

    ${Total_user_count} =    Get text   css=.label
    log  ${Total_user_count}
    ${Total_user_count}  remove string  ${Total_user_count}  users   Show all  user
    ${Total_user_count}  Strip String  ${Total_user_count}
    log  ${Total_user_count}
    Set Suite Variable  ${Total_user_count}

select value from By hospital list

    [Arguments]      ${BY_HOSPITAL}

    click element  css=span[title=' By hospital ']
    click element  css=.select2-search__field
    input text  css=.select2-search__field   ${BY_HOSPITAL}
    #click element  xpath=//li[text()='${BY_HOSPITAL}']
    press key   css=.select2-search__field  \\13
    sleep  2s

verify number of users in search result should be less than total user present

     wait until element is visible  css=.small.quiet  20s
     page should contain element  css=.small.quiet
     ${Search_result_user_count} =    Get text   css=.label
     log  ${Search_result_user_count}
     ${Search_result_user_count}  remove string  ${Search_result_user_count}  users   Show all  user
     log  ${Search_result_user_count}
     ${Search_result_user_count}  Strip String  ${Search_result_user_count}
     log  ${Search_result_user_count}
     log  ${Total_user_count}
     Should Be True  ${Search_result_user_count} < ${Total_user_count}


###### Add user page ##################

verify ADD USER page loaded

    page should contain  Add user
    page should contain  First, enter a username and password. Then, you'll be able to edit more user options.
    page should contain  General
    page should contain button  Save

Click Save Button

    click button   Save

verify save changed message

    page should contain  The user "${NEWUSERNAME}" was changed successfully.

Click Save and continue editing Button

   click button  _continue

verify save changed message after clicking Save and continue editing

   sleep  2s
   page should contain  The user "${NEWUSERNAME}" was changed successfully. You may edit it again below.

verify user added message after clicking Save and continue editing

   sleep  2s
   page should contain  The user "${NEWUSERNAME}" was added successfully. You may edit it again below.

############## General ###########################

input nonexistsusername

    # to avoid this this keyword is used, A user with that username already exists.
    ${tempusername} =  catenate  ${NEWUSERNAME}0908
    input text  name=username   ${tempusername}
    log  ${tempusername}

verify First name validation required field message

    element should be visible   xpath=//div[@class='form-row errors field-first_name']
    ${message} =  get text  css=div[class='form-row errors field-first_name']>ul>li
    page should contain  This field is required.
    page should contain element  css=.errornote
    #page should contain  Please correct the errors below.
    Should Be Equal   ${message}  This field is required.

verify Last name: validation required field message

    element should be visible   xpath=//div[@class='form-row errors field-last_name']
    ${message} =  get text  css=div[class='form-row errors field-last_name']>ul>li
    page should contain  This field is required.
    page should contain element  css=.errornote
    #page should contain  Please correct the errors below.
    Should Be Equal   ${message}  This field is required.

verify Email: validation required field message

    element should be visible   xpath=//div[@class='form-row errors field-email']
    ${message} =  get text  css=div[class='form-row errors field-email']>ul>li
    page should contain  This field is required.
    page should contain element  css=.errornote
    Should Be Equal   ${message}  This field is required.

verify Username: validation required field message

    Clear Element Text  name=username
    adminuserpageobj.Click Save Button
    element should be visible   xpath=//div[@class='form-row errors field-username']
    ${message} =  get text  css=div[class='form-row errors field-username']>ul>li
    page should contain  This field is required.
    page should contain element  css=.errornote
    #page should contain  Please correct the errors below.
    Should Be Equal   ${message}  This field is required.

verify Password: validation required field message

    Clear Element Text  name=password1
    adminuserpageobj.Click Save Button
    element should be visible   xpath=//div[@class='form-row errors field-password1']
    ${message} =  get text  css=div[class='form-row errors field-password1']>ul>li
    #element should be visible   xpath=(//ul[@class='errorlist'])[4]
    page should contain  This field is required.
    page should contain element  css=.errornote
    #page should contain  Please correct the errors below.
    Should Be Equal   ${message}  This field is required.

verify Passwordconfirmation: validation required field message

    Clear Element Text  name=password2
    adminuserpageobj.Click Save Button
    element should be visible   xpath=//div[@class='form-row errors field-password2']
    ${message} =  get text  css=div[class='form-row errors field-password2']>ul>li
    #element should be visible   xpath=(//ul[@class='errorlist'])[4]
    page should contain  This field is required.
    page should contain element  css=.errornote
    #page should contain  Please correct the errors below.
    Should Be Equal   ${message}  This field is required.

verify username field help text

     page should contain element   xpath=//p[text()='Required. 30 characters or fewer. Letters, digits and @/./+/-/_ only.']
     page should contain element   xpath=(//p[@class='help'])[1]
     page should contain   Required. 30 characters or fewer. Letters, digits and @/./+/-/_ only.


verify Password confirmation: field help text

     page should contain element  xpath=//p[text()='Enter the same password as above, for verification.']
     page should contain element   xpath=(//p[@class='help'])[2]
     page should contain   Enter the same password as above, for verification.


Enter First name

    input text  name=first_name   ${FIRST_NAME}
    log   ${FIRST_NAME}

Enter Last name

    input text  name=last_name   ${LAST_NAME}
    log  ${LAST_NAME}

Enter Email

    input text  name=email   ${NEW_USER_EMAIL}
    log  ${NEW_USER_EMAIL}

Enter New Username

    input text  name=username   ${NEW_USERNAME}
    log  ${NEW_USERNAME}

Enter Password

    input text  name=password1   ${PASSWORD1}
    log  ${PASSWORD1}
    input password  name=password1   ${PASSWORD1}


Enter Password confirmation

    input text  name=password2   ${PASSWORD1}
    log  ${PASSWORD1}
    input password  name=password2   ${PASSWORD1}


Verify user added message after clicking on save button

    page should contain  The user "${NEWUSERNAME}" was added successfully. You may edit it again below.
    page should contain link  Hospital/WorkArea
    page should contain link  Permissions
    page should contain link  Contacts
    page should contain link  Identity
    page should contain link  Activity
    page should contain link  Membership

verify username already exists message

    page should contain  A user with that username already exists.


click Users link in top-breadcrumbs

    click link  Users
    Run Keyword And Ignore Error  Confirm Action

click on GENERAL link

     click link   General

click on HOSPITAL/WORKAREA

     click link   Hospital/WorkArea


click on PERMISSIONS

     click link   Permissions

click on CONTACTS

     click link  Contacts

click on IDENTITY

     click link  Identity

click on ACTIVITY

     click link  Activity

click on MEMBERSHIP

     click link  Membership

Navigate to Add user page fill up the General tab

    adminuserpageobj.Click Add user Button
    adminuserpageobj.verify ADD USER page loaded
    adminuserpageobj.Enter First name
    adminuserpageobj.Enter Last name
    adminuserpageobj.Enter New Username
    adminuserpageobj.Enter Email
    adminuserpageobj.Enter Password
    adminuserpageobj.Enter Password confirmation

Navigate to Add user page fill up the General tab and Click Save and continue editing Button

    adminuserpageobj.Navigate to Add user page fill up the General tab
    adminuserpageobj.Click Save and continue editing Button

Navigate to Add user page fill up the General tab and Click Save Button

    adminuserpageobj.Navigate to Add user page fill up the General tab
    adminuserpageobj.Click Save Button

mention with button to be clicked

   [Arguments]     ${my_value}
   run keyword if  "${my_value}" == "Save and continue editing"  adminuserpageobj.Click Save and continue editing Button
   ...  ELSE IF  "${my_value}" == "Save"  adminuserpageobj.Click Save Button

############## HOSPITAL/WORKAREA ###########################

verify page HOSPITAL/WORKAREA tab

     page should contain  Hospitals:
     page should contain element  css=div[class='form-row field-hospitals'] ul[class='select2-selection__rendered']
     page should contain  Hold down "Control", or "Command" on a Mac, to select more than one.
     #page should contain element  css=a[id='add_id_userprofile-0-hospitals']>span
     page should contain element  css=a[id='add_id_userprofile_set-0-hospitals']>span
     #add-another
     page should contain  PrimaryHospital:
     #page should contain element  css=#select2-id_userprofile-0-primaryHospital-container
     page should contain element  css=#select2-id_userprofile_set-0-primaryHospital-container
     #add-another
     page should contain element  css=a[id='add_id_userprofile_set-0-primaryHospital']>span

     page should contain  WorkArea:
     page should contain element  css=div[class='form-row field-workArea'] ul[class='select2-selection__rendered']
     page should contain  Hold down "Control", or "Command" on a Mac, to select more than one.
     #add-another
     page should contain element  css=a[id='add_id_userprofile_set-0-hospitals']>span

     page should contain  PrimaryWorkarea:
     page should contain element  css=#select2-id_userprofile_set-0-primaryWorkarea-container
     #page should contain element  css=div[class='form-row field-primaryWorkarea'] span[id='select2-id_userprofile-0-primaryWorkarea-container']
     #page should contain element  css=span[id='select2-id_userprofile-0-primaryWorkarea-container']
     #add-another
     page should contain element  css=a[id='add_id_userprofile_set-0-primaryWorkarea']>span

     page should contain  Groups:
     #page should contain element  xpath=//div[@class='form-row field-groups']/div//ul[@ class="select2-selection__rendered"]
     page should contain element  css=div[class='form-row field-groups'] ul[class='select2-selection__rendered']
     page should contain element  css=a[id='add_id_groups']>span
     page should contain  A user will get all permissions granted to each of their groups
     #page should contain  The groups this user belongs to. A user will get all permissions granted to each of his/her group. Hold down "Control", or "Command" on a Mac, to select more than one.


click on HOSPITAL multiselectlist

     click element  css=div[class='form-row field-hospitals'] ul[class='select2-selection__rendered']

select value from HOSPITAL multiselectlist

    click element  css=div[class='form-row field-hospitals'] ul[class='select2-selection__rendered']
    sleep  2s
    click element  xpath=//li[text()='${HOSPITALS}']

click on PrimaryHospital list

     click element  css=#select2-id_userprofile_set-0-primaryHospital-container

select value from PrimaryHospital list

     click element  css=#select2-id_userprofile_set-0-primaryHospital-container
     click element  xpath=//li[text()='${PRIMARYHOSPITAL}']

select value from WorkArea list

     click element  css=div[class='form-row field-workArea'] ul[class='select2-selection__rendered']
     click element  xpath=//li[text()='${WORKAREA}']

click on PrimaryWorkarea list

     click element  css=#select2-id_userprofile_set-0-primaryWorkarea-container

select value from PrimaryWorkarea list

     click element  css=#select2-id_userprofile_set-0-primaryWorkarea-container
     input text  css=span[class='select2-search select2-search--dropdown']>input  ${PRIMARYWORKAREA}
     press key   css=span[class='select2-search select2-search--dropdown']>input  \\13
     #click element  xpath=//option[text()='${PRIMARYWORKAREA}']

select value from Groups list under Hospital/WorkArea

     click element  css=div[class='form-row field-groups'] ul[class='select2-selection__rendered']
     click element  xpath=//li[text()='${GROUPS}']

verify hospitals field validation and required field message

    element should be visible   css=.errorlist>li
    page should contain element  css=div[class='form-row errors field-hospitals']>.errorlist>li
    page should contain  Please select Hospital

verify Department field validation and required field message

    element should be visible   xpath=//div[@class='form-row errors field-department']/ul
    ${dep_val} =  get text  xpath=//div[@class='form-row errors field-department']/ul
    page should contain  This field is required.
    #page should contain  Please correct the errors below.
    Should Be Equal   ${dep_val}  This field is required.

############## Permissions ###########################

verify page Permissions tab

     page should contain  Active
     page should contain  Designates whether this user should be treated as active. Unselect this instead of deleting accounts.
     page should contain checkbox  name=is_active

     page should contain  Staff status
     page should contain  Designates whether the user can log into this admin site.
     page should contain checkbox  name=is_staff

     page should contain  Superuser status
     page should contain  Designates that this user has all permissions without explicitly assigning them.
     page should contain checkbox  name=is_superuser

     page should contain  User permissions:
     page should contain  Specific permissions for this user. Hold down "Control", or "Command" on a Mac, to select more than one.
     page should contain element  xpath=//select[@ id='id_user_permissions']

     page should contain  Permission Level:
     page should contain  0 to 5. Lower means more permissions.
     page should contain element  id=id_userprofile_set-0-level

verify help text in Permissions tab

     page should contain  Designates whether this user should be treated as active. Unselect this instead of deleting accounts.
     page should contain  Designates whether the user can log into this admin site.
     page should contain  Designates that this user has all permissions without explicitly assigning them.
     page should contain  Specific permissions for this user. Hold down "Control", or "Command" on a Mac, to select more than one.

Select Active Checkbox

      #Select Checkbox  xpath=//label[text()='Active']
      select checkbox  name=is_active
      click element  xpath=//label[text()='Active']


verify Active checkbox selected/checked

     sleep  2s
     checkbox should be selected   is_active

UnSelect Active Checkbox

     click element  xpath=//label[text()='Active']
      #Unselect Checkbox  name=is_active


verify Active checkbox Not Be Selected/unchecked

      #Checkbox Should Not Be Selected   xpath=//label[text()='Active']
      checkbox should not be selected   id_is_active


Select Staff status Checkbox

      click element  xpath=//label[@for='id_is_staff']
      #checkbox should not be selected  name=is_staff
      #select checkbox  id=id_is_staff

verify Staff status checkbox selected/checked

     #Checkbox Should Be Selected   xpath=//label[text()='Staff status']
      checkbox should be selected   id_is_staff

Unselect Staff status Checkbox

     click element  xpath=//label[@for='id_is_staff']
     #unselect checkbox  id_is_staff

verify Staff status checkbox Not Be Selected/unchecked

      #Checkbox Should Not Be Selected   xpath=//label[text()='Staff status']
      checkbox should not be selected   id_is_staff


Select Superuser status Checkbox

      click element  xpath=//label[text()='Superuser status']
      #select checkbox  id_is_superuser

verify Superuser status checkbox selected/checked

     #Checkbox Should Be Selected   xpath=//label[text()='Superuser status']
     checkbox should be selected   id_is_superuser

Unselect Superuser status Checkbox

     click element  xpath=//label[text()='Superuser status']
     #unselect checkbox  id_is_superuser

verify Superuser status checkbox Not Be Selected/unchecked

      #Checkbox Should Not Be Selected   xpath=//label[text()='Superuser status']
      checkbox should not be selected   id_is_superuser


click on User permissions list

   click element  xpath=(//ul[@class='select2-selection__rendered'])[2]


select value from User permissions list

     #click element  xpath=//li[text()='${USERPERMISSION}']
     Select From List By Label  xpath=//select[@id='id_user_permissions']  ${USERPERMISSION}
     #${USERPERMISSION}


Enter Permission Level

    input text  css=#id_userprofile_set-0-level   ${PERMISSION_LEVEL}
    log  ${PERMISSION_LEVEL}

clear Permission level field content

     Clear Element Text  css=#id_userprofile_set-0-level

verify Permission level field validation and required field message

    element should be visible   xpath=//div[@class='form-row errors field-level']/ul
    ${per_val} =  get text  xpath=//div[@class='form-row errors field-level']/ul
    page should contain  This field is required.
    Should Be Equal   ${per_val}  This field is required.


click on Groups list

   click element  xpath=(//ul[@class='select2-selection__rendered'])[3]

#TODO
select value from Groups list

   click element  xpath=//li[text()='${GROUPS}']
   #${GROUPS}


##############  Contacts ###########################

verify page Contacts tab

   page should contain  Phone:
   page should contain element  name=userprofile_set-0-phone
   page should contain  Fax:
   page should contain element  name=userprofile_set-0-fax
   page should contain  VoceraId:
   page should contain element  name=userprofile_set-0-voceraId
   page should contain  Email:
   page should contain element  name=email


Enter USER Phone number

    input text  name=userprofile_set-0-phone   ${PHONE}
    log  ${PHONE}


Enter USER Fax number

    input text  name=userprofile_set-0-fax   ${FAX}
    log  ${FAX}

Enter USER VoceraId number

    input text  name=userprofile_set-0-voceraId   ${VOCERID}
    log  ${VOCERID}

Enter USER EMAIL address

    input text  name=email   ${NEW_USER_EMAIL}
    log  ${NEW_USER_EMAIL}


##############  Identity ###########################

verify Identity tab is loaded

     page should contain  Current Identities
     page should contain  Table
     page should contain  Column
     page should contain  Values
     page should contain  Add New Identity
     page should contain  Select Important Column:
     page should contain  No data available in table
     page should contain element  xpath=//span[@class='select2-selection select2-selection--single']
     page should contain button   id=btnSearch

select value from Select Important Column: drop down list

     sleep  2s
     Select From List    impColumnSelect    ${SELECT_IMPORTANT_COLUMN}

click on Select Important Column search button

    click button  Search
    sleep  2s

click on Add link

    Wait Until Page Contains   Add
    click link  Add
    sleep  2s
    page should not contain  No data available in table

verify Current Identities table row has remove link

    page should contain link  Edit

################## MEMBERSHIP ###############3

verify MEMBERSHIP tab is loaded

     page should contain  Dashboards
     page should contain  Email Reports
     page should contain  Decision Modules
     page should contain  Smart Alerts

     #Dashboards
     page should contain button  css=div[class='pull-right']>a>input

     #Email Reports
     page should contain button  css=a[href='/atc/emailreport/emailreportmembership/add/?_to_field=id&_popup=1']>input

     #Decision Modules
     page should contain button  css=a[href='/atc/decision/plannedactionmembership/add/?_to_field=id&_popup=1']>input

     #Smart Alerts
     page should contain button  css=a[href='/atc/smartalert/intalertmembership/add/?_to_field=id&_popup=1']>input


### Add Dashboard Membership ###

click on Add Dashboards under Membership

    click button  css=div[class='pull-right']>a>input

verify Add Dashboard Membership page

    page should contain element  css=.related-popup-back-label
    wait until element is visible  css=div[class='related-popup']>iframe  20s
    page should contain  Dashboard:
    page should contain  Type:
    page should contain  UserProfile:
    page should contain  Group:
    page should contain button  css=.default

select value from dashboard drop down list

    select frame  css=div[class='related-popup']>iframe
    click element  css=div[class='form-row field-view']>div>div>span>span>span
    click element  css=.select2-search__field
    input text  css=.select2-search__field   ${DASHBOARD_MEMERSHIPS}
    sleep  2s
    press key   css=.select2-search__field  \\13
    unselect frame

select value from type drop down list

    select frame  css=div[class='related-popup']>iframe
    click element  css=#select2-id_type-container
    click element  css=.select2-search__field
    input text  css=.select2-search__field   user
    press key   css=.select2-search__field  \\13
    unselect frame

select value from UserProfile drop down list

    select frame  css=div[class='related-popup']>iframe
    click element  css=#select2-id_userProfile-container
    click element  css=.select2-search__field
    input text  css=.select2-search__field   ${NEWUSERNAME}
    press key   css=.select2-search__field  \\13
    unselect frame

click on save button under Add Dashboard Membership

    select frame  css=div[class='related-popup']>iframe
    click element  css=.default
    unselect frame

verify Dashboards table updated with new dashboard membership

    wait until page contains element  css=.odd>td>a  20s
    page should contain  ${DASHBOARD_MEMERSHIPS}
    page should contain  User
    page should contain  Individual
    page should contain link  Remove

Remove Dashboards Membership from Dashboards table

    click link  Remove
    confirm action
    wait until page does not contain element  css=.odd>td>a  5s
    page should not contain  ${DASHBOARD_MEMERSHIPS}
    page should not contain  Individual
    page should not contain link  Remove

click on back to naviagte to Membership tab

    click element  css=.related-popup-back-label
    sleep  1s

########### Add email report membership###########

click on Add Email Reports under Membership

    click element  css=a[href='/atc/emailreport/emailreportmembership/add/?_to_field=id&_popup=1']>input

verify email report membership page

    page should contain element  css=.related-popup-back-label
    wait until element is visible  css=div[class='related-popup']>iframe  20s
    page should contain  OptedOut
    page should contain  EReport:
    page should contain  TemplateVarIdentity:
    page should contain  UserProfile:
    page should contain  Group:
    page should contain  ShowButtonAuth
    page should contain  Show/Hide button for app login.
    page should contain button  css=.default


select value from EReport drop down list

    select frame  css=div[class='related-popup']>iframe
    click element  css=#select2-id_eReport-container
    click element  css=.select2-search__field
    input text  css=.select2-search__field   ${EREPORT_MEMBERSHIPS}
    sleep  1s
    press key   css=.select2-search__field  \\13
    sleep  2s
    unselect frame

select value from UserProfile drop down from list add email report membership page

    select frame  css=div[class='related-popup']>iframe
    click element  css=#select2-id_userProfile-container
    click element  css=.select2-search__field
    input text  css=.select2-search__field   ${NEWUSERNAME}
    press key   css=.select2-search__field  \\13
    unselect frame

click on save button under add email report membership page

    select frame  css=div[class='related-popup']>iframe
    click element  css=.default
    unselect frame

verify Email Reports table updated with new email report membership

    wait until page contains element  css=.odd>td>a  20s
    page should contain  ${NEWUSERNAME} - ${EREPORT_MEMBERSHIPS}
    page should contain link  Remove

Remove Email Reports Membership from Email Reports table

    click link  Remove
    confirm action
    wait until page does not contain element  css=.odd>td>a  5s
    page should not contain  automationuser - ${EREPORT_MEMBERSHIPS}
    page should not contain link  Remove

################Add Decision Module Membership####

click on Add Decision Modules under Membership

    click element  css=a[href='/atc/decision/plannedactionmembership/add/?_to_field=id&_popup=1']>input

verify Add Decision Module Membership page

    page should contain element  css=.related-popup-back-label
    wait until element is visible  css=div[class='related-popup']>iframe  20s
    page should contain  Decision Module:
    page should contain  Priority:
    page should contain  UserProfile:
    page should contain  Group:
    page should contain  EmailNotif
    page should contain  FeedNotif
    page should contain  FaxNotif
    page should contain  CallNotif
    page should contain  SmsNotif
    page should contain  OptedOut
    page should contain  RelayNotif
    page should contain  AppNotif
    page should contain  VoceraNotif
    page should contain  ExternalApiNotif
    page should contain button  css=.default

select value from Decision Modules drop down list under Add Decision Module Membership page

    select frame  css=div[class='related-popup']>iframe
    click element  css=#select2-id_action-container
    click element  css=.select2-search__field
    input text  css=.select2-search__field   ${DECISION_MODULE_MEMBERSHIPS}
    sleep  2s
    #press key   css=.select2-search__field  \\13
    click element  css=ul[id='select2-id_action-results']>li
    unselect frame

select value from UserProfile drop down list under Add Decision Module Membership page

    select frame  css=div[class='related-popup']>iframe
    click element  css=#select2-id_userProfile-container
    click element  css=.select2-search__field
    input text  css=.select2-search__field   ${NEWUSERNAME}
    click element  css=ul[id='select2-id_userProfile-results']>li
    #press key   css=.select2-search__field  \\13
    unselect frame

click on save button under Add Decision Module Membership

    select frame  css=div[class='related-popup']>iframe
    click element  css=.default
    unselect frame

verify Decision Modules table updated with new Decision Module Membership

    wait until page contains element  css=.odd>td>a  20s
    page should contain  ${DECISION_MODULE_MEMBERSHIPS}
    page should contain  User
    page should contain  Individual
    page should contain link  Remove

Remove Decision Module Membership from Decision Modules table

    click link  Remove
    confirm action
    wait until page does not contain element  css=.odd>td>a  5s
    page should not contain  ${DECISION_MODULE_MEMBERSHIPS}
    page should not contain  Individual
    page should not contain link  Remove


click on Add Smart Alerts under Membership

    #sleep  1s
    click element  css=a[href='/atc/smartalert/intalertmembership/add/?_to_field=id&_popup=1']>input
    #click element  xpath=(//input[@class='btn btn-success'])[3]

verify Add Smart Alert Memberships page

    page should contain element  css=.related-popup-back-label
    wait until element is visible  css=div[class='related-popup']>iframe  20s
    page should contain  IAlerts:
    page should contain  IUserProfile:
    page should contain  Group:
    page should contain  IAlertAbove
    page should contain  IAlertBelow
    page should contain  IAlerts:
    page should contain  EmailNotif
    page should contain  FeedNotif
    page should contain  SmsNotif
    page should contain  Pivot:
    page should contain  PivotValues:
    page should contain button  css=.default
    Unselect Frame

select value from Decision Modules drop down list under Add Smart Alert Membership page

    select frame  css=div[class='related-popup']>iframe
    click element  css=div[class='form-row field-iAlerts'] span[class='select2-selection select2-selection--single']
    click element  css=.select2-search__field
    input text  css=.select2-search__field   ${SMART_IALERTS_MEMBERSHIPS}
    sleep  2s
    press key   css=.select2-search__field  \\13
    unselect frame

select value from UserProfile drop down list under Add Smart Alert Membership page

    select frame  css=div[class='related-popup']>iframe
    click element  css=#select2-id_iUserProfile-container
    click element  css=.select2-search__field
    input text  css=.select2-search__field   ${NEWUSERNAME}
    press key   css=.select2-search__field  \\13
    unselect frame

click on save button under Add Smart Alert Membership page

    select frame  css=div[class='related-popup']>iframe
    click element  css=.default
    unselect frame

verify Smart Alert table updated with new Smart Alert Membership Membership

    wait until page contains element  css=.odd>td>a  20s
    page should contain  ${SMART_IALERTS_MEMBERSHIPS}
    page should contain  User
    page should contain  Individual
    page should contain link  Remove

Remove Smart Alert Membership from Smart Alert table

    click link  Remove
    confirm action
    wait until page does not contain element  css=.odd>td>a  5s
    page should not contain  ${SMART_IALERTS_MEMBERSHIPS}
    page should not contain  Individual
    page should not contain link  Remove