variable "bucket_policy" {
  type = "map"
}

# export TF_VAR_environment
variable "environment" {}

variable "regions" {
  type = "list"
}

variable "terraform_admin_project_id" {}
