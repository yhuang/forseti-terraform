# export TF_VAR_environment
variable "environment" {}

variable "machine_type" {}

variable "network_tier" {}

variable "project_name_base" {}

variable "regions" {
  type = "list"
}

variable "states_bucket_base" {}

variable "subnetwork_cidr_ranges" {
  type = "map"
}
