resource "dbtcloud_environment_variable" "dbt_db_env_var" {
  for_each = var.dbt_cloud_projects
  name       = "DBT_DB_VAR"
  project_id = dbtcloud_project.dbt_project[each.key].id
  environment_values = {
    "project" : "",
    "Dev" : "dev"
    "Prod" : "prod"
  }
  depends_on = [
    dbtcloud_project.dbt_project[each.key],
    dbtcloud_environment.redshift_dev_environment[each.key],
    dbtcloud_environment.redshift_prod_environment[each.key],
  ]
}
resource "dbtcloud_environment_variable" "dbt_schema_env_var" {
  name       = "DBT_SCHMEA_VAR"
  project_id = dbtcloud_project.dbt_project[each.key].id
  environment_values = {
    "project" : "",
    "Dev" : "dev"
    "Prod" : "prod"
  }
  depends_on = [
    dbtcloud_project.dbt_project[each.key],
    dbtcloud_environment.redshift_dev_environment[each.key],
    dbtcloud_environment.redshift_prod_environment[each.key],
  ]
}
