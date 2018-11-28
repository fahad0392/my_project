*** Settings ***
Library         SeleniumLibrary
Resource        ../common.robot


*** Keywords ***


Verify Profile Manager page

    wait until page contains    Profile Manager  2s
    page should contain     Account Information
    page should contain     Name
    page should contain     Username
    page should contain     Email
    page should contain     Hospitals you have access to:
    page should contain     This information is critical for us to maintain your Qventus account.  If you believe any of this information is incorrect, please e-mail us at support@qventus.com
    ##page should contain element   xpath=//*[@id='user-profile']/div[2]/ul/li[2]/a
    page should contain element  css=a[href='#user-profile-basic']
    page should contain element  css=a[href='#user-profile-password']
    page should contain element  css=a[href='#user-profile-contact']
    ##page should contain element   xpath=//*[@id='user-profile']/div[2]/ul/li[3]/a
    ##page should contain element   xpath=//*[@id='user-profile']/div[2]/ul/li[3]/a


click on user-profile-Account information

    ##click element  xpath=//*[@id='user-profile']/div[2]/ul/li[1]/a
    click element  css=css=a[href='#user-profile-basic']

click on user-profile-password

   ##click element  xpath=//*[@id='user-profile']/div[2]/ul/li[2]/a
   click element  css=a[href='#user-profile-password']
   Set Browser Implicit Wait	3 seconds


Verify Profile user-profile-password page

   page should contain  Old password
   page should contain  New Password
   page should contain  Confirm
   ##page should contain element  xpath=//*[@id='profile-changepassword']
   page should contain element  css=#profile-changepassword

click on user-profile-contact Settings

    ##click element  xpath=//*[@id='user-profile']/div[2]/ul/li[3]/a
    click element  css=a[href='#user-profile-contact']


Verify user-profile-contact Settings page

    page should contain   Medical title
    page should contain   Phone Number
    page should contain   separated by dashes (e.g. 650-111-1111)
    page should contain button   Save changes


Enter old-password
    #[Arguments]      ${username}
    input text  name=old-password   ${PASSWORD}
    log  ${PASSWORD}

Enter New Password
    #[Arguments]       ${password}
    ${NEWPASSWORD} =  set variable   ${PASSWORD}
    input text  name=password  ${NEWPASSWORD}
    log  ${NEWPASSWORD}


Enter Confirm Password
    #[Arguments]       ${password}
    ${Confirm} =  set variable   ${PASSWORD}
    input text  name=confirm-password  ${Confirm}
    log  ${Confirm}


Enter old password for all field under password tab

    input text  name=old-password   ${PASSWORD}
    log  ${PASSWORD}
    input text  name=password  ${PASSWORD}
    log  ${PASSWORD}
    input text  name=confirm-password   ${PASSWORD}
    log  ${PASSWORD}

Enter incorrect old password

    input text  name=old-password   123456@#$%


verify save changes button

   ##page should contain element   xpath=.//*[@id='profile-changepassword']
   page should contain element  css=#profile-changepassword


click save changes(profile) button

    ##click element   xpath=.//*[@id='profile-changepassword']
    click element  css=#profile-changepassword


verify New Password mandatory is required field save change

    page should contain  This field is required.

New password cannot be same as old password

    wait until element is visible  xpath=(.//span[@class='help-inline'])[1]
    #wait until element is visible  xpath=(.//*[@class='help-inline'])[1]
    wait until page contains  xpath=(.//span[@class='help-inline'])[1]
    ${my_string}  get text   xpath=(.//*[@class='help-inline'])[1]
    log  ${my_string}
    Element Text Should Be     xpath=(.//span[@class='help-inline'])[1]    New password cannot be same as old password


verify New Password saved

    page should contain  xpath=(.//*[@class='help-inline'])[1]

This field is required

Invalid Length (Must be 8 characters or more)


Password Saved!


verify contact settings saved message
    page should contain  Information Saved!