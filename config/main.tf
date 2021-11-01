# Enables the master API to manage other GCP APIs

resource "google_project_service" "master-api" {
  project = var.project_id
  service = "serviceusage.googleapis.com"
}


# List of modules to be used

module "access" {
  source     = "./resources/access"
  project_id = var.project_id
}


module "cloud-run" {
  source                         = "./resources/cloud-run"
  project_id                     = var.project_id
  project_region                 = var.project_region
  dialect_map_db_instance_name   = module.databases.dialect_map_db_instance_name
  dialect_map_db_instance_host   = module.databases.dialect_map_db_instance_host
  dialect_map_db_name            = module.databases.dialect_map_db_name
  dialect_map_db_user            = var.dialect_map_db_user
  dialect_map_db_pass            = var.dialect_map_db_pass
  dialect_map_deployment_sa_name = module.access.deployments_sa_name
  dialect_map_computing_sa_name  = module.access.jobs_sa_name
}


# The cache creation is currently commented out due to its surprisingly high cost.
# The cost is 0.05$ per GB per hour. As an example: a 1GB instance is 35.7$ a month.
#
# module "caches" {
#   source              = "./resources/caches"
#   project_id          = var.project_id
#   project_region      = var.project_region
#   project_zone        = var.project_zone
# }


module "databases" {
  source              = "./resources/databases"
  project_id          = var.project_id
  project_region      = var.project_region
  project_zone        = var.project_zone
  dialect_map_db_user = var.dialect_map_db_user
  dialect_map_db_pass = var.dialect_map_db_pass
}


module "pub-sub" {
  source                   = "./resources/pub-sub"
  project_id               = var.project_id
  dialect_map_diff_sa_name = module.access.diff_sa_name
  dialect_map_jobs_sa_name = module.access.jobs_sa_name
}


module "registry" {
  source           = "./resources/registry"
  project_id       = var.project_id
  project_location = var.project_location
}


module "storage" {
  source               = "./resources/storage"
  project_id           = var.project_id
  project_location     = var.project_location
  registry_bucket_name = module.registry.registry_bucket_name
}
