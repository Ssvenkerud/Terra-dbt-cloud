### repo cloned via the deploy token strategy
resource "dbtcloud_repository" "deploy_repo" {
  project_id         = dbtcloud_project.dbt_project.id
  remote_url         = "git://github.com/<github_org>/<github_repo>.git"
  git_clone_strategy = "deploy_key"
}

resource "dbtcloud_project_repository" "dbt_project_repository" {
  project_id    = dbtcloud_project.dbt_project.id
  repository_id = dbtcloud_repository.dbt_repository.repository_id
}
