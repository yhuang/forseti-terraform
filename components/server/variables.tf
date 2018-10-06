variable "availability_zones" {
  type = "map"
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

variable "network_tier" {}

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

variable "states_bucket_base" {}

variable "subnetwork_cidr_ranges" {
  type = "map"
}

variable "system_configuration" {
  type = "map"
}
