
resource "dbtcloud_environment" "snowflake_prod_environment" {
  for_each = { for conn in var.dbt_cloud_snowflake_prod_environment :
    conn.project =>
  conn }
  dbt_version       = var.dbt_cloud_version
  name              = "Prod"
  project_id        = dbtcloud_project.dbt_project[each.key].id
  type              = "deployment"
  deployment_type   = "production"
  credential_id     = dbtcloud_snowflake_credential.snowflake_pk_creds[each.value.snowflake_connection].credential_id
  connection_id     = dbtcloud_global_connection.snowflake_non_sso[each.value.snowflake_connection].id
  use_custom_branch = true
  custom_branch     = var.dbt_prod_branch
  depends_on = [dbtcloud_global_connection.snowflake_non_sso,
    dbtcloud_snowflake_credential.snowflake_pk_creds
  ]
}

resource "dbtcloud_environment" "snowflake_manual_prod_environment" {
  for_each = { for conn in var.dbt_cloud_snowflake_prod_environment :
    conn.project =>
  conn }
  dbt_version       = var.dbt_cloud_version
  name              = "Prod"
  project_id        = dbtcloud_project.dbt_project[each.key].id
  type              = "deployment"
  deployment_type   = "production"
  credential_id     = dbtcloud_snowflake_credential.snowflake_manual_creds[each.value.snowflake_connection].credential_id
  connection_id     = dbtcloud_global_connection.snowflake_non_sso[each.value.snowflake_connection].id
  use_custom_branch = true
  custom_branch     = var.dbt_prod_branch
  depends_on = [dbtcloud_global_connection.snowflake_non_sso,
    dbtcloud_snowflake_credential.snowflake_manual_creds
  ]
}

// we can also set a deployment environment as being the production one
resource "dbtcloud_environment" "snowflake_deployment_environment" {
  for_each = { for idx, conn in var.dbt_cloud_snowflake_deployment_environment :
  idx => conn }
  dbt_version     = var.dbt_cloud_version
  name            = each.value.name
  project_id      = dbtcloud_project.dbt_project[each.value.project].id
  type            = "deployment"
  deployment_type = each.value.type
  connection_id   = dbtcloud_global_connection.snowflake_non_sso[each.value.snowflake_connection].id
  credential_id   = dbtcloud_snowflake_credential.snowflake_pk_creds[each.value.snowflake_connection].credential_id
  depends_on = [dbtcloud_global_connection.snowflake_non_sso,
    dbtcloud_snowflake_credential.snowflake_pk_creds
  ]
}


resource "dbtcloud_environment" "snowflake_dev_environment" {
  for_each = { for conn in var.dbt_cloud_snowflake_dev_environment :
    conn.project =>
  conn }
  dbt_version   = var.dbt_cloud_version
  name          = "Dev"
  project_id    = dbtcloud_project.dbt_project[each.key].id
  type          = "development"
  connection_id = dbtcloud_global_connection.snowflake_sso[each.value.snowflake_connection].id
  depends_on    = [dbtcloud_global_connection.snowflake_sso]
}


