resource "google_compute_firewall" "d_all_to_forseti_security_server" {
  name    = "d--all--to--forseti-security-server"
  network = "${local.network}"
  project = "${local.project_id}"

  direction = "INGRESS"
  priority  = 200

  deny {
    protocol = "icmp"
  }

  deny {
    protocol = "tcp"
  }

  deny {
    protocol = "udp"
  }

  source_ranges = [
    "${var.known_ips["all"]}",
  ]

  target_service_accounts = [
    "${local.server_service_account}"
  ]
}

resource "google_compute_firewall" "a_all_to_forseti_security_server" {
  name    = "a--all--to--forseti-security-server"
  network = "${local.network}"
  project = "${local.project_id}"

  direction = "INGRESS"
  priority  = 100

  allow {
    protocol = "tcp"
    ports    = [
      "22"
    ]
  }

  source_ranges = [
    "${var.known_ips["all"]}",
  ]

  target_service_accounts = [
    "${local.server_service_account}"
  ]
}

resource "google_compute_firewall" "a_forseti_security_subnetwork_to_forseti_security_server" {
  name    = "a--forseti-security-subnetwork--to--forseti-security-server"
  network = "${local.network}"
  project = "${local.project_id}"

  direction = "INGRESS"
  priority  = 100

  allow {
    protocol = "tcp"
    ports    = [
      "50051"
    ]
  }

  source_ranges = [
    "${var.subnetwork_cidr_ranges[var.regions[1]]}",
  ]

  target_service_accounts = [
    "${local.server_service_account}"
  ]
}
