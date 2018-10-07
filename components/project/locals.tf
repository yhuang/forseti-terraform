locals {
  client_service_account    = "${google_service_account.client.email}"
  org_id                    = "${google_project.forseti_security.org_id}"
  project_id                = "${google_project.forseti_security.project_id}"
  server_service_account    = "${google_service_account.server.email}"
  server_service_account_id = "${google_service_account.server.id}"
  terraform_admin           = "${var.service_accounts["terraform-admin"]}"
}
