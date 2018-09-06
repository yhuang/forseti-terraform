# https://forsetisecurity.org/docs/guides/forseti-service-accounts.html

resource "google_service_account" "auditor" {
  account_id = "${var.forseti_roles["auditor"]}"
  project    = "${google_project.forseti_security.project_id}"
}

resource "google_service_account" "enforcer" {
  account_id = "${var.forseti_roles["enforcer"]}"
  project    = "${google_project.forseti_security.project_id}"
}

resource "google_service_account" "explainer" {
  account_id = "${var.forseti_roles["explainer"]}"
  project    = "${google_project.forseti_security.project_id}"
}

resource "google_organization_iam_binding" "appengine_app_viewer" {
  org_id = "${google_project.forseti_security.org_id}"
  role   = "${var.iam_roles["appengine-appViewer"]}"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_organization_iam_binding" "bigquery_data_viewer" {
  org_id = "${google_project.forseti_security.org_id}"
  role   = "${var.iam_roles["bigquery-dataViewer"]}"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_organization_iam_binding" "browser" {
  org_id = "${google_project.forseti_security.org_id}"
  role   = "${var.iam_roles["browser"]}"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_project_iam_binding" "cloudsql_client" {
  project = "${google_project.forseti_security.project_id}"
  role    = "${var.iam_roles["cloudsql-client"]}"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
    "serviceAccount:${google_service_account.enforcer.email}",
    "serviceAccount:${google_service_account.explainer.email}",
  ]
}

resource "google_organization_iam_binding" "cloudsql_viewer" {
  org_id = "${google_project.forseti_security.org_id}"
  role   = "${var.iam_roles["cloudsql-viewer"]}"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_organization_iam_binding" "compute_network_viewer" {
  org_id = "${google_project.forseti_security.org_id}"
  role   = "${var.iam_roles["compute-networkViewer"]}"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_organization_iam_binding" "computer_security_admin" {
  org_id = "${google_project.forseti_security.org_id}"
  role   = "${var.iam_roles["compute-securityAdmin"]}"

  members = [
    "serviceAccount:${google_service_account.enforcer.email}",
  ]
}

resource "google_organization_iam_binding" "iam_security_reviewer" {
  org_id = "${google_project.forseti_security.org_id}"
  role   = "${var.iam_roles["iam-securityReviewer"]}"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}

resource "google_project_iam_binding" "logging_log_writer" {
  project = "${google_project.forseti_security.project_id}"
  role    = "${var.iam_roles["logging-logWriter"]}"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
    "serviceAccount:${google_service_account.enforcer.email}",
  ]
}

resource "google_project_iam_binding" "storage_object_creator" {
  project = "${google_project.forseti_security.project_id}"
  role   = "${var.iam_roles["storage-objectCreator"]}"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
    "serviceAccount:${google_service_account.enforcer.email}",
  ]
}

resource "google_project_iam_binding" "storage_object_viewer" {
  project = "${google_project.forseti_security.project_id}"
  role   = "${var.iam_roles["storage-objectViewer"]}"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
    "serviceAccount:${google_service_account.enforcer.email}",
  ]
}

resource "google_organization_iam_binding" "servicemanagement_quota_viewer" {
  org_id = "${google_project.forseti_security.org_id}"
  role   = "${var.iam_roles["servicemanagement-quotaViewer"]}"

  members = [
    "serviceAccount:${google_service_account.auditor.email}",
  ]
}
