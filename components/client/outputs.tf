output "internal_ip" {
  value = "${google_compute_instance.client.network_interface.0.address}"
}
