variable "billing_account_id" {}
variable "forseti_roles" {
  type = "map"
}
variable "org_id" {}
variable "project_names" {
  type = "map"
}
variable regions {
  type = "list"
}
