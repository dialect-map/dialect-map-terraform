# List of empty values to be filled once the module is imported

variable "project_id" {
  type        = string
  description = "GCP Project ID for the Dialect Map resources"
}

variable "terraform_sa_name" {
  type        = string
  description = "GCP Project Terraform SA name for the Dialect Map resources"
}

variable "dialect_map_deployment_sa_name" {
  type        = string
  description = "GCP Dialect map project SA name for the backend deployments"
}

variable "dialect_map_diff_sa_name" {
  type        = string
  description = "Dialect map project SA name for the data diff publisher"
}

variable "dialect_map_jobs_sa_name" {
  type        = string
  description = "Dialect map project SA name for the computing jobs"
}
