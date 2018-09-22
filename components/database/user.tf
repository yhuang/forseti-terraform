resource "google_sql_user" "forseti_security" {
  instance  = "${google_sql_database_instance.forseti_security.name}"
  name      = "${var.os}"
  project   = "${local.project_id}"
}
