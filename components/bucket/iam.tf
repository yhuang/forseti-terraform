resource "google_storage_bucket_iam_binding" "storage_bucket_object_admin" {
  bucket = "${local.bucket_name}"
  role   = "${lookup(var.iam_roles["storage"], "objectAdmin")}"

  members = [
    "serviceAccount:${local.server_service_account}",
  ]
}
