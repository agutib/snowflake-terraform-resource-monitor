/*resource "snowflake_warehouse" "warehouse4" {
  name           = "TF_VWH_4TH"
  warehouse_size = "xsmall"
  auto_suspend = 300
  auto_resume = true
  min_cluster_count = 1
  max_cluster_count = 5
  max_concurrency_level = 4
  scaling_policy = "Standard"
  statement_timeout_in_seconds = 14400
  depends_on = [null_resource.execute_script]
}*/