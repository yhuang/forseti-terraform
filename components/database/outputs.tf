output "connection_name" {
  value = "${google_sql_database_instance.forseti.connection_name}"
}

output "database_name" {
  value = "${google_sql_database.forseti.name}"
}

output "database_ip" {
  value = "${google_sql_database_instance.forseti.ip_addresses.0.ip_address}"
}

output "database_port" {
  value = "${var.cloudsql_database_port}"
}
