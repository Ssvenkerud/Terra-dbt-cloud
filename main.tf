terraform {
  required_providers {
    dbtcloud = {
      source  = "dbt-labs/dbtcloud"
      version = "~> 0.3"
    }
  }
}


module "projects"{
source = "./projects"
}

module "access_controll" {
source = "./access_controll"
}


module "connections" {
source = "./connections"
}


module "enviroments" {
source = "./enviroments"
}


module "git_repositories" {
source = "./git-repositories"
}

resource "dbtcloud_global_connection" "redshift_provisioned" {
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
