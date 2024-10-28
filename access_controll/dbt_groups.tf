resource "dbtcloud_group" "dbt_cloud_developer" {
  name = "TF Group 1"
  group_permissions {
    permission_set = "member"
    all_projects   = true
  }
  group_permissions {
    permission_set = "developer"
    all_projects   = false
    project_id     = dbtcloud_project.dbt_project.id
    writable_environment_categories = ["development", "staging"]
  }
}

resource "dbtcloud_group" "dbt_cloud_project_reader"{
  name = "TF Group 1"
  group_permissions {
    permission_set = "member"
    all_projects   = true
  }
  group_permissions {
    permission_set = "developer"
    all_projects   = false
    project_id     = dbtcloud_project.dbt_project.id
    writable_environment_categories = ["development", "staging"]
  }
}
resource "dbtcloud_group" "dbt_cloud_read_only"{
  name = "TF Group 1"
  group_permissions {
    permission_set = "member"
    all_projects   = true
  }
  group_permissions {
    permission_set = "developer"
    all_projects   = false
    project_id     = dbtcloud_project.dbt_project.id
    writable_environment_categories = ["development", "staging"]
  }
}

