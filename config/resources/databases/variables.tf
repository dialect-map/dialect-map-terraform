# List of constant values to be used

variable "dialect_map_db_instance_name" {
  type        = string
  default     = "dialect-map-db-main"
  description = "Database instance name for the Dialect Map application"
}

variable "dialect_map_db_name" {
  type        = string
  default     = "dialect_map"
  description = "Database name for the Dialect Map application"
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

variable "dialect_map_db_user" {
  type        = string
  description = "Database connection login username"
}

variable "dialect_map_db_pass" {
  type        = string
  description = "Database connection login password"
}
