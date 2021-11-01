# List of empty values to be filled once the module is imported

variable "project_id" {
  type        = string
  description = "GCP Project ID for the Dialect map resources"
}

variable "project_region" {
  type        = string
  description = "GCP Project region for the Dialect map resources"
}

variable "dialect_map_db_instance_name" {
  type        = string
  description = "Database instance name for the Dialect map application"
}

variable "dialect_map_db_instance_host" {
  type        = string
  description = "Database instance host for the Dialect map application"
}

variable "dialect_map_db_name" {
  type        = string
  description = "Database connection login db name"
}

variable "dialect_map_db_user" {
  type        = string
  description = "Database connection login username"
}

variable "dialect_map_db_pass" {
  type        = string
  description = "Database connection login password"
}

variable "dialect_map_deployment_sa_name" {
  type        = string
  description = "GCP Dialect map project SA name for the backend deployments"
}
