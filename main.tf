terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
project = "red-studio-419223"
region = "us-central1"
zone = "us-central1-b"
credentials = "red-studio-419223-21776f8d2ea1.json"
}

resource "google_storage_bucket" "mappa-bucket-1" {
  name          = "copy_this_name_and_mappa_anime"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}