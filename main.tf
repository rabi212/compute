provider "google" {
  project = "giffy-builder" # Replace with your actual project ID
  region  = "asia-south1"
}

resource "google_storage_bucket" "my_bucket" {
  name                     = "compute96-unique" # Ensure this name is globally unique
  location                 = "asia-south1"
  force_destroy            = true
  public_access_prevention = "enforced"
}

output "bucket_url" {
  value = "gs://${google_storage_bucket.my_bucket.name}"
}
