# Enables the API to manage resources

resource "google_project_service" "registry-api" {
  project = var.project_id
  service = "containerregistry.googleapis.com"
}


# List of resources associated to the module

resource "google_container_registry" "docker-registry" {
  project  = var.project_id
  location = var.project_location

  # Necessary to avoid eventual consistency errors
  depends_on = [google_project_service.registry-api]
}
