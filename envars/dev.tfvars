bucket_policy = {
  "location"      = "US"
  "storage_class" = "MULTI_REGIONAL"
  "versioning"    = true
  "force_destroy" = true
}

source_image = {
  "centos7" = "centos-7-v20180815"
}
