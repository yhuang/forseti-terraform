provider "random" {}

resource "random_id" "string" {
  byte_length = 4
}

resource "google_project" "forseti_security" {
  name            = "${var.environment}-${var.project_name}"
  project_id      = "${var.environment}-${var.project_name}-${random_id.string.hex}"
  org_id          = "${data.google_project.terraform_admin.org_id}"
  billing_account = "${data.google_project.terraform_admin.billing_account}"
}

# https://forsetisecurity.org/docs/howto/deploy/gcp-deployment.html

resource "google_project_services" "api_services" {
  project = "${google_project.forseti_security.project_id}"

  services = [
    "${var.apis}"
  ]
}
