resource "snowflake_resource_monitor" "monitor3" {
  name         = "TF_DEMO_RSM_03"
  credit_quota = 100
  warehouses = ["TF_VWH_4TH"]
  frequency       = "MONTHLY"
  start_timestamp = "IMMEDIATELY"

  notify_triggers            = [60, 75, 80, 90,]
  suspend_trigger           = 90
  suspend_immediate_trigger = 100
  depends_on = [null_resource.execute_script]
}