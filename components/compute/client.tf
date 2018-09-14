resource "google_compute_instance" "client" {
  name         = "${local.client_name}"
  machine_type = "${var.machine_type}"
  zone         = "${var.availability_zones[0]}"

  boot_disk {
    initialize_params {
      image = "${local.image_family}"
    }
  }

  network_interface {
    subnetwork         = "${var.subnetwork}"
    subnetwork_project = "${local.project_id}"
  }

  service_account {
    email = "${local.client_service_account}"

    scopes = [
      "${var.scopes["all-api-access"]}",
    ]
  }
}