# export TF_VAR_environment
variable "environment" {}

variable "machine_type" {}

variable "network_tier" {}

variable "project_name_base" {}

variable "region" {}

variable "regions" {
  type = "map"
}

variable "states_bucket_base" {}

variable "subnetwork_cidr_ranges" {
  type = "map"
}
