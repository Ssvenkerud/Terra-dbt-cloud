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


