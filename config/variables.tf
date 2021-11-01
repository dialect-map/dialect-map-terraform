# List of constant values to be used

variable "project_id" {
  type        = string
  default     = "ds3-dialect-map"
  description = "GCP Project ID for the Dialect Map resources"
}

variable "project_location" {
  type        = string
  default     = "US"
  description = "GCP Project global location for the Dialect Map resources"
}

variable "project_region" {
  type        = string
  default     = "us-east4"
  description = "GCP Project region for the Dialect Map resources"
}

variable "project_zone" {
  type        = string
  default     = "us-east4-a"
  description = "GCP Project zone for the Dialect Map resources"
}


# List of empty values to be provided by environment variables,
# Following the 'TF_VAR_<variable_name>' convention.
# Ref: https://www.terraform.io/docs/configuration/variables.html#environment-variables

variable "dialect_map_db_user" {
  type        = string
  sensitive   = true
  description = "Database connection login username"

  validation {
    condition     = length(var.dialect_map_db_user) > 0
    error_message = "The variable dialect_map_db_user cannot be empty."
  }
}

variable "dialect_map_db_pass" {
  type        = string
  sensitive   = true
  description = "Database connection login password"

  validation {
    condition     = length(var.dialect_map_db_pass) > 0
    error_message = "The variable dialect_map_db_pass cannot be empty."
  }
}
