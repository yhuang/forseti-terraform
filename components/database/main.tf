resource "google_sql_database" "forseti" {
  instance  = "${google_sql_database_instance.forseti.name}"
  name      = "${local.database_name}"
  project   = "${local.project_id}"
}
