*** Settings ***
Documentation    Suite description

  # necessary for Setup & Teardown
Resource        ../resources/missioncontrol/mcEmergencyDepartment.robot    # necessary for lower level keywords in test cases
Resource        ../resources/missioncontrol/mccommon.robot   # necessary for lower level keywords in test cases


Library         SeleniumLibrary

Suite Setup      Start realtime Mission Control suite
#Test Setup       MissionControlBegin Test
#Test Teardown    MissionControlEnd Test
Suite Teardown   Stop realtime Mission Control suite


# Copy/paste the below command to Terminal to execute:
# pybot -d results/mc tests/<filename>.robot


*** Test Cases ***

1__User should be able to Navigate to MC Emergency Department dashboard

   [Tags]  regression-test  missioncontrol-ed  daily-smoketest

   Navigate and verify MC Emergency Department dashboard page

2__User should be able to see the 4 main mc metrics(Dials) under MC Emergency Department dashboard

   [Tags]  regression-test  missioncontrol-ed  daily-smoketest

    Navigate MC Emergency Department dashboard page and verify 4 main mc metrics

3__User should be able to see the stats counts under MC Emergency Department dashboard

   [Tags]  regression-test  missioncontrol-ed  daily-smoketest

    Navigate MC Emergency Department dashboard page and verify stats counts

4__User should be able to see zopim on the page to the bottom right under MC Emergency Department dashboard

    [Tags]  regression-test  missioncontrol-ed

    Navigate MC Emergency Department dashboard page verify zopim present

5__User should be able to switch between hospitals using the dropdown under MC Emergency Department dashboard

    [Tags]  regression-test  missioncontrol-ed  daily-smoketest

    Navigate MC realtime missioncontrol dashboard page and able to switch between hospitals using the dropdown

6__As user verify Roomed Status Counts matches with Roomed status count image

    [Tags]  regression-test  missioncontrol-ed

    verify the Roomed count matches with visualization under Status Counts

7__As user verify Waiting Room Status Counts matches with Waiting status count image

    [Tags]  regression-test  missioncontrol-ed

    verify the Waiting Room count matches with visualization under Status Counts

8__As user verify Triaged Room Status Counts matches with Triaged status count image

    [Tags]  regression-test  missioncontrol-ed

    verify the Triaged Room count matches with visualization under Status Counts

9__As user verify Pending Discharges Status Counts matches with Pending Discharges status count image

    [Tags]  regression-test  missioncontrol-ed

    verify the Pending Discharges count matches with visualization under Status Counts

10__As user verify Pending Admits Status Counts matches with Pending Admits status count image

    [Tags]  regression-test  missioncontrol-ed

    verify the Pending Admits count matches with visualization under Status Counts

11__As user verify Total Census dail under MC Emergency Department dashboard

    [Tags]  regression-test  missioncontrol-ed

    verify the Total Census counts dail

12__As user verify Length of stay of discharges in the last 60 minutes dail under MC Emergency Department dashboard

     [Tags]  regression-test  missioncontrol-ed

     verify Length of stay of discharges in the last 60 minutes dail

13__As user verify Expected patients will be discharged in the next hour dail under under MC Emergency Department dashboard

     [Tags]  regression-test  missioncontrol-ed

     verify Expected patients will be discharged in the next hour dail

14__As user verify Expected patients will be admitted in the next hour dail under under MC Emergency Department dashboard

     [Tags]  regression-test  missioncontrol-ed

     verify Expected patients will be admitted in the next hour dail

15__As user verify Total Census count is equal total patients

     [Tags]

     verify Total Census equal to patients

16__As user verify Total Census count is equal total patients,number of bubbles

     [Tags]  regression-test  missioncontrol-ed

     verify Total Census equal to number of bubbles

17__As staff user should able to see Mark patient as outlier? pop window under under MC Emergency Department dashboard

     [Tags]  regression-test  missioncontrol-ed

     verify Mark patient as outlier popup displayed when staff user click on bubble

18__As staff user should able to close Mark patient as outlier? pop window under MC Emergency Department dashboard

     [Tags]  regression-test  missioncontrol-ed

     verify able to close Mark patient as outlier? pop window clicking on close button

19__As User should be able to hover over and see the tooltip with details on the patient under MC Emergency Department dashboard

     [Tags]  regression-test  missioncontrol-ed

     verify able to hover over patient bubble

20__As user should able to Remove patient by clicking on Remove patient button in Mark patient as outlier? pop window under MC Emergency Department dashboard

     [Tags]  regression-test  missioncontrol-ed

     verify patient will be permanently removed from mission control

