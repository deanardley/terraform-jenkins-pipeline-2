terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.5.0"
    }
  }
}

provider "google" {
  project = "my-second-project-511402"
  region  = "us-central1"
  zone    = "us-central1-a"
}

