*** Settings ***

Library         SeleniumLibrary
Library         robot.libraries.String
Library         Collections
Library         OperatingSystem
Library         robot.libraries.DateTime



Resource        ../mccommon.robot

*** Variables ***



*** Keywords ***


MCload custom dashboard page

   go to   ${MC_CUSTOM_URL}


