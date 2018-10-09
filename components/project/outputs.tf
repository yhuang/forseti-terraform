output "client_service_account" {
  value = "${google_service_account.client.email}"
}

output "org_id" {
  value = "${google_project.forseti.org_id}"
}

output "project_id" {
  value = "${google_project.forseti.project_id}"
}

output "project_name" {
  value = "${google_project.forseti.name}"
}

output "project_number" {
  value = "${google_project.forseti.number}"
}

output "server_service_account" {
  value = "${google_service_account.server.email}"
}
