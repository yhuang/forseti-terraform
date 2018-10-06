terragrunt = {
  dependencies {
    paths = [
      "../networking",
      "../bucket",
      "../database",
    ]
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}
