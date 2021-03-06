locals {
  connection_name          = "${data.terraform_remote_state.database.connection_name}"
  database_name            = "${replace(var.project_name_base, "-", "_")}"
  forseti_bucket           = "${data.terraform_remote_state.bucket.name}"
  forseti_conf_server_yaml = "${data.template_file.forseti_conf_server_yaml.rendered}"
  forseti_services         = "${join(" ", var.forseti_services)}"
  image_self_link          = "${data.google_compute_image.latest_forseti_image.self_link}"
  network_tier             = "${var.network_tiers[var.region]}"
  org_id                   = "${data.terraform_remote_state.project.org_id}"
  project_id               = "${data.terraform_remote_state.project.project_id}"
  region                   = "${var.regions[var.region]}"
  run_forseti_suite        = "${data.template_file.run_forseti_suite.rendered}"
  run_frequency            = "${chomp(data.template_file.run_frequency.rendered)}"
  server_name              = "${var.project_name_base}-server"
  server_service_account   = "${data.terraform_remote_state.project.server_service_account}"
  startup_script           = "${data.template_file.configure_forseti_server.rendered}"
  states_bucket            = "${var.forseti_security_states_bucket}"
  subnetwork               = "${data.terraform_remote_state.networking.subnetwork_self_links[local.region]}"
  zone                     = "${element(var.availability_zones[local.region], 0)}"
}
