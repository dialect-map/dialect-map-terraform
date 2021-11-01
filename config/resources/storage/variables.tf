# List of empty values to be filled once the module is imported

variable "project_id" {
  type        = string
  description = "GCP Project ID for the Dialect Map resources"
}

variable "project_location" {
  type        = string
  description = "GCP Project location for the Dialect Map resources"
}

variable "registry_bucket_name" {
  type        = string
  description = "GCP Registry bucket name for the Dialect Map resources"
}
