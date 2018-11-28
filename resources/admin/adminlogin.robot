*** Settings ***
Documentation    Suite description

Resource    ../../resources/admin/pom/adminloginpageobj.robot
Resource    ../../resources/admin/pom/adminhomepageobj.robot


*** Keywords ***

Login with valid adminuser and adminpassword

    adminloginpageobj.load adminlogin page
    adminloginpageobj.Enter admin username
    adminloginpageobj.Enter admin password
    adminloginpageobj.click on adminlogin button
    adminloginpageobj.verify adminuser loged in

Invalid username + Invalid password

    adminloginpageobj.load adminlogin page
    adminloginpageobj.Enter invalidadmin username
    adminloginpageobj.Enter invalidadmin password
    adminloginpageobj.click on adminlogin button
    adminloginpageobj.verify invalid login

Invalid username + valid password

    adminloginpageobj.load adminlogin page
    adminloginpageobj.Enter invalidadmin username
    adminloginpageobj.Enter admin password
    adminloginpageobj.click on adminlogin button
    adminloginpageobj.verify invalid login

valid username + invalid password

    adminloginpageobj.load adminlogin page
    adminloginpageobj.Enter invalidadmin username
    adminloginpageobj.Enter invalidadmin password
    adminloginpageobj.click on adminlogin button
    adminloginpageobj.verify invalid login
    adminloginpageobj.load adminlogin page

verify adminusername field validation

    adminloginpageobj.load adminlogin page
    adminloginpageobj.Enter admin password
    adminloginpageobj.click on adminlogin button
    adminloginpageobj.verify Username required field


verify adminpassword field validation

    adminloginpageobj.load adminlogin page
    adminloginpageobj.Enter admin username
    adminloginpageobj.click on adminlogin button
    adminloginpageobj.verify password required field


Verify admin signout

    adminlogin.Login with valid adminuser and adminpassword
    adminhomepageobj.verify admin home page title
    adminhomepageobj.Navigate to logout link and click on logout
    adminloginpageobj.verify adminlogout page

verify staffuser should not have access to admin

    adminloginpageobj.load adminlogin page
    adminloginpageobj.Fill Login page and submit  ${USERNAME}  ${PASSWORD}
    adminloginpageobj.verify staffuser should not have access to admin modules

verify Non staffuser should not have access to admin

    adminloginpageobj.load adminlogin page
    adminloginpageobj.Fill Login page and submit  ${USERNAME1}  ${PASSWORD1}
    adminloginpageobj.verify invalid login
