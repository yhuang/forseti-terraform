locals {
  client_service_account    = "${google_service_account.client.email}"
  org_id                    = "${google_project.forseti_security.org_id}"
  project_id                = "${google_project.forseti_security.project_id}"
  server_service_account    = "${google_service_account.server.email}"
  server_service_account_id = "projects/${local.project_id}/serviceAccounts/${local.server_service_account}"
}
