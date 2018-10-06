locals {
  database_name = "${replace(var.project_name_base, "-", "_")}"
  instance_name = "${local.project_name}-${random_id.string.hex}"
  project_name  = "${data.terraform_remote_state.project.project_name}"
  project_id    = "${data.terraform_remote_state.project.project_id}"
  states_bucket = "${var.environment}-${var.project_name_base}-${var.states_bucket_base}"
}
