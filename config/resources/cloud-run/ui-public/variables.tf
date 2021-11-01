# List of empty values to be filled once the module is imported

variable "project_id" {
  type        = string
  description = "GCP Project ID for the Dialect map resources"
}

variable "project_region" {
  type        = string
  description = "GCP Project region for the Dialect map resources"
}

variable "dialect_map_public_api_host" {
  type        = string
  description = "GCP Dialect map UI public host address"
}

variable "dialect_map_public_api_port" {
  type        = string
  description = "GCP Dialect map UI public port number"
}

variable "dialect_map_deployment_sa_name" {
  type        = string
  description = "GCP Dialect map project SA name for the backend deployments"
}
