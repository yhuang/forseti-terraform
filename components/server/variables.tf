variable "availability_zones" {
  type = "list"
}

variable "cloudsql_database_port" {}

variable "email_recipient" {}

variable "email_sender" {}

# export TF_VAR_environment
variable "environment" {}

variable "forseti_security_services" {
  type = "list"
}

variable "machine_type" {}

variable "os" {}

variable "project_name_base" {}

variable "regions" {
  type = "list"
}

variable "sendgrid_api_key" {}

variable "service_accounts" {
  type = "map"
}

variable "scopes" {
  type = "map"
}

variable "software" {
  type = "map"
}

variable "system_configuration" {
  type = "map"
}

variable "subnetwork" {}
