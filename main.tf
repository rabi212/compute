provider "google" {
  project = "gcp-poc-project-285306" # Replace with your actual project ID
  region  = "us-central1"
}

resource "google_storage_bucket" "my_bucket" {
  name                     = "compute96-unique" # Ensure this name is globally unique
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
}

output "bucket_url" {
  value = "gs://${google_storage_bucket.my_bucket.name}"
}
