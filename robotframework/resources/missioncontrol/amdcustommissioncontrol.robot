*** Settings ***
Documentation    Suite description

Resource      ../../resources/missioncontrol/pom/custompageobj.robot


*** Keywords ***


Navigate to customMission page

    historicalpageobj.mcLoad login page
    historicalpageobj.mclogin Page Loaded
    historicalpageobj.mclogin page contains
    historicalpageobj.Enter mcusername
    historicalpageobj.Enter mcpassword
    historicalpageobj.click on mcSign button


Navigate MC realtime missioncontrol dashboard page

    custompageobj.MCload custom dashboard page
   
    realtimepageobj.verify mc realtime dashboard page title
    realtimepageobj.verify mc realtime dashboard hostpital name