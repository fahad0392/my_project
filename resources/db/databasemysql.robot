*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     DatabaseLibrary
Library     OperatingSystem
Library     String
Library     Dialogs
Library     SSHLibrary
Library     DateTime

Resource        ../../resources/amd/common.robot


*** Variables ***

#Suite Setup     Connect To Database     pymysql     ${DBName}   ${DBUser}   ${DBPass}   ${DBHost}   ${DBPort}
#Suite Teardown  Disconnect From Database

*** Keywords ***

Connect to mysql database

    Connect To Database     pymysql     ${DBName}   ${DBUser}   ${DBPass}   ${DBHost}   ${DBPort}

Disconnect mysql database

    Disconnect from Database

Check If Exists In DB - username present

    Check If Exists In Database    select username from auth_user where username='${USERNAME}';

Check If Not Exists In DB -username not present

    Check If Not Exists In Database    select username from auth_user where username='autouser11';


verify Table Must Exist 'auth_user'

    Table Must Exist    auth_user

Verify Row Count is Equal to X

    Row Count is Equal to X    select username from auth_user;    7

Verify Row Count is Less Than X

    Row Count is Less Than X    select username from auth_user;    8

Verify Row Count is Greater Than X

    Row Count is Greater Than X    SELECT * FROM auth_user;    1

Retrieve Row Count from auth_user table

    ${output} =    Row Count    select username from auth_user;
    Log    ${output}
    #Should Be Equal As Strings    ${output}    7

Retrieve records from auth_user table

    @{output} =    query    select * from auth_user;
    Log Many    @{output}
