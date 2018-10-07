provider "google" {
  region = "${local.region}"
}

provider "random" {}

terraform {
  # terraform.required_version: cannot contain interpolations
  required_version = ">= 0.11.8"

  backend "gcs" {}
}

# https://github.com/hashicorp/terraform/pull/12223
data "google_compute_image" "latest_forseti_security_image" {
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
    domain_super_admin_email = "${var.service_accounts["g-suite-groups-auditor"]}"
    email_recipient          = "${var.email_recipient}"
    email_sender             = "${var.email_sender}"
    forseti_install_dir      = "${var.system_configuration["forseti-install-dir"]}"
    forseti_security_bucket  = "${data.terraform_remote_state.bucket.name}"
    org_id                   = "${data.terraform_remote_state.project.org_id}"
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

data "template_file" "run_forseti_security_suite" {
  template = "${file("${path.module}/templates/run-forseti-security-suite.sh")}"

  vars {
    date                            = "${var.software["date"]}"
    forseti_security_environment_sh = "${var.system_configuration["forseti-security-environment-sh"]}"
  }
}

data "template_file" "configure_forseti_security_server" {
  template = "${file("${path.module}/templates/configure-forseti-security-server.sh")}"

  vars {
    cloudsql_connection_name        = "${data.terraform_remote_state.database.connection_name}"
    cloudsql_database_name          = "${local.database_name}"
    cloudsql_database_port          = "${var.cloudsql_database_port}"
    cloudsql_proxy                  = "${var.software["cloudsql-proxy"]}"
    cloudsql_proxy_service          = "${var.system_configuration["cloudsql-proxy-service"]}"
    flock                           = "${var.software["flock"]}"
    forseti_conf_server_yaml        = "${data.template_file.forseti_conf_server_yaml.rendered}"
    forseti_foreground_sh           = "${var.software["forseti-foreground-sh"]}"
    forseti_install_dir             = "${var.system_configuration["forseti-install-dir"]}"
    forseti_security_bucket         = "${data.terraform_remote_state.bucket.name}"
    forseti_security_environment_sh = "${var.system_configuration["forseti-security-environment-sh"]}"
    forseti_security_services       = "${local.forseti_security_services}"
    forseti_server                  = "${var.software["forseti-server"]}"
    forseti_service                 = "${var.system_configuration["forseti-service"]}"
    run_forseti_security_suite      = "${data.template_file.run_forseti_security_suite.rendered}"
    run_forseti_security_suite_sh   = "${var.software["run-forseti-security-suite-sh"]}"
    run_frequency                   = "${chomp(data.template_file.run_frequency.rendered)}"
    user                            = "${var.os}"
  }
}
