resource "random_id" "string" {
  byte_length = "${var.byte_length}"
}

resource "google_project" "forseti" {
  name                = "${local.forseti_project_name}"

  auto_create_network = "false"
  billing_account     = "${local.billing_account}"
  org_id              = "${local.org_id}"
  project_id          = "${local.forseti_project_name}-${random_id.string.hex}"
}
