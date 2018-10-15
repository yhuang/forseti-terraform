// "cloudasset.googleapis.com"

apis = [
  "admin.googleapis.com",
  "appengine.googleapis.com",
  "bigquery-json.googleapis.com",
  "cloudbilling.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "deploymentmanager.googleapis.com",
  "iam.googleapis.com",
  "pubsub.googleapis.com",
  "servicemanagement.googleapis.com",
  "serviceusage.googleapis.com",
  "sql-component.googleapis.com",
  "sqladmin.googleapis.com",
  "storage-api.googleapis.com",

  "compute.googleapis.com",
  "oslogin.googleapis.com",
  "replicapool.googleapis.com",
  "replicapoolupdater.googleapis.com",
  "resourceviews.googleapis.com",

  "container.googleapis.com",
  "containerregistry.googleapis.com",
]

availability_zones = {
  "us-west1" = [
    "us-central1-a",
    "us-central1-b",
  ]
  "us-central1" = [
    "us-central1-b",
    "us-central1-f",
  ]
  "us-east1" = [
    "us-central1-c",
    "us-central1-d",
  ]
  "us-east4" = [
    "us-central1-a",
    "us-central1-b",
  ]
}

byte_length = 4

cloudsql_database_port = 3306

cloudsql_database_version = "MYSQL_5_7"

forseti_roles = {
  "client"                 = "client"
  "server"                 = "server"
}

iam_roles = {
  "appengine-appViewer"               = "roles/appengine.appViewer"
  "bigquery-dataViewer"               = "roles/bigquery.dataViewer"
  "browser"                           = "roles/browser"
  "cloudsql-client"                   = "roles/cloudsql.client"
  "cloudsql-viewer"                   = "roles/cloudsql.viewer"
  "compute-imageUser"                 = "roles/compute.imageUser"
  "compute-networkViewer"             = "roles/compute.networkViewer"
  "compute-securityAdmin"             = "roles/compute.securityAdmin"
  "iam-serviceAccountTokenCreator"    = "roles/iam.serviceAccountTokenCreator"
  "iam-securityReviewer"              = "roles/iam.securityReviewer"
  "logging-logWriter"                 = "roles/logging.logWriter"
  "servicemanagement-quotaViewer"     = "roles/servicemanagement.quotaViewer"
  "serviceusage-serviceUsageConsumer" = "roles/serviceusage.serviceUsageConsumer"
  "storage-objectAdmin"               = "roles/storage.objectAdmin"
  "storage-objectCreator"             = "roles/storage.objectCreator"
  "storage-objectViewer"              = "roles/storage.objectViewer"
}

# Source IP ranges for legacy HTTP(S) Load Balancing healt checks:
#   35.191.0.0/16
#   130.211.0.0/22

# Source IP ranges for legacy Network Load Balancing health checks:
#   35.191.0.0/16
#   209.85.152.0/22
#   209.85.204.0/22

known_ips = {
  "all" = [
    "0.0.0.0/0"
  ]
  "health-check" = [
    "35.191.0.0/16",
    "130.211.0.0/22",
    "209.85.152.0/22",
    "209.85.204.0/22"
  ]
}

os = "centos"

project_name_base = "forseti-security"

regions = {
  "us-west1"    = "us-west1"
  "us-central1" = "us-central1"
  "us-east1"    = "us-east1"
  "us-east4"    = "us-east4"
}

scopes = {
  "all-api-access" = "https://www.googleapis.com/auth/cloud-platform"
}

software = {
  "cloudsql-proxy"        = "/usr/bin/cloudsql-proxy"
  "date"                  = "/bin/date"
  "flock"                 = "/usr/bin/flock"
  "forseti-enforcer"      = "/usr/bin/forseti-enforcer"
  "forseti-foreground-sh" = "/usr/bin/forseti-foreground.sh"
  "forseti-server"        = "/usr/bin/forseti-server"
  "run-forseti-suite-sh"  = "/usr/bin/run-forseti-suite.sh"
}

system_configuration = {
  "cloudsql-proxy-service" = "/lib/systemd/system/cloudsql-proxy.service"
  "forseti-install-dir"    = "/opt/forseti-security"
  "forseti-environment-sh" = "/etc/profile.d/forseti-environment.sh"
  "forseti-service"        = "/lib/systemd/system/forseti.service"
}
