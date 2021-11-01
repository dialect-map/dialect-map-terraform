# List of constant values to be used

variable "dialect_map_cache_name" {
  type        = string
  default     = "dialect-map-jobs-cache"
  description = "Redis cache instance for the Dialect Map jobs"
}


# List of empty values to be filled once the module is imported

variable "project_id" {
  type        = string
  description = "GCP Project ID for the Dialect Map resources"
}

variable "project_region" {
  type        = string
  description = "GCP Project region for the Dialect Map resources"
}

variable "project_zone" {
  type        = string
  description = "GCP Project zone for the Dialect Map resources"
}
