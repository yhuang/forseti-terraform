variable "availability_zones" {
  type = "map"
}

# export TF_VAR_forseti_security_states_bucket
variable "forseti_security_states_bucket" {}

variable "forseti_services" {
  type = "list"
}

variable "project_name_base" {}

variable "region" {}

variable "regions" {
  type = "map"
}

variable "scopes" {
  type = "map"
}

variable "sysconfig" {
  type = "map"
}
