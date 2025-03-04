terraform {
  required_providers {
    dbtcloud = {
      source  = "dbt-labs/dbtcloud"
      version = "0.3.19"
    }
  }
}

provider "dbtcloud" {
  account_id = var.dbt_cloud_account_id
  token      = var.dbt_cloud_token
  host_url   = "https://emea.dbt.com/api"
}

module "terra_dbt_cloud_base" {
  source = "git@github.com:Ssvenkerud/Terra-dbt-cloud.git//base_module?ref=0.2.1"

  dbt_cloud_projects      = var.dbt_cloud_projects
  dbt_cloud_version       = var.dbt_cloud_version
  dbt_prod_branch         = var.dbt_prod_branch
  dbt_cloud_admin_enabled = var.dbt_cloud_admin_enabled

  dbt_cloud_snowflake_connections_sso = var.dbt_cloud_snowflake_connections_sso
  snowflake_oauth_client_id           = var.snowflake_oauth_client_id
  snowflake_oauth_client_secret       = var.snowflake_oauth_client_secret

  dbt_cloud_snowflake_prod_environment       = var.dbt_cloud_snowflake_prod_environment
  dbt_cloud_snowflake_deployment_environment = var.dbt_cloud_snowflake_deployment_environment
  dbt_cloud_snowflake_dev_environment        = var.dbt_cloud_snowflake_dev_environment
}

module "terra_dbt_cloud_redshift" {
  source = "git@github.com:Ssvenkerud/Terra-dbt-cloud.git//redshift_connector?ref=0.2.1"

  dbt_cloud_projects = var.dbt_cloud_projects
  dbt_cloud_version  = var.dbt_cloud_version
  dbt_prod_branch    = var.dbt_prod_branch

  dbt_cloud_redshift_connections = var.dbt_cloud_redshift_connections

  dbt_cloud_redshift_prod_username          = var.dbt_cloud_redshift_prod_username
  dbt_cloud_redshift_prod_password          = var.dbt_cloud_redshift_prod_password
  dbt_cloud_redshift_prod_threads           = var.dbt_cloud_redshift_prod_threads
  dbt_cloud_redshift_deployment_environment = var.dbt_cloud_redshift_deployment_environment
  dbt_cloud_redshift_dev_environment        = var.dbt_cloud_redshift_dev_environment
  dbt_cloud_redshift_prod_environment       = var.dbt_cloud_redshift_prod_environment
}




