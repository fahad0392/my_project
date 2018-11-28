*** Settings ***
Documentation    Suite description

Resource        ../resources/admin/admincommon.robot   # necessary for Setup & Teardown
Resource        ../resources/admin/adminlogin.robot    # necessary for lower level keywords in test cases
Resource        ../resources/admin/adminusermanagement.robot   # necessary for lower level keywords in test cases

Library         SeleniumLibrary

Suite Setup      Start USERsuite
Test Setup       verify autotest user data present if yes cleanup NEWUSER
Test Teardown    End User test
Suite Teardown   End USERsuite


# Copy/paste the below command to Terminal to execute:
# pybot -d results/admin -i admin tests/adminUserManagement.robot


*** Test Cases ***

1__Admin user should able to see USERS page

   [Tags]  regression-test  admin-usermanagement  daily-smoketest

   valid admin user should able to navigate to Users page

2__Admin user should able to navigate ADD USER page

   [Tags]  regression-test  admin-usermanagement

   valid admin user should able to navigate to ADD USER page

3__Admin user should able to navigate to ADD USER page and fill out General details save

   [Tags]  regression-test  admin-usermanagement

   valid admin user should able to navigate to ADD USER page and fill out General details

4__Admin user should able to seach newly created user in Users page and able to edit

   [Tags]  regression-test  admin-usermanagement

   validate admin user should able to search new user created and able to edit

5__As Admin user validate First name is mandatory field under General tab

   [Tags]  regression-test  admin-usermanagement

   validate required First name field validation under general tab

6__As Admin user validate Last name is mandatory field under General tab

    [Tags]  regression-test  admin-usermanagement

   validate required Last name field validation under general tab

7__As Admin user validate Email is mandatory field under General tab

    [Tags]  regression-test  admin-usermanagement

   validate required Email field validation under general tab

8__As Admin user validate username is mandatory field under General tab

    [Tags]  regression-test  admin-usermanagement

   validate required username field validation under general tab

9__As Admin user Password is mandatory field under General tab

    [Tags]  regression-test  admin-usermanagement

   validate required Password field validation under general tab

10__As Admin user Password confirmation is mandatory field under General tab

    [Tags]  regression-test  admin-usermanagement

   validate required Password confirmation field validation under general tab

11__As Admin user verify A user with that username already exists message

    [Tags]  regression-test  admin-usermanagement

   validate cannot use duplicate username

12__As Admin user verify field are present under HOSPITAL/WORKAREA tab

   [Tags]  regression-test  admin-usermanagement

   verify fields under Hospital/WorkArea present in tab

13__Admin user should able to navigate to ADD USER page and fill out HOSPITAL/WORKAREA save

   [Tags]  regression-test  admin-usermanagement

   valid admin user should able to navigate to Hospital/WorkArea tab

14__As Admin user Hospitals is mandatory field under HOSPITAL/WORKAREA tab

    [Tags]  regression-test  admin-usermanagement

   validate required Hospitals field validation under HOSPITAL/WORKAREA tab

15__As Admin user verify no exception after clicking Click Save and continue button when no value for Hospitals and PrimaryHospital is selected

    [Tags]  regression-test  admin-usermanagement

   verify no exception after clicking Click Save and continue button when no value for Hospitals and PrimaryHospital is selected

16__As Admin user verify no exception after clicking Click Save button when no value for Hospitals and PrimaryHospital is selected

    [Tags]  regression-test  admin-usermanagement

   verify no exception after clicking Click Save button when no value for Hospitals and PrimaryHospital is selected

############ PERMISSIONS############

17__As Admin user verify field are present under PERMISSIONS tab

   [Tags]  regression-test  admin-usermanagement

   verify fields under PERMISSIONS present in tab

18__Admin user should able to navigate to ADD USER page and fill out PERMISSIONS save

   [Tags]  regression-test  admin-usermanagement

   valid admin user should able to navigate to Permissions tab

19__As Admin user Permission Level is mandatory field under PERMISSIONS tab

    [Tags]  regression-test  admin-usermanagement

   validate required Permission Level field validation under PERMISSIONS tab

############ CONTACTS ############

20__As Admin user verify field are present under CONTACTS tab

   [Tags]  regression-test  admin-usermanagement

   verify fields under CONTACTS present in tab

21__Admin user should able to navigate to ADD USER page and fill out CONTACTS save

   [Tags]  regression-test  admin-usermanagement

   valid admin user should able to navigate to CONTACTS tab

############ IDENTITY ############

22__As Admin user verify field are present under IDENTITY tab

   [Tags]  regression-test  admin-usermanagement

   verify fields under IDENTITY present in tab

23__Admin user should able to navigate to ADD USER page and fill out IDENTITY TAB and save

   [Tags]  regression-test  admin-usermanagement

   valid admin user should able to navigate to IDENTITY tab

############ MEMBERSHIP  ############

