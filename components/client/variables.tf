variable "availability_zones" {
  type = "map"
}

# export TF_VAR_environment
variable "environment" {}

variable "forseti_security_services" {
  type = "list"
}

variable "machine_type" {}

variable "network_tier" {}

variable "project_name_base" {}

variable "region" {}

variable "regions" {
  type = "map"
}

variable "scopes" {
  type = "map"
}

variable "software" {
  type = "map"
}

variable "states_bucket_base" {}

variable "system_configuration" {
  type = "map"
}
