provider "google" {
  region = "${local.region}"
}

terraform {
  # terraform.required_version: cannot contain interpolations
  required_version = ">= 0.11.8"

  backend "gcs" {}
}

# https://github.com/hashicorp/terraform/pull/12223
data "google_compute_image" "latest_forseti_security_image" {
  project   = "${local.project_id}"
  family    = "${var.project_name_base}"
}

data "terraform_remote_state" "project" {
  backend = "gcs"

  config {
    bucket = "${local.states_bucket}"
    prefix = "components/project"
  }
}

data "terraform_remote_state" "networking" {
  backend = "gcs"

  config {
    bucket = "${local.states_bucket}"
    prefix = "components/networking"
  }
}
