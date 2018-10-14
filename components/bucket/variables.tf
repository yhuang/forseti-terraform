variable "bucket_policy" {
  type = "map"
}

# export TF_VAR_forseti_security_states_bucket
variable "forseti_security_states_bucket" {}

variable "iam_roles" {
  type = "map"
}

variable "project_name_base" {}

variable "region" {}

variable "regions" {
  type = "map"
}

variable "terraform_admin_project_id" {}
