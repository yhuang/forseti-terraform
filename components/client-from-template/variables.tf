variable "availability_zones" {
  type = "map"
}

# export TF_VAR_environment
variable "environment" {}

variable "forseti_security_services" {
  type = "list"
}

variable "project_name_base" {}

variable "regions" {
  type = "list"
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
