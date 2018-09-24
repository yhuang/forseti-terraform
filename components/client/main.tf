resource "google_compute_instance" "client" {
  name         = "${local.client_name}"
  machine_type = "${var.machine_type}"
  project      = "${local.project_id}"
  zone         = "${element(var.availability_zones[var.regions[1]], 0)}"

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
    email = "${local.client_service_account}"

    scopes = [
      "${var.scopes["all-api-access"]}",
    ]
  }

  metadata {
    enable-oslogin = "${var.enable_os_login}"
    startup-script = "${data.template_file.configure_forseti_security_client.rendered}"
  }
}
