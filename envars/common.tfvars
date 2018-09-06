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

project_names = {
  "forseti-security" = "forseti-security"
  "terraform-admin"  = "terraform-org-admin"
}