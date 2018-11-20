*** Settings ***
Documentation    Suite description

Resource    ../../resources/amd/pom/signinobj.robot
Resource    ../../resources/amd/pom/leftpaneobj.robot
Resource    ../../resources/amd/pom/homepageobj.robot
Resource    ../../resources/amd/pom/rtalSutterRxpageobj.robot

*** Keywords ***

Login to application and navigate to Sutter Rx RTAL dashboard

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    verify RTAL option in leftpane
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalSutterRxpageobj.verify default RTAL page loaded
    rtalSutterRxpageobj.Navigate to Sutter Rx RTAL Board page
    rtalSutterRxpageobj.verify Sutter Rx RTAL page loaded

Login to application and navigate to Sutter Rx RTAL dashboard and verify page

    rtalSutterRx.Login to application and navigate to Sutter Rx RTAL dashboard
    rtalSutterRxpageobj.verify Sutter Rx RTAL dashboard page

Login to application and navigate Sutter Rx RTAL dashboard and verify page in full screen mode

    rtalSutterRx.Login to application and navigate to Sutter Rx RTAL dashboard
    rtalSutterRxpageobj.verify Full Screen option in Sutter Rx RTAL dashboard page
    rtalSutterRxpageobj.click on Full Screen option in Sutter Rx RTAL dashboard page
    rtalSutterRxpageobj.verify Exit Full Screen option in Sutter Rx RTAL dashboard page
    rtalSutterRxpageobj.click on Exit Full Screen option in Sutter Rx RTAL dashboard page
    rtalSutterRxpageobj.verify Full Screen option in Sutter Rx RTAL dashboard page

Login to application and navigate Sutter Rx RTAL dashboard and verify print option

    rtalSutterRx.Login to application and navigate to Sutter Rx RTAL dashboard
    rtalSutterRxpageobj.verify Print option in Sutter Rx RTAL dashboard page
    #rtalSutterRxpageobj.click on Print option in Sutter Rx RTAL dashboard page

Login to application and navigate Sutter Rx RTAL dashboard and verify Search option available

    rtalSutterRx.Login to application and navigate to Sutter Rx RTAL dashboard
    rtalSutterRxpageobj.verify Search option in Sutter Rx RTAL dashboard page
    rtalSutterRxpageobj.click on Search option in Sutter Rx RTAL dashboard page
    rtalSutterRxpageobj.verify Search box displayed to search table content in Sutter Rx RTAL dashboard page
    rtalSutterRxpageobj.Close Search box in Sutter Rx RTAL dashboard page

Login to application and navigate Sutter Rx RTAL dashboard and verify able to search table content

    rtalSutterRx.Login to application and navigate to Sutter Rx RTAL dashboard
    rtalSutterRxpageobj.verify Search option in Sutter Rx RTAL dashboard page
    rtalSutterRxpageobj.click on Search option in Sutter Rx RTAL dashboard page
    rtalSutterRxpageobj.Enter keyword to search in table content  Earth X-ray
    rtalSutterRxpageobj.verify table content search result
    rtalSutterRxpageobj.Close Search box in Sutter Rx RTAL dashboard page

Login to application and navigate Sutter Rx RTAL dashboard and verify No results found message when keyword is not available

    rtalSutterRx.Login to application and navigate to Sutter Rx RTAL dashboard
    rtalSutterRxpageobj.verify Search option in Sutter Rx RTAL dashboard page
    rtalSutterRxpageobj.click on Search option in Sutter Rx RTAL dashboard page
    rtalSutterRxpageobj.Enter keyword to search in table content  I am Not present
    rtalSutterRxpageobj.verify table content search result
    rtalSutterRxpageobj.verify No results found message for table content search
    rtalSutterRxpageobj.Close Search box in Sutter Rx RTAL dashboard page

Login to application and navigate Sutter Rx RTAL dashboard and verify status drop down list

    rtalSutterRx.Login to application and navigate to Sutter Rx RTAL dashboard
    rtalSutterRxpageobj.click on STATUS drop down list under status column
    rtalSutterRxpageobj.verify STATUS dropdown list of values under status column in Sutter Rx RTAL dashboard page

Login to application and navigate Sutter Rx RTAL dashboard and verify able to select values from drop down list

    rtalSutterRx.Login to application and navigate to Sutter Rx RTAL dashboard
    rtalSutterRxpageobj.verify able to select status option from status dropdown in Sutter Rx RTAL dashboard page

Login to application and navigate Sutter Rx RTAL dashboard and verify notes text field available under Follow-Up column

    rtalSutterRx.Login to application and navigate to Sutter Rx RTAL dashboard
    rtalSutterRxpageobj.verify Notes text field available under Follow-Up column

Login to application and navigate Sutter Rx RTAL dashboard and verify able to Add Note under Follow-Up column

    rtalSutterRx.Login to application and navigate to Sutter Rx RTAL dashboard
    rtalSutterRxpageobj.Add Note and verify Notes added under Follow-Up

Login to application and navigate Sutter Rx RTAL dashboard and verify able to delete Note under Follow-Up column

    rtalSutterRx.Login to application and navigate to Sutter Rx RTAL dashboard
    rtalSutterRxpageobj.Delete newly added note and verify note deleted

Login to application and navigate Sutter Rx RTAL dashboard and verify Candidates and Reviewed filter options

    rtalSutterRx.Login to application and navigate to Sutter Rx RTAL dashboard
    rtalSutterRxpageobj.verify Candidates and Reviewed filter options present in Sutter Rx RTAL dashboard page

Login to application and navigate Sutter Rx RTAL dashboard and verify # of rows present is equal count of Candidates plus count of Reviewed

    rtalSutterRx.Login to application and navigate to Sutter Rx RTAL dashboard
    rtalSutterRxpageobj.verify # of rows present is equal count of Candidates plus count of Reviewed

Login to application and navigate Sutter Rx RTAL dashboard and verify Reviewed dashboard by using reviewed filter

    rtalSutterRx.Login to application and navigate to Sutter Rx RTAL dashboard
    rtalSutterRxpageobj.verify Reviewed dashboard by using reviewed filter

Login to application and navigate Sutter Rx RTAL dashboard and verify Candidates dashboard by using Candidates filter

    rtalSutterRx.Login to application and navigate to Sutter Rx RTAL dashboard
    rtalSutterRxpageobj.verify Candidates dashboard by using Candidates filter

Login to application and navigate Sutter Rx RTAL dashboard and verify able to reveiw under Candidates filter list

    rtalSutterRx.Login to application and navigate to Sutter Rx RTAL dashboard
    rtalSutterRxpageobj.click on candidates filter
    rtalSutterRxpageobj.verify able to reveiw the status under Candidates filter list