# The following APIs need to be enabled manually:
# cloudresourcemanager.googleapis.com
# serviceusage.googleapis.com
# storage-api.googleapis.com

# Billing Account User:
# terraform-service-user@terraform-org-admin.iam.gserviceaccount.com

resource "google_project_service" "cloudbilling_api" {
  project = "${data.google_project.terraform_admin.project_id}"
  service = "cloudbilling.googleapis.com"
}

resource "google_project_service" "iam_api" {
  project = "${data.google_project.terraform_admin.project_id}"
  service = "iam.googleapis.com"
}
