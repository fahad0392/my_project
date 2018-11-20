*** Settings ***
Library         SeleniumLibrary
Resource        ../common.robot


*** Keywords ***


Verify Profile Manager page

    wait until page contains    Contact Us
    page should contain     Let us know if we can help out -- or just say hi!
    page should contain     Subject
    page should contain     Message
    #page should contain element   xpath=//*[@id='einfo']
    page should contain element  css=#einfo

click on user-profile-Account information

    #click element  xpath=//*[@id='user-profile']/div[2]/ul/li[1]/a
    click element  css=.active>a