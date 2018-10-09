resource "google_sql_user" "forseti" {
  instance  = "${google_sql_database_instance.forseti.name}"
  name      = "${var.os}"
  project   = "${local.project_id}"
}
