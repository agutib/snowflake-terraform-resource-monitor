terraform {
  required_providers {
    snowflake = {
      source  = "snowflake-labs/snowflake"
      version = "~> 0.59"
    }
  }
}

provider "snowflake" {
  role  = "ACCOUNTADMIN"
}

/*data "local_file" "fix_quota" {
  filename = "${path.module}/wh_quota_plus_balance.csv"
}

data "snowflake_stage" "existing_stage" {
  name     = "MY_INT_STAGE"
  database = "TF_DEMO"
  schema   = "Warehouse_credits"
}

data "snowflake_table" "existing_table" {
  name     = "VWH_CREDIT_QUOTA"
  database = "TF_DEMO"
  schema   = "Warehouse_credits"
}

resource "snowflake_task" "execute_task" {
  name          = "tf_task_01"
  warehouse     = "COMPUTE_WH"
  sql_statement = "COPY INTO ${data.snowflake_table.existing_table.fully_qualified_name} FROM @${data.snowflake_stage.existing_stage.fully_qualified_name} FILE_FORMAT = (FORMAT_NAME = 'example_file_format')"
}

resource "snowflake_file_format" "example_file_format" {
  name            = "example_file_format"
  format_type     = "CSV"
  field_delimiter = ","
  skip_header     = 1
}*/
  resource "null_resource" "execute_script" {
  depends_on = [snowflake_task.execute_task]
  provisioner "local-exec" {
    command = "python3 script.py"
  }
}

