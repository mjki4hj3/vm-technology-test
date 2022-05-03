# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service
resource "google_project_service" "compute"{
  project = google_project.vm_tech_test_project.number
  service = "compute.googleapis.com"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service
resource "google_project_service" "container"{
  project = google_project.vm_tech_test_project.number
  service = "container.googleapis.com"
}


# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "vm_custom_vpc" {
  name = "vm-custom-vpc"
  routing_mode = "REGIONAL"
  auto_create_subnetworks = false


  depends_on = [
    google_project_service.compute,
    google_project_service.container
  ]
}

