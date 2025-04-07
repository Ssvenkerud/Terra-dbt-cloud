
resource "dbtcloud_global_connection" "snowflake_sso" {
  for_each = { for conn in var.dbt_cloud_snowflake_connections_sso : conn.name => conn }
  name     = each.key
  snowflake = {
    account   = each.value.account
    database  = each.value.dbname
    warehouse = each.value.warehouse
    role      = each.value.role

    client_session_keep_alive = each.value.client_session_keep_alive
    allow_sso                 = true
    oauth_client_id           = var.snowflake_oauth_client_id
    oauth_client_secret       = var.snowflake_oauth_client_secret
  }
}
resource "dbtcloud_global_connection" "snowflake_non_sso" {
  for_each = { for conn in var.dbt_cloud_snowflake_connections_non_sso : conn.name => conn }
  name     = each.key
  snowflake = {
    account   = each.value.account
    database  = each.value.dbname
    warehouse = each.value.warehouse
    role      = each.value.role

    client_session_keep_alive = each.value.client_session_keep_alive
  }
}

resource "dbtcloud_snowflake_credential" "snowflake_pk_creds" {
  for_each    = { for conn in var.snowflake_pk_creds : conn.snowflake_connection => conn }
  project_id  = dbtcloud_project.dbt_project[each.value.project].id
  auth_type   = "keypair"
  num_threads = "16"
  schema      = ""
  user        = each.value.username
  private_key = each.value.private_key
}
