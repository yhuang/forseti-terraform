# export TF_VAR_forseti_security_states_bucket
variable "forseti_security_states_bucket" {}

variable "known_ips" {
  type = "map"
}

variable "private_ip_google_access" {}

variable "project_name_base" {}

variable "regions" {
  type = "map"
}

variable "subnetwork_cidr_ranges" {
  type = "map"
}
