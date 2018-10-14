terragrunt = {
  remote_state {
    backend = "gcs"
    config {
      bucket  = "${get_env("TF_VAR_forseti_security_states_bucket", "`TF_VAR_forseti_security_states_bucket` not set")}"
      prefix  = "components/${path_relative_to_include()}"
      credentials = "${get_env("GOOGLE_APPLICATION_CREDENTIALS", "`GOOGLE_APPLICATION_CREDENTIALS` not set")}"
      project = "${get_env("TF_VAR_terraform_admin_project_id", "`TF_VAR_terraform_admin_project_id` not set")}"
    }
  }

  terraform {
    # Force Terraform to keep trying to acquire a lock for up to 5 minutes
    # if someone else already has the lock.
    extra_arguments "retry_lock" {
      commands = [
        "apply",
        "destroy",
        "graph",
        "import",
        "init",
        "plan",
        "refresh",
        "taint",
        "untaint",
        "validate",
      ]

      arguments = [
        "-lock-timeout=5m",
        "--var-file=${get_tfvars_dir()}/../../envars/common.tfvars",
        "--var-file=${get_tfvars_dir()}/../../envars/${get_env("TF_VAR_environment", "`TF_VAR_environment` not set")}.tfvars",
        "--var-file=terraform.tfvars"
      ]
    }
  }
}
