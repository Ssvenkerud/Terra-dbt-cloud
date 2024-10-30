// we can also set a deployment environment as being the production one
resource "dbtcloud_environment" "redshift_deployment_environment" {
  for_each = { for conn in var.dbt_cloud_redshift_deployment_environment :
  "${conn.project+conn.name}" =>  conn } 
  dbt_version     = var.dbt_cloud_version 
  name            = "${each.value.name}"
  project_id      = dbtcloud_project.dbt_project[each.key].id
  type            = "deployment"
  deployment_type = "${each.value.type}"
  connection_id   = dbtcloud_global_connection.redshift_provisioned[each.value.redshift_connection].id
}
// we can also set a deployment environment as being the production one
resource "dbtcloud_environment" "redshift_dev_environment" {
  for_each = { for conn in var.dbt_cloud_redshift_dev_environment :
  conn.project =>
  conn } 
  dbt_version     = var.dbt_cloud_version 
  name            = "Dev"
  project_id      = dbtcloud_project.dbt_project[each.key].id
  type            = "development"
  connection_id   = dbtcloud_global_connection.redshift_provisioned[each.value.redshift_connection].id
}

