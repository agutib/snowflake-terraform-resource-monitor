terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.59"
    }
  }
}

provider "snowflake" {
  role  = "SYSADMIN"
}

resource "snowflake_resource_monitor" "monitor" {
  name         = "TF_DEMO_RSM_01"
  credit_quota = 100

  frequency       = "DAILY"
  start_timestamp = "IMMIDIATELY"

  notify_triggers            = [50, 60, 70, 80, 90, 99, 100]
  suspend_triggers           = 90
  suspend_immediate_triggers = 100
}
