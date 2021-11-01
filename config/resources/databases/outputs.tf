# List of public module constants

output "dialect_map_db_instance_name" {
  value       = var.dialect_map_db_instance_name
  description = "Database instance name"
}

output "dialect_map_db_instance_host" {
  value       = google_sql_database_instance.dialect-map-db-instance.public_ip_address
  description = "Database instance assigned public IP"
}

output "dialect_map_db_name" {
  value       = var.dialect_map_db_name
  description = "Database name"
}
