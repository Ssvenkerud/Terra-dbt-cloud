variable "dbt_cloud_projects" {
  type    = list(string)
  default = ["demo"]
}
variable "dbt_cloud_admin_enabled" {
  type = bool
  default = false
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

variable "dbt_cloud_version" {
  type = string 
 }

variable "dbt_prod_branch" {
  type = string
}
variable "dbt_cloud_redshift_deployment_environment" {

 type = list(object({
    project = string
    redshift_connection = string
    name = string
    type = string
 })) 
default = [
{ 
    project = "temp"
    redshift_connection = "demo_connection"
    name = "Prod"
    type = "production"
    },
    { 
    project = "temp"
    redshift_connection = "demo_connection"
    name = "Stage"
    type = "stageing"
    },
    { 
    project = "temp"
    redshift_connection = "demo_connection"
    name = "QA"
    type = ""
    }
]
}

variable "dbt_cloud_self_hosted_git" {
 type = list(object({
  project = string
  url = string
 })) 
}

variable "dbt_cloud_redshift_dev_environment" {
 type = list(object({
    project = string
    redshift_connection = string
 })) 
}
variable "dbt_cloud_redshift_prod_environment" {
 type = list(object({
    project = string
    redshift_connection = string
 })) 
}
