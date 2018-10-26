resource "google_compute_global_address" "managed_services" {
  name          = "managed-services"
  provider      = "google-beta"

  address_type  = "INTERNAL"
  network       = "${local.network_self_link}"
  prefix_length = "16"
  project       = "${local.project_id}"
  purpose       = "VPC_PEERING"
}

resource "null_resource" "vpc_to_services_peering" {
  provisioner "local-exec" {
    command = <<EOF
gcloud beta services vpc-peerings connect \
--service=servicenetworking.googleapis.com \
--network=${local.network_name} \
--ranges=${google_compute_global_address.managed_services.name} \
--project=${local.project_id};
EOF
  }

  provisioner "local-exec" {
    when = "destroy"

    command = <<EOF
gcloud compute networks peerings delete servicenetworking-googleapis-com \
--network=${local.network_name} \
--project=${local.project_id}
EOF
  }
}