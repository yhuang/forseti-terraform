# https://forsetisecurity.org/docs/howto/deploy/gcp-deployment.html

# resource "google_project_service" "compute" {
#   project            = "${local.forseti_project_id}"
#   service            = "compute.googleapis.com"
#   disable_on_destroy = false
# }
#
# resource "google_project_service" "iam" {
#   project            = "${local.forseti_project_id}"
#   service            = "iam.googleapis.com"
#   disable_on_destroy = false
#
#   depends_on = [
#     "google_project_service.compute",
#   ]
# }

resource "google_project_services" "api_services" {
  project = "${local.forseti_project_id}"

  services = [
    "${var.apis}"
  ]

  # depends_on = [
  #   "google_project_service.iam",
  # ]
}
