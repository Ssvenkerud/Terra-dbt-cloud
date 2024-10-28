resource "dbtcloud_environment_variable" "dbt_db_env_var" {
  name       = "DBT_DB_VAR"
  project_id = dbtcloud_project.dbt_project.id
  environment_values = {
    "project" : "",
    "Dev" : "dev",
    "CI" : "ci",
    "Prod" : "prod"
  }
  depends_on = [
    dbtcloud_project.dbt_project,
    dbtcloud_environment.dev_env,
    dbtcloud_environment.ci_env,
    dbtcloud_environment.prod_env,
  ]
}
resource "dbtcloud_environment_variable" "dbt_schema_env_var" {
  name       = "DBT_SCHMEA_VAR"
  project_id = dbtcloud_project.dbt_project.id
  environment_values = {
    "project" : "",
    "Dev" : "dev",
    "CI" : "ci",
    "Prod" : "prod"
  }
  depends_on = [
    dbtcloud_project.dbt_project,
    dbtcloud_environment.dev_env,
    dbtcloud_environment.ci_env,
    dbtcloud_environment.prod_env,
  ]
}
