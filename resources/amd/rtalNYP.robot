*** Settings ***
Documentation    Suite description

Resource    ../../resources/amd/pom/signinobj.robot
Resource    ../../resources/amd/pom/leftpaneobj.robot
Resource    ../../resources/amd/pom/homepageobj.robot
Resource    ../../resources/amd/pom/rtalNYPpageobj.robot

*** Keywords ***

Login to application and navigate to NYP RTAL dashboard

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalNYPpageobj.verify default RTAL page loaded
    rtalNYPpageobj.Navigate to NYP RTAL Board page
    rtalNYPpageobj.verify NYP RTAL page loaded
    rtalNYPpageobj.verify NYP RTAL dashboard page

Login to application and navigate to NYP RTAL dashboard and verify page

    rtalNYP.Login to application and navigate to NYP RTAL dashboard
    rtalNYPpageobj.verify NYP RTAL dashboard page

Login to application and navigate NYP RTAL dashboard and verify page in full screen mode

    rtalNYP.Login to application and navigate to NYP RTAL dashboard
    rtalNYPpageobj.verify Full Screen option in NYP RTAL dashboard page
    rtalNYPpageobj.click on Full Screen option in NYP RTAL dashboard page
    rtalNYPpageobj.verify Exit Full Screen option in NYP RTAL dashboard page
    rtalNYPpageobj.click on Exit Full Screen option in NYP RTAL dashboard page
    rtalNYPpageobj.verify Full Screen option in NYP RTAL dashboard page

Login to application and navigate NYP RTAL dashboard and verify print option

    rtalNYP.Login to application and navigate to NYP RTAL dashboard
    rtalNYPpageobj.verify Print option in NYP RTAL dashboard page
    #rtalNYPpageobj.click on Print option in NYP RTAL dashboard page

Login to application and navigate NYP RTAL dashboard and verify Sort by

    rtalNYP.Login to application and navigate to NYP RTAL dashboard
    rtalNYPpageobj.verify Print option in NYP RTAL dashboard page
    rtalNYPpageobj.verify default value SORT BY dropdown in NYP RTAL dashboard page
    rtalNYPpageobj.click on SORT BY drop down list in NYP RTAL dashboard page
    rtalNYPpageobj.verify SORT BY dropdown list of values in NYP RTAL dashboard page

Login to application and navigate NYP RTAL dashboard and verify Sort by different options available from drop down list

    rtalNYP.Login to application and navigate to NYP RTAL dashboard
    rtalNYPpageobj.verify default value SORT BY dropdown in NYP RTAL dashboard page
    rtalNYPpageobj.verify able to select different sort option from SORT BY dropdown in NYP RTAL dashboard page

Login to application and navigate NYP RTAL dashboard and verify Search option available

    rtalNYP.Login to application and navigate to NYP RTAL dashboard
    #rtalNYPpageobj.verify default value SORT BY dropdown in NYP RTAL dashboard page
    rtalNYPpageobj.verify Search option in NYP RTAL dashboard page
    rtalNYPpageobj.click on Search option in NYP RTAL dashboard page
    rtalNYPpageobj.verify Search box displayed to search table content in NYP RTAL dashboard page
    rtalNYPpageobj.Close Search box in NYP RTAL dashboard page

Login to application and navigate NYP RTAL dashboard and verify able to search table content

    rtalNYP.Login to application and navigate to NYP RTAL dashboard
    #rtalNYPpageobj.verify default value SORT BY dropdown in NYP RTAL dashboard page
    rtalNYPpageobj.verify Search option in NYP RTAL dashboard page
    rtalNYPpageobj.click on Search option in NYP RTAL dashboard page
    rtalNYPpageobj.Enter keyword to search in table content  Earth X-ray
    rtalNYPpageobj.verify table content search result
    rtalNYPpageobj.Close Search box in NYP RTAL dashboard page

Login to application and navigate NYP RTAL dashboard and verify No results found message when keyword is not available

    rtalNYP.Login to application and navigate to NYP RTAL dashboard
    #rtalNYPpageobj.verify default value SORT BY dropdown in NYP RTAL dashboard page
    rtalNYPpageobj.verify Search option in NYP RTAL dashboard page
    rtalNYPpageobj.click on Search option in NYP RTAL dashboard page
    rtalNYPpageobj.Enter keyword to search in table content  I am Not present
    rtalNYPpageobj.verify table content search result
    rtalNYPpageobj.verify No results found message for table content search
    rtalNYPpageobj.Close Search box in NYP RTAL dashboard page

Login to application and navigate NYP RTAL dashboard and verify calender option available under EDD column

    rtalNYP.Login to application and navigate to NYP RTAL dashboard
    rtalNYPpageobj.verify calender option available under EDD column

Login to application and navigate NYP RTAL dashboard and verify able to select date from calender option available under EDD column

    rtalNYP.Login to application and navigate to NYP RTAL dashboard
    rtalNYPpageobj.verify able to select date from calender under EDD column

Login to application and navigate NYP RTAL dashboard and verify Add Barrier text field available under Possible Barriers column

    rtalNYP.Login to application and navigate to NYP RTAL dashboard
    rtalNYPpageobj.verify Add Barrier text field available under Possible Barriers column

Login to application and navigate NYP RTAL dashboard and verify able to Add Barrier under Possible Barriers column

    rtalNYP.Login to application and navigate to NYP RTAL dashboard
    rtalNYPpageobj.verify Add Barrier text field available under Possible Barriers column
    rtalNYPpageobj.Add new custom Barrier and verify custom Barrier added

Login to application and navigate NYP RTAL dashboard and verify able to delete Barrier under Possible Barriers column

    rtalNYP.Login to application and navigate to NYP RTAL dashboard
    rtalNYPpageobj.Delete newly created custom Barrier and verify barrier is not present

Login to application and navigate NYP RTAL dashboard and verify notes text field available under Follow-Up column

    rtalNYP.Login to application and navigate to NYP RTAL dashboard
    rtalNYPpageobj.verify Notes text field available under Follow-Up column

Login to application and navigate NYP RTAL dashboard and verify able to Add Note under Follow-Up column

    rtalNYP.Login to application and navigate to NYP RTAL dashboard
    rtalNYPpageobj.Add Note and verify Notes added under Follow-Up

Login to application and navigate NYP RTAL dashboard and verify able to delete Note under Follow-Up column

    rtalNYP.Login to application and navigate to NYP RTAL dashboard
    rtalNYPpageobj.Delete newly added note and verify note deleted