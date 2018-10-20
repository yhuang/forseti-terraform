provider "google" {}

terraform {
  # terraform.required_version: cannot contain interpolations
  required_version = "< 0.12.0"

  backend "gcs" {}
}

data "terraform_remote_state" "project" {
  backend = "gcs"

  config {
    bucket = "${local.states_bucket}"
    prefix = "components/project"
  }
}
