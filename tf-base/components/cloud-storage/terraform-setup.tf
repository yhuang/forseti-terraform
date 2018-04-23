provider "google" {
  region = "${var.regions["0"]}"
}

terraform {
  required_version = ">= 0.10.4"
  backend          "gcs"            {}
}
