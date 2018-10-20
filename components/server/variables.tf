variable "availability_zones" {
  type = "map"
}

variable "cloudsql_database_port" {}

variable "email_recipient" {}

variable "email_sender" {}

# export TF_VAR_forseti_security_states_bucket
variable "forseti_security_states_bucket" {}

variable "forseti_services" {
  type = "list"
}

# export TF_VAR_g_suite_groups_auditor
variable "g_suite_groups_auditor" {}

variable "machine_type" {}

variable "network_tiers" {
  type = "map"
}

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

variable "subnetwork_cidr_ranges" {
  type = "map"
}

variable "sysconfig" {
  type = "map"
}

# export TF_VAR_trusted_images_project_id
variable "trusted_images_project_id" {}
