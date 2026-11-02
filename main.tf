module "cloudsql" {
  source = "./modules/cloudsql"

  project_id    = var.project_id
  region        = var.region
  instance_name = var.instance_name
  database_name = var.database_name
}
