provider "google" {
  region = "${local.region}"
}

terraform {
  # terraform.required_version: cannot contain interpolations
  required_version = ">= 0.11.8"

  backend "gcs" {}
}

data "terraform_remote_state" "project" {
  backend = "gcs"

  config {
    bucket = "${local.states_bucket}"
    prefix = "components/project"
  }
}

data "terraform_remote_state" "machine_template" {
  backend = "gcs"

  config {
    bucket = "${local.states_bucket}"
    prefix = "components/machine-template"
  }
}

data "terraform_remote_state" "server" {
  backend = "gcs"

  config {
    bucket = "${local.states_bucket}"
    prefix = "components/templatized-server"
  }
}

data "template_file" "forseti_conf_client_yaml" {
  template = "${file("${path.module}/templates/forseti-conf-client.yaml")}"

  vars {
    forseti_server_ip = "${data.terraform_remote_state.server.internal_ip}"
  }
}

data "template_file" "configure_forseti_client" {
  template = "${file("${path.module}/templates/configure-forseti-client.sh")}"

  vars {
    forseti_conf_client_yaml        = "${data.template_file.forseti_conf_client_yaml.rendered}"
    forseti_install_dir             = "${var.system_configuration["forseti-install-dir"]}"
    forseti_environment_sh = "${var.system_configuration["forseti-environment-sh"]}"
  }
}
