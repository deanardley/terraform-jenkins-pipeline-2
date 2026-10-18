resource "google_compute_network" "vpc_network" {
  name                    = var.vpcname
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnetname
  ip_cidr_range = "10.2.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet2" {
  name          = var.subnet2name
  ip_cidr_range = "10.3.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_firewall" "firewall_rules" {
  name    = var.firewallname
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "vm-terraform" {
  name         = var.vmname
  machine_type = var.machinetype
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.vmimage
      size  = var.machinesize
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.subnet.id

    access_config {

    }
  }

  metadata_startup_script = "echo hi > /test.txt"

}