/*resource "snowflake_resource_monitor" "monitor" {
  name         = "TF_DEMO_RSM_00"
  credit_quota = 10
  warehouse = [COMPUTE_WH]
  frequency       = "DAILY"
  start_timestamp = "IMMIDIATELY"

  notify_triggers            = [60, 75, 80, 90,]
  suspend_triggers           = 90
  suspend_immediate_triggers = 100
}*/