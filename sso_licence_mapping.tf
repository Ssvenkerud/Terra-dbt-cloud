locals {
  developer_licence = formatlist("%s developer", var.dbt_cloud_projects)

}

# Developer license group mapping
resource "dbtcloud_partial_license_map" "dev_license_map" {
  license_type               = "developer"
  sso_license_mapping_groups = local.developer_licence
}

resource "dbtcloud_partial_license_map" "it_licence" {
  count = var.dbt_cloud_admin_enabled ? 1 : 0
  license_type = "it"
  sso_license_mapping_groups = ["Admin"]
}

resource "dbtcloud_partial_license_map" "read_only_licence" {
  count = var.dbt_cloud_admin_enabled ? 1 : 0
  license_type = "read_only"
  sso_license_mapping_groups = ["Read only"]
}
