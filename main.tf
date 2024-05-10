terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.26.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "organic-origin-417303"
  region = "asia-east2"
  zone = "asia-east2-a"
  credentials = "organic-origin-417303-27a43386d5a5.json"
}


resource "google_storage_bucket" "bucket" {
  name          = "finallyunderstanding"
  storage_class = "STANDARD"
  location      = "asia-east1"
  uniform_bucket_level_access = false

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}  

resource "google_storage_bucket_object" "website" {
  name   = "index.html"
  source = "index.html"
  bucket = google_storage_bucket.bucket.name
  
}
resource "google_storage_bucket_acl" "bucket_acl" {
  bucket         = google_storage_bucket.bucket.name
   predefined_acl = "publicRead"
 }
 



