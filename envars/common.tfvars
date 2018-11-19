// "cloudasset.googleapis.com"

apis = [
  "admin.googleapis.com",
  "appengine.googleapis.com",
  "bigquery-json.googleapis.com",
  "cloudbilling.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "deploymentmanager.googleapis.com",
  "pubsub.googleapis.com",
  "servicemanagement.googleapis.com",
  "servicenetworking.googleapis.com",
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

  "iam.googleapis.com",
  "iamcredentials.googleapis.com",
]

availability_zones = {
  "us-west1" = [
    "us-west1-a",
    "us-west1-b",
  ]
  "us-central1" = [
    "us-central1-b",
    "us-central1-f",
  ]
  "us-east1" = [
    "us-east1-c",
    "us-east1-d",
  ]
  "us-east4" = [
    "us-east4-a",
    "us-east4-b",
  ]
}

byte_length = 4

cloudsql_database_port = 3306

cloudsql_database_version = "MYSQL_5_7"

forseti_roles = {
  "client" = "client"
  "server" = "server"
}

iam_roles = {
  "appengine" = {
    "appViewer" = "roles/appengine.appViewer"
  }
  "bigquery" = {
    "dataViewer" = "roles/bigquery.dataViewer"
  }
  "cloudsql" = {
    "client" = "roles/cloudsql.client"
    "viewer" = "roles/cloudsql.viewer"
  }
  "compute" = {
    "imageUser"     = "roles/compute.imageUser"
    "networkViewer" = "roles/compute.networkViewer"
    "securityAdmin" = "roles/compute.securityAdmin"
  }
  "iam" = {
    "serviceAccountTokenCreator" = "roles/iam.serviceAccountTokenCreator"
    "securityReviewer"           = "roles/iam.securityReviewer"
  }
  "logging" = {
    "logWriter" = "roles/logging.logWriter"
  }
  "primitive" = {
    "browser" = "roles/browser"
  }
  "servicemanagement" = {
    "quotaViewer" = "roles/servicemanagement.quotaViewer"
  }
  "serviceusage" = {
    "serviceUsageConsumer" = "roles/serviceusage.serviceUsageConsumer"
  }
  "storage" = {
    "objectAdmin"   = "roles/storage.objectAdmin"
    "objectCreator" = "roles/storage.objectCreator"
    "objectViewer"  = "roles/storage.objectViewer"
  }
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
    "209.85.204.0/22",
  ]
}

network_tiers = {
  "us-west1"    = "PREMIUM"
  "us-central1" = "STANDARD"
  "us-east1"    = "STANDARD"
  "us-east4"    = "PREMIUM"
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

sysconfig = {
  "cloudsql-proxy"         = "/usr/bin/cloudsql-proxy"
  "cloudsql-proxy-service" = "/lib/systemd/system/cloudsql-proxy.service"
  "date"                   = "/bin/date"
  "flock"                  = "/usr/bin/flock"
  "forseti-enforcer"       = "/usr/bin/forseti-enforcer"
  "forseti-environment-sh" = "/etc/profile.d/forseti-environment.sh"
  "forseti-foreground-sh"  = "/usr/bin/forseti-foreground.sh"
  "forseti-install-dir"    = "/opt/forseti-security"
  "forseti-server"         = "/usr/bin/forseti-server"
  "forseti-service"        = "/lib/systemd/system/forseti.service"
  "run-forseti-suite-sh"   = "/usr/bin/run-forseti-suite.sh"
}
