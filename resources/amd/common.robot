*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Library          OperatingSystem
Library          String


*** Variables ***

${BROWSER}             firefox
${USERNAME}            autostaffuser
${PASSWORD}            autostaffuser123
${EMAIL}               balaji.anantharam@analyticsmd.com
${TYPE}                http
${LOGIN_COOL_DOWN_TIME}  32m
${HOSTNAME}            127.0.0.1
${USERNAME1}           testauto1
${PASSWORD1}           testauto123

${URL}                 http://127.0.0.1:8000/login
${PORT}                8000
${SERVER}              ${TYPE}://${HOSTNAME}:${PORT}/

##################
#Database details
#####################

${DBHost}   127.0.0.1
${DBName}   analyticsMD
${DBPass}
${DBPort}   3306
${DBUser}   root

#######################
###Dashboards
#######################
${DASH_USERNAME}  mudit
${DASH_PASSWORD}  mudit

${IDR_USERNAME}  testuser2
${IDR_PASSWORD}  test*123

${RTAL_USERNAME}  rtal
${RTAL_PASSWORD}  rtal

#${DASH_USERNAME}  pooja
#${DASH_PASSWORD}  since1987

*** Keywords ***



Begin Test

    Open Browser  about:blank   ${BROWSER}
    Maximize Browser Window
    delete all cookies

End Test

     close browser

