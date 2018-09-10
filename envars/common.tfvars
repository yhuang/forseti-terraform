apis = [
  "admin.googleapis.com",
  "appengine.googleapis.com",
  "bigquery-json.googleapis.com",
  "cloudbilling.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "deploymentmanager.googleapis.com",
  "iam.googleapis.com",
  "serviceusage.googleapis.com",
  "sql-component.googleapis.com",
  "sqladmin.googleapis.com",
  "storage-api.googleapis.com",

  "compute.googleapis.com",
  "container.googleapis.com",
  "containerregistry.googleapis.com",
  "oslogin.googleapis.com",
  "pubsub.googleapis.com",
  "replicapool.googleapis.com",
  "replicapoolupdater.googleapis.com",
  "resourceviews.googleapis.com",
]

availability_zones = [
  "us-central1-b",
  "us-central1-c",
]

byte_length = 4

cloudsql_database_user_name = "centos"

cloudsql_database_port      = 3306

forseti_roles = {
  "client"                 = "client"
  "server"                 = "server"
  "g-suite-groupd-auditor" = "g-suite-groupd-auditor"
}

project_name_base = "forseti-security"

regions = [
  "us-central1",
]

iam_roles = {
  "appengine-appViewer"               = "roles/appengine.appViewer"
  "bigquery-dataViewer"               = "roles/bigquery.dataViewer"
  "browser"                           = "roles/browser"
  "cloudsql-client"                   = "roles/cloudsql.client"
  "cloudsql-viewer"                   = "roles/cloudsql.viewer"
  "compute-networkViewer"             = "roles/compute.networkViewer"
  "compute-securityAdmin"             = "roles/compute.securityAdmin"
  "iam-serviceAccountTokenCreator"    = "roles/iam.serviceAccountTokenCreator"
  "iam-securityReviewer"              = "roles/iam.securityReviewer"
  "logging-logWriter"                 = "roles/logging.logWriter"
  "storage-objectCreator"             = "roles/storage.objectCreator"
  "storage-objectViewer"              = "roles/storage.objectViewer"
  "servicemanagement-quotaViewer"     = "roles/servicemanagement.quotaViewer"
  "serviceusage-serviceUsageConsumer" = "roles/serviceusage.serviceUsageConsumer"
}

scopes = {
  "all-api-access" = "https://www.googleapis.com/auth/cloud-platform"
}

# https://forsetisecurity.org/docs/howto/configure/gsuite-group-collection.html
#
# Create g-suite-groups-auditor service account out of band
# Enable G Suite Domain-wide Delegation
# Product name for the consent screen:  Terraform Org Admin
#
# https://admin.google.com/ManageOauthClients
#
# Enter the Client ID for service account client as Client Name with the following API scopes:
# https://www.googleapis.com/auth/admin.directory.group.readonly,https://www.googleapis.com/auth/admin.directory.user.readonly

service_accounts = {
  "g-suite-groups-auditor" = "g-suite-groups-auditor@terraform-org-admin.iam.gserviceaccount.com"
  "terraform-admin"        = "terraform-service-user@terraform-org-admin.iam.gserviceaccount.com"
}

source_image = {
  "centos7" = "centos-7-v20180815"
}
