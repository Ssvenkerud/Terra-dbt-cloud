// we can also set a deployment environment as being the production one
resource "dbtcloud_environment" "redshift_prod_environment" {
  for_each = { for conn in var.dbt_cloud_redshift_prod_environment :
  conn.project =>
  conn } 
  dbt_version     = var.dbt_cloud_version 
  name            = "Prod"
  project_id      = dbtcloud_project.dbt_project[each.key].id
  type            = "deployment"
  deployment_type = "production"
  connection_id   = dbtcloud_global_connection.redshift_provisioned[each.value.redshift_connection].id
}