21__As User should be able to see the most recent decisions with a tag of "Recent" in the decisions table

     [Tags]  regression-test  missioncontrol-ed

     verify able to see the most recent decisions

22__As User should be able to add comments in decision

     [Tags]  regression-test  missioncontrol-ed

     verify able to enter the comments under decision


23__As User should be able to click on a decision and view all the comments added by different users.

     [Tags]  regression-test  missioncontrol-ed

     verify able click on a decision and view comments

24__As User should be able sub-bubble either have name of nurse name or unassigned

     [Tags]  regression-test  missioncontrol-ed  daily-smoketest

     verify sub-bubble either have name of nurse name or unassigned

25__As user should able to click on circle present next to “This is a more recent one"

     [Tags]  regression-test  missioncontrol-ed

     verify able to click on circle present next to 'This is a more recent one'

26__AS user is not a staff user, user should not be able to view the "Mark patient as outlier pop up under MC Emergency Department dashboard

     [Tags]  regression-test  missioncontrol-ed  daily-smoketest

     Non staff user should not be able to view the "Mark patient as outlier pop up


############################Historical ED Dashboard#########################3


27__As User should be able to Navigate to MC Emergency Department Historical dashboard

     [Tags]  regression-test  missioncontrol-ed  daily-smoketest

     Navigate MC Historical dashboard page

28__As User should be able to select previous week from time dropdown

     [Tags]  regression-test  missioncontrol-ed

     Navigate MC previous week Historical dashboard page

29__As User should be able to select previous month from time dropdown

     [Tags]  regression-test  missioncontrol-ed

     Navigate MC previous month Historical dashboard page

30__As User should be able to select previous year from time dropdown

     [Tags]  regression-test  missioncontrol-ed

     Navigate MC previous year Historical dashboard page

31__User should be able to select previous hour from time dropdown

     [Tags]  regression-test  missioncontrol-ed

     Navigate MC previous hour Historical dashboard page

User should be able to select previous minute from time dropdown

     [Tags]

     Navigate MC previous Minute Historical dashboard page

32__As User should not be able to select invalid day

     [Tags]  regression-test  missioncontrol-ed

     Invalid date in time dropdown

33__As User should not be able to select invalid hour/time

     [Tags]  regression-test  missioncontrol-ed

     Invalid hour/time in time dropdown

34__As User should be able to see zopim on the page to the bottom right

     [Tags]  regression-test  missioncontrol-ed

      Navigate to zopim on the Historical dashboard page page


35__As User should be able to select different hosptial in Historical dashboard page

     [Tags]  regression-test  missioncontrol-ed

    Navigate different hosptial in MC Historical dashboard page

36__As User should be able to see Total Census and verify Historical dashboard page

     [Tags]  regression-test  missioncontrol-ed

    Navigate to Historical dashboard page verify Total Census

37__As User should be able to see Length of stayof discharges inthe past hour and verify Historical dashboard page

     [Tags]  regression-test  missioncontrol-ed

    Navigate to Historical dashboard page verify Length of stayof discharges inthe past hour

38__As User should be able to see Expected patients willbe discharged in the next hour and verify Historical dashboard page

     [Tags]  regression-test  missioncontrol-ed

    Navigate to Historical dashboard page verify Expected patients willbe discharged in the next hour

39__As User should be able to see Expected patients will be admitted in the next hour and verify Historical dashboard page

     [Tags]  regression-test  missioncontrol-ed

    Navigate to Historical dashboard page verify Expected patients will be admitted in the next hour


40__As user verify Waiting Room Status Counts in Historical dashboard page

     [Tags]  regression-test  missioncontrol-ed

   verify the Waiting Room status counts Historical dashboard page

41__As user verify Triaged Status Counts in Historical dashboard page

     [Tags]  regression-test  missioncontrol-ed

    verify the Triaged status counts Historical dashboard page

42__As user verify Roomed Status Counts in Historical dashboard page

     [Tags]  regression-test  missioncontrol-ed

    verify the Roomed status counts Historical dashboard page

43__As user verify Pending Discharges Status Counts in Historical dashboard page

     [Tags]  regression-test  missioncontrol-ed

    verify the Pending Discharges status counts Historical dashboard page

44__As user verify Pending Admits Counts in Historical dashboard page

    [Tags]  regression-test  missioncontrol-ed

    verify the Pending Admits status counts Historical dashboard page

45__As user verify Total Census count is equal total patients in Historical dashboard page

     [Tags]

     verify Total Census equal to patients in Historical dashboard page

46__user should not able to see Mark patient as outlier? pop window

     [Tags]  regression-test  missioncontrol-ed

     verify Mark patient as outlier popup not displayed when user click on bubble
