locals {
  project_name           = "${data.terraform_remote_state.project.project_name}"
  project_id             = "${data.terraform_remote_state.project.project_id}"
  server_name            = "${var.project_name_base}-server"
  client_name            = "${var.project_name_base}-client"
  server_service_account = "${data.terraform_remote_state.project.server_service_account}"
  client_service_account = "${data.terraform_remote_state.project.client_service_account}"
  image         = "projects/${local.project_id}/global/images/${var.image}}"
}
