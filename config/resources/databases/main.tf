# Enables the API to manage resources

resource "google_project_service" "sql-admin-api" {
  project = var.project_id
  service = "sqladmin.googleapis.com"
}

resource "google_project_service" "sql-component-api" {
  project = var.project_id
  service = "sql-component.googleapis.com"
}


# List of resources associated to the module

resource "google_sql_database_instance" "dialect-map-db-instance" {
  name             = var.dialect_map_db_instance_name
  region           = var.project_region
  database_version = "POSTGRES_13"

  settings {
    tier              = "db-f1-micro"
    availability_type = "ZONAL"
    disk_autoresize   = false
    disk_size         = 40
    disk_type         = "PD_SSD"

    # Whether the instance is STOPPED or RUNNING
    activation_policy = "NEVER"

    # Labels to identify and search the instance
    user_labels = {
      env : "production"
    }

    # Whether daily data backup is activated, and at what time (UTC)
    backup_configuration {
      enabled    = true
      start_time = "08:00"
    }

    # Whether this SQL instance should be assigned a public IPV4 address
    ip_configuration {
      ipv4_enabled = true

      authorized_networks {
        name  = "NYU CDS Office"
        value = "216.165.95.0/24"
      }
    }

    # The preferred Compute Engine zone where the database is hosted
    location_preference {
      zone = var.project_zone
    }

    # When an instance can automatically restart to apply updates (UTC)
    maintenance_window {
      day  = 7
      hour = 10
    }
  }

  # Necessary to avoid eventual consistency errors
  depends_on = [google_project_service.sql-admin-api]
}


# resource "google_sql_database" "dialect-map-database" {
#   project  = var.project_id
#   name     = var.dialect_map_db_name
#   charset  = "UTF8"
#   instance = google_sql_database_instance.dialect-map-db-instance.name
#
#   # Necessary to avoid eventual consistency errors
#   depends_on = [google_project_service.sql-admin-api]
# }


# resource "google_sql_user" "dialect-map-db-user" {
#   project  = var.project_id
#   name     = var.dialect_map_db_user
#   password = var.dialect_map_db_pass
#   instance = google_sql_database_instance.dialect-map-db-instance.name
#
#   # Necessary to avoid eventual consistency errors
#   depends_on = [google_project_service.sql-admin-api]
# }
