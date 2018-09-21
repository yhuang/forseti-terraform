provider "google" {
  region = "${var.regions[0]}"
}

provider "random" {}

terraform {
  # terraform.required_version: cannot contain interpolations
  required_version = ">= 0.11.8"

  backend "gcs" {}
}

data "terraform_remote_state" "bucket" {
  backend = "gcs"

  config {
    bucket = "${var.environment}-forseti-security-terraform-states"
    prefix = "components/bucket"
  }
}

data "terraform_remote_state" "database" {
  backend = "gcs"

  config {
    bucket = "${var.environment}-forseti-security-terraform-states"
    prefix = "components/database"
  }
}

data "terraform_remote_state" "project" {
  backend = "gcs"

  config {
    bucket = "${var.environment}-forseti-security-terraform-states"
    prefix = "components/project"
  }
}

data "template_file" "forseti_conf_server_yaml" {
  template = "${file("${path.module}/templates/forseti_conf_server.yaml")}"

  vars {
    domain_super_admin_email = "${var.service_accounts["g-suite-groups-auditor"]}"
    forseti_security_bucket  = "${data.terraform_remote_state.bucket.name}"
    org_id                   = "${data.terraform_remote_state.project.org_id}"
    project_name_base        = "${var.project_name_base}"
    user                     = "${var.os}"
  }
}

resource "random_integer" "minute" {
  min = 0
  max = 59
}

data "template_file" "run_frequency" {
  template = "${file("${path.module}/templates/run-frequency")}"

  vars {
    rand_minute = "${random_integer.minute}"
  }
}

data "template_file" "run_forseti_security_suite" {
  template = "${file("${path.module}/templates/run-forseti-security-suite.sh")}"
}

data "template_file" "configure_forseti_security_server" {
  template = "${file("${path.module}/templates/configure-forseti-security-server.sh")}"

  vars {
    cloudsql_connection_name    = "${data.terraform_remote_state.database.connection_name}"
    cloudsql_database_name      = "${local.database_name}"
    cloudsql_database_port      = "${var.cloudsql_database_port}"
    cloudsql_database_user_name = "${var.cloudsql_database_user_name}"
    cloudsql_proxy              = "${var.software["cloudsql-proxy"]}"
    flock                       = "${var.software["flock"]}"
    forseti_conf_server_yaml    = "${data.template_file.forseti_conf_server_yaml.rendered}"
    forseti_security_bucket     = "${data.terraform_remote_state.bucket.name}"
    forseti_security_services   = "${local.forseti_security_services}"
    forseti_server              = "${var.software["forseti-server"]}"
    project_name_base           = "${var.project_name_base}"
    run_forseti_security_suite  = "${data.template_file.run_forseti_security_suite.rendered}"
    run_frequency               = "${data.template_file.random_integer.minute}"
    user                        = "${var.os}"
  }
}
