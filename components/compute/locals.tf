locals {
  client_name            = "${var.project_name_base}-client"
  client_service_account = "${data.terraform_remote_state.project.client_service_account}"
  database_name          = "${replace(var.project_name_base, "-", "_")}"
  image_family           = "projects/${local.project_id}/global/images/${var.image_family}}"
  project_id             = "${data.terraform_remote_state.project.project_id}"
  project_name           = "${data.terraform_remote_state.project.project_name}"
  server_name            = "${var.project_name_base}-server"
  server_service_account = "${data.terraform_remote_state.project.server_service_account}"
}
