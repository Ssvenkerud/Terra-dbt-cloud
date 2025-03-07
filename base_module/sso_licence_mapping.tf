locals {
  developer_licence = formatlist("%s developer", var.dbt_cloud_projects)

}

# Developer license group mapping
resource "dbtcloud_partial_license_map" "dev_license_map" {
  license_type               = "developer"
  sso_license_mapping_groups = concat(local.developer_licence)
}
# Developer license group mapping
resource "dbtcloud_partial_license_map" "dev_admin_license_map" {
  count                      = var.dbt_cloud_admin_enabled ? 1 : 0
  license_type               = "developer"
  sso_license_mapping_groups = ["App_Access_dbtCloud_Developer"]
}
resource "dbtcloud_partial_license_map" "it_licence" {
  count                      = var.dbt_cloud_admin_enabled ? 1 : 0
  license_type               = "it"
  sso_license_mapping_groups = ["App_Access_dbtCloud_Admin"]
}

resource "dbtcloud_partial_license_map" "read_only_licence" {
  count                      = var.dbt_cloud_admin_enabled ? 1 : 0
  license_type               = "read_only"
  sso_license_mapping_groups = ["App_Access_dbtCloud_ReadOnly"]
}
