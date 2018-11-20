
*** Settings ***
Documentation    Suite description

Resource      ../../resources/missioncontrol/pom/inPatientpageobj.robot


*** Keywords ***


Navigate to InPatient Mission page

    inPatientpageobj.mcLoad login page
    inPatientpageobj.mclogin Page Loaded
    inPatientpageobj.mclogin page contains
    inPatientpageobj.Enter mcusername
    inPatientpageobj.Enter mcpassword
    inPatientpageobj.click on mcSign button


Navigate MC InPatient missioncontrol dashboard page

    inPatientpageobj.MCload InPatient dashboard page
    inPatientpageobj.verify mc InPatient dashboard page
    inPatientpageobj.verify mc InPatient dashboard hostpital name

Navigate MC InPatient missioncontrol dashboard page and verify 4 main mc top dials

    inPatientpageobj.MCload InPatient dashboard page
    inPatientpageobj.verify mc InPatient dashboard page
    inPatientpageobj.verify 4 main mc top dials displayed

Navigate MC InPatient missioncontrol dashboard page and verify status counts

    inPatientpageobj.MCload InPatient dashboard page
    inPatientpageobj.verify Status Counts

verify the Open Requests counts in inpatient dashboard

   inPatientpageobj.MCload InPatient dashboard page
   inPatientpageobj.Get Value From Open Requests status count and verify

verify the Bed Closures counts in inpatient dashboard

   inPatientpageobj.MCload InPatient dashboard page
   inPatientpageobj.Get Value From Open Requests status count and verify

verify the Total Census dial count

   inPatientpageobj.MCload InPatient dashboard page
   inPatientpageobj.Get Value From Total Census top dials

verify Available Beds dial

    inPatientpageobj.MCload InPatient dashboard page
    inPatientpageobj.Get Value From Available Beds top dials


verify Pending Admits for Next 24 Hours dial

    inPatientpageobj.MCload InPatient dashboard page
    inPatientpageobj.Get Value From Pending Admits for Next 24 Hours top dials

verify Expected Discharges for Next 24 Hours dial

    inPatientpageobj.MCload InPatient dashboard page
    inPatientpageobj.Get Value From Expected Discharges for Next 24 Hours top dials


######Bubbles#######

verify legend are present in InPatient missioncontrol dashboard

    inPatientpageobj.MCload InPatient dashboard page
    inPatientpageobj.verify bubbles legends

verify sub-bubble have name of units name

    inPatientpageobj.MCload InPatient dashboard page
    inPatientpageobj.verify sub-bubble have name of units

verify able view units bubble tool tip

    inPatientpageobj.MCload InPatient dashboard page
    inPatientpageobj.verify unit bubles have tool tip

verify tooltips in the bubble chart shows bed name

    inPatientpageobj.MCload InPatient dashboard page
    inPatientpageobj.verify tooltips in the bubble shows bed name