*** Settings ***
Documentation    Suite description

Resource    ../../resources/amd/pom/signinobj.robot
Resource    ../../resources/amd/pom/leftpaneobj.robot
Resource    ../../resources/amd/pom/staffingpageobj.robot

*** Keywords ***

Login and navigate to staffing page

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Staffing icon
    staffingpageobj.verify Staffing page loaded


login and verify staffing page

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    leftpaneobj.click on Staffing icon
    staffingpageobj.verify Staffing page loaded
    staffingpageobj.verify Staffing page


Login and navigate to staffing page and verify staffing plan displayed

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    leftpaneobj.click on Staffing icon
    staffingpageobj.verify Staffing page loaded
    verify Staffing plan graph is displayed


Login and navigate to staffing page and verify able to select different days and verify staffing plan reflected accordingly

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    leftpaneobj.click on Staffing icon
    staffingpageobj.verify Staffing page loaded
    verify Staffing plan graph is displayed
    select different days and verify staffing plan reflected accordingly

navigate to staffing page and verify able to select different months

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    leftpaneobj.click on Staffing icon
    staffingpageobj.verify Staffing page loaded
    verify Staffing plan graph is displayed
    select different months from drop down list

navigate to staffing page and verify export to PDF and PNG

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    leftpaneobj.click on Staffing icon
    staffingpageobj.verify Staffing page loaded
    verify Staffing plan graph is displayed
    verify export to PDF and PNG option available

navigate to staffing page and verify Create a new shift pop is displayed on clicking in difference

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    leftpaneobj.click on Staffing icon
    staffingpageobj.verify Staffing page loaded
    verify Staffing plan graph is displayed
    click on Difference and verify Create a new shift popup screen populated

navigate to staffing page and verify Create a new shift pop screen

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    leftpaneobj.click on Staffing icon
    staffingpageobj.verify Staffing page loaded
    verify Staffing plan graph is displayed
    click on Difference and verify Create a new shift popup screen populated
    verify Create a new shift popup screen

navigate to staffing page and Create a new shift

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    leftpaneobj.click on Staffing icon
    staffingpageobj.verify Staffing page loaded
    verify Staffing plan graph is displayed
    click on Difference
    Create a new shift
    verify a new shift displayed under Staffing Plan

navigate to staffing page and Number of workers and Duration (hours) field mandatory

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    leftpaneobj.click on Staffing icon
    staffingpageobj.verify Staffing page loaded
    verify Staffing plan graph is displayed
    click on Difference
    verify Number of workers and Duration (hours) fields are madatory


navigate to staffing page and verify Load a staffing plan pop screen

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    leftpaneobj.click on Staffing icon
    staffingpageobj.verify Staffing page loaded
    click load plan icon
    verify Load a staffing plan popup screen


navigate to staffing page and verify Download as CSV and other options

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    leftpaneobj.click on Staffing icon
    staffingpageobj.verify Staffing page loaded
    verify Staffing plan graph is displayed
    verify Download as CSV and other options

navigate to staffing page and verify Copy shifts from to another day popup screen

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    leftpaneobj.click on Staffing icon
    staffingpageobj.verify Staffing page loaded
    verify Staffing plan graph is displayed
    select Copy to a different day option
    verify Copy to a different day popup screen

navigate to staffing page and verify Clear shifts from the following days popup screen

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${DASH_USERNAME}  ${DASH_PASSWORD}
    leftpaneobj.click on Alerts icon
    leftpaneobj.click on Staffing icon
    staffingpageobj.verify Staffing page loaded
    verify Staffing plan graph is displayed
    select Clear shifts from the following days
    verify Clear shifts from the following days popup screen