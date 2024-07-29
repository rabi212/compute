provider "google" {
  project = var.project_id
  region  = "asia-south1"
}

resource "google_compute_instance" "rabi" {
  name         = "rabi"
  machine_type = "n1-standard-1"
  zone         = "asia-south1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20230628"
      size  = 20
      type  = "pd-standard"
    }
  }

  network_interface {
    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  tags = ["http-server", "https-server"]
}

resource "google_compute_firewall" "default" {
  name    = "allow-http-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["http-server", "https-server"]
}

variable "project_id" {
  description = "The ID of the project in which to create the instance"
  type        = string
}

variable "credentials_file" {
  description = "Path to the credentials file"
  type        = string
}
