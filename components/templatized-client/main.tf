resource "google_compute_instance_from_template" "client" {
  source_instance_template = "${local.template_self_link}"

  name         = "${local.client_name}"
  project      = "${local.project_id}"
  zone         = "${local.zone}"

  service_account {
    email = "${local.client_service_account}"

    scopes = [
      "${var.scopes["all-api-access"]}",
    ]
  }

  metadata {
    startup-script = "${local.startup_script}"
  }
}
