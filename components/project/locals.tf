locals {
  billing_account           = "${data.google_project.terraform_admin.billing_account}"
  client_service_account    = "${google_service_account.client.email}"
  org_id                    = "${data.google_project.terraform_admin.org_id}"
  forseti_project_id        = "${google_project.forseti.project_id}"
  forseti_project_name      = "${var.environment}-${var.project_name_base}"
  server_service_account    = "${google_service_account.server.email}"
  server_service_account_id = "${google_service_account.server.id}"
}
