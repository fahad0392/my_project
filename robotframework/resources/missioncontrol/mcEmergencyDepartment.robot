
*** Settings ***
Documentation    Suite description

Resource      ../../resources/missioncontrol/pom/edpageobj.robot
Resource      ../../resources/missioncontrol/pom/mcloginLeftpanePageobj.robot


*** Keywords ***


Navigate to mission control Emergency Department dashboard

    mcloginLeftpanePageobj.Load login page
    mcloginLeftpanePageobj.verify login Page Loaded
    mcloginLeftpanePageobj.verify login page contains
    mcloginLeftpanePageobj.Fill Login page and submit  ${USERNAME}  ${PASSWORD}
    mcloginLeftpanePageobj.Verify home button in leftpane
    mcloginLeftpanePageobj.click on MC icon

Navigate and verify MC Emergency Department dashboard page

    edpageobj.verify mc Emergency Department dashboard page loaded
    edpageobj.verify mc Emergency Department dashboard hostpital name

Navigate MC Emergency Department dashboard page and verify 4 main mc metrics

    edpageobj.verify mc Emergency Department dashboard page loaded
    edpageobj.verify mc Emergency Department dashboard hostpital name
    edpageobj.verify 4 main mc metrics dials under Emergency Department dashboard

Navigate MC Emergency Department dashboard page and verify stats counts

    edpageobj.verify mc Emergency Department dashboard page loaded
    edpageobj.verify Status Counts present under Emergency Department dashboard

Navigate MC realtime missioncontrol dashboard page and able to switch between hospitals using the dropdown

   edpageobj.verify mc Emergency Department dashboard page loaded
   edpageobj.click on hospital drop down and select hospital from list

Navigate MC Emergency Department dashboard page verify zopim present

   edpageobj.verify mc Emergency Department dashboard page loaded
   edpageobj.verify able to see zopim on Emergency Department dashboard page

verify the Roomed count matches with visualization under Status Counts

   edpageobj.verify mc Emergency Department dashboard page loaded
   edpageobj.Get Value From Roomed status count and verify

verify the Waiting Room count matches with visualization under Status Counts

   edpageobj.verify mc Emergency Department dashboard page loaded
   edpageobj.Get Value From Waiting Room status count and verify

verify the Triaged Room count matches with visualization under Status Counts

   edpageobj.verify mc Emergency Department dashboard page loaded
   edpageobj.Get Value From Triaged Room status count and verify

verify the Pending Discharges count matches with visualization under Status Counts

   edpageobj.verify mc Emergency Department dashboard page loaded
   edpageobj.Get Value From Pending Discharges status count and verify

verify the Pending Admits count matches with visualization under Status Counts

   edpageobj.verify mc Emergency Department dashboard page loaded
   edpageobj.Get Value From Pending Admits status count and verify

verify the Total Census counts dail

    edpageobj.verify mc Emergency Department dashboard page loaded
    edpageobj.Get Value From Total Census and verify

verify Length of stay of discharges in the last 60 minutes dail

    edpageobj.verify mc Emergency Department dashboard page loaded
    edpageobj.Length of stay of discharges in the last 60 minutes and verify

verify Expected patients will be discharged in the next hour dail

    edpageobj.verify mc Emergency Department dashboard page loaded
    edpageobj.Get Value From Expected patients will be dischargred in the next hour and verify

verify Expected patients will be admitted in the next hour dail

    edpageobj.verify mc Emergency Department dashboard page loaded
    edpageobj.Get Value From Expected patients will be admitted in the next hour and verify

verify Total Census equal to patients

    edpageobj.verify Total Census equals to number of patients

verify Total Census equal to number of bubbles

   edpageobj.verify mc Emergency Department dashboard page loaded
   edpageobj.verify Total Census equals to number of bubbles


verify Mark patient as outlier popup displayed when staff user click on bubble

   edpageobj.verify mc Emergency Department dashboard page loaded
   edpageobj.verify Mark patient as outlier popup window

verify able to close Mark patient as outlier? pop window clicking on close button

   edpageobj.verify mc Emergency Department dashboard page loaded
   edpageobj.click close button in Mark patient as outlier popup window

verify able to hover over patient bubble

   edpageobj.verify mc Emergency Department dashboard page loaded
   edpageobj.verify hover over patient

verify patient will be permanently removed from mission control

    edpageobj.verify mc Emergency Department dashboard page loaded
    edpageobj.click on remove patient button in Mark patient as outlier popup window

verify able to see the most recent decisions

    edpageobj.verify mc Emergency Department dashboard page loaded
    edpageobj.verify most recent decisions with a tag of "Recent"

verify able click on a decision and view comments

    edpageobj.verify mc Emergency Department dashboard page loaded
    edpageobj.click on a decision and view all the comments

verify able to enter the comments under decision

    edpageobj.verify mc Emergency Department dashboard page loaded
    edpageobj.Enter comments in desision in realtime dashboard page

verify sub-bubble either have name of nurse name or unassigned

    edpageobj.verify mc Emergency Department dashboard page loaded
    edpageobj.check sub-bubble either have name of nurse name or unassigned

