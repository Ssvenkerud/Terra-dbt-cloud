# Terra-DBT-Cloud

## Introduction 
Terra-DBT-Cloud is a Terraform Dataplattfom on demand module.
This module contains the configuration of DBT cloud, creating projects, evironments, connections and the like.

By enabling this module you can build up a preconfigured DBT Cloud configuration for your  data platform that adheres to modern standards of security, access and monitoring.
The module implements dev and prod environmnets, variables to configure CICD and altering DBT behaviour based on enviroments. 
It automate the creation of roles and assignmetn of DBT liceces.

### :note!: this module is under active development. 
Developent happens in a trunkbased approach. 
Therfore it is highly recomended to only deploy pinned version of the module to change sensitive environments. 
Any non pinned deployments are likely to break or change without warning.

## Setup
This section covers the prerecuisites, and steps needed to set up the module.

### Prerequesite
    - DBT CLOUD Account
    - service token with acount admin roles
    - system to run Terraform
    - git repository to store the configuration

### Steps to take

1. Create the main.tf file based on the main.txt  example in the setup folder
2. Craate the configurations.auto.tfvars for the admin project, based on the Config_admin.txt file in setup folder
3. Populate the configurations.auto.tfvars as described in the file
4. Configure enviroment variables
    - TF_VAR_dbt_cloud_account_id
    - TF_VAR_dbt_cloud_token
5. Run teraform plan
6. Check that output makes sense given your configuration
7. Run terraform apply
8. Terraform setup compleeted

#### Adding additional projects
In the case that you want to add aditional projects to the setup follow the steps below. 
Before starting however please note that the degree to which you need to create seperation depends on your terraform setup.

Also note that the pipeline is expected to run with the same parameters and users as the admin configuration. 
Seperate projects and states are used to split up the potential for errors and mistakes that can occure when using modules. 
As such missconfiguration in the project never can spread outside of this project. Making recovery easier.

1. Configure create a new repo or folder accordign to your terraform setup that allow the trigger o seperate terraform pipelines. 
2. Create a new copy of the main.tf file form the original project setup. No need to make any changes
3. Create a Configuration.auto.tfvars from the example the setup folder named `config_new_project.txt´
4. Poopulate the configuration in accordance with the description.
5. Run your terraform pipelien against this configuration using the same seting as in the admin config.
