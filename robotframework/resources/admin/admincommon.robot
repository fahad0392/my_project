*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Library          OperatingSystem

Resource        ../../resources/admin/adminmetrics.robot
Resource        ../admin/adminusermanagement.robot

*** Variables ***

# ADMIN scrtips varaiables
${BROWSER}             firefox
${EMAIL}               balaji.anantharam@analyticsmd.com
${ADMIN_URL}                 http://localhost:8000/atc
${ADMIN_USERNAME}            autoadmin
${ADMIN_PASSWORD}            autoadmin@123

# Non staff user
${USERNAME1}           testauto1
${PASSWORD1}           testauto123

#staffuser
${USERNAME}            autostaffuser
${PASSWORD}            autostaffuser123

*** Keywords ***




##########admin Metrics############

Start metricsuite

    Navigate to Metrics page from adminleftpane

End metricsuite

   close browser


################## ##########

Begin Test

    Open Browser  about:blank   ${BROWSER}
    Maximize Browser Window
    delete all cookies

End Test

     close browser

################User###################

Start USERsuite

    Open Browser  about:blank   ${BROWSER}
    Maximize Browser Window
    delete all cookies
    Navigate to USER page from adminleftpane

End USERsuite

   close browser