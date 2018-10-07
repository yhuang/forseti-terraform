variable "bucket_policy" {
  type = "map"
}

# export TF_VAR_environment
variable "environment" {}

variable "iam_roles" {
  type = "map"
}

variable "project_name_base" {}

variable "region" {}

variable "regions" {
  type = "map"
}

variable "states_bucket_base" {}

variable "terraform_admin_project_id" {}
