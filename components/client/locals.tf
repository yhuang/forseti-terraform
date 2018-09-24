locals {
  client_name               = "${var.project_name_base}-client"
  client_service_account    = "${data.terraform_remote_state.project.client_service_account}"
  image_family              = "${local.project_id}/${var.project_name_base}"
  network                   = "${data.terraform_remote_state.networking.network_self_link}"
  project_id                = "${data.terraform_remote_state.project.project_id}"
  project_name              = "${data.terraform_remote_state.project.project_name}"
  subnetwork                = "${data.terraform_remote_state.networking.subnetwork_self_link}"
}
