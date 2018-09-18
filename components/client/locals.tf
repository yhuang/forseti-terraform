locals {
  client_name               = "${var.project_name_base}-client"
  client_service_account    = "${data.terraform_remote_state.project.client_service_account}"
  image_family              = "projects/${local.project_id}/global/images/${var.projet_name_base}}"
  project_id                = "${data.terraform_remote_state.project.project_id}"
  project_name              = "${data.terraform_remote_state.project.project_name}"
}
