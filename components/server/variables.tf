variable "availability_zones" {
  type = "map"
}

variable "cloudsql_database_port" {}

variable "email_recipient" {}

variable "email_sender" {}

# export TF_VAR_environment
variable "environment" {}

variable "forseti_services" {
  type = "list"
}

variable "machine_type" {}

variable "network_tier" {}

variable "os" {}

variable "project_name_base" {}

variable "region" {}

variable "regions" {
  type = "map"
}

variable "scopes" {
  type = "map"
}

variable "sendgrid_api_key" {}

variable "service_accounts" {
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

# export TF_VAR_trusted_images_project_id
variable "trusted_images_project_id" {}
