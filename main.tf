provider "google" {
  project = "mydemo-452010"  # Replace with your GCP Project ID
  region  = "us-central1"      # Change to your preferred region
}

resource "google_compute_instance" "debian_vm" {
  name         = "debian-12-vm"
  machine_type = "e2-medium" # Choose your preferred machine type
  zone         = "us-central1-a" # Change as needed

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 20 # Disk size in GB
    }
  }

  network_interface {
    network = "default"
    access_config {
      # Assigns an external IP
    }
  }
}  # <-- Missing closing brace added here
