variable "bucket_policy" {
  type = "map"
}

# export TF_VAR_forseti_security_states_bucket
variable "forseti_security_states_bucket" {}

variable "iam_roles" {
  type = "map"
}

variable "region" {}

variable "regions" {
  type = "map"
}
