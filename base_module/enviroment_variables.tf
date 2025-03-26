resource "dbtcloud_environment_variable" "dbt_db_env_var_snowflake" {
  for_each   = toset(var.dbt_cloud_projects)
  name       = "DBT_DB_ENV"
  project_id = dbtcloud_project.dbt_project[each.key].id
  environment_values = {
    "Project" : null
    "Dev" : "dev"
    "Prod" : "prod"
  }
  depends_on = [
    dbtcloud_environment.snowflake_deployment_environment,
    dbtcloud_environment.snowflake_dev_environment,
    dbtcloud_environment.snowflake_prod_environment
  ]
}
resource "dbtcloud_environment_variable" "dbt_schema_env_var_snowflake" {
  for_each   = toset(var.dbt_cloud_projects)
  name       = "DBT_SCHEMA_ENV"
  project_id = dbtcloud_project.dbt_project[each.key].id
  environment_values = {
    "project" : null
    "Dev" : "dev"
    "Prod" : "prod"
  }
  depends_on = [
    dbtcloud_environment.snowflake_deployment_environment,
    dbtcloud_environment.snowflake_dev_environment,
    dbtcloud_environment.snowflake_prod_environment
  ]
}
resource "dbtcloud_environment_variable" "dbt_db_env_var_redshift" {
  for_each   = toset(var.dbt_cloud_projects)
  name       = "DBT_DB_ENV"
  project_id = dbtcloud_project.dbt_project[each.key].id
  environment_values = {
    "Project" : null
    "Dev" : "dev"
    "Prod" : "prod"
  }
  depends_on = [
    dbtcloud_environment.redshift_deployment_environment,
    dbtcloud_environment.redshift_dev_environment,
    dbtcloud_environment.redshift_prod_environment
  ]

}

resource "dbtcloud_environment_variable" "dbt_schema_env_var_redshift" {
  for_each   = toset(var.dbt_cloud_projects)
  name       = "DBT_SCHEMA_ENV"
  project_id = dbtcloud_project.dbt_project[each.key].id
  environment_values = {
    "project" : null
    "Dev" : "dev"
    "Prod" : "prod"
  }
  depends_on = [
    dbtcloud_environment.redshift_deployment_environment,
    dbtcloud_environment.redshift_dev_environment,
    dbtcloud_environment.redshift_prod_environment
  ]
}
