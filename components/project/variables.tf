variable "apis" {
  type = "list"
}

variable "environment" {}

variable "forseti_roles" {
  type = "map"
}

variable "iam_roles" {
  type = "map"
}

variable "project_name" {}

variable "regions" {
  type = "list"
}

variable "terraform_admin_project_id" {}
