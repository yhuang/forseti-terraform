variable "availability_zones" {
  type = "list"
}

variable "cloudsql_database_user_name" {}

variable "cloudsql_database_port" {}

# export TF_VAR_environment
variable "environment" {}

variable "image_family" {}

variable "machine_type" {}

variable "subnetwork" {}

variable "project_name_base" {}

variable "regions" {
  type = "list"
}

variable "scopes" {
  type = "map"
}
