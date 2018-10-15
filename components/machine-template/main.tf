resource "google_compute_instance_template" "forseti" {
  name         = "${local.image_name}"

  machine_type = "${var.machine_type}"
  project      = "${local.project_id}"

  disk {
    auto_delete  = true
    boot         = true
    source_image = "${local.image_self_link}"
  }

  network_interface {
    subnetwork         = "${local.subnetwork}"
    subnetwork_project = "${local.project_id}"

    access_config {
      network_tier = "${local.network_tier}"
      // Ephemeral External IP
    }
  }
}
