resource "google_compute_instance" "server" {
  name         = "${local.server_name}"
  machine_type = "${var.machine_type}"
  project      = "${local.project_id}"
  zone         = "${local.zone}"

  boot_disk {
    initialize_params {
      image = "${local.image_family}"
    }
  }

  network_interface {
    subnetwork         = "${local.subnetwork}"
    subnetwork_project = "${local.project_id}"

    access_config {
      network_tier = "${var.network_tier}"
      // Ephemeral External IP
    }
  }

  service_account {
    email = "${local.server_service_account}"

    scopes = [
      "${var.scopes["all-api-access"]}",
    ]
  }

  metadata {
    startup-script = "${local.startup_script}"
  }
}
