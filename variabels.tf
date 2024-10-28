variable "dbt_cloud_projects" {
  type    = list(string)
  default = ["demo"]
}

variable "dbt_cloud_redshift_connections" {
    type = list(object({
        name = string
        private_link_endpoint_id = string
        hostname = string
        dbname = string
  }))
  default = [
  {
    name = "demo_connection"
    private_link_endpoint_id = "dummy_link"
    hostname = "dummy host"
    dbname = "dev"
  }
  ]
}
 
