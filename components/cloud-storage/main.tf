data "terraform_remote_state" "project" {
  backend = "gcs"
  config {
    bucket  = "${var.ENV}-forseti-terraform-states"
    prefix  = "${var.ENV}-components/core-admin/project"
  }
}

resource "google_storage_bucket" "scanner_bucket" {
  name          = "${data.terraform_remote_state.project.project_id}"
  project       = "${data.terraform_remote_state.project.project_id}"
  location      = "US"
  storage_class = "MULTI_REGIONAL"
  versioning    {
    enabled = true
  }
  force_destroy = true
}