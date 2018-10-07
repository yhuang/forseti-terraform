locals {
  database_name             = "${replace(var.project_name_base, "-", "_")}"
  forseti_security_services = "${join(" ", var.forseti_security_services)}"
  image_self_link           = "${data.google_compute_image.latest_forseti_security_image.self_link}"
  network                   = "${data.terraform_remote_state.networking.network_self_link}"
  project_id                = "${data.terraform_remote_state.project.project_id}"
  region                    = "${var.regions[var.region]}"
  server_name               = "${var.project_name_base}-server"
  server_service_account    = "${data.terraform_remote_state.project.server_service_account}"
  startup_script            = "${data.template_file.configure_forseti_security_server.rendered}"
  states_bucket             = "${var.environment}-${var.project_name_base}-${var.states_bucket_base}"
  subnetwork                = "${data.terraform_remote_state.networking.subnetwork_self_links[local.region]}"
  zone                      = "${element(var.availability_zones[local.region], 0)}"
}