24__As Admin user verify field are present under MEMBERSHIP tab

   [Tags]  regression-test  admin-usermanagement

   verify fields under MEMBERSHIP present in tab

25__As Admin user verify able to click on ADD Dashboards button under MEMBERSHIP tab and verify Add Dashboard Membership page

   [Tags]  regression-test  admin-usermanagement

   verify able to click on ADD Dashboards button under MEMBERSHIP tab and verify Add Dashboard Membership page

26__As Admin user verify able to add Dashboard Membership from MEMBERSHIP tab

   [Tags]  regression-test  admin-usermanagement

   verify able to add Dashboard Membership from MEMBERSHIP tab

27__As Admin user verify able to remove Dashboard Membership under MEMBERSHIP tab

   [Tags]  regression-test  admin-usermanagement

   verify able to remove Dashboard Membership under MEMBERSHIP tab

28__As Admin user verify able to click on ADD Email Reports button under MEMBERSHIP tab and verify Add email report membership page

   [Tags]  regression-test  admin-usermanagement

   verify able to click on ADD Email Reports button under MEMBERSHIP tab and verify Add email report membership page

29__As Admin user verify able to add email report membership from MEMBERSHIP tab

   [Tags]  regression-test  admin-usermanagement

   verify able to add email report membership from MEMBERSHIP tab

30__As Admin user verify able to remove email report membership from MEMBERSHIP tab

   [Tags]  regression-test  admin-usermanagement

   verify able to remove email report membership from MEMBERSHIP tab

31__As Admin user verify able to click on ADD Decision Modules button under MEMBERSHIP tab and verify Add Decision Module Membership page

   [Tags]  regression-test  admin-usermanagement

   verify able to click on ADD Decision Modules button under MEMBERSHIP tab and verify Add Decision Module Membership page

32__As Admin user verify able to Add Decision Module Membership from MEMBERSHIP tab

   [Tags]  regression-test  admin-usermanagement

   verify able to Add Decision Module Membership from MEMBERSHIP tab

33__As Admin user verify able to remove Decision Module Membership from MEMBERSHIP tab

   [Tags]  regression-test  admin-usermanagement

   verify able to remove Decision Module Membership from MEMBERSHIP tab

34__As Admin user verify able to click on ADD Smart Alerts button under MEMBERSHIP tab and verify Add Smart Alert Memberships page

   [Tags]  regression-test  admin-usermanagement

   verify able to click on ADD Smart Alerts button under MEMBERSHIP tab and verify Add Smart Alert Memberships page

35__As Admin user verify able to Add Smart Alerts Membership from MEMBERSHIP tab

   [Tags]  regression-test  admin-usermanagement

   verify able to Add Smart Alerts Membership from MEMBERSHIP tab

36__As Admin user verify able to remove Smart Alerts Membership from MEMBERSHIP tab

   [Tags]  regression-test  admin-usermanagement

   verify able to remove Smart Alerts Membership from MEMBERSHIP tab

############### scenario ###########

37__As admin user create a new USER

   [Tags]  regression-test  admin-usermanagement  daily-smoketest

   verify able to create new user

38__As admin user create a new USER with Staff status permission

    [Tags]  regression-test  admin-usermanagement

   verify able to create new user Staff

39__As admin user create a new USER with Superuser status permission

    [Tags]  regression-test  admin-usermanagement

   verify able to create new Superuser user

40__As admin user create a new USER with staff & Superuser status permission

    [Tags]  regression-test  admin-usermanagement

   verify able to create new user by selecting staff & Superuser user permission

41__As admin user should able to edit USER and modify and save

    [Tags]  regression-test  admin-usermanagement

   verify able to user should able to edit USER and modify and save


42__As Admin user should be able to do simple user search

    [Tags]  regression-test  admin-usermanagement  daily-smoketest

    simple user search

43__As Admin user should be able to do user search by filtering active status

    [Tags]  regression-test  admin-usermanagement

    verify user search using by selecting active list

44__As Admin user should be able to do user search by filtering staff status

    [Tags]  regression-test  admin-usermanagement

    verify user search by selecting value from staff drop down list

45__As Admin user should be able to do user search by filtering superuser status

    [Tags]  regression-test  admin-usermanagement

    verify user search by selecting value from superuser drop down list

46__As Admin user should be able to do user search by filtering groups status

    [Tags]  regression-test  admin-usermanagement

    verify user search by selecting value from groups drop down list

47__As Admin user should be able to do user search by filtering By hospital

    [Tags]  regression-test  admin-usermanagement

    verify user search by selecting value from By hospital drop down list

48__As Admin user should be able to do to reset filters when 0 users search result

    [Tags]  regression-test  admin-usermanagement

    verify able to do user reset by clicking link try to reset filters

49__As Admin user should be able to navigate to history page

    [Tags]  regression-test  admin-usermanagement

    verify user should be able to navigate to history page