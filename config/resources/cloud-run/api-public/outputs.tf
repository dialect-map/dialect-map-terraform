# List of public module constants

output "dialect_map_public_api_host" {
  value       = google_cloud_run_service.dialect-map-public-api.status[0].url
  description = "Public API assigned host address"
}

output "dialect_map_public_api_port" {
  value       = 443
  description = "Public API assigned port number"
}
