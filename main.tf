provider "google" {
  project = "giffy-builder"  # Replace with your actual project ID
  region  = "asia-south1"
}

resource "google_compute_instance" "rabi" {
  name         = "rabi"
  machine_type = "n1-standard-1"
  zone         = "asia-south1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20240519"
      size  = 20
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
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
  name    = "default-allow-http-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["http-server", "https-server"]
}
