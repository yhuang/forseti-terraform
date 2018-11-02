provider "google" {
  region = "${local.region}"
}

provider "google-beta" {
  region = "${local.region}"
}

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

data "terraform_remote_state" "networking" {
  backend = "gcs"

  config {
    bucket = "${local.states_bucket}"
    prefix = "components/networking"
  }
}
