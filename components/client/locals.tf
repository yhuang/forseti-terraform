locals {
  client_name               = "${var.project_name_base}-client"
  client_service_account    = "${data.terraform_remote_state.project.client_service_account}"
  image_family              = "${local.project_id}/${var.project_name_base}"
  project_id                = "${data.terraform_remote_state.project.project_id}"
  project_name              = "${data.terraform_remote_state.project.project_name}"
}
