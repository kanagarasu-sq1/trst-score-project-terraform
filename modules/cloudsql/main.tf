resource "google_project_service" "sqladmin" {
  project            = var.project_id
  service            = "sqladmin.googleapis.com"
  disable_on_destroy = false
}

resource "google_sql_database_instance" "postgres" {
  project          = var.project_id
  name             = var.instance_name
  region           = var.region
  database_version = "POSTGRES_15"

  deletion_protection = true

  settings {
    tier              = "db-custom-1-3840"
    edition           = "ENTERPRISE"
    availability_type = "ZONAL"

    disk_type       = "PD_SSD"
    disk_size       = 76
    disk_autoresize = true

    backup_configuration {
      enabled                        = true
      start_time                     = "20:00"
      point_in_time_recovery_enabled = false

      backup_retention_settings {
        retained_backups = 3
        retention_unit   = "COUNT"
      }
    }

    maintenance_window {
      day          = 6
      hour         = 20
      update_track = "stable"
    }

    ip_configuration {
      ipv4_enabled    = true
      private_network = "projects/${var.project_id}/global/networks/default"
      ssl_mode        = "ENCRYPTED_ONLY"
    }

    user_labels = {
      env = "staging"
    }
  }

  depends_on = [
    google_project_service.sqladmin
  ]
}

resource "google_sql_database" "database" {
  project  = var.project_id
  name     = var.database_name
  instance = google_sql_database_instance.postgres.name
}
