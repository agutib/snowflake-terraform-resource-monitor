resource "snowflake_table" "table" {
  database            = snowflake_database.database1.name
  schema              = snowflake_schema.schema.name
  name                = "VWH_CREDIT_QUOTA2"

  column {
    name     = "WAREHOUSE_NAME"
    type     = "VARCHAR"
    nullable = true

  }
  column {
    name     = "MONITOR_NAME"
    type     = "VARCHAR"
    nullable = true

  }
  column {
    name     = "MONTHLY_ALLOCATION"
    type     = "NUMBER"
    nullable = true
  }
  depends_on = [snowflake_schema.schema]
}


