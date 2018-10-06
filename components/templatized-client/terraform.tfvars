terragrunt = {
  dependencies {
    paths = [
      "../server"
    ]
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}
