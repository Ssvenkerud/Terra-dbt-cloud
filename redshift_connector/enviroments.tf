// we can also set a deployment environment as being the production one
resource "dbtcloud_environment" "redshift_deployment_environment" {
  for_each = { for idx, conn in var.dbt_cloud_redshift_deployment_environment :
  idx => conn }
  dbt_version     = var.dbt_cloud_version
  name            = each.value.name
  project_id      = dbtcloud_project.dbt_project[each.value.project].id
  type            = "deployment"
  deployment_type = each.value.type
  connection_id   = dbtcloud_global_connection.redshift_provisioned[each.value.redshift_connection].id
}
// we can also set a deployment environment as being the production one
resource "dbtcloud_environment" "redshift_dev_environment" {
  for_each = { for conn in var.dbt_cloud_redshift_dev_environment :
    conn.project =>
  conn }
  dbt_version   = var.dbt_cloud_version
  name          = "Dev"
  project_id    = dbtcloud_project.dbt_project[each.key].id
  type          = "development"
  connection_id = dbtcloud_global_connection.redshift_provisioned[each.value.redshift_connection].id
  depends_on    = [dbtcloud_global_connection.redshift_provisioned]
}
resource "dbtcloud_environment" "redshift_prod_environment" {
  for_each = { for conn in var.dbt_cloud_redshift_prod_environment :
    conn.project =>
  conn }
  dbt_version       = var.dbt_cloud_version
  name              = "Prod"
  project_id        = dbtcloud_project.dbt_project[each.key].id
  type              = "deployment"
  deployment_type   = "production"
  connection_id     = dbtcloud_global_connection.redshift_provisioned[each.value.redshift_connection].id
  credential_id     = dbtcloud_postgres_credential.redshift_prod_credential[each.key].credential_id
  use_custom_branch = true
  custom_branch     = var.dbt_prod_branch
  depends_on        = [dbtcloud_global_connection.redshift_provisioned]
}


