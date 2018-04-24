module "project" {
  source                        = "../../../modules/project"

  billing_account_id            = "${var.billing_account_id}"
  roles                         = "${var.forseti_roles}"
  org_id                        = "${var.org_id}"
  project_name                  = "${var.project_names["forseti-security"]}"
}
