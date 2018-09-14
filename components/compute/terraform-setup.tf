provider "google" {
  region = "${var.regions[0]}"
}

terraform {
  # terraform.required_version: cannot contain interpolations
  required_version = ">= 0.11.8"

  backend "gcs" {}
}

data "terraform_remote_state" "project" {
  backend = "gcs"

  config {
    bucket = "${var.environment}-forseti-security-terraform-states"
    prefix = "components/project"
  }
}

data "terraform_remote_state" "database" {
  backend = "gcs"

  config {
    bucket = "${var.environment}-forseti-security-terraform-states"
    prefix = "components/database"
  }
}

data "template_file" "configure_forseti_services" {
  template = "${file("${path.module}/templates/configure-forseti-services.sh")}"

  vars {
    cloudsql_connection_name    = "${data.terraform_remote_state.database.connection_name}"
    cloudsql_database_name      = "${local.database_name}"
    cloudsql_database_port      = "${var.cloudsql_database_port}"
    cloudsql_database_user_name = "${var.cloudsql_database_user_name}"
  }
}