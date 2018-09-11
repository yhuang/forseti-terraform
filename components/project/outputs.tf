output "project_id" {
  value = "${google_project.forseti_security.project_id}"
}

output "project_name" {
  value = "${google_project.forseti_security.name}"
}

output "project_number" {
  value = "${google_project.forseti_security.number}"
}

output "server_service_account" {
  value = "${google_service_account.server.email}"
}

output "client_service_account" {
  value = "${google_service_account.client.email}"
}
