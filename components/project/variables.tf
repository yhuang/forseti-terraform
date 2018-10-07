variable "apis" {
  type = "list"
}

variable "byte_length" {}

# export TF_VAR_environment
variable "environment" {}

variable "forseti_roles" {
  type = "map"
}

variable "iam_roles" {
  type = "map"
}

variable "project_name_base" {}

# export TF_VAR_terraform_admin_project_id
variable "terraform_admin_project_id" {}
