locals {
  database_name = "${replace(var.project_name_base, "-", "_")}"
  instance_name = "${google_sql_database_instance.forseti.name}"
  project_id    = "${data.terraform_remote_state.project.project_id}"
  region        = "${var.regions[var.region]}"
  states_bucket = "${var.forseti_security_states_bucket}"
}
