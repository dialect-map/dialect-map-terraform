# List of public module constants

output "terraform_sa_name" {
  value       = var.terraform_sa_name
  description = "GCP Project Terraform SA name for the Workbench resources"
}

output "deployments_sa_name" {
  value       = google_service_account.dialect-map-deployment-sa.account_id
  description = "GCP Dialect map project SA name for the backend deployments"
}

output "diff_sa_name" {
  value       = google_service_account.dialect-map-diff-sa.account_id
  description = "GCP Dialect map project SA name for the data diff publisher"
}

output "jobs_sa_name" {
  value       = google_service_account.dialect-map-jobs-sa.account_id
  description = "GCP Dialect map project SA name for the computing jobs"
}
