# The random_id resource generates randomness only when it is first created.  The result produced is
# stored in the Terraform states and re-used until the input changes, prompting the resource to be
# recreated.
#
# https://www.terraform.io/docs/providers/random/index.html
#
# In the context of the google_sql_database_instance resource, the ability to generate a new
# resource_id when a new region is specified is required, because reuse a Cloud SQL instance name
# cannot be reused for approximately 7 days after the instance that name is associated to has been
# deleted.  For seamless Cloud SQL instance redeployment upon region change, a resource_id's map
# argument called keepers will trigger new random values to be generated only when users specificy
# a new region that is different from the current region.
#
# https://cloud.google.com/sql/docs/mysql/quickstart

resource "random_id" "string" {
  byte_length = "${var.byte_length}"

  keepers {
    region = "${local.region}"
  }
}

resource "google_sql_database_instance" "forseti" {
  name     = "${var.project_name_base}-${random_id.string.hex}"
  provider = "google-beta"

  database_version = "${var.cloudsql_database_version}"
  project          = "${local.project_id}"
  region           = "${local.region}"

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
      ipv4_enabled    = "${var.cloudsql_ip_configuration["ipv4-enabled"]}"
      private_network = "${local.network}"
      require_ssl     = "${var.cloudsql_ip_configuration["require-ssl"]}"
    }
  }
}
