output "connection_name" {
  value = "${google_sql_database_instance.forseti_security.connection_name}"
}

output "database_name" {
  value = "${google_sql_database.forseti_security.name}"
}

output "database_port" {
  value = "${var.cloudsql_database_port}"
}
