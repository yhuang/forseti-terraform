output "internal_ip" {
  value = "${google_compute_instance.server.network_interface.0.address}"
}
