resource "google_compute_network" "forseti_security" {
  name                    = "${var.environment}-${var.project_name_base}"
  project                 = "${local.project_id}"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "forseti_security_us_central1" {
  name          = "${var.environment}-${var.project_name_base}-${var.regions[1]}"
  ip_cidr_range = "${var.subnetwork_cidr_ranges[var.regions[1]]}"
  region        = "${var.regions[1]}"
  project       = "${local.project_id}"
  network       = "${google_compute_network.forseti_security.self_link}"
}
