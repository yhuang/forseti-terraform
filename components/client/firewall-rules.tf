resource "google_compute_firewall" "d_all_to_forseti_security_client" {
  name    = "d--all--to--forseti-security-client"
  network = "${local.network}"
  project = "${local.project_id}"

  direction = "INGRESS"
  priority  = 200

  deny {
    protocol = "tcp"
  }

  source_ranges = [
    "${var.known_ips["all"]}",
  ]

  target_service_accounts = [
    "${local.client_service_account}"
  ]
}

resource "google_compute_firewall" "a_all_to_forseti_security_client" {
  name    = "a--all--to--forseti-security-client"
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
    "${local.client_service_account}"
  ]
}
