resource "dbtcloud_group" "dbt_cloud_developer" {
  for_each = var.dbt_cloud_projects

  name = "{each.key} developer"

  group_permissions {
    permission_set = "developer"
    all_projects   = false
    project_id     = dbtcloud_project.dbt_project[each.key].id
    writable_environment_categories = ["development", "staging"]
  }
  group_permissions {
    permission_set = "job-admin"
    all_projects   = false
    project_id     = dbtcloud_project.dbt_project[each.key].id
  }

}

resource "dbtcloud_group" "dbt_cloud_read_only"{
  name = "Read only"
  group_permissions {
    permission_set = "Read-Only"
    all_projects   = true
  }
}

resource "dbtcloud_group" "dbt_cloud_admin"{
  name = "Admin"
  group_permissions {
    permission_set = "Account Admin"
    all_projects   = true
  }
  group_permissions {
    permission_set = "owner"
    all_projects   = true
  }
}

