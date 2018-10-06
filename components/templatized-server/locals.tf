locals {
  database_name             = "${replace(var.project_name_base, "-", "_")}"
  forseti_security_services = "${join(" ", var.forseti_security_services)}"
  project_id                = "${data.terraform_remote_state.project.project_id}"
  server_name               = "${var.project_name_base}-server"
  server_service_account    = "${data.terraform_remote_state.project.client_service_account}"
  startup_script            = "${data.template_file.configure_forseti_security_server.rendered}"
  states_bucket             = "${var.environment}-${var.project_name_base}-${var.states_bucket_base}"
  template_self_link        = "${data.terraform_remote_state.machine_template.self_link}"
  zone                      = "${element(var.availability_zones[var.regions[1]], 0)}"
}
