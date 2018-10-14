locals {
  client_service_account    = "${google_service_account.client.email}"
  org_id                    = "${google_project.forseti.org_id}"
  project_id                = "${google_project.forseti.project_id}"
  server_service_account    = "${google_service_account.server.email}"
  server_service_account_id = "${google_service_account.server.id}"
}
