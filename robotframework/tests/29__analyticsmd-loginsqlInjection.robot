*** Settings ***
Documentation    Suite description

Resource        ../resources/amd/common.robot   # necessary for Setup & Teardown
Resource        ../resources/amd/login.robot    # necessary for lower level keywords in test cases
Library         SeleniumLibrary

Test Setup       Begin Test
Test Teardown    End Test
#Suite Setup      Connect To Database
#Suite Teardown   Disconnect From Database

# Copy/paste the below command to Terminal to execute:
# pybot -d results/login tests/29__analyticsmd-loginsqlInjection.robot

*** Test Cases ***

As a dbadmin verify "auth_user" table present in database

     [Tags]

     verify auth_user table present in database

As a dbadmin get count and records from auth_user table

     [Tags]

     verify records from auth_user table


As a dbadmin verify database present after passing a query drop database in username field

     [Tags]

     verify database present after passing a query drop database in username field

Login Bypass Using SQL Injection

     [Tags]

     verify login validation message while injecting sql

As a dbadmin verify 'auth_user' table present in database

     [Tags]

     verify auth_user table present in database

As a dbadmin verify auth_user present after passing a query drop auth_user in username field

     [Tags]

     verify auth_user present after passing a query drop auth_user in username field

As a dbadmin verify auth_user table present in database

     [Tags]

     verify auth_user table present in database

As valid user able to login into application

     [Tags]

     verify user with valid credentials able to login

As user try to inject sql in username field in login

     [Tags]

     bypass-login-using-sql-injection

As valid user able to login into application after sql injection

      [Tags]

     verify user with valid credentials able to login