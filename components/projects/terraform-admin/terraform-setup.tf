provider "google" {
  region = "${var.regions["0"]}"
}

terraform {
  required_version = ">= 0.11.8"

  backend "gcs" {}
}

data "google_project" "terraform_admin" {
  project_id = "${var.terraform_admin_project_id}"
}
