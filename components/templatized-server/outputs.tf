output "external_ip" {
  value = "${google_compute_instance_from_template.server.network_interface.0.access_config.0.assigned_nat_ip}"
}

output "internal_ip" {
  value = "${google_compute_instance_from_template.server.network_interface.0.address}"
}
