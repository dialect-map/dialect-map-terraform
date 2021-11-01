# List of public module constants

output "dialect_map_cache_host" {
  value       = google_redis_instance.dialect-map-jobs-cache.host
  description = "Redis cache assigned public host"
}

output "dialect_map_cache_port" {
  value       = google_redis_instance.dialect-map-jobs-cache.port
  description = "Redis cache assigned public port"
}
