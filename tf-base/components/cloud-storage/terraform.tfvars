terragrunt = {
  remote_state {
    backend = "gcs"
    config {
      bucket  = "${get_env("TF_VAR_ENV", "default")}-forseti-terraform-states"
      prefix  = "${get_env("TF_VAR_ENV", "default")}-components/cloud-storage"
      credentials = "${get_env("GOOGLE_APPLICATION_CREDENTIALS", "default")}"
      project = "${get_env("GOOGLE_PROJECT", "terraform-org-admin")}"
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
      ]

      arguments = [
        "-lock-timeout=30s",
        "--var-file=${get_tfvars_dir()}/../../envars/common.tfvars",
        "--var-file=${get_tfvars_dir()}/../../envars/${get_env("ENV", "default")}.tfvars",
        "--var-file=terraform.tfvars"
      ]
    }
  }
}