resource "google_sql_database" "forseti" {
  instance  = "${local.instance_name}"
  name      = "${local.database_name}"
  project   = "${local.project_id}"
}
