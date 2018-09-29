variable "availability_zones" {
  type = "map"
}

# export TF_VAR_environment
variable "environment" {}

variable "forseti_security_services" {
  type = "list"
}

variable "known_ips" {
  type = "map"
}

variable "machine_type" {}

variable "network_tier" {}

variable "os" {}

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

variable "system_configuration" {
  type = "map"
}
