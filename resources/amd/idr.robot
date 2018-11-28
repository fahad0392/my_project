*** Settings ***
Documentation    Suite description

Resource    ../../resources/amd/pom/signinobj.robot
Resource    ../../resources/amd/pom/leftpaneobj.robot
Resource    ../../resources/amd/pom/homepageobj.robot
Resource    ../../resources/amd/pom/idrpageobj.robot

*** Keywords ***

Login to application and navigate to IDR page

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded

Login to application and navigate to IDR dashboard and verify page

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.verify IDR dashboard page

Login to application and navigate to IDR dashboard and verify SORT BY list of values

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.verify SORT BY dropdown list of values

navigate IDR dashboard and verify default value for SORT BY: drop down list

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.verify default value SORT BY dropdown

navigate to IDR dashboard page and verify sort by different options available from SORT BY drop down list

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.verify able to select different sort option from SORT BY dropdown


Login to application and navigate to IDR dashboard and verify Switch units list of values

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.verify Switch units dropdown list of values

navigate IDR dashboard and verify default value for verify Switch units drop down list

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.verify default value Switch units dropdown

navigate to IDR dashboard page and verify sort by different options available from Switch units drop down list

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.verify able to select different units option from Switch units dropdown


navigate to IDR dashboard and verify dispositions list of values

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.verify disposition dropdown list of values

navigate to IDR dashboard page and verify different options available from Disposition drop down list

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.verify able to select different option from Disposition dropdown

navigate to IDR dashboard page and verify able to Select/unselect flags if avaialbe under Possible Barriers

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.verify able to select and unselect flags under Possible Barriers

navigate to IDR dashboard page and verify able to enter notes under Notes column

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.Enter noted under Notes field

navigate to IDR dashboard page and delete able to enter notes under Notes column

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.verify able to delete under Notes field


navigate to IDR dashboard page and verify date picker under EDD column

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.verify date picker EDD column


navigate to IDR dashboard page and Select date from date picker under EDD column

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.Select EDD date from date picker

navigate to IDR dashboard page and verify date picker has 2 months calender under EDD column

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.verify two month calender is displayed in date picker


navigate to IDR dashboard page and verify Patient name format under Patient

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded

navigate other module available under left pane from IDR Dashboard

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.verify able to navigate other module from IDR dashboard

verify staff user able to access IDR EDD Export

    idrpageobj.navigate to IDR EDD Export link
    signinobj.Fill Login page and submit  ${USERNAME}  ${PASSWORD}
    idrpageobj.verify access denied message should not displayed IDR - EDD Export

verify non staff user not able to access IDR EDD Export

    idrpageobj.navigate to IDR EDD Export link
    signinobj.Fill Login page and submit  ${USERNAME1}  ${PASSWORD1}
    idrpageobj.verify access denied message IDR - EDD Export

staff user login to application and able to access IDR - EDD Export

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${USERNAME}  ${PASSWORD}
    homepageobj.verify AMD home page loaded
    idrpageobj.navigate to IDR EDD Export link
    idrpageobj.verify access denied message should not displayed IDR - EDD Export

staff user login to application and not able to access IDR - EDD Export

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${USERNAME1}  ${PASSWORD1}
    homepageobj.verify AMD home page loaded
    idrpageobj.navigate to IDR EDD Export link
    idrpageobj.verify access denied message IDR - EDD Export

login to application and able to access IDR and verify print option available in IDR page

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.verify print option in IDR page

login to application and able to access IDR and verify able to print in IDR page

    signinobj.load login page
    signinobj.login page loaded
    signinobj.Fill Login page and submit  ${IDR_USERNAME}  ${IDR_PASSWORD}
    homepageobj.verify AMD home page loaded
    leftpaneobj.verify IDR option in leftpane
    leftpaneobj.click on Patient List icon
    idrpageobj.verify AMD IDR page loaded
    idrpageobj.verify print option in IDR page
    idrpageobj.click on print option in idr page
