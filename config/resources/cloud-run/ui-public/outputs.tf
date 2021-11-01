# List of public module constants

output "dialect_map_public_ui_host" {
  value       = google_cloud_run_service.dialect-map-ui.status[0].url
  description = "Public UI assigned host address"
}
