# export TF_VAR_forseti_security_states_bucket
variable "forseti_security_states_bucket" {}

variable "machine_type" {}

variable "network_tiers" {
  type = "map"
}

variable "project_name_base" {}

variable "region" {}

variable "regions" {
  type = "map"
}

variable "subnetwork_cidr_ranges" {
  type = "map"
}

# export TF_VAR_trusted_images_project_id
variable "trusted_images_project_id" {}
