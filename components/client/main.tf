resource "google_compute_instance" "client" {
  name         = "${local.client_name}"
  machine_type = "${var.machine_type}"
  project      = "${local.project_id}"
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

  metadata {
    enable-oslogin = "${var.enable_os_login}"
    startup-script = "${data.template_file.configure_forseti_security_client.rendered}"
  }
}
