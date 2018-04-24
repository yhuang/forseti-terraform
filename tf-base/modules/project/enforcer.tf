# https://forsetisecurity.org/docs/guides/forseti-service-accounts.html

resource "google_service_account" "enforcer" {
  account_id   = "${var.roles["enforcer"]}"
  project      = "${google_project.project.project_id}"
}


resource "google_organization_iam_binding" "enforcer_security_admin" {
  org_id = "${var.org_id}"
  role   = "roles/compute.securityAdmin"

  members = [
    "serviceAccount:${google_service_account.enforcer.email}",
  ]
}


resource "google_project_iam_binding" "enforcer_storage_object_viewer" {
  project = "${google_project.project.project_id}"
  role    = "roles/storage.objectViewer"

  members = [
    "serviceAccount:${google_service_account.enforcer.email}",
  ]
}

resource "google_project_iam_binding" "enforcer_storage_object_creator" {
  project = "${google_project.project.project_id}"
  role    = "roles/storage.objectCreator"

  members = [
    "serviceAccount:${google_service_account.enforcer.email}",
  ]
}

resource "google_project_iam_binding" "enforcer_log_writer" {
  project = "${google_project.project.project_id}"
  role    = "roles/logging.logWriter"

  members = [
    "serviceAccount:${google_service_account.enforcer.email}",
  ]
}

resource "google_project_iam_binding" "enforcer_cloudsql_client" {
  project = "${google_project.project.project_id}"
  role    = "roles/cloudsql.client"

  members = [
    "serviceAccount:${google_service_account.enforcer.email}",
  ]
}