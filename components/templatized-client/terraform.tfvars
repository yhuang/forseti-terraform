terragrunt = {
  dependencies {
    paths = [
      "../machine-template",
      "../templatized-server",
    ]
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}
