terragrunt = {
  remote_state {
    backend = "gcs"
    config {
      bucket  = "${get_env("TF_VAR_environment", "default")}-forseti-security-terraform-states"
      prefix  = "components/database"
      credentials = "${get_env("GOOGLE_APPLICATION_CREDENTIALS", "default")}"
      project = "${get_env("TF_VAR_terraform_admin_project_id", "terraform-org-admin")}"
    }
  }

  terraform {
    # Force Terraform to keep trying to acquire a lock for up to 20 minutes
    # if someone else already has the lock.
    extra_arguments "retry_lock" {
      commands = [
        "apply",
        "destroy",
        "import",
        "init",
        "plan",
        "refresh",
        "taint",
        "untaint",
        "validate",
      ]

      arguments = [
        "-lock-timeout=30s",
        "--var-file=${get_tfvars_dir()}/../../envars/common.tfvars",
        "--var-file=${get_tfvars_dir()}/../../envars/${get_env("TF_VAR_environment", "default")}.tfvars",
        "--var-file=terraform.tfvars"
      ]
    }
  }
}
