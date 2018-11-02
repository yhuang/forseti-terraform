resource "google_compute_firewall" "a_all_to_forseti_server" {
  name = "a--all--to--forseti-server"

  direction = "INGRESS"
  network   = "${local.network_self_link}"
  priority  = 100
  project   = "${local.project_id}"

  allow {
    protocol = "tcp"

    ports = [
      "22",
    ]
  }

  source_ranges = [
    "${var.known_ips["all"]}",
  ]

  target_service_accounts = [
    "${local.server_service_account}",
  ]
}

resource "google_compute_firewall" "a_forseti_subnetworks_to_forseti_server" {
  name = "a--forseti-subnetworks--to--forseti-server"

  direction = "INGRESS"
  network   = "${local.network_self_link}"
  priority  = 100
  project   = "${local.project_id}"

  allow {
    protocol = "tcp"

    ports = [
      "50051",
    ]
  }

  source_ranges = [
    "${values(var.subnetwork_cidr_ranges)}",
  ]

  target_service_accounts = [
    "${local.server_service_account}",
  ]
}

resource "google_compute_firewall" "d_all_to_forseti_server" {
  name = "d--all--to--forseti-server"

  direction = "INGRESS"
  network   = "${local.network_self_link}"
  priority  = 200
  project   = "${local.project_id}"

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
    "${local.server_service_account}",
  ]
}
