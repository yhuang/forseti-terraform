provider "google" {}

provider "random" {}

terraform {
  required_version = "< 0.12.0"

  backend "gcs" {}
}

data "google_project" "terraform_admin" {
  project_id = "${var.terraform_admin_project_id}"
}
