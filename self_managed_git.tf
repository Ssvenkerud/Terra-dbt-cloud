### repo cloned via the deploy token strategy
resource "dbtcloud_repository" "dbt_repository" {
for_each = { for repo in var.dbt_cloud_self_hosted_git : repo.project => repo } 
  project_id         = dbtcloud_project.dbt_project[each.value.project].id
  remote_url         = each.value.url
  git_clone_strategy = "deploy_key"
}

resource "dbtcloud_project_repository" "dbt_project_repository" {
  for_each = toset(var.dbt_cloud_projects)
  project_id    = dbtcloud_project.dbt_project[each.key].id
  repository_id = dbtcloud_repository.dbt_repository[each.key].repository_id
}

# To be run 
#dbt_cloud_api_result = await (fetch('https://<dbt_cloud_url>/api/v2/integrations/github/installations/').then(res => res.json()));
#console.log("github_application_id: " + dbt_cloud_api_result.filter(res => res["access_tokens_url"].includes("github"))[0]["id"]);
