# Enables the API to manage resources

resource "google_project_service" "iam-api" {
  project = var.project_id
  service = "iam.googleapis.com"
}


# List of modules to be used

module "access-roles" {
  source                         = "./roles"
  project_id                     = var.project_id
  terraform_sa_name              = module.access-services.terraform_sa_name
  dialect_map_deployment_sa_name = module.access-services.deployments_sa_name
  dialect_map_diff_sa_name       = module.access-services.diff_sa_name
  dialect_map_jobs_sa_name       = module.access-services.jobs_sa_name

  # Necessary to avoid eventual consistency errors
  depends_on = [google_project_service.iam-api]
}


module "access-services" {
  source     = "./services"
  project_id = var.project_id

  # Necessary to avoid eventual consistency errors
  depends_on = [google_project_service.iam-api]
}
