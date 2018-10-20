# https://forsetisecurity.org/docs/howto/deploy/gcp-deployment.html

resource "google_project_services" "api_services" {
  project = "${local.forseti_project_id}"

  services = [
    "${var.apis}"
  ]
}
