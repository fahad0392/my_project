*** Variables ***

####### Authentication and Authorization #########
${SEARCH_USER_NAME}           amd_admin
${ACTIVE_VALUE}               Yes

####### Creating new user in Add user screen #########

###General########

${FIRST_NAME}         firstnametest
${LAST_NAME}          lastnametest
${NEW_USER_EMAIL}     ram@rl.com
${NEW_USERNAME}       automationuser
${PASSWORD1}          Password1
#${PASSWORD_CONFIRMATION)

###Hospital/WorkArea########

${HOSPITALS}           Hospital A
${PRIMARYHOSPITAL}     San Martin
${DEPARTMENT}          Operating Room
${WORKAREA}            Emergency Room
${PRIMARYWORKAREA}     ED Staffing
${GROUPS}              pooja_dashboard_group

###Permissions########

${USERPERMISSION}      admin | log entry | Can delete log entry
${GROUPS}              Local Staff
${PERMISSION_LEVEL}    1

###Contacts########
${PHONE}      1-541-754-3010
${FAX}        1-541-754-3010
${VOCERID}    9090

##############  Identity #############

${SELECT_IMPORTANT_COLUMN}  staffing_master.pay_period_end


############# Membership #############

###Add Dashboard Membership###

${DASHBOARD_MEMERSHIPS}   A good dash
${TYPE_MEMERSHIPS}  user

###########  Add email report membership###

${EREPORT_MEMBERSHIPS}  Test Email Report - Sorting

######### Add Decision Module Membership page ####

${DECISION_MODULE_MEMBERSHIPS}  Surge Warning(Test Hospital 3)

##########Smart Alert Membership page#########

${SMART_IALERTS_MEMBERSHIPS}  Average patient satisfaction





