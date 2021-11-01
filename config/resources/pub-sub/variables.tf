# List of empty values to be filled once the module is imported

variable "project_id" {
  type        = string
  description = "GCP Project ID for the Dialect Map resources"
}

variable "dialect_map_diff_sa_name" {
  type        = string
  description = "GCP Dialect map project SA name for the data diff publisher"
}

variable "dialect_map_jobs_sa_name" {
  type        = string
  description = "GCP Dialect map project SA name for the computing jobs"
}
