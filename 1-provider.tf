#https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = local.project_id
  region = local.region
}

# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = "vm-tech-test-terraform-state"
    prefix = "terraform-state"
  }
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~> 4.0"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer
resource "random_integer" "int"{
  min = 100
  max = 1000000
}