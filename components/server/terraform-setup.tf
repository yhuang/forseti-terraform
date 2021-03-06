provider "google" {
  region = "${local.region}"
}

provider "random" {}

terraform {
  # terraform.required_version: cannot contain interpolations
  required_version = "< 0.12.0"

  backend "gcs" {}
}

# https://github.com/hashicorp/terraform/pull/12223
data "google_compute_image" "latest_forseti_image" {
  project = "${var.trusted_images_project_id}"
  family  = "${var.project_name_base}"
}

data "terraform_remote_state" "bucket" {
  backend = "gcs"

  config {
    bucket = "${local.states_bucket}"
    prefix = "components/bucket"
  }
}

data "terraform_remote_state" "database" {
  backend = "gcs"

  config {
    bucket = "${local.states_bucket}"
    prefix = "components/database"
  }
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

data "template_file" "forseti_conf_server_yaml" {
  template = "${file("${path.module}/templates/forseti-conf-server.yaml")}"

  vars {
    domain_super_admin_email = "${var.g_suite_groups_auditor}"
    email_recipient          = "${var.email_recipient}"
    email_sender             = "${var.email_sender}"
    forseti_install_dir      = "${var.sysconfig["forseti-install-dir"]}"
    forseti_bucket           = "${local.forseti_bucket}"
    org_id                   = "${local.org_id}"
    sendgrid_api_key         = "${var.sendgrid_api_key}"
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
    rand_minute = "${random_integer.minute.result}"
  }
}

data "template_file" "run_forseti_suite" {
  template = "${file("${path.module}/templates/run-forseti-suite.sh")}"

  vars {
    date                   = "${var.sysconfig["date"]}"
    forseti_environment_sh = "${var.sysconfig["forseti-environment-sh"]}"
  }
}

data "template_file" "configure_forseti_server" {
  template = "${file("${path.module}/templates/configure-forseti-server.sh")}"

  vars {
    cloudsql_connection_name = "${local.connection_name}"
    cloudsql_database_name   = "${local.database_name}"
    cloudsql_database_port   = "${var.cloudsql_database_port}"
    cloudsql_proxy           = "${var.sysconfig["cloudsql-proxy"]}"
    cloudsql_proxy_service   = "${var.sysconfig["cloudsql-proxy-service"]}"
    flock                    = "${var.sysconfig["flock"]}"
    forseti_conf_server_yaml = "${local.forseti_conf_server_yaml}"
    forseti_foreground_sh    = "${var.sysconfig["forseti-foreground-sh"]}"
    forseti_install_dir      = "${var.sysconfig["forseti-install-dir"]}"
    forseti_bucket           = "${local.forseti_bucket}"
    forseti_environment_sh   = "${var.sysconfig["forseti-environment-sh"]}"
    forseti_services         = "${local.forseti_services}"
    forseti_server           = "${var.sysconfig["forseti-server"]}"
    forseti_service          = "${var.sysconfig["forseti-service"]}"
    run_forseti_suite        = "${local.run_forseti_suite}"
    run_forseti_suite_sh     = "${var.sysconfig["run-forseti-suite-sh"]}"
    run_frequency            = "${local.run_frequency}"
    user                     = "${var.os}"
  }
}
