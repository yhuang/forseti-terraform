locals {
  client_name               = "${var.project_name_base}-client"
  client_service_account    = "${data.terraform_remote_state.project.client_service_account}"
  image_family              = "${data.google_compute_image.latest_forseti_security_image.name}"
  network                   = "${data.terraform_remote_state.networking.network_self_link}"
  project_id                = "${data.terraform_remote_state.project.project_id}"
  subnetwork                = "${data.terraform_remote_state.networking.subnetwork_self_link}"
  startup_script            = "${data.template_file.configure_forseti_security_client.rendered}"
  states_bucket             = "${var.environment}-${var.project_name_base}-${var.states_bucket_base}"
  zone                      = "${element(var.availability_zones[var.regions[1]], 0)}"
}
