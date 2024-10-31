locals {
  developer_licence = formatlist("%sdeveloper", var.dbt_cloud_projects)

}

# Developer license group mapping
resource "dbtcloud_partial_license_map" "dev_license_map" {
  license_type               = "developer"
  sso_license_mapping_groups = local.developer_licence
}
