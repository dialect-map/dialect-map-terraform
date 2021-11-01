# List of resources associated to the module

resource "google_service_account" "dialect-map-deployment-sa" {
  project      = var.project_id
  account_id   = var.dialect_map_deployment_sa_name
  display_name = "Dialect map deployments SA"
}


resource "google_service_account" "dialect-map-diff-sa" {
  project      = var.project_id
  account_id   = var.dialect_map_diff_sa_name
  display_name = "Dialect map data-diff publisher SA"
}


resource "google_service_account" "dialect-map-jobs-sa" {
  project      = var.project_id
  account_id   = var.dialect_map_jobs_sa_name
  display_name = "Dialect map data-processing jobs SA"
}
