resource "google_compute_global_address" "managed_services" {
  name          = "managed-services"
  provider      = "google-beta"

  address_type  = "INTERNAL"
  network       = "${local.network_self_link}"
  prefix_length = "16"
  project       = "${local.project_id}"
  purpose       = "VPC_PEERING"
}

resource "google_compute_network_peering" "managed_services" {
  name = "managed-services"
  network = "${local.network_self_link}"
  peer_network = "${google_compute_global_address.managed_services.self_link}"
}
