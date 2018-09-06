provider "google" {
  region = "${var.regions["0"]}"
}

terraform {
  required_version = ">= 0.11.8"

  backend "gcs" {}
}
