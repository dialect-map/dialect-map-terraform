terraform {
  backend "gcs" {
    bucket = "ds3-dialect-map-tf-state"
    prefix = "state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.86.0"
    }
  }
}


provider "google" {
  project = var.project_id
  region  = var.project_region
  zone    = var.project_zone
}
