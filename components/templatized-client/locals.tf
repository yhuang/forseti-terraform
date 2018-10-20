locals {
  client_name              = "${var.project_name_base}-client"
  client_service_account   = "${data.terraform_remote_state.project.client_service_account}"
  forseti_conf_client_yaml = "${data.template_file.forseti_conf_client_yaml.rendered}"
  forseti_server_ip        = "${data.terraform_remote_state.server.internal_ip}"
  project_id               = "${data.terraform_remote_state.project.project_id}"
  region                   = "${var.regions[var.region]}"
  startup_script           = "${data.template_file.configure_forseti_client.rendered}"
  states_bucket            = "${var.forseti_security_states_bucket}"
  template_self_link       = "${data.terraform_remote_state.machine_template.self_link}"
  zone                     = "${element(var.availability_zones[local.region], 0)}"
}
