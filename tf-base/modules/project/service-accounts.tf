# https://forsetisecurity.org/docs/guides/forseti-service-accounts.html

resource "google_service_account" "auditor" {
  account_id   = "${var.roles["auditor"]}"
  project      = "${google_project.project.project_id}"
}

resource "google_service_account" "enforcer" {
  account_id   = "${var.roles["enforcer"]}"
  project      = "${google_project.project.project_id}"
}

resource "google_service_account" "explainer" {
  account_id   = "${var.roles["explainer"]}"
  project      = "${google_project.project.project_id}"
}


resource "google_organization_iam_binding" "bigquery_data_viewer" {
  org_id = "${var.org_id}"
  role   = "roles/bigquery.dataViewer"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_organization_iam_binding" "browser" {
  org_id = "${var.org_id}"
  role   = "roles/browser"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_organization_iam_binding" "network_viewer" {
  org_id = "${var.org_id}"
  role   = "roles/compute.networkViewer"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_organization_iam_binding" "security_reviewer" {
  org_id = "${var.org_id}"
  role   = "roles/iam.securityReviewer"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_organization_iam_binding" "appengine_app_iewer" {
  org_id = "${var.org_id}"
  role   = "roles/appengine.appViewer"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_organization_iam_binding" "b_quota_viewer" {
  org_id = "${var.org_id}"
  role   = "roles/servicemanagement.quotaViewer"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_organization_iam_binding" "cloudsql_viewer" {
  org_id = "${var.org_id}"
  role   = "roles/cloudsql.viewer"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}


resource "google_organization_iam_binding" "security_admin" {
  org_id = "${var.org_id}"
  role   = "roles/compute.securityAdmin"

  members = [
    "serviceAccount:${google_service_account.enforcer.email}",
  ]
}


resource "google_project_iam_binding" "storage_object_viewer" {
  project = "${google_project.project.project_id}"
  role    = "roles/storage.objectViewer"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
    "serviceAccount:${google_service_account.enforcer.email}",
  ]
}

resource "google_project_iam_binding" "storage_object_creator" {
  project = "${google_project.project.project_id}"
  role    = "roles/storage.objectCreator"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
    "serviceAccount:${google_service_account.enforcer.email}",
  ]
}

resource "google_project_iam_binding" "log_writer" {
  project = "${google_project.project.project_id}"
  role    = "roles/logging.logWriter"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
    "serviceAccount:${google_service_account.enforcer.email}",
  ]
}

resource "google_project_iam_binding" "cloudsql_client" {
  project = "${google_project.project.project_id}"
  role    = "roles/cloudsql.client"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
    "serviceAccount:${google_service_account.enforcer.email}",
    "serviceAccount:${google_service_account.explainer.email}",
  ]
}