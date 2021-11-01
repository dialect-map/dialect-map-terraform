# Enables the API to manage resources

resource "google_project_service" "redis-api" {
  project = var.project_id
  service = "redis.googleapis.com"
}


# List of resources associated to the module

resource "google_redis_instance" "dialect-map-jobs-cache" {
  display_name  = "Dialect map jobs cache"
  name          = var.dialect_map_cache_name
  region        = var.project_region
  location_id   = var.project_zone
  redis_version = "REDIS_5_0"

  tier           = "BASIC"
  auth_enabled   = true
  memory_size_gb = 1

  # Labels to identify and search the instance
  labels = {
    env = "production"
  }
}
