bucket_policy = {
  "force-destroy" = true
  "location"      = "US"
  "storage-class" = "MULTI_REGIONAL"
  "versioning"    = true
}

cloudsql_authorized_networks = []

cloudsql_backup_configuration = {
  "binary-log-enabled" = false
  "enabled"            = false
}

cloudsql_ip_configuration = {
  "ipv4-enabled" = true
  "require-ssl"  = true
}

# https://cloud.google.com/products/calculator/#id=804e8825-f077-4222-8b7f-7005ed1716d5
cloudsql_settings = {
  "activation-policy" = "ALWAYS"
  "disk-size"         = 10
  "disk-type"         = "PD_HDD"
  # Second-generation instance tiers are based on the machine type.
  "tier"              = "db-f1-micro"
}

email_recipient = ""

email_sender = ""

forseti_security_services = [
  "explain",
  "inventory",
  "model",
  "notifier",
  "scanner",
]

machine_type = "f1-micro"

network_tier = "STANDARD"

region = "us-central1"

sendgrid_api_key = ""

subnetwork_cidr_ranges = {
  "us-west1"    = "10.128.0.0/24"
  "us-central1" = "10.129.0.0/24"
  "us-east1"    = "10.130.0.0/24"
  "us-east4"    = "10.131.0.0/24"
}
