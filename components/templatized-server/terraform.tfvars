terragrunt = {
  dependencies {
    paths = [
      "../networking",
      "../bucket",
      "../database",
      "../machine-template",
    ]
  }

  include {
    path = "${find_in_parent_folders()}"
  }
}
