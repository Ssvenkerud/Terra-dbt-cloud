
resource "dbtcloud_global_connection" "snowflake" {
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
