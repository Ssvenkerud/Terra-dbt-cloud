

resource "dbtcloud_project" "dbt_project" {
for_each = toset(var.dbt_cloud_projects)
  name     = each.key
}
