# https://forsetisecurity.org/docs/guides/forseti-service-accounts.html

resource "google_service_account" "explainer" {
  account_id   = "${var.roles["explainer"]}"
  project      = "${google_project.project.project_id}"
}


resource "google_project_iam_binding" "explainer_cloudsql_client" {
  project = "${google_project.project.project_id}"
  role    = "roles/cloudsql.client"

  members = [
    "serviceAccount:${google_service_account.explainer.email}",
  ]
}