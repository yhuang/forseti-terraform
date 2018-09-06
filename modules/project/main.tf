provider "random" {}

resource "random_id" "string" {
  byte_length = 4
}

resource "google_project" "project" {
  name            = "${var.project_name}"
  project_id      = "${var.project_name}-${random_id.string.hex}"
  org_id          = "${var.org_id}"
  billing_account = "${var.billing_account_id}"
}

# https://forsetisecurity.org/docs/howto/deploy/gcp-deployment.html

resource "google_project_services" "api_services" {
  project = "${google_project.project.project_id}"

  services = [
    "admin.googleapis.com",
    "appengine.googleapis.com",
    "bigquery-json.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "deploymentmanager.googleapis.com",
    "iam.googleapis.com",
    "serviceusage.googleapis.com",
    "sql-component.googleapis.com",
    "sqladmin.googleapis.com",
    "storage-api.googleapis.com",
  ]
}