verify able to click on circle present next to 'This is a more recent one'

    edpageobj.verify mc Emergency Department dashboard page loaded
    edpageobj.click on circle present next to 'This is a more recent one' and verify

Non staff user should not be able to view the "Mark patient as outlier pop up

    mcloginLeftpanePageobj.login as non staff user
    edpageobj.verify mc Emergency Department dashboard page loaded
    edpageobj.verify Mark patient as outlier popup window is not displayed for non staff user
    close browser


################### Historical ED Dashboard################

Navigate MC Historical dashboard page

    mcloginLeftpanePageobj.login as staff user
    edpageobj.verify mc Emergency Department dashboard page loaded
    edpageobj.MCload Historical dashboard page
    edpageobj.verify mc historical dashboard page title
    edpageobj.verify mc historical dashboard hostpital name
    edpageobj.verify 4 main mc metrics
    edpageobj.verify Status Counts
    edpageobj.click on date/time drop down in Emergency Department dashboard
    edpageobj.click on Show the current state

Navigate different hosptial in MC Historical dashboard page


    edpageobj.MCload Historical dashboard page
    edpageobj.verify mc historical dashboard page title
    edpageobj.verify mc historical dashboard hostpital name
    edpageobj.click on hospital drop down
    edpageobj.select hospital from list

Navigate MC previous week Historical dashboard page

    edpageobj.Enter previous week date in Enter past date field and verify
    edpageobj.click go button in Show a past state

Navigate MC previous month Historical dashboard page


    edpageobj.Enter previous month date in Enter past date field updated
    edpageobj.click on Show the current state

Navigate MC previous year Historical dashboard page

    edpageobj.Enter previous year date in Enter past date field updated
    edpageobj.click on Show the current state

Navigate MC previous hour Historical dashboard page

    edpageobj.Enter previous hour in Enter past time field updated
    edpageobj.click on Show the current state

Navigate MC previous Minute Historical dashboard page

    edpageobj.click on date/time drop down in Emergency Department dashboard
    edpageobj.Enter previous Minute in Enter past time field
    edpageobj.click go button
    edpageobj.verify state of the emergency room on previous minute date

Invalid date in time dropdown

    edpageobj.verify mc Emergency Department dashboard page loaded
    edpageobj.click on date/time drop down in Emergency Department dashboard
    edpageobj.verify Invalid date in time dropdown
    edpageobj.click on Show the current state in realtime dashboard

Invalid hour/time in time dropdown

    edpageobj.verify mc Emergency Department dashboard page loaded
    edpageobj.click on date/time drop down in Emergency Department dashboard
    edpageobj.verify Invalid hour/time in time dropdown
    edpageobj.click on date/time drop down in Emergency Department dashboard
    edpageobj.click on Show the current state in realtime dashboard

Navigate to zopim on the Historical dashboard page page

    edpageobj.click on date/time drop down in Emergency Department dashboard
    edpageobj.click go button in Show a past state
    edpageobj.verify zopim on the page
    edpageobj.click on date/time drop down in Emergency Department dashboard
    edpageobj.click on Show the current state in realtime dashboard


Navigate to Historical dashboard page verify Total Census

    edpageobj.MCload Historical dashboard page
    edpageobj.Get value From Total Census historical page and verify

Navigate to Historical dashboard page verify Length of stayof discharges inthe past hour

    edpageobj.MCload Historical dashboard page
    edpageobj.Get value Length of stay of discharges in the past hour and verify

Navigate to Historical dashboard page verify Expected patients willbe discharged in the next hour

    edpageobj.MCload Historical dashboard page
    edpageobj.Get value Expected patients willbe discharged in thenext hour and verify

Navigate to Historical dashboard page verify Expected patients will be admitted in the next hour

    edpageobj.MCload Historical dashboard page
    edpageobj.Get value Expected patients willbe admitted in thenext hour and verify

verify the Waiting Room status counts Historical dashboard page

    edpageobj.MCload Historical dashboard page
    edpageobj.Get Value From Waiting Room status count from historical view page and verify

verify the Roomed status counts Historical dashboard page

    edpageobj.MCload Historical dashboard page
    edpageobj.Get Value From Roomed status count from historical view page and verify

verify the Triaged status counts Historical dashboard page

    edpageobj.MCload Historical dashboard page
    edpageobj.Get Value From Triaged Room status count from historical view page and verify

verify the Pending Discharges status counts Historical dashboard page

    edpageobj.MCload Historical dashboard page
    edpageobj.Get Value From Pending Discharges status count from historical view page and verify

verify the Pending Admits status counts Historical dashboard page

    edpageobj.MCload Historical dashboard page
    edpageobj.Get Value From Pending Admits status count from historical view page and verify

verify Total Census equal to patients in Historical dashboard page

    edpageobj.MCload Historical dashboard page
    edpageobj.verify Total Census equals to number of patients in historcial page

verify Mark patient as outlier popup not displayed when user click on bubble

    edpageobj.login as valid non staff user
    edpageobj.MCload Historical dashboard page
    edpageobj.verify Mark patient as outlier popup window is not displayed in historical dashboard

