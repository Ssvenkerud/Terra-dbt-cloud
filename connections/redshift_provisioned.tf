resource "dbtcloud_global_connection" "redshift_provisioned" {
  provider = dbtcloud
  for_each = { for conn in var.dbt_cloud_redshift_connections : conn.name => conn } 
  name = each.key
  private_link_endpoint_id = each.value.private_link_endpoint_id
  redshift = {
    hostname = each.value.hostname
    port     = 5439
    // optional fields
    dbname = each.value.dbname
    // it is possible to set settings to connect via SSH Tunnel as well
  }
}
