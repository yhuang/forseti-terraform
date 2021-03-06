provider "google" {
  region = "${local.region}"
}

terraform {
  # terraform.required_version: cannot contain interpolations
  required_version = "< 0.12.0"

  backend "gcs" {}
}

# https://github.com/hashicorp/terraform/pull/12223
data "google_compute_image" "latest_forseti_image" {
  family  = "${var.project_name_base}"
  project = "${var.trusted_images_project_id}"
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

data "terraform_remote_state" "server" {
  backend = "gcs"

  config {
    bucket = "${local.states_bucket}"
    prefix = "components/server"
  }
}

data "template_file" "forseti_conf_client_yaml" {
  template = "${file("${path.module}/templates/forseti-conf-client.yaml")}"

  vars {
    forseti_server_ip = "${local.forseti_server_ip}"
  }
}

data "template_file" "configure_forseti_client" {
  template = "${file("${path.module}/templates/configure-forseti-client.sh")}"

  vars {
    forseti_conf_client_yaml = "${local.forseti_conf_client_yaml}"
    forseti_install_dir      = "${var.sysconfig["forseti-install-dir"]}"
    forseti_environment_sh   = "${var.sysconfig["forseti-environment-sh"]}"
  }
}
