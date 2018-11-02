terragrunt = {
  dependencies {
    paths = [
      "../project",
      "../networking",
    ]
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}
