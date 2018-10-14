locals {
  image_name      = "${data.google_compute_image.latest_forseti_image.name}"
  image_self_link = "${data.google_compute_image.latest_forseti_image.self_link}"
  network         = "${data.terraform_remote_state.networking.network_self_link}"
  project_id      = "${data.terraform_remote_state.project.project_id}"
  region          = "${var.regions[var.region]}"
  states_bucket   = "${var.forseti_security_states_bucket}"
  subnetwork      = "${data.terraform_remote_state.networking.subnetwork_self_links[local.region]}"
}
