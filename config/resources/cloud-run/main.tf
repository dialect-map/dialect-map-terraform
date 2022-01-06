# Enables the API to manage resources

resource "google_project_service" "run-api" {
  project = var.project_id
  service = "run.googleapis.com"
}


# List of modules to be used

# module "api-private" {
#   source                         = "./api-private"
#   project_id                     = var.project_id
#   project_region                 = var.project_region
#   dialect_map_db_instance_name   = var.dialect_map_db_instance_name
#   dialect_map_db_instance_host   = var.dialect_map_db_instance_host
#   dialect_map_db_name            = var.dialect_map_db_name
#   dialect_map_db_user            = var.dialect_map_db_user
#   dialect_map_db_pass            = var.dialect_map_db_pass
#   dialect_map_deployment_sa_name = var.dialect_map_deployment_sa_name
#   dialect_map_computing_sa_name  = var.dialect_map_computing_sa_name
#
#   # Necessary to avoid eventual consistency errors
#   depends_on = [google_project_service.run-api]
# }


# module "api-public" {
#   source                         = "./api-public"
#   project_id                     = var.project_id
#   project_region                 = var.project_region
#   dialect_map_db_instance_name   = var.dialect_map_db_instance_name
#   dialect_map_db_instance_host   = var.dialect_map_db_instance_host
#   dialect_map_db_name            = var.dialect_map_db_name
#   dialect_map_db_user            = var.dialect_map_db_user
#   dialect_map_db_pass            = var.dialect_map_db_pass
#   dialect_map_deployment_sa_name = var.dialect_map_deployment_sa_name
#
#   # Necessary to avoid eventual consistency errors
#   depends_on = [google_project_service.run-api]
# }


# module "ui-public" {
#   source                         = "./ui-public"
#   project_id                     = var.project_id
#   project_region                 = var.project_region
#   dialect_map_public_api_host    = "" # module.api-public.dialect_map_public_api_host
#   dialect_map_public_api_port    = "" # module.api-public.dialect_map_public_api_port
#   dialect_map_deployment_sa_name = var.dialect_map_deployment_sa_name
#
#   # Necessary to avoid eventual consistency errors
#   depends_on = [google_project_service.run-api]
# }
