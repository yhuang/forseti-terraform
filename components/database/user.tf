resource "google_sql_user" "forseti_security" {
  instance  = "${google_sql_database_instance.forseti_security.name}"
  name      = "${var.cloudsql_database_user_name}"
  password  = "${var.cloudsql_database_user_password}"
  project   = "${local.project_id}"
}
