# List of resources associated to the module

resource "google_cloud_run_service" "dialect-map-ui" {
  name     = "dialect-map-ui"
  location = var.project_region

  template {
    spec {
      containers {
        image = "us.gcr.io/${var.project_id}/dialect-map-ui:0.2.3-search-only"

        ports {
          container_port = 5000
        }
        env {
          name  = "SERVER_API_HOST"
          value = var.dialect_map_public_api_host
        }
        env {
          name  = "SERVER_API_PORT"
          value = var.dialect_map_public_api_port
        }
      }

      timeout_seconds      = 20
      service_account_name = "${var.dialect_map_deployment_sa_name}@${var.project_id}.iam.gserviceaccount.com"
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/minScale" = "1"
        "autoscaling.knative.dev/maxScale" = "2"
      }
    }
  }

  # In case future 'A-B testing' wants to be carried out
  traffic {
    percent         = 100
    latest_revision = true
  }

  # Automatically creates a unique name for the deployment revision
  autogenerate_revision_name = true

  # Avoid reference errors when container changes are introduced in-place
  # Ref: https://www.terraform.io/docs/language/meta-arguments/lifecycle.html
  lifecycle {
    create_before_destroy = true
  }
}


resource "google_cloud_run_service_iam_binding" "dialect-map-ui-access" {
  project  = var.project_id
  location = var.project_region
  service  = google_cloud_run_service.dialect-map-ui.name

  role    = "roles/run.invoker"
  members = ["allUsers"]
}
