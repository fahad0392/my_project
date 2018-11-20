*** Settings ***
Library         SeleniumLibrary
Resource        ../../admin/admincommon.robot



*** Keywords ***

Navigate to logout link and click on logout

   #click element  xpath=//li[@class='top-user-tools-welcome-msg']
   click element  css=.user-tools-welcome-msg
   ##click element  xpath=//a[text()='Log out']
   click link  Log out


verify admin home page title

   title should be  Site administration | QVENTUS

verify HOME link present in rightpane

   #page should contain link     xpath=(//a[@href='/atc/'])[1]
   page should contain link  css=.breadcrumbs>a
   page should contain element  css=.breadcrumbs>a

click on HOME link in rightpane

   #click link   xpath=(//a[@href='/atc/'])[1]
   click link  css.breadcrumbs>a
   #click element  css=.breadcrumbs>a
