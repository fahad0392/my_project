*** Variables ***

###########Admin Metrics ##########
# below varialbe is used by admin metric page

${METRICS_NAME}              LengthOfStay
${tablename}                 coi_or
${tabular_action}            Delete selected metrics
${tabular_action}            Delete selected metrics
${DEPARTMENT}                Emergency Department
${WORK AREA}                ED Staffing
${WORK AREA1}               Emergency Room

####### Creating new metric #########

${EXISTING_METRICS_NAME}  LengthOfStay
${NEWMETRICS_NAME}       AutoTest_Metrics
${DESCRIPTION}           This metrics is created by Automation testing
${UNITS}                 minutes
${ABBREVIATION}          tt
${PERMISSION LEVEL}      3
${SAVE_AS_NEW_METRICS_NAME}   AutoTest SaveAsNew Metrics

# DATA TAB
${SQL TABLE}             raw_er
${WHICH TABLE}           raw_er
${TIME_COLUMN}           check_out_time
${SELECT_QUERY}          avg(timestampdiff(minute,check_in_time,check_out_time))
${WHERE_CLAUSE}          (check_out_time IS NOT NULL  and timestampdiff(minute,check_in_time,check_out_time) between 0 and 1700)
${ON_JOINCONDITION}      acrtr

${SELECT_QUERY1}         avg(timestampdiff(minute,roomed_in_ed,MD_start))
${WHERE_CLAUSE1}         discharge_disposition_map = 'pure discharge' AND roomed_in_ED IS NOT NULL and md_start IS NOT NULL and timestampdiff(minute,roomed_in_ed,MD_start) between 0 and 600


# Metric definitions
${METRIC_DEF_NAME}      testmetric
${HOSPITAL}             San Martin
${REGRESSION}           Volume ALL
${Baseline}             1
${Target}               1
${Filters}              xyz
${LastUpdatedStats}     2014-01-01
${LastUpdatedStatstime}   06:08:09
${RowStats}             {}
${Paired_denominator_metric}  ED volume (count)
${Role of paired metric}  Filtered Denominator (translate all filters or error)
${Filters excluded from paired denominator}  abcd

${HOSPITAL1}             Test Hospital 1
${REGRESSION1}           Roomed in ED to MD Assign





