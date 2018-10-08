resource "google_compute_firewall" "a_all_to_forseti_security_client" {
  name    = "a--all--to--forseti-security-client"

  direction = "INGRESS"
  network = "${local.network}"
  priority  = 100
  project = "${local.project_id}"

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
    "${local.client_service_account}"
  ]
}

resource "google_compute_firewall" "d_all_to_forseti_security_client" {
  name    = "d--all--to--forseti-security-client"

  direction = "INGRESS"
  network = "${local.network}"
  priority  = 200
  project = "${local.project_id}"

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
    "${local.client_service_account}"
  ]
}
