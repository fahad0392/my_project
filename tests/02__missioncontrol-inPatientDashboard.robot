*** Settings ***
Documentation    Suite description

 # necessary for Setup & Teardown
Resource        ../resources/missioncontrol/amdinPatientmissioncontrol.robot    # necessary for lower level keywords in test cases
Resource        ../resources/missioncontrol/mccommon.robot   # necessary for lower level keywords in test cases


Library         SeleniumLibrary

Suite Setup      Start InPatient Mission Control suite
#Test Setup       MissionControlBegin Test
#Test Teardown    MissionControlEnd Test
Suite Teardown   Stop InPatient Mission Control suite


*** Test Cases ***

1__As User should be able to Navigate to MC InPatient dashboard

   [Tags]  regression-test  missioncontrol-ip  daily-smoketest

   Navigate MC InPatient missioncontrol dashboard page

2__As User should be able to see the 4 main mc top dials

   [Tags]  regression-test  missioncontrol-ip  daily-smoketest

   Navigate MC InPatient missioncontrol dashboard page and verify 4 main mc top dials

3__As User should be able to see the status counts in InPatient missioncontrol dashboard page

   [Tags]  regression-test  missioncontrol-ip  daily-smoketest

   Navigate MC InPatient missioncontrol dashboard page and verify status counts

4__As user verify Open Requests Status Counts in InPatient missioncontrol dashboard page

   [Tags]  regression-test  missioncontrol-ip

   verify the Open Requests counts in inpatient dashboard

5__As user verify Bed Closures Status Counts in InPatient missioncontrol dashboard page

   [Tags]  regression-test  missioncontrol-ip

   verify the Bed Closures counts in inpatient dashboard

6__As user verify Total Census dial in InPatient missioncontrol dashboard page

   [Tags]  regression-test  missioncontrol-ip

   verify the Total Census dial count

7__As user verify Available Beds dial in InPatient missioncontrol dashboard page

    [Tags]  regression-test  missioncontrol-ip

    verify Available Beds dial

8__As user verify Pending Admits for Next 24 Hours dial in InPatient missioncontrol dashboard page

    [Tags]  regression-test  missioncontrol-ip

    verify Pending Admits for Next 24 Hours dial

9__As user verify Expected Discharges for Next 24 Hour dial in InPatient missioncontrol dashboard

     [Tags]  regression-test  missioncontrol-ip

     verify Expected Discharges for Next 24 Hours dial

10__As user verify Legend of colors shows beside the bubble chart in InPatient missioncontrol dashboard

     [Tags]  regression-test  missioncontrol-ip

     verify legend are present in InPatient missioncontrol dashboard

11__As User should be able view unit sub-bubble have name of units

     [Tags]  regression-test  missioncontrol-ip  daily-smoketest

     verify sub-bubble have name of units name

12__As User should be able view units bubble tool tip

     [Tags]  regression-test  missioncontrol-ip  daily-smoketest

     verify able view units bubble tool tip

13__User should be able view tooltips in the bubble chart shows bed name

     [Tags]  regression-test  missioncontrol-ip  daily-smoketest

     verify tooltips in the bubble chart shows bed name