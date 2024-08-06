resource "google_storage_bucket" "my-bucket" {
  name                     = "comput-96"
  project                  = "gcp-poc-project-285306"
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
}
#
resource "google_storage_bucket" "my-bucket2" {
  name                     = "tt-githubdemo-bucket-002"
  project                  = "tt-dev-001"
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
}
#
### dummy
