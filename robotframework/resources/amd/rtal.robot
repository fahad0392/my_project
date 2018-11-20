*** Settings ***
Documentation    Suite description

Resource    ../../resources/amd/pom/signinobj.robot
Resource    ../../resources/amd/pom/leftpaneobj.robot
Resource    ../../resources/amd/pom/homepageobj.robot
Resource    ../../resources/amd/pom/rtalEmorypageobj.robot

*** Keywords ***

Login to application and navigate to RTAL Dashboard

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded

Login to application and navigate to RTAL dashboard and verify page

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded

Login to application and navigate RTAL dashboard and verify page in full screen mode

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.verify Full Screen option in Emory RTAL dashboard page
    rtalEmorypageobj.click on Full Screen option in Emory RTAL dashboard page
    rtalEmorypageobj.verify Exit Full Screen option in Emory RTAL dashboard page
    rtalEmorypageobj.click on Exit Full Screen option in Emory RTAL dashboard page
    rtalEmorypageobj.verify Full Screen option in Emory RTAL dashboard page

Login to application and navigate RTAL dashboard and verify print option

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.verify Print option in Emory RTAL dashboard page
    rtalEmorypageobj.click on Print option in Emory RTAL dashboard page

Login to application and navigate RTAL dashboard and verify Sort by

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.verify default value SORT BY dropdown in Emory RTAL dashboard page
    rtalEmorypageobj.click on SORT BY drop down list in Emory RTAL dashboard page
    rtalEmorypageobj.verify SORT BY dropdown list of values in Emory RTAL dashboard page

Login to application and navigate RTAL dashboard and verify Sort by different options available from drop down list

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.verify default value SORT BY dropdown in Emory RTAL dashboard page
    rtalEmorypageobj.verify able to select different sort option from SORT BY dropdown in Emory RTAL dashboard page

Login to application and navigate RTAL dashboard and verify Search option available

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.verify Search option in Emory RTAL dashboard page
    rtalEmorypageobj.click on Search option in Emory RTAL dashboard page
    rtalEmorypageobj.verify Search box displayed to search table content in Emory RTAL dashboard page
    rtalEmorypageobj.Close Search box in Emory RTAL dashboard page

Login to application and navigate RTAL dashboard and verify able to search table content

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.verify Search option in Emory RTAL dashboard page
    rtalEmorypageobj.click on Search option in Emory RTAL dashboard page
    rtalEmorypageobj.Enter keyword to search in table content  Earth X-ray
    rtalEmorypageobj.verify table content search result
    rtalEmorypageobj.Close Search box in Emory RTAL dashboard page

Login to application and navigate RTAL dashboard and verify No results found message when keyword is not available

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.verify Search option in Emory RTAL dashboard page
    rtalEmorypageobj.click on Search option in Emory RTAL dashboard page
    rtalEmorypageobj.Enter keyword to search in table content  I am Not present
    rtalEmorypageobj.verify table content search result
    rtalEmorypageobj.verify No results found message for table content search
    rtalEmorypageobj.Close Search box in Emory RTAL dashboard page

Login to application and navigate RTAL dashboard and verify default value for verify Switch units drop down list

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.click on Switch units drop down list in Emory RTAL dashboard page
    rtalEmorypageobj.verify default value Switch units dropdown

Login to application and navigate to RTAL dashboard and verify Switch units list of values

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.click on Switch units drop down list in Emory RTAL dashboard page
    rtalEmorypageobj.verify Switch units dropdown list of values

Login to application and navigate RTAL dashboard and verify able to switch units by selecting values from Switch units drop down list

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.verify able to select different units option from Switch units dropdown in Emory RTAL dashboard page

Login to application and navigate RTAL dashboard and verify units Search option available

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.click on Switch units drop down list in Emory RTAL dashboard page
    rtalEmorypageobj.verify units Search box displayed in Switch units drop down list under Emory RTAL dashboard page

Login to application and navigate RTAL dashboard and verify able to Search units

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.click on Switch units drop down list in Emory RTAL dashboard page
    rtalEmorypageobj.click on units Search box displayed in Switch units under Emory RTAL dashboard page
    rtalEmorypageobj.Enter keyword to search in units Search box in Switch units drop down list under Emory RTAL dashboard page  ${SEARCH_UNIT_KEYWORD}
    rtalEmorypageobj.verify units Search search result in Switch units drop down list under Emory RTAL dashboard page

Login to application and navigate RTAL dashboard and verify No results found message when units is not available

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.click on Switch units drop down list in Emory RTAL dashboard page
    rtalEmorypageobj.click on units Search box displayed in Switch units under Emory RTAL dashboard page
    rtalEmorypageobj.Enter keyword to search in units Search box in Switch units drop down list under Emory RTAL dashboard page  I am not present
    rtalEmorypageobj.verify No results found message for units search

Login to application and navigate RTAL dashboard and verify calender option available under EDD column

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.verify calender option available under EDD column

Login to application and navigate RTAL dashboard and verify able to select date from calender option available under EDD column

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.verify able to select date from calender under EDD column

Login to application and navigate RTAL dashboard and verify drop down list available under Disposition column

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.verify Disposition drop down list available under Disposition column

Login to application and navigate RTAL dashboard and verify able to select values from drop down list available under Disposition column

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.verify drop down list available under Disposition column

Login to application and navigate RTAL dashboard and verify Add Barrier text field available under Possible Barriers column

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.verify Add Barrier text field available under Possible Barriers column

Login to application and navigate RTAL dashboard and verify able to Add Barrier under Possible Barriers column

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.verify Add Barrier text field available under Possible Barriers column
    rtalEmorypageobj.Add new custom Barrier and verify custom Barrier added

Login to application and navigate RTAL dashboard and verify able to delete Barrier under Possible Barriers column

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.Delete newly created custom Barrier and verify barrier is not present

Login to application and navigate RTAL dashboard and verify notes text field available under Notes column

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.verify Notes text field available under Notes column

Login to application and navigate RTAL dashboard and verify able to Add Note under Notes column

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.Add Notes and verify Notes added

Login to application and navigate RTAL dashboard and verify able to delete Note under Notes column

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.Delete newly added note and verify note deleted

Login to application and navigate RTAL dashboard and verify able to Vertical scroll with sticky header

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${RTAL_USERNAME}  ${RTAL_USERNAME}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify RTAL option in leftpane
    leftpaneobj.click on RTAL icon
    rtalEmorypageobj.verify Emory RTAL page loaded
    rtalEmorypageobj.verify able to Vertical scroll with sticky header
