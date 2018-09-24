output "network_self_link" {
  value = "${google_compute_network.forseti_security.self_link}"
}

output "subnetwork_self_link" {
  value = "${google_compute_subnetwork.forseti_security_us_central1.self_link}"
}
