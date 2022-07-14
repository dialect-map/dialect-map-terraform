# Variables to use in the file

locals {
  dialect_map_sql_connect_name = "${var.project_id}:${var.project_region}:${var.dialect_map_db_instance_name}"
  dialect_map_deployment_sa    = "${var.dialect_map_deployment_sa_name}@${var.project_id}.iam.gserviceaccount.com"
  dialect_map_computing_sa     = "${var.dialect_map_computing_sa_name}@${var.project_id}.iam.gserviceaccount.com"
}


resource "google_cloud_run_service" "dialect-map-private-api" {
  name     = "dialect-map-private-api"
  location = var.project_region

  template {
    spec {
      containers {
        image = "us.gcr.io/${var.project_id}/dialect-map-private-api:0.5.0"

        ports {
          container_port = 8080
        }
        env {
          name  = "DIALECT_MAP_DB_URL"
          value = "postgresql+psycopg2://${var.dialect_map_db_user}:${var.dialect_map_db_pass}@/${var.dialect_map_db_name}?host=/cloudsql/${local.dialect_map_sql_connect_name}"
        }
        env {
          name  = "DIALECT_MAP_LOG_LEVEL"
          value = "INFO"
        }
      }

      timeout_seconds      = 20
      service_account_name = local.dialect_map_deployment_sa
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/minScale"      = "1"
        "autoscaling.knative.dev/maxScale"      = "1"
        "run.googleapis.com/cloudsql-instances" = local.dialect_map_sql_connect_name
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


resource "google_cloud_run_service_iam_binding" "dialect-map-private-api-access" {
  project  = var.project_id
  location = var.project_region
  service  = google_cloud_run_service.dialect-map-private-api.name

  role    = "roles/run.invoker"
  members = ["serviceAccount:${local.dialect_map_computing_sa}"]
}
