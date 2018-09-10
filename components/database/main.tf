resource "google_sql_database" "forseti_security" {
  instance  = "${google_sql_database_instance.forseti_security.name}"
  name      = "${local.database_name}"
  project   = "${local.project_id}"
}
