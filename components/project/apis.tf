# https://forsetisecurity.org/docs/howto/deploy/gcp-deployment.html

resource "google_project_services" "api_services" {
  project = "${google_project.forseti.project_id}"

  services = [
    "${var.apis}"
  ]
}
