resource "google_storage_bucket" "forseti_bucket" {
  name          = "${local.project_id}"

  force_destroy = "${var.bucket_policy["force-destroy"]}"
  location      = "${var.bucket_policy["location"]}"
  project       = "${local.project_id}"
  storage_class = "${var.bucket_policy["storage-class"]}"

  versioning    {
    enabled = "${var.bucket_policy["versioning"]}"
  }
}
