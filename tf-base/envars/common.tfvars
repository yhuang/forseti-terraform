regions = [
  "us-west1",
]

availability_zones = [
  "us-west1-b",
  "us-west1-c",
]

# The Terraform Admin service account will need to have the following predefined organization roles:
#
#   - Billing Account User
#   - Organization Role Administrator
#   - Organization Policy Administrator
#   - Organization Administrator
#   - Project Creator
#   - Project Deleter
#   - Service Management Administrator
#   - Quota Administrator
#
# The Terraform Admin servic account will need to have the following predefined project roles:
#
#   - Viewer
#   - Storage Admin

forseti_roles = {
  "auditor"                = "auditor"
  "enforcer"               = "enforcer"
  "explainer"              = "explainer"
  "g-suite-groupd-auditor" = "g-suite-groupd-auditor"
}

service_accounts = {
//  "auditor" = "auditor@forseti-security-duragility.iam.gserviceaccount.com"
//  "enforcer" = "enforcer@forseti-security-duragility.iam.gserviceaccount.com"
//  "explainer" = "explainer@forseti-security-duragility.iam.gserviceaccount.com"
//  "g-suite-groups-auditor" = "g-suite-groups-auditor@forseti-security-duragility.iam.gserviceaccount.com"
  "terraform-admin" = "terraform-service-user@terraform-org-admin.iam.gserviceaccount.com"
}

project_names = {
  "forseti-security" = "forseti-security"
  "terraform-admin" = "terraform-org-admin"
}