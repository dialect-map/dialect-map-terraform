# List of public module constants

output "registry_bucket_name" {
  value       = google_container_registry.docker-registry.id
  description = "Registry bucket assigned name"
}
