locals {
  client_name            = "${var.project_name_base}-client"
  client_service_account = "${data.terraform_remote_state.project.client_service_account}"
  project_id             = "${data.terraform_remote_state.project.project_id}"
  region                 = "${var.regions[var.region]}"
  startup_script         = "${data.template_file.configure_forseti_security_client.rendered}"
  states_bucket          = "${var.environment}-${var.project_name_base}-${var.states_bucket_base}"
  template_self_link     = "${data.terraform_remote_state.machine_template.self_link}"
  zone                   = "${element(var.availability_zones[local.region], 0)}"
}
