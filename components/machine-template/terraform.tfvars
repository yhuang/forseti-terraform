terragrunt = {
  dependencies {
    paths = [
      "../networking",
    ]
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}
