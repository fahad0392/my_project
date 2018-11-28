*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Library          OperatingSystem
#Resource        pom/signinobj.robot

#Resource         ../../resources/missioncontrol/amdmissioncontrol.robot
Resource         ../../resources/missioncontrol/mcEmergencyDepartment.robot
Resource         ../../resources/missioncontrol/amdinPatientmissioncontrol.robot
*** Variables ***

${BROWSER}             firefox
${URL}                 http://localhost:8000/login
${URL1}
# Staff user
${USERNAME}            balaji
${PASSWORD}            balaji

# Not a staff user
${NON_USERNAME}            mary
${NON_PASSWORD}            mary


${HOSPITAL_ID}          1
${COMMENT_TEXT}         This comment is entered by automated scripts for testing purpose in comment field

${HOSPITAL_NAME}              Rose de Lima
${SELECT_HOSPITAL_NAME}       Siena

#####

${MM-DD-YYYY}
${hh:mm}
${HISTORICAL_datetime}

${PREVIOUS_WEEK_DATE}
${PREVIOUS_WEEK_TIME}
${PREVIOUS_WEEK_DATETIME}

${PREVIOUS_MONTH_DATE}
${PREVIOUS_MONTH_TIME}
${PREVIOUS_MONTH_DATETIME}

${PREVIOUS_YEAR_DATE}
${PREVIOUS_YEAR_TIME}
${PREVIOUS_YEAR_DATETIME}


${PREVIOUS_HOUR}
${PREVIOUS_HOUR_TIME}
${MM-DD-YYYY}

${PREVIOUS_MINUTE}
${PREVIOUS_MINUTE_TIME}

${SUB_BUBLE_NURSENAME1}    Kinkade, Elinor
${SUB_BUBLE_NURSENAME2}    Harbor, Kurt


${REAlHOSPITAL_NAME}      Rose de Lima
${SWITCH_HOSPITAL_NAME}   Siena



########In Patients######

${SUB_BUBLE_UNITNAME1}  unit1
${SUB_BUBLE_UNITNAME2}  unit2
${SUB_BUBLE_UNITNAME3}  unit3
${SUB_BUBLE_UNITNAME4}  unit4
${SUB_BUBLE_UNITNAME5}  unit5
${UNITS_COUNT}  5


*** Keywords ***


Stop Mission Control suite

    close browser

#MissionControlBegin Test

#MissionControlEnd Test


Start realtime Mission Control suite

    open browser  about:blank   ${BROWSER}
    Maximize Browser Window
    delete all cookies
    mcEmergencyDepartment.Navigate to mission control Emergency Department dashboard


Stop realtime Mission Control suite

    close browser


Start InPatient Mission Control suite

    amdinPatientmissioncontrol.Navigate to InPatient Mission page

Stop InPatient Mission Control suite

     close browser