*** Variables ***

####### Homepage #########

${USERNAME}       mudit
${FIRST NAME}     Mudit
${LAST NAME}      Garg
${YOUR_FACILITIES}  Rose de Lima
${HOME_DASHBOARD_SEARCH}  BIDMC NICU Example
${HOME_METRIC_SEARCH}  Test Hospital 1:Disposition to exit - D/C

#Recent Dashboards
#${HOME_RECENT_DASHBOARD}  BIDMC NICU Example

# Recent Metrics
#${HOME_RECENT_METRIC}  Disposition to exit - D/C

####### Dashboard #########
# create a new dashboard

${CREATE_DASHBOARD}  My new dash

# Owner list
${DASHBOARD1}   A good dash
${DASHBOARD2}   BIDMC NICU Example

# Editor list
${EDITOR_DASHBOARD1}   St. Joseph Staffing
${EDITOR_DASHBOARD2}   Testing New Analysis

# Viewer list
${VIEWER_DASHBOARD1}   Automation dash view
${VIEWER_DASHBOARD2}   Automationdash



##########

###Add Key Metric####

#########

# Which hospital is this metric in?

${Which hospital is this metric in?}  Test Hospital 2

# Which department, if any, is this metric associated with?

${Which department is this metric in?}  Emergency Room

#Finally, choose your metric

${Finally choose your metric}  Roomed in ED to MD Start - Admit


############################

#Metrics

############################


#select Hospitals

${HOSPITALS_METRICS}  Test Hospital 2

#Work Areas
${WORKAREAS_METRICS}  Emergency Room
#${WORKAREAS_METRICS}  ED Staffing


#search for Metrics 

${METRIC_METRICS}  Roomed in ED to MD Start - Admit

#Time Intervals

############################

#Alerts

############################

##Smart Alert##

${ALERT_SELECT_METRICS}  Hospital A - LengthOfStay
${ALERT_THRESHOLD}  5
${ALERT_MONITOR_THIS_METRIC_BY}  acuity
${ALERT_MONITOR_IT_FOR}  Beier, Lorrie

##Basic Alert###

${ALERT_AVERAGE_OVER}  3 days
${ALERT_TRIGGER_WHEN}  below
${ALERT_BASIC_THRESHOLD}  6
${ALERT_NOTIFY_ME_AT_MOST_ONCE_EVERY}  Month

