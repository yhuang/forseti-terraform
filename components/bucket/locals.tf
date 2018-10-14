locals {
  bucket_name            = "${google_storage_bucket.forseti_bucket.name}"
  project_id             = "${data.terraform_remote_state.project.project_id}"
  region                 = "${var.regions[var.region]}"
  server_service_account = "${data.terraform_remote_state.project.server_service_account}"
  states_bucket          = "${var.forseti_security_states_bucket}"
}
