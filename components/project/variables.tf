variable "apis" {
  type = "list"
}

variable "byte_length" {}

# export TF_VAR_environment
variable "environment" {}

variable "forseti_roles" {
  type = "map"
}

# export TF_VAR_forseti_security_states_bucket
variable "forseti_security_states_bucket" {}

variable "iam_roles" {
  type = "map"
}

variable "project_name_base" {}

# export TF_VAR_terraform_admin_project_id
variable "terraform_admin_project_id" {}

# export TF_VAR_trusted_images_project_id
variable "trusted_images_project_id" {}
