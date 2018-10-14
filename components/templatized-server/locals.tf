locals {
  database_name          = "${replace(var.project_name_base, "-", "_")}"
  forseti_services       = "${join(" ", var.forseti_services)}"
  project_id             = "${data.terraform_remote_state.project.project_id}"
  region                 = "${var.regions[var.region]}"
  server_name            = "${var.project_name_base}-server"
  server_service_account = "${data.terraform_remote_state.project.server_service_account}"
  startup_script         = "${data.template_file.configure_forseti_server.rendered}"
  states_bucket          = "${var.forseti_security_states_bucket}"
  template_self_link     = "${data.terraform_remote_state.machine_template.self_link}"
  zone                   = "${element(var.availability_zones[local.region], 0)}"
}
