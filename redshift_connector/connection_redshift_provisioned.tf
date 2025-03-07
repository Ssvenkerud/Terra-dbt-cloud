
data "dbtcloud_privatelink_endpoint" "private_link_id" {
  for_each = { for conn in var.dbt_cloud_redshift_connections : conn.name => conn } 

  name = each.value.private_link_endpoint_id
 }

resource "dbtcloud_global_connection" "redshift_provisioned" {
  for_each = { for conn in var.dbt_cloud_redshift_connections : conn.name => conn } 
  name = each.key
  private_link_endpoint_id = data.dbtcloud_privatelink_endpoint.private_link_id[each.value.name].id 
  redshift = {
    hostname = each.value.hostname
    port     = 5439
    // optional fields
    dbname = each.value.dbname
    // it is possible to set settings to connect via SSH Tunnel as well
  }
}

resource "dbtcloud_postgres_credential" "redshift_prod_credential" {
  for_each = { for conn in var.dbt_cloud_redshift_prod_environment : conn.project => conn } 
  project_id     = dbtcloud_project.dbt_project[each.key].id
  type           = "redshift"
  default_schema = ""
  username       = var.dbt_cloud_redshift_prod_username
  password       = var.dbt_cloud_redshift_prod_password
  num_threads    = var.dbt_cloud_redshift_prod_threads

}
