# https://forsetisecurity.org/docs/guides/forseti-service-accounts.html
resource "google_service_account" "server" {
  account_id = "${var.forseti_roles["server"]}"
  project    = "${local.project_id}"
}

resource "google_service_account" "client" {
  account_id = "${var.forseti_roles["client"]}"
  project    = "${local.project_id}"
}

resource "google_organization_iam_binding" "appengine_app_viewer" {
  org_id = "${local.org_id}"
  role   = "${var.iam_roles["appengine-appViewer"]}"

  members = [
    "serviceAccount:${local.server_service_account}",
  ]
}

resource "google_organization_iam_binding" "bigquery_data_viewer" {
  org_id = "${local.org_id}"
  role   = "${var.iam_roles["bigquery-dataViewer"]}"

  members = [
    "serviceAccount:${local.server_service_account}",
  ]
}

resource "google_organization_iam_binding" "browser" {
  org_id = "${local.org_id}"
  role   = "${var.iam_roles["browser"]}"

  members = [
    "serviceAccount:${local.server_service_account}",
  ]
}

resource "google_organization_iam_binding" "cloudsql_viewer" {
  org_id = "${local.org_id}"
  role   = "${var.iam_roles["cloudsql-viewer"]}"

  members = [
    "serviceAccount:${local.server_service_account}",
  ]
}

resource "google_organization_iam_binding" "compute_network_viewer" {
  org_id = "${local.org_id}"
  role   = "${var.iam_roles["compute-networkViewer"]}"

  members = [
    "serviceAccount:${local.server_service_account}",
  ]
}

resource "google_organization_iam_binding" "computer_security_admin" {
  org_id = "${local.org_id}"
  role   = "${var.iam_roles["compute-securityAdmin"]}"

  members = [
    "serviceAccount:${local.server_service_account}",
  ]
}

resource "google_organization_iam_binding" "iam_security_reviewer" {
  org_id = "${local.org_id}"
  role   = "${var.iam_roles["iam-securityReviewer"]}"

  members = [
    "serviceAccount:${local.server_service_account}",
  ]
}

resource "google_organization_iam_binding" "servicemanagement_quota_viewer" {
  org_id = "${local.org_id}"
  role   = "${var.iam_roles["servicemanagement-quotaViewer"]}"

  members = [
    "serviceAccount:${local.server_service_account}",
  ]
}

resource "google_organization_iam_binding" "serviceusage_serviceUsageConsumer" {
  org_id = "${local.org_id}"
  role   = "${var.iam_roles["serviceusage-serviceUsageConsumer"]}"

  members = [
    "serviceAccount:${local.server_service_account}",
  ]
}

resource "google_project_iam_binding" "cloudsql_client" {
  project = "${local.project_id}"
  role    = "${var.iam_roles["cloudsql-client"]}"

  members = [
    "serviceAccount:${local.server_service_account}",
  ]
}

resource "google_project_iam_binding" "logging_log_writer" {
  project = "${local.project_id}"
  role    = "${var.iam_roles["logging-logWriter"]}"

  members = [
    "serviceAccount:${local.server_service_account}",
    "serviceAccount:${local.client_service_account}",
  ]
}

resource "google_project_iam_binding" "storage_object_creator" {
  project = "${local.project_id}"
  role    = "${var.iam_roles["storage-objectCreator"]}"

  members = [
    "serviceAccount:${local.server_service_account}",
  ]
}

resource "google_project_iam_binding" "storage_object_viewer" {
  project = "${local.project_id}"
  role    = "${var.iam_roles["storage-objectViewer"]}"

  members = [
    "serviceAccount:${local.server_service_account}",
    "serviceAccount:${local.client_service_account}",
  ]
}

resource "google_service_account_iam_binding" "serviceAccountTokenCreator" {
  service_account_id = "${local.server_service_account_id}"
  role               = "${var.iam_roles["iam-serviceAccountTokenCreator"]}"

  members = [
    "serviceAccount:${local.server_service_account}",
  ]
}

resource "google_project_iam_binding" "compute_image_user" {
  project = "${var.trusted_images_project_id}"
  role    = "${var.iam_roles["compute-imageUser"]}"

  members = [
    "serviceAccount:${local.terraform_admin}",
    "serviceAccount:${local.server_service_account}",
    "serviceAccount:${local.client_service_account}",
  ]
}
