locals {
  bucket_name            = "${google_storage_bucket.forseti_security_bucket.name}"
  project_id             = "${data.terraform_remote_state.project.project_id}"
  server_service_account = "${data.terraform_remote_state.project.server_service_account}"
  states_bucket          = "${var.environment}-${var.project_name_base}-${var.states_bucket_base}"
}
