resource "google_compute_instance" "server" {
  name         = "${local.server_name}"
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
    email = "${local.server_service_account}"

    scopes = [
      "${var.scopes["all-api-access"]}",
    ]
  }

  metadata {
    startup-script = "${data.template_file.configure_forseti_services.rendered}"
  }
}
