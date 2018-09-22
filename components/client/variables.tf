variable "availability_zones" {
  type = "list"
}

variable "cloudsql_database_port" {}

variable "cloudsql_database_user_name" {}

variable "cloudsql_proxy" {}

variable "enable_os_login" {}

# export TF_VAR_environment
variable "environment" {}

variable "forseti_security_services" {
  type = "list"
}

variable "machine_type" {}

variable "project_name_base" {}

variable "regions" {
  type = "list"
}

variable "scopes" {
  type = "map"
}

variable "subnetwork" {}

variable "software" {
  type = "map"
}

variable "system_configuration" {
  type = "map"
}
