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
  subnetwork                = "${local.subnetworks[local.region]}"
  subnetworks               = {
    "us-west1"    = "${data.terraform_remote_state.networking.subnetwork_us_west1_self_link}"
    "us-central1" = "${data.terraform_remote_state.networking.subnetwork_us_central1_self_link}"
    "us-east1"    = "${data.terraform_remote_state.networking.subnetwork_us_east1_self_link}"
    "us-east4"    = "${data.terraform_remote_state.networking.subnetwork_us_east4_self_link}"
  }
  zone                      = "${element(var.availability_zones[local.region], 0)}"
}
