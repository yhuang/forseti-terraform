resource "random_id" "string" {
  byte_length = "${var.byte_length}"
}

resource "google_sql_database_instance" "forseti_security" {
  name             = "${local.instance_name}"
  database_version = "${var.cloudsql_database_version}"
  project          = "${local.project_id}"
  region           = "${var.regions[0]}"

  settings {
    activation_policy = "${var.cloudsql_settings["activation-policy"]}"
    disk_size         = "${var.cloudsql_settings["disk-size"]}"
    disk_type         = "${var.cloudsql_settings["disk-type"]}"
    tier              = "${var.cloudsql_settings["tier"]}"

    backup_configuration {
      binary_log_enabled = "${var.cloudsql_backup_configuration["binary-log-enabled"]}"
      enabled            = "${var.cloudsql_backup_configuration["enabled"]}"
    }

    ip_configuration {
      ipv4_enabled = "${var.cloudsql_ip_configuration["ipv4-enabled"]}"
      require_ssl = "${var.cloudsql_ip_configuration["require-ssl"]}"

      authorized_networks = [
        "${var.cloudsql_authorized_networks}",
      ]
    }
  }
}
