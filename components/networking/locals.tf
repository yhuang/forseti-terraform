locals {
  client_service_account = "${data.terraform_remote_state.project.client_service_account}"
  network                = "${google_compute_network.forseti_security.name}"
  project_id             = "${data.terraform_remote_state.project.project_id}"
  server_service_account = "${data.terraform_remote_state.project.server_service_account}"
  states_bucket          = "${var.environment}-${var.project_name_base}-${var.states_bucket_base}"
  us_west1               = "${var.regions["us-west1"]}"
  us_central1            = "${var.regions["us-central1"]}"
  us_east1               = "${var.regions["us-east1"]}"
  us_east4               = "${var.regions["us-east4"]}"
}
