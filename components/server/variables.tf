variable "availability_zones" {
  type = "list"
}

variable "cloudsql_database_port" {}

variable "cloudsql_database_user_name" {}

# export TF_VAR_environment
variable "environment" {}

variable "forseti_security_services" {}

variable "machine_type" {}

variable "os" {}

variable "project_name_base" {}

variable "regions" {
  type = "list"
}

variable "service_accounts" {
  type = "map"
}

variable "scopes" {
  type = "map"
}

variable "software" {
  type = "map"
}

variable "subnetwork" {}
