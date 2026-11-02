variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  description = "Cloud SQL region"
}

variable "instance_name" {
  type        = string
  description = "Cloud SQL instance name"
}

variable "database_name" {
  type        = string
  description = "PostgreSQL database name"
}
