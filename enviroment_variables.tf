resource "dbtcloud_environment_variable" "dbt_db_env_var" {
  for_each = toset(var.dbt_cloud_projects)
  name       = "DBT_DB_VAR"
  project_id = dbtcloud_project.dbt_project[each.key].id
  environment_values = {
    "project" : "",
    "Dev" : "dev"
    "Prod" : "prod"
  }
}
resource "dbtcloud_environment_variable" "dbt_schema_env_var" {
  for_each = toset(var.dbt_cloud_projects)
  name       = "DBT_SCHMEA_VAR"
  project_id = dbtcloud_project.dbt_project[each.key].id
  environment_values = {
    "project" : "",
    "Dev" : "dev"
    "Prod" : "prod"
  }
}
