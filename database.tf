resource "snowflake_database" "database1" {
  name                        = "TF_DEMO02"
  comment                     = "Creating 2nd Database to recreate the automation.."
  depends_on = [null_resource.execute_script]
}

resource "snowflake_schema" "schema" {
  database = "TF_DEMO02"
  name     = "WAREHOUSE_CREDITS02"
  comment  = "Creating 2nd Database to recreate the automation.."

  is_transient        = false
  is_managed          = false
  depends_on = [snowflake_database.database1]
}

