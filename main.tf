resource "google_storage_bucket" "my-bucket" {
  name                     = "compute96"
  project                  = "tt-dev-001"
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
}
#
