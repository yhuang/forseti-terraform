# https://forsetisecurity.org/docs/guides/forseti-service-accounts.html

resource "google_service_account" "auditor" {
  account_id   = "${var.roles["auditor"]}"
  project      = "${google_project.project.project_id}"
}


resource "google_organization_iam_binding" "auditor_bigquery_data_viewer" {
  org_id = "${var.org_id}"
  role   = "roles/bigquery.dataViewer"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_organization_iam_binding" "auditor_browser" {
  org_id = "${var.org_id}"
  role   = "roles/browser"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_organization_iam_binding" "auditor_network_viewer" {
  org_id = "${var.org_id}"
  role   = "roles/compute.networkViewer"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_organization_iam_binding" "auditor_security_reviewer" {
  org_id = "${var.org_id}"
  role   = "roles/iam.securityReviewer"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_organization_iam_binding" "auditor_appengine_app_iewer" {
  org_id = "${var.org_id}"
  role   = "roles/appengine.appViewer"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_organization_iam_binding" "auditor_b_quota_viewer" {
  org_id = "${var.org_id}"
  role   = "roles/servicemanagement.quotaViewer"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_organization_iam_binding" "auditor_cloudsql_viewer" {
  org_id = "${var.org_id}"
  role   = "roles/cloudsql.viewer"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}


resource "google_project_iam_binding" "auditor_storage_object_viewer" {
  project = "${google_project.project.project_id}"
  role    = "roles/storage.objectViewer"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_project_iam_binding" "auditor_storage_object_creator" {
  project = "${google_project.project.project_id}"
  role    = "roles/storage.objectCreator"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_project_iam_binding" "auditor_log_writer" {
  project = "${google_project.project.project_id}"
  role    = "roles/logging.logWriter"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_project_iam_binding" "auditor_cloudsql_client" {
  project = "${google_project.project.project_id}"
  role    = "roles/cloudsql.client"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}