#..................................... Provider Block ......................................#

provider "google" {
    project         = var.project_id
    access_token    = var.access_token
}
provider "google-beta" {
    project         = var.project_id
    access_token    = var.access_token
}

terraform {
  required_version = ">=0.12.0"
  required_providers {
    google      = ">=2.11.0"
    google-beta = ">=2.13"
  }
}