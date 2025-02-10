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

variable "dbt_cloud_redshift_connections" {
  description = "Stores the descriptor variables to creates a connection between DBT Cloud, and the redshift warehouse. This connection requires Private Link enabled to function properly. Of further note, Redshift supports only a single connection per database. Therefor you need to create a conection for every databse. This is esspecially relevant for systems utilising several databases for seperation."
  type = list(object({
    name                     = string
    private_link_endpoint_id = string
    hostname                 = string
    dbname                   = string
  }))
  default = [
    {
      name                     = "demo_connection"
      private_link_endpoint_id = "dummy_link"
      hostname                 = "dummy host"
      dbname                   = "dev"
    }
  ]
}

variable "dbt_cloud_snowflake_connections_sso" {
  description = "stores the variables used for creating Snowflake conections."
  type = list(object({
    name                      = string
    account                   = string
    dbname                    = string
    warehouse                 = string
    role                      = string
    client_session_keep_alive = bool
  }))
  default = [
    {
      name                      = "demo_connection"
      account                   = "dummy host"
      dbname                    = "dev"
      warehouse                 = "dummy"
      role                      = "dumm_role"
      client_session_keep_alive = false
    }
  ]
}

variable "snowflake_oauth_client_id" {
  description = "In order to enable SSO between DBT and snowflake, this variables is used to stor the Client ID. This variable is only needed when dbt_cloud_admin_enabled is set to ture"
  type        = string
  sensitive   = true
  default     = ""
}
variable "snowflake_oauth_client_secret" {
  description = "In order to enable SSO between DBT and snowflake, this variables is used to stor the Client ID. This variable is only needed when dbt_cloud_admin_enabled is set to ture"
  type        = string
  sensitive   = true
  default     = ""
}

variable "dbt_cloud_version" {
  description = "DBT Cloud now supports the use of release track. Use this variabel to set the releace track that you want to follow. It is only possible to have one setup per state. For teams/projects witb higher/lowe risk tolerance, create seperate states."
  type        = string
}

variable "dbt_prod_branch" {
  description = "set the name that your production branch has in git. This will be the branch that is checked out by dbt cloud when running jobs in the Production setting."
  type        = string
}
variable "dbt_cloud_redshift_deployment_environment" {
  description = "In the case that one neds additional redshift based  envrioments other than DEV and PROD, this variable is used to create and link them"
  type = list(object({
    project             = string
    redshift_connection = string
    name                = string
    type                = string
  }))
  default = [
    {
      project             = "temp"
      redshift_connection = "demo_connection"
      name                = "Prod"
      type                = "production"
    },
    {
      project             = "temp"
      redshift_connection = "demo_connection"
      name                = "Stage"
      type                = "stageing"
    },
    {
      project             = "temp"
      redshift_connection = "demo_connection"
      name                = "QA"
      type                = ""
    }
  ]
}

variable "dbt_cloud_self_hosted_git" {
  type = list(object({
    project = string
    url     = string
  }))
}

variable "dbt_cloud_redshift_dev_environment" {
  description = "This variable creates the link between which project, should use what connection as its production connection. Teher is only one production enviroment per project in dbt cloud, there for this can be a simmpe mapping list"
  type = list(object({
    project             = string
    redshift_connection = string
  }))
}
variable "dbt_cloud_redshift_prod_environment" {
  description = "This variable maps what connection a prodject should use for its development environment. Development is a special enviroment in DBT cloud and there can only ever be one. Therefror this is a simple mapping list."
  type = list(object({
    project             = string
    redshift_connection = string
  }))
}

variable "dbt_cloud_redshift_prod_username" {
  description = "As DBT cloud currently only supports the use of username and password to redshift users, this variable must be set to provide credentials for production enviroments. It is however recomended etting it av an env variable, rather than as a set variabel"
  type        = string
  sensitive   = true
}

variable "dbt_cloud_redshift_prod_password" {
  description = "As DBT cloud currently only supports the use of username and password to redshift users, this variable must be set to provide credentials for production enviroments. It is however recomended etting it av an env variable, rather than as a set variabel"
  type        = string
  sensitive   = true
}

variable "dbt_cloud_redshift_prod_threads" {
  description = "The number of threds a production enviroment should use in REdshift."
  type        = number
  default     = 16
}
