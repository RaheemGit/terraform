provider "google" {
  project = "mydemo-452010"  # Replace with your GCP Project ID
  region  = "us-central1"     # Change to your preferred region
}

variable "vm_count" {
  description = "Number of VMs to create"
  default     = 3  # Adjust the number of instances as needed
}

resource "google_compute_instance" "debian_vms" {
  count        = var.vm_count
  name         = "debian-12-vm-${count.index}"
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
}
