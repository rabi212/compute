provider "google" {
  project = "gcp-poc-project-285306" # Replace with your actual project ID
  region  = "asia-south1"
}

resource "google_storage_bucket" "my_bucket" {
  name                     = "giffy-96" # Ensure this name is globally unique
  location                 = "asia-south1"
  force_destroy            = true
  public_access_prevention = "enforced"
}

output "bucket_url" {
  value = "gs://${google_storage_bucket.my_bucket.name}"
}
