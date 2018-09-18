variable "byte_length" {}

variable "cloudsql_authorized_networks" {
  type = "list"
}

variable "cloudsql_backup_configuration" {
  type = "map"
}

variable "cloudsql_database_port" {}

variable "cloudsql_database_user_name" {}

# export TF_VAR_cloudsql_database_user_password
variable "cloudsql_database_user_password" {}

variable "cloudsql_database_version" {}

variable "cloudsql_ip_configuration" {
  type = "map"
}

variable "cloudsql_settings" {
  type = "map"
}

# export TF_VAR_environment
variable "environment" {}

variable "project_name_base" {}

variable "regions" {
  type = "list"
}
