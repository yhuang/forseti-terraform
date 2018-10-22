# Forseti Terraform

#### Required Software

- [Google Cloud SDK](https://cloud.google.com/sdk/docs/quickstarts)
- [jq](https://stedolan.github.io/jq/download)
- [Terraform](https://www.terraform.io/downloads.html)
- [Terragrunt](https://github.com/gruntwork-io/terragrunt/releases)

#### Quickstart Guide

  1. Deploy your [Terraform Admin project](https://github.com/yhuang/terraform-admin).

  2. Deploy your [Trusted Images project](https://github.com/yhuang/trusted-images).

  3. Configure `gcloud` to use your Terraform Admin service account key:
  ```
  $ gcloud auth activate-service-account --key-file <Path to the Terraform Admin service account key>
  ```

  4. Obtain the name of the GCS bucket created by the Terraform Admin project that is dedicated to persist the Terraform states of your Forseti Terraform project.  From the Terraform Admin project's root directory:
  ```
  $ terragrunt show
  .
  .
  .
  Outputs:

  terraform_states_buckets = [
    trusted-images-terraform-states,
    dev-forseti-security-terraform-states
  ]
  ```
  The output of the `terragrunt show` command will depend on your Terraform Admin project deployment.

  5. Set the following environment variables in the Forseti Terraform repo's `dev.env` file to fit your Forseti Terraform project deployment:
  ```
  GOOGLE_APPLICATION_CREDENTIALS=<path to the Terraform Admin service account key>
  TERRAFORM_ADMIN_PROJECT_NAME=<your Terraform Admin project name (not its project ID)>
  TRUSTED_IMAGES_PROJECT_NAME=<your Trusted Images project name (not its project ID)>
  TF_VAR_forseti_security_states_bucket=<the states bucket name of your specific Forseti Terraform environment>
  TF_VAR_g_suite_groups_auditor=<your
  ```

  6. From the Forseti Terraform repo's root directory, export the updated environment variables:
  ```
  $ source envars/dev.env
  ```

  7. At this point, Terragrunt should be able bootstrap the rest of the way to a fully functional Forseti project environment under the current organization.  This Forseti project environment will include a VPC network and four subnetworks, a Cloud SQL database instance, a GCS bucket, and compute engine on which Forseti Security Suite will run.  

  From the Forseti Terraform repo's root directory:
  ```
  $ cd components

  $ for i in project networking database bucket server; do cd $i; terragrunt plan; terragrunt apply --auto-approve; cd ..; done
  ```

  8. SSH into the Forseti Server instance via `gcloud`:
  ```
  $ gcloud compute ssh user@forseti-security-server --project <your Forseti Security environment project's ID>

  [user@forseti-security-server ~]$ run-forseti-suite.sh
  .
  .
  .
  {
    "status": "SUCCESS"
  }
  ```
