output "network_self_link" {
  value = "${google_compute_network.forseti_security.self_link}"
}

output "subnetwork_us_west1_self_link" {
  value = "${google_compute_subnetwork.forseti_security_us_west1.self_link}"
}

output "subnetwork_us_central1_self_link" {
  value = "${google_compute_subnetwork.forseti_security_us_central1.self_link}"
}

output "subnetwork_us_east1_self_link" {
  value = "${google_compute_subnetwork.forseti_security_us_east1.self_link}"
}

output "subnetwork_us_east4_self_link" {
  value = "${google_compute_subnetwork.forseti_security_us_east4.self_link}"
}
