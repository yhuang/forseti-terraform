locals {
  database_name             = "${replace(var.project_name_base, "-", "_")}"
  forseti_security_services = "${join(" ", var.forseti_security_services)}"
  image_family              = "${local.project_id}/${var.project_name_base}"
  project_id                = "${data.terraform_remote_state.project.project_id}"
  project_name              = "${data.terraform_remote_state.project.project_name}"
  server_name               = "${var.project_name_base}-server"
  server_service_account    = "${data.terraform_remote_state.project.server_service_account}"
}
