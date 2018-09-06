provider "random" {}

resource "random_id" "string" {
  byte_length = 4
}

resource "google_project" "forseti_security" {
  name            = "${var.environment}-forseti-security"
  project_id      = "${var.environment}-forseti-security-${random_id.string.hex}"
  org_id          = "${data.google_project.terraform_admin.org_id}"
  billing_account = "${data.google_project.terraform_admin.billing_account}"
}

# https://forsetisecurity.org/docs/howto/deploy/gcp-deployment.html

resource "google_project_services" "api_services" {
  project = "${google_project.forseti_security.project_id}"

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

    "container.googleapis.com",
    "containerregistry.googleapis.com",
    "oslogin.googleapis.com",
    "pubsub.googleapis.com",
    "replicapool.googleapis.com",
    "replicapoolupdater.googleapis.com",
    "resourceviews.googleapis.com",
  ]
}
