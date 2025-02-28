variable "dbt_cloud_projects" {
  description = "Holds a list of strings, containing all the DBT Cloud projects assosiated with this state. To create additional projects, all one needs to do, is at the project to the list. Note that names here are case sensitive."
  type        = list(string)
  default     = ["demo"]
}
variable "dbt_cloud_admin_enabled" {
  description = "Every DBT Cloud instance need certain defaul troles, and access created, and mapped. One state within a given DBT cloud instance needs to have this option enabled, to create admin related resources."
  type        = bool
  default     = false
}


variable "dbt_cloud_version" {
  description = "DBT Cloud now supports the use of release track. Use this variabel to set the releace track that you want to follow. It is only possible to have one setup per state. For teams/projects witb higher/lowe risk tolerance, create seperate states."
  type        = string
}

variable "dbt_prod_branch" {
  description = "set the name that your production branch has in git. This will be the branch that is checked out by dbt cloud when running jobs in the Production setting."
  type        = string
}

