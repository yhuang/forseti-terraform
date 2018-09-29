terragrunt = {
  dependencies {
    paths = [
      "../project"
    ]
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}
