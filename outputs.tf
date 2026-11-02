output "instance_name" {
  description = "Cloud SQL instance name"
  value       = module.cloudsql.instance_name
}

output "connection_name" {
  description = "Cloud SQL connection name"
  value       = module.cloudsql.connection_name
}

output "public_ip_address" {
  description = "Cloud SQL public IP address"
  value       = module.cloudsql.public_ip_address
}

output "private_ip_address" {
  description = "Cloud SQL private IP address"
  value       = module.cloudsql.private_ip_address
}

output "database_name" {
  description = "PostgreSQL database name"
  value       = module.cloudsql.database_name
}
