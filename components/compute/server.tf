resource "google_compute_instance" "server" {
  name         = "${local.server_name}"
  machine_type = "${var.machine_type}"
  zone         = "${var.availability_zones[0]}"

  boot_disk {
    initialize_params {
      image = "${local.image}"
    }
  }

  network_interface {
    network = "default"
  }

  service_account {
    email = "${local.server_service_account}"

    scopes = [
      "${var.scopes["all-api-access"]}",
    ]
  }
}
