terraform {
  backend "gcs" {
    bucket = "trustscore-aws-backup"
    prefix = "cloudsql/dev"
  }
}
