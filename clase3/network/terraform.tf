terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>4.65.2"
    }
  }
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}
