resource "google_sql_user" "forseti" {
  instance = "${local.instance_name}"
  name     = "${var.os}"
  project  = "${local.project_id}"
}
