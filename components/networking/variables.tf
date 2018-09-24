variable "environment" {}

variable "project_name_base" {}

variable "regions" {
  type = "list"
}

variable "subnetwork_cidr_ranges" {
  type = "map"
}
