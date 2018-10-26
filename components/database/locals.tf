locals {
  database_name = "${replace(var.project_name_base, "-", "_")}"
  instance_name = "${google_sql_database_instance.forseti.name}"
  network       = "${data.terraform_remote_state.networking.network_self_link}"
  project_id    = "${data.terraform_remote_state.project.project_id}"
  project_name  = "${data.terraform_remote_state.project.project_name}"
  region        = "${var.regions[var.region]}"
  states_bucket = "${var.forseti_security_states_bucket}"
}
