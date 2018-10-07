variable "environment" {}

variable "known_ips" {
  type = "map"
}

variable "project_name_base" {}

variable "regions" {
  type = "map"
}

variable "states_bucket_base" {}

variable "subnetwork_cidr_ranges" {
  type = "map"
}
