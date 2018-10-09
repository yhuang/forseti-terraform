resource "google_storage_bucket" "forseti_bucket" {
  force_destroy = "${var.bucket_policy["force-destroy"]}"
  location      = "${var.bucket_policy["location"]}"
  name          = "${local.project_id}"
  project       = "${local.project_id}"
  storage_class = "${var.bucket_policy["storage-class"]}"

  versioning    {
    enabled = "${var.bucket_policy["versioning"]}"
  }
}
