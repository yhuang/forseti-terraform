resource "google_storage_bucket" "forseti_security_bucket" {
  name          = "${data.terraform_remote_state.project.project_id}"
  project       = "${data.terraform_remote_state.project.project_id}"
  location      = "${var.bucket_policy["location"]}"
  storage_class = "${var.bucket_policy["storage_class"]}"
  versioning    {
    enabled = "${var.bucket_policy["versioning"]}"
  }
  force_destroy = "${var.bucket_policy["force_destroy"]}"
}
