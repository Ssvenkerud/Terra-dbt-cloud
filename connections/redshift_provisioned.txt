resource "dbtcloud_global_connection" "redshift_provisioned" {
  name = "var.connection.name"
  private_link_endpoint_id =
  redshift = {
    hostname = "var.connection.host"
    port     = 5439
    // optional fields
    dbname = "var.conection.db"
    // it is possible to set settings to connect via SSH Tunnel as well
  }
}
