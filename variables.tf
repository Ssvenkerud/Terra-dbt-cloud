variable "dbt_cloud_projects" {
  type    = list(string)
  default = ["demo"]
}

variable "dbt_cloud_redshift_conection" {
    type = list(object({
    name = string
    host = string
    dbname = string
}))
default = [
{
name = demo_conection
host = host_123
db_name = dwh
}
]
}

variable "dbt_cloud_verion"{
type = string
default = "verionless"
}

