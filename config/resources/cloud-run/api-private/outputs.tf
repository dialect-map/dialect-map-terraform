# List of public module constants

output "dialect_map_private_api_host" {
  value       = google_cloud_run_service.dialect-map-private-api.status[0].url
  description = "Private API assigned host address"
}
