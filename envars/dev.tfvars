bucket_policy = {
  "location"      = "US"
  "storage-class" = "MULTI_REGIONAL"
  "versioning"    = true
  "force-destroy" = true
}

cloudsql_authorized_networks = []

cloudsql_backup_configuration = {
  "binary-log-enabled" = false
  "enabled"            = false
}

cloudsql_database_version = "MYSQL_5_7"

cloudsql_ip_configuration = {
  "ipv4-enabled" = true
  "require-ssl"  = true
}

# https://cloud.google.com/products/calculator/#id=804e8825-f077-4222-8b7f-7005ed1716d5
cloudsql_settings = {
  "activation-policy" = "ALWAYS"
  "disk-size"         = 10
  "disk-type"         = "PD_HDD"
  "tier"              = "db-f1-micro"
}

source_image = {
  "centos7" = "centos-7-v20180815"
}
