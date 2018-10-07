variable "byte_length" {}

variable "cloudsql_authorized_networks" {
  type = "list"
}

variable "cloudsql_backup_configuration" {
  type = "map"
}

variable "cloudsql_database_port" {}

variable "cloudsql_database_version" {}

variable "cloudsql_ip_configuration" {
  type = "map"
}

variable "cloudsql_settings" {
  type = "map"
}

# export TF_VAR_environment
variable "environment" {}

variable "os" {}

variable "project_name_base" {}

variable "region" {}

variable "regions" {
  type = "map"
}

variable "states_bucket_base" {}
