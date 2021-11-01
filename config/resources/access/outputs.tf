# List of public module constants

output "deployments_sa_name" {
  value       = module.access-services.deployments_sa_name
  description = "SA name for the backend deployments"
}

output "diff_sa_name" {
  value       = module.access-services.diff_sa_name
  description = "SA name for the data diff publisher"
}

output "jobs_sa_name" {
  value       = module.access-services.jobs_sa_name
  description = "SA name for the computing jobs"
}
