provider "google" {
  region = "${var.regions[1]}"
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

data "terraform_remote_state" "networking" {
  backend = "gcs"

  config {
    bucket = "${var.environment}-forseti-security-terraform-states"
    prefix = "components/networking"
  }
}

data "terraform_remote_state" "server" {
  backend = "gcs"

  config {
    bucket = "${var.environment}-forseti-security-terraform-states"
    prefix = "components/server"
  }
}

data "template_file" "forseti_conf_client_yaml" {
  template = "${file("${path.module}/templates/forseti-conf-client.yaml")}"

  vars {
    forseti_server_ip = "${data.terraform_remote_state.server.internal_ip}"
  }
}

data "template_file" "configure_forseti_security_client" {
  template = "${file("${path.module}/templates/configure-forseti-security-client.sh")}"

  vars {
    forseti_conf_client_yaml        = "${data.template_file.forseti_conf_client_yaml.rendered}"
    forseti_install_dir             = "${var.system_configuration["forseti-install-dir"]}"
    forseti_security_environment_sh = "${var.system_configuration["forseti-security-environment-sh"]}"
    user                            = "${var.os}"
  }
}
