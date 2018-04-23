regions = [
  "us-west1",
]

availability_zones = [
  "us-west1-b",
  "us-west1-c",
]

service_accounts = {
  "auditor" = "auditor@forseti-security-duragility.iam.gserviceaccount.com"
  "enforcer" = "enforcer@forseti-security-duragility.iam.gserviceaccount.com"
  "explainer" = "explainer@forseti-security-duragility.iam.gserviceaccount.com"
  "g-suite-groups-auditor" = "g-suite-groups-auditor@forseti-security-duragility.iam.gserviceaccount.com"
  "terraform-admin" = "terraform-service-user@terraform-org-admin.iam.gserviceaccount.com"
}